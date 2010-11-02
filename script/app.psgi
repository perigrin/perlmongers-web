use strict;
use lib qw(lib);
use PerlMongers::Web;

PerlMongers::Web->setup_engine('PSGI');
my $app = sub { PerlMongers::Web->run(@_) };
