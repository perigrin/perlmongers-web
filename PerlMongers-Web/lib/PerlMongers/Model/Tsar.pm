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
     provides    => { push => 'add_email' },
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
     provides    => { push => 'add_name' },
     description => {
         sort_order => 1,
     },
);
has 'pause_id_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Pause_id]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_pause_id' },
     description => {
         sort_order => 2,
     },
);

no Moose;
1;
__END__
