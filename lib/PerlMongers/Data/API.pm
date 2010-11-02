package PerlMongers::Data::API;
use Moose::Role;
our $VERSION = '0.01';
use namespace::autoclean;

with qw(
  KiokuDB::Role::API
  PerlMongers::Data::API::Geo
);

sub get_object_by_id {
    my ( $self, $id ) = @_;
    my $wtf = $self->directory->search( { id => $id } );
    my @list = $wtf->all;
    confess "couldn't find object for $id" unless scalar @list;

    return @list if wantarray;
    return shift @list;
}

sub store_objects {
    my ( $self, @objs ) = @_;
    return $self->directory->txn_do( sub { $self->directory->store(@objs) } );
}

1;
__END__
