package PerlMongers::Model::Tsar;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'email_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Email]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'email' },
     description => {
         sort_order => 0,
     },
);
has 'name_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Name]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'name' },
     description => {
         sort_order => 1,
     },
);

no Moose;
1;
__END__