package PerlMongers::Cmd::Command::load_xml;
use 5.12.0;
use Moose;
our $VERSION = '0.01';
use namespace::autoclean;

use XML::Toolkit::Loader;
use MooseX::Types::Path::Class qw(File);
use PerlMongers::Model::XML::Perl_mongers;
use PerlMongers::KiokuDB;

extends qw(MooseX::App::Cmd::Command);

with qw(
  PerlMongers::Cmd::Common
);

sub usage_desc { "load_xml %o " }

has input => (
    isa           => File,
    is            => 'ro',
    coerce        => 1,
    required      => 1,
    documentation => 'path to Perl Mongers XML file',
);

has dsn => (
    isa           => "Str",
    is            => "ro",
    required      => 1,
    documentation => 'KiokuDB DSN',
);

has _namespace => (
    isa     => 'Str',
    reader  => 'namespace',
    default => 'PerlMongers::Model::XML',
);

has _loader => (
    isa        => 'XML::Toolkit::Loader',
    reader     => 'loader',
    lazy_build => 1,
);

sub _build__loader {
    my $self     = shift;
    my $filename = $self->input->stringify;
    say STDERR "Loading $filename" if $self->verbose;
    my $loader = XML::Toolkit::Loader->new( namespace => $self->namespace, );
    $loader->parse_file($filename);
    return $loader;
}

has _dir => (
    isa        => 'PerlMongers::KiokuDB',
    reader     => 'dir',
    lazy_build => 1,
);

sub _build__dir {
    PerlMongers::KiokuDB->new(
        dsn        => shift->dsn,
        extra_args => { create => 1 }
    );
}

sub execute {
    my ( $self, $opt, $args ) = @_;
    my $root  = shift->loader->root_object;
    my $scope = $self->dir->new_scope;
    $self->dir->store($root) unless $self->dry_run;
}

1;
__END__
