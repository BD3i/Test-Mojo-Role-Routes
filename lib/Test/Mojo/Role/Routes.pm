package Test::Mojo::Role::Routes;

use strict;
use warnings;

our $VERSION = '0.001';

use Mojo::Base -role;
use Mojo::Util qw(encode);


## make requests for named routes

sub delete_route_ok {
  my $self = shift;
  my $route = shift;
  return $self->delete_ok($self->app->url_for($route), @_);
}

sub get_route_ok  {
  my $self = shift;
  my $route = shift;
  return $self->get_ok($self->app->url_for($route), @_);
}

sub head_route_ok {
  my $self = shift;
  my $route = shift;
  return $self->head_ok($self->app->url_for($route), @_);
}

sub options_route_ok {
  my $self = shift;
  my $route = shift;
  return $self->options_ok($self->app->url_for($route), @_);
}

sub patch_route_ok {
  my $self = shift;
  my $route = shift;
  return $self->patch_ok($self->app->url_for($route), @_);
}

sub post_route_ok {
  my $self = shift;
  my $route = shift;
  return $self->post_ok($self->app->url_for($route), @_);
}

sub put_route_ok {
  my $self = shift;
  my $route = shift;
  return $self->put_ok($self->app->url_for($route), @_);
}

## testing current url path and named route

sub path_is {
  my ($self, $path, $desc) = @_;
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." is $path");
  return $self->test('is', $self->tx->req->url->path => $path, $desc);
}

sub path_isnt {
  my ($self, $path, $desc) = @_;
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." isn't $path");
  return $self->test('ok', !($self->tx->req->url->path eq $path), $desc);
}

sub path_like {
  my ($self, $path, $desc) = @_;
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." like $path");
  return $self->test('like', $self->tx->req->url->path => $path, $desc);
}

sub path_unlike {
  my ($self, $path, $desc) = @_;
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." unlike $path");
  return $self->test('unlike', $self->tx->req->url->path => $path, $desc);
}

sub path_starts_with {
  my ($self, $path, $desc) = @_;
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." starts with $path");
  my $length = length($path);
  return $self->test('is', substr($self->tx->req->url->path, 0, $length) => $path, $desc);
}

sub route_is {
  my ($self, $route, $desc) = @_;
  my $path = $self->app->url_for($route);
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." is route $route -> $path");
  return $self->test('is', $self->tx->req->url->path => $path, $desc);
}

sub route_isnt {
  my ($self, $route, $desc) = @_;
  my $path = $self->app->url_for($route);
  $desc = _desc($desc, 'url path '. $self->tx->req->url->path ." isn't route $route -> $path");
  return $self->test('ok', !($self->tx->req->url->path eq $path), $desc);
}

# if no $desc is provided to test then use the default that each method defines
sub _desc { encode 'UTF-8', shift || shift }

1;

=head1 NAME

Test::Mojo::Role::Routes - Module abstract placeholder text

=head1 SYNOPSIS

=for comment Brief examples of using the module.

=head1 DESCRIPTION

=for comment The module's description.

=head1 AUTHOR

Brian Davis <bdiii@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by BD3i LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
