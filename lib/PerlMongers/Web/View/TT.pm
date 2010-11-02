package PerlMongers::Web::View::TT;
use Moose;
BEGIN { extends 'Catalyst::View::TT' }

__PACKAGE__->config(
    {
        CATALYST_VAR => 'c',
        INCLUDE_PATH => [
            PerlMongers::Web->path_to( 'root', 'src' ),
            PerlMongers::Web->path_to( 'root', 'lib' )
        ],
        TEMPLATE_EXTENSION => '.tt2',
        ERROR              => 'error.tt2',
        TIMER              => 0,
        PLUGIN_BASE        => ['PerlMongers::Template::Plugin']
    }
);

1;
