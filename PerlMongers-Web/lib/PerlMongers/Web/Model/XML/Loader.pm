#!/usr/bin/env perl 
package PerlMongers::Web::Model::XML::Loader;
use Moose;
use XML::Toolkit::Loader;
use MooseX::Types::Path::Class qw(File);
use Moose::Util::TypeConstraints;

has input => (
    isa        => File,
    is         => 'ro',
    coerce     => 1,
    lazy_build => 1,
);

sub _build_input { 'perl_mongers.xml' }

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_namespace { 'Acme' }

has _loader => (
    isa        => 'XML::Toolkit::Loader',
    reader     => 'loader',
    lazy_build => 1,
);

sub _build__loader {
    my $loader = XML::Toolkit::Loader->new( namespace => $_[0]->namespace );
    $loader->parse_file( $self->input->stringify );
    return $loader;
}

no Moose;
1;
__END__
