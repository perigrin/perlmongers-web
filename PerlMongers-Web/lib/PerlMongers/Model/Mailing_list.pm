package PerlMongers::Model::Mailing_list;
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
has 'subscribe_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Subscribe]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'subscribe' },
     description => {
         sort_order => 2,
     },
);
has 'unsubscribe_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Unsubscribe]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'unsubscribe' },
     description => {
         sort_order => 3,
     },
);

no Moose;
1;
__END__
