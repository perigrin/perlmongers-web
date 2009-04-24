package PerlMongers::Web::Model::XML;
use base 'Catalyst::Model::Adaptor';
 __PACKAGE__->config( class => 'PerlMongers::Web::Model::XML::Loader' );