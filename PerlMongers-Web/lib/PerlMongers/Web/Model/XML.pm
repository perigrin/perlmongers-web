package PerlMongers::Web::Model::XML;
use Moose;
extends qw(Catalyst::Model);

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
    isa     => 'Str',
    is      => 'ro',
    default => 'PerlMongers::Model',
);

has _loader => (
    isa        => 'XML::Toolkit::Loader',
    reader     => 'loader',
    lazy_build => 1,
);

sub _build__loader {
    my $self   = shift;
    my $loader = XML::Toolkit::Loader->new(
        namespace    => $self->namespace,
        filter_class => 'XML::Toolkit::Loader::ParserNS'

    );
    $loader->parse_file( $self->input->stringify );
    return $loader;
}

has root => (
    isa        => 'PerlMongers::Model::Perl_mongers',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_root { shift->loader->root_object; }

no Moose;
1;
__END__
