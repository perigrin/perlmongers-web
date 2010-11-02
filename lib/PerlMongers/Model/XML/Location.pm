package PerlMongers::Model::XML::Location;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'city' => (
    isa         => 'PerlMongers::Model::XML::City',
    reader      => 'city',
    writer      => 'add_city',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "city",
        node_type    => "child",
        Name         => "city",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

has 'continent' => (
    isa         => 'PerlMongers::Model::XML::Continent',
    reader      => 'continent',
    writer      => 'add_continent',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "continent",
        node_type    => "child",
        Name         => "continent",
        NamespaceURI => "",
        sort_order   => 1,
    },
);

has 'country' => (
    isa         => 'PerlMongers::Model::XML::Country',
    reader      => 'country',
    writer      => 'add_country',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "country",
        node_type    => "child",
        Name         => "country",
        NamespaceURI => "",
        sort_order   => 2,
    },
);

has 'latitude' => (
    isa         => 'PerlMongers::Model::XML::Latitude',
    reader      => 'latitude',
    writer      => 'add_latitude',
    traits      => [qw(XML)],    
    description => {
        Prefix       => "",
        LocalName    => "latitude",
        node_type    => "child",
        Name         => "latitude",
        NamespaceURI => "",
        sort_order   => 3,
    },
);

has 'longitude' => (
    isa         => 'PerlMongers::Model::XML::Longitude',
    reader      => 'longitude',
    writer      => 'add_longitude',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "longitude",
        node_type    => "child",
        Name         => "longitude",
        NamespaceURI => "",
        sort_order   => 4,
    },
);

has 'region_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Region]',
    is          => 'ro',
    init_arg    => 'regions',
    traits      => [qw(XML Array)],
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    handles     => { add_region => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "region",
        node_type    => "child",
        Name         => "region",
        NamespaceURI => "",
        sort_order   => 5,
    },
);

has 'state' => (
    isa         => 'PerlMongers::Model::XML::State',
    reader      => 'state',
    writer      => 'add_state',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "state",
        node_type    => "child",
        Name         => "state",
        NamespaceURI => "",
        sort_order   => 6,
    },
);
1;

__END__
