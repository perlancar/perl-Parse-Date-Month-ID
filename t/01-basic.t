#!perl

use 5.010001;
use strict;
use warnings;
use Test::More 0.98;

use Parse::Date::Month::ID qw(parse_date_month_id);

is_deeply(parse_date_month_id(text=>"se"), 9);
is_deeply(parse_date_month_id(text=>"sep"), 9);
is_deeply(parse_date_month_id(text=>"Jun"), 6);
is_deeply(parse_date_month_id(text=>"SEP"), 9);
is_deeply(parse_date_month_id(text=>"sept"), 9);
is_deeply(parse_date_month_id(text=>"mars"), undef);

DONE_TESTING:
done_testing();
