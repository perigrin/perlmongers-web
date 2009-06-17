package PerlMongers::Model::Perl_mongers;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'group_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Group]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'group' },
     description => {
         sort_order => 0,
     },
);

no Moose;
1;
__END__
