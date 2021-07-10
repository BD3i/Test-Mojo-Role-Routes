#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

del '/' => sub ($c) {
  $c->render(template => 'index');
} => 'delete';

get '/' => sub ($c) {
  $c->render(template => 'index');
} => 'index';

options '/' => sub ($c) {
  $c->render(template => 'index');
} => 'options';

patch '/' => sub ($c) {
  $c->render(template => 'index');
} => 'patch';

post '/' => sub ($c) {
  $c->render(template => 'index');
} => 'post';

put '/' => sub ($c) {
  $c->render(template => 'index');
} => 'put';

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
