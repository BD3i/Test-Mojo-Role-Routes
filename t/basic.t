use strict;
use Test::More;
use Mojo::File qw(curfile);
use Test::Mojo::WithRoles 'Routes';

my $script = curfile->dirname->sibling('t/myapp.pl');

my $t = Test::Mojo::WithRoles->new($script);

ok $t->does('Test::Mojo::Role::Routes'), 'does Routes';

$t->delete_route_ok('delete')
  ->route_is('delete')
  ->status_is(200);

$t->get_route_ok('unknown')
  ->route_is('unknown')
  ->status_is(404);

$t->get_route_ok('index')
  ->route_is('index')
  ->status_is(200);

$t->head_route_ok('index')
  ->route_is('index')
  ->status_is(200);

$t->options_route_ok('options')
  ->route_is('options')
  ->status_is(200);

$t->patch_route_ok('patch')
  ->route_is('patch')
  ->status_is(200);

$t->post_route_ok('post')
  ->route_is('post')
  ->status_is(200);

$t->put_route_ok('put')
  ->route_is('put')
  ->status_is(200);

done_testing();
