package PerlMongers::Web::Controller::Root;
use Moose;

BEGIN { extends 'Catalyst::Controller::REST'; }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(
    default => 'text/html',
    map     => {
        'text/html' => [ 'View', 'TT' ],
        'text/xml'  => undef,
    },
);

=head1 NAME

PerlMongers::Web::Controller::Root - Root Controller for PerlMongers::Web

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path('/') ActionClass('REST') {
}

sub index_GET {
    my ( $self, $c ) = @_;
    $c->stash->{root}     = $c->model('XML')->root;
    $c->stash->{template} = 'index.tt2';
}

=head2 end

Attempt to render a view, if needed.

=cut 

sub end : ActionClass('RenderView') {
}

=head1 AUTHOR

Chris Prather

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
