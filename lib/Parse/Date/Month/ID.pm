package Parse::Date::Month::ID;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(parse_date_month_id $Pat);

our %month_values = (
    jan => 1,
    januari => 1,
    january => 1,

    feb => 2,
    peb => 2,
    februari => 2,
    pebruari => 2,
    february => 2,

    mar => 3,
    mrt => 3,
    maret => 3,
    march => 3,

    apr => 4,
    april => 4,

    mei => 5,
    may => 5,

    jun => 6,
    juni => 6,
    june => 6,

    jul => 7,
    juli => 7,
    july => 7,

    agu => 8,
    aug => 8,
    agt => 8,
    agustus => 8,
    august => 8,

    sep => 9,
    sept => 9,
    september => 9,

    okt => 10,
    oct => 10,
    oktober => 10,
    october => 10,

    nov => 11,
    nop => 11,
    november => 11,
    nopember => 11,

    des => 12,
    dec => 12,
    desember => 12,
    december => 12,
);

our $Pat = join("|", sort keys %month_values); $Pat = qr/(?:$Pat)/;

our %SPEC;

$SPEC{parse_date_month_id} = {
    v => 1.1,
    summary => 'Parse month name from Indonesian text',
    description => <<'_',

Returns undef when month name is unrecognized.

_
    args    => {
        text => {
            summary => 'The input text that contains month name',
            schema => 'str*',
            pos => 0,
            req => 1,
        },
    },
    result_naked => 1,
};
sub parse_date_month_id {
    my %args = @_;
    my $text = $args{text};

    $text =~ s/^\s+//s;
    return undef unless length($text);

    $month_values{lc $text};
}

1;
# ABSTRACT:

=head1 SYNOPSIS

 use Parse::Date::Month::ID qw(parse_date_month_id);

 my $m = parse_date_month_id(text => "sept"); # 9
 $m = parse_date_month_id(text => "mars"); # undef


=head1 DESCRIPTION

The goal of this module is to parse month names commonly found in Indonesian
text. It currently parses abbreviated and full month names in Indonesian as well
as English, since English date are also mixed in Indonesian text.


=head1 VARIABLES

None are exported by default, but they are exportable.

=head2 $Pat

A regex.


=head1 SEE ALSO

A more full-fledged Indonesian date parsing module:
L<DateTime::Format::Alami::ID>, with more dependencies.

Somewhat related: L<Parse::Number::ID>

=cut
