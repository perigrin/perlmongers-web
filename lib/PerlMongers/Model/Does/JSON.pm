package PerlMongers::Model::Does::JSON;
use Moose::Role;

use MooseX::Storage;

with Storage();

sub TO_JSON { shift->pack }

1;
__END__
