package PerlMongers::Model::XML::Email;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'domain_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Domain]',
    is          => 'ro',
    init_arg    => 'domains',
    traits      => [qw(XML Array)],
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    handles     => { add_domain => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "domain",
        node_type    => "child",
        Name         => "domain",
        NamespaceURI => "",
        sort_order   => 0,
    },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => {
        node_type  => "character",
        sort_order => 1,
    },
);
has 'type' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "type",
        node_type    => "attribute",
        Name         => "type",
        NamespaceURI => "",
        sort_order   => 2,
    },
);
has 'user_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::User]',
    is          => 'ro',
    init_arg    => 'users',
    traits      => [qw(XML Array)],
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    handles     => { add_user => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "user",
        node_type    => "child",
        Name         => "user",
        NamespaceURI => "",
        sort_order   => 3,
    },
);
1;

__END__
