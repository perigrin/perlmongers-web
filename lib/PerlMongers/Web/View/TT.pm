package PerlMongers::Web::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
    {
        CATALYST_VAR => 'c',
        INCLUDE_PATH => [
            PerlMongers::Web->path_to( 'root', 'src' ),
            PerlMongers::Web->path_to( 'root', 'lib' )
        ],
        ERROR       => 'error.tt2',
        TIMER       => 0,
        PLUGIN_BASE => ['PerlMongers::Template::Plugin']
    }
);

=head1 NAME

PerlMongers::Web::View::TT - TT View for PerlMongers::Web

=head1 DESCRIPTION

TT View for PerlMongers::Web. 

=head1 AUTHOR

=head1 SEE ALSO

L<PerlMongers::Web>

Chris Prather

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
