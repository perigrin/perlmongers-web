package PerlMongers::Model::XML::Tsar;
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

has 'pause_id' => (
    isa         => 'PerlMongers::Model::XML::Pause_id',
    is          => 'rw',
    traits      => [qw(XML)],
    description => {
        Prefix       => "",
        LocalName    => "pause_id",
        node_type    => "child",
        Name         => "pause_id",
        NamespaceURI => "",
        sort_order   => 2,
    },
);
sub add_pause_id { shift->pause_id(shift) }

1;
__END__
