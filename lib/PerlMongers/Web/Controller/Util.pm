package PerlMongers::Web::Controller::Util;
use Moose::Role;
use namespace::autoclean;

sub handle_invalid_request {
    my ( $self, $c, $uri, $errmsg ) = @_;
    $c->log->debug($errmsg);

    my $is_browser = $c->request->looks_like_browser;
    if ($is_browser) {
        $c->response->redirect($uri);
        $c->detach;
    }
    $self->status_bad_request( $c, message => $errmsg );
    $c->detach;
}

sub handle_resource_creation {
    my ( $self, $c, $uri, $obj ) = @_;
    my $is_browser = $c->request->looks_like_browser;
    $c->log->debug("created resource at $uri");
    if ($is_browser) {
        $c->response->redirect($uri);
        $c->detach;
    }
    $self->status_created(
        $c,
        location => $uri,
        entity   => $obj->pack,
    );
    $c->detach;
}

1;
__END__
