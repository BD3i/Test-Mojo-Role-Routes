requires 'perl', '5.16.0';

# requires 'Some::Module', 'VERSION';
requires 'Mojolicious', '7.60';

on test => sub {
    requires 'Test::More', '0.96';
};
