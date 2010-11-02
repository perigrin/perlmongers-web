package PerlMongers::Data::API::Geo;
use 5.12.0;
use Moose::Role;
use Math::Trig qw(deg2rad rad2deg);
use List::Util qw(min max);
use namespace::autoclean;

use Geo::Distance;
use Data::Stream::Bulk::Util qw(bulk);

has geo => (
    isa        => 'Geo::Distance',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_geo { Geo::Distance->new() }

sub find_within_x_meters {
    my ( $self, $center, $distance, $limit ) = @_;
    my $dbh  = $self->directory->backend->schema->storage->dbh;
    my $rows = $self->geo->closest(
        dbh       => $dbh,
        table     => 'entries',
        fields    => ['id'],
        lon_field => 'longitude',
        lat_field => 'latitude',
        lon       => $center->{longitude},
        lat       => $center->{latitude},
        unit      => 'meter',
        distance  => $distance,
        where     => q[class in ('PerlMongers::Model::XML::Group')],
        count     => $limit // 10,
    );

    my $stream = bulk( map { $_->{id} } @$rows );
    $stream->filter( sub { [ map { $self->directory->lookup($_) } @$_ ] } );
}

sub between {
    my ( $a, $b ) = @_;
    return ( { '>', \$a }, { '<', \$b } );
}

sub find_in_box {
    my ( $self, $box ) = @_;
    my $where = {
        longitude => [ -and => between( $box->{min_lon}, $box->{max_lon} ) ],
        latitude  => [ -and => between( $box->{min_lat}, $box->{max_lat} ) ],
        class => [ map { "PerlMongers::Model::XML::$_" } ('Group') ],
    };
    $self->directory->search($where);
}

1;
__END__
