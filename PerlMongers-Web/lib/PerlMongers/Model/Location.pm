package PerlMongers::Model::Location;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'city_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::City]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_city' },
     description => {
         sort_order => 0,
     },
);
has 'continent_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Continent]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_continent' },
     description => {
         sort_order => 1,
     },
);
has 'country_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Country]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_country' },
     description => {
         sort_order => 2,
     },
);
has 'latitude_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Latitude]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_latitude' },
     description => {
         sort_order => 3,
     },
);
has 'longitude_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Longitude]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_longitude' },
     description => {
         sort_order => 4,
     },
);
has 'region_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::Region]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_region' },
     description => {
         sort_order => 5,
     },
);
has 'state_collection' => (
     isa         => 'ArrayRef[PerlMongers::Model::State]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'add_state' },
     description => {
         sort_order => 6,
     },
);

no Moose;
1;
__END__
