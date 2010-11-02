package PerlMongers::Model::XML::Mailing_list;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'email_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Email]',
    is          => 'ro',
    init_arg    => 'emails',
    traits      => [qw(XML Array)],
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    handles     => { add_email => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "email",
        node_type    => "child",
        Name         => "email",
        NamespaceURI => "",
        sort_order   => 0,
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
        sort_order   => 1,
    },
);

sub add_name { shift->name(shift) }

has 'subscribe_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Subscribe]',
    is          => 'ro',
    init_arg    => 'subscribes',
    traits      => [qw(XML Array)],
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    handles     => { add_subscribe => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "subscribe",
        node_type    => "child",
        Name         => "subscribe",
        NamespaceURI => "",
        sort_order   => 2,
    },
);
has 'unsubscribe_collection' => (
    isa         => 'ArrayRef[PerlMongers::Model::XML::Unsubscribe]',
    is          => 'ro',
    init_arg    => 'unsubscribes',
    traits      => [qw(XML Array)],
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    handles     => { add_unsubscribe => ['push'] },
    description => {
        Prefix       => "",
        LocalName    => "unsubscribe",
        node_type    => "child",
        Name         => "unsubscribe",
        NamespaceURI => "",
        sort_order   => 3,
    },
);
1;

__END__
