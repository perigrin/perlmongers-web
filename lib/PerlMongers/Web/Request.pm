package PerlMongers::Web::Request;
use Moose;
use namespace::autoclean;

BEGIN { extends qw(Catalyst::Request::REST::ForBrowsers) }

around data => sub {
    my $next = shift;
    my $self = shift;
    return $self->$next(@_) || $self->params;
};

has geo_ip => (
    is         => 'ro',
    lazy_build => 1,
);

sub _build_geo_ip {
    shift->_context->model('GeoIP');
}

sub user_location {
    my $self    = shift;
    my $address = $self->address;
    my $record  = $self->geo_ip->record_by_addr($address);
    return unless $record;    # got nothing, return undef
    return {
        longitude   => $record->longitude,
        latitude    => $record->latitude,
        description => $record->city,
    };
}

sub location {
    my $self = shift;

    my $data = $self->data;
    if ( $data->{longitude} && $data->{latitude} ) {
        warn 'user supplied';
        return {
            longitude   => $data->{longitude},
            latitude    => $data->{latitude},
            description => 'user defined',
        };
    }
    elsif (my $location = $self->user_location) { warn "looked up via GeoIP"; return $location } 
    else { 
        confess "No Clue where the Fuck we are";
    }
}

1;
__END__
