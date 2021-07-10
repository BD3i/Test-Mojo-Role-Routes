use strict;
use Test::More;
use Mojo::File qw(curfile);
use Test::Mojo::WithRoles 'Routes';

my $script = curfile->dirname->sibling('t/myapp.pl');

my $t = Test::Mojo::WithRoles->new($script);

ok $t->does('Test::Mojo::Role::Routes'), 'does Routes';

$t->get_route_ok('unknown')
  ->route_is('unknown')
  ->status_is(404);

$t->get_route_ok('index')
  ->route_is('index')
  ->status_is(200);

done_testing();
