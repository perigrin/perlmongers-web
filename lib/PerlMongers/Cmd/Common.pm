package PerlMongers::Cmd::Common;
use Moose::Role;
our $VERSION = '0.01';
use namespace::autoclean;

has dry_run => (
    isa           => 'Bool',
    is            => 'ro',
    default       => 0,
    traits        => ['Getopt'],
    cmd_aliases   => ['n'],
    documentation => 'Do not actually send'
);

has verbose => (
    isa           => 'Bool',
    is            => 'ro',
    default       => 0,
    traits        => ['Getopt'],
    cmd_aliases   => ['v'],
    documentation => 'Be noisy in your output'
);

1;
__END__
