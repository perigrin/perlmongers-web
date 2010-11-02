package PerlMongers::KiokuDB;
use Moose;
use namespace::autoclean;

use SQL::Abstract;
use KiokuDB::TypeMap::Entry::Set;

extends qw(KiokuX::Model);

with qw(PerlMongers::Data::API);

has columns => (
    isa        => 'ArrayRef',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_columns {
    [
        name => {
            data_type   => "varchar",
            is_nullable => 1,
            extract     => sub {
                my $obj = shift;
                return $obj->name->text if $obj->can('name') && $obj->name;
            },
        },
        state => {
            data_type   => "varchar",
            is_nullable => 1,
            extract     => sub {
                my $obj = shift;
                return $obj->state->text if $obj->can('state') && $obj->state;
            },
        },
        country  => {
            data_type   => "varchar",
            is_nullable => 1,
            extract     => sub {
                my $obj = shift;
                return $obj->country->text if $obj->can('country') && $obj->country;
            },
        },
        continent  => {
            data_type   => "varchar",
            is_nullable => 1,
            extract     => sub {
                my $obj = shift;
                return $obj->continent->text if $obj->can('continent') && $obj->continent;
            },
        },
        longitude => {
            data_type   => "double",
            is_nullable => 1,
            extract     => sub {
                my $obj = shift;
                return $obj->longitude->text if $obj->can('longitude');
            },
        },
        latitude => {
            data_type   => "double",
            is_nullable => 1,
            extract     => sub {
                my $obj = shift;
                return $obj->latitude->text if $obj->can('latitude');
            },
        },

    ];
}

around _build__connect_args => sub {
    my $next = shift;
    my $self = shift;
    my $args = $self->$next(@_);
    push @$args, columns => $self->columns;
    return $args;
};

1;

__END__
