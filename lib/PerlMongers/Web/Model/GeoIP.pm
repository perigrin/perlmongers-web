package PerlMongers::Web::Model::GeoIP;
use Moose;
use Geo::IP;

BEGIN { extends qw(Catalyst::Model::Adaptor) }

__PACKAGE__->config(
    class       => 'Geo::IP',
    constructor => 'open',
    args        => {
        database => 'conf/GeoLiteCity.dat',
        type     => GEOIP_STANDARD,
    },
);

sub mangle_arguments {
    my ( $self, $args ) = @_;
	my @params = ( $args->{database}, $args->{type} );
    return @params;
}

1;
__END__
