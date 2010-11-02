package PerlMongers::Web;
our $VERSION = '0.01';

use Catalyst qw(

  ConfigLoader
  Static::Simple
  Unicode::Encoding

  Authentication
  Authorization::Roles

  Session
  Session::Store::FastMmap
  Session::State::Cookie
);

use PerlMongers::Web::Request;

# use Catalyst::Log::Log4perl;

# Configure the application.
#
# Note that settings in payitforward_web.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with a external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name                   => 'PerlMongers::Web',
    'Plugin::ConfigLoader' => { file => 'conf/catalyst.yml' },

    # 'Plugin::Authentication' => {
    #     default_realm => 'user',
    #     use_session   => 1,
    #     user          => {
    #         credential => {
    #             class         => 'Password',
    #             password_type => 'self_check'
    #         },
    #         store => {
    #             class      => 'Model::KiokuDB',
    #             model_name => 'Kioku',
    #         }
    #     }
    # },
);

__PACKAGE__->request_class('PerlMongers::Web::Request');

# __PACKAGE__->log( Catalyst::Log::Log4perl->new('conf/catalyst_logging.conf') );

# Start the application
__PACKAGE__->setup();
1;
__END__

=head1 NAME

PerlMongers::Web - Catalyst based application

=head1 SYNOPSIS

    script/perlmongers_web_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<PerlMongers::Web::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Chris Prather

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
