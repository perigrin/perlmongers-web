package PerlMongers::Model::XML::Group;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

with qw(KiokuDB::Role::ID);

sub kiokudb_object_id { 'Group:' . shift->id }

has 'date_collection' => (
    isa      => 'ArrayRef[PerlMongers::Model::XML::Date]',
    is       => 'ro',
    init_arg => 'dates',
    traits   => [qw(XML Array)],
    lazy     => 1,
    default  => sub { [] },
    handles  => {
        add_date => ['push'],
        dates    => ['elements'],
    },
    description => {
        Prefix       => "",
        LocalName    => "date",
        node_type    => "child",
        Name         => "date",
        NamespaceURI => "",
        sort_order   => 0,
    },
);
has 'email_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Email]',
    is          => 'ro',
    init_arg    => 'emails',
    traits      => [qw(XML Array)],
    lazy        => 1,
    default     => sub { [] },
    handles     => { add_email => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "email",
        node_type    => "child",
        Name         => "email",
        NamespaceURI => "",
        sort_order   => 1,
    },
);

has 'id' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "id",
        node_type    => "attribute",
        Name         => "id",
        NamespaceURI => "",
        sort_order   => 2,
    },
);

has 'location' => (
    isa         => 'PerlMongers::Model::XML::Location',
    reader      => 'location',
    writer      => 'add_location',
    traits      => [qw(XML)],
    handles     => [qw(longitude latitude state country continent)],
    description => {
        Prefix       => "",
        LocalName    => "location",
        node_type    => "child",
        Name         => "location",
        NamespaceURI => "",
        sort_order   => 3,
    },
);

has 'mailing_list_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Mailing_list]',
    is          => 'ro',
    init_arg    => 'mailing_lists',
    traits      => [qw(XML Array)],
    lazy        => 1,
    default     => sub { [] },
    handles     => { add_mailing_list => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "mailing_list",
        node_type    => "child",
        Name         => "mailing_list",
        NamespaceURI => "",
        sort_order   => 4,
    },
);

has 'name' => (
    isa         => 'PerlMongers::Model::XML::Name',
    is          => 'rw',
    init_arg    => 'names',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "child",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 5,
    },
);

sub add_name { shift->name(shift) }

has 'status' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "status",
        node_type    => "attribute",
        Name         => "status",
        NamespaceURI => "",
        sort_order   => 6,
    },
);

sub is_active {
    lc( $_[0]->status ) eq 'active' || lc( $_[0]->status ) eq 'sleeping';
}

has 'tsar' => (
    isa         => 'PerlMongers::Model::XML::Tsar',
    is          => 'rw',
    init_arg    => 'tsars',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "tsar",
        node_type    => "child",
        Name         => "tsar",
        NamespaceURI => "",
        sort_order   => 7,
    },
);

sub add_tsar { shift->tsar(shift) }

has 'web_collection' => (
    isa      => 'ArrayRef[PerlMongers::Model::XML::Web]',
    is       => 'ro',
    init_arg => 'webs',
    traits   => [qw(XML Array)],
    lazy     => 1,

    default     => sub       { [] },
    handles     => { add_web => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "web",
        node_type    => "child",
        Name         => "web",
        NamespaceURI => "",
        sort_order   => 8,
    },
);
1;

__END__
