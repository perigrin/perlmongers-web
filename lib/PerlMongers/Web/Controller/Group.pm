package PerlMongers::Web::Controller::Group;
use Moose;
BEGIN { extends 'Catalyst::Controller::REST' }
use Try::Tiny;

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(
    default => 'text/html',
    map     => {
        'text/html' => [ 'View', 'TT' ],
        'text/xml'  => undef
    },
    namespace => '',
);

use constant DEFAULT_RADIUS => 160934;    # 100 miles

sub nearest : Path('/groups/nearest') ActionClass('REST') {
}

sub nearest_GET {
    my ( $self, $c ) = @_;
    my $data = $c->request->data;
    my $k    = $c->model('Kioku');
    my $location =
      try { $c->request->location; } catch { return $self->status_ok($c, entity => { }) };
    my $iter =
      $k->find_within_x_meters( $location, $data->{range} // DEFAULT_RADIUS,
        $data->{limit} );
    $self->status_ok( $c, entity => { data => $data, iter => $iter } );
}

my $by_date = sub {
    [
        sort {
            try {
                return 1  unless $a->date_collection->[0] && $a->date_collection->[0]->text;
                return -1 unless $b->date_collection->[0] && $b->date_collection->[0]->text;
                $a->date_collection->[0]->text
                  cmp $b->date_collection->[0]->text;
            }
            catch { warn $_; return 0 }
          } @$_
    ];
};

sub all : Path('/groups/all') ActionClass('REST') {
}

sub all_GET {
    my ( $self, $c ) = @_;
    my $iter =
      $c->model('Kioku')
      ->search( { class => 'PerlMongers::Model::XML::Group', } );
    $self->status_ok( $c, entity => { iter => $iter->filter($by_date), } );
}

sub continent : Path('/groups') ActionClass('REST') {
}

sub continent_GET {
    my ( $self, $c, $continent ) = @_;
    my $name = $continent;
    $name = '' if $name eq 'Non-geographical';
    my $iter = $c->model('Kioku')->search(
        {
            class     => 'PerlMongers::Model::XML::Group',
            continent => $name,
        }
    );
    $self->status_ok(
        $c,
        entity => {
            iter      => $iter->filter($by_date),
            continent => $continent
        }
    );
}

sub group : Path('/group') ActionClass('REST') {
}

sub group_GET {
    my ( $self, $c, $name ) = @_;
    my ($root) = $c->model('Kioku')->search(
        {
            class => 'PerlMongers::Model::XML::Group',
            name  => $name
        }
    )->items;
    $self->status_ok( $c, entity => $root );
}

1;
__END__
