package PerlMongers::Model::Group;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'date_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Date]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_date' },
     description => {
         sort_order => 0,
     },
);
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
         sort_order => 1,
     },
);
has 'id' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'XML' ],
  description => {
     Prefix => "",
     LocalName => "id",
     node_type => "attribute",
     Name => "id",
     NamespaceURI => "",
     sort_order => 2,
 },
);
has 'location_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Location]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_location' },
     description => {
         sort_order => 3,
     },
);
has 'mailing_list_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Mailing_list]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_mailing_list' },
     description => {
         sort_order => 4,
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
         sort_order => 5,
     },
);
has 'status' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'XML' ],
  description => {
     Prefix => "",
     LocalName => "status",
     node_type => "attribute",
     Name => "status",
     NamespaceURI => "",
     sort_order => 6,
 },
);
has 'tsar_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Tsar]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_tsar' },
     description => {
         sort_order => 7,
     },
);
has 'web_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Web]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_web' },
     description => {
         sort_order => 8,
     },
);

no Moose;
1;
__END__
