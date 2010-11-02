package PerlMongers::Model::XML::Perl_mongers;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'group_collection' => (
    isa        => 'ArrayRef[PerlMongers::Model::XML::Group]',
    is         => 'ro',
    init_arg   => 'groups',
    traits     => [qw(XML Array)],
    lazy       => 1,
    default    => sub { [] },
    handles    => {
        add_group => 'push',
        groups    => 'elements'
    },
    description => {
        Prefix       => "",
        LocalName    => "group",
        node_type    => "child",
        Name         => "group",
        NamespaceURI => "",
        sort_order   => 0,
    },
);
1;

__END__
