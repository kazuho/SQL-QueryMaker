use strict;
use warnings;
use SQL::QueryMaker;
use Test::More;

sub doit {
    my ($code, $name) = @_;
    local $@;
    my $query = $code->();
    ok ! defined $query, "$name - does not return anything";
    ok $@, "$name - error is thrown";
}

doit(sub { eval {
    sql_eq('foo' => [1,2,3]);
}}, "sql_eq");

doit(sub { eval {
    sql_in('foo' => [[1,2,3], 4]);
}}, "sqn_in");

doit(sub { eval {
    sql_and(a => [ [1,2], 3]);
}}, "sql_and");

done_testing;
