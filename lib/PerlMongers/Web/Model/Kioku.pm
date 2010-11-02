package PerlMongers::Web::Model::Kioku;
use Moose;
use PerlMongers::KiokuDB;
BEGIN { extends qw(Catalyst::Model::KiokuDB) }

has '+model' => ( handles => 'PerlMongers::Data::API', );

has '+model_class' => ( default => 'PerlMongers::KiokuDB' );

1;
