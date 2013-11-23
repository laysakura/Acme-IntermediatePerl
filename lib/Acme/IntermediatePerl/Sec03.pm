package Acme::IntermediatePerl::Sec03;
use Exporter qw(import);
our @EXPORT = qw(ex1 ex2);

use strict;
use warnings;
use utf8;

sub ex1 {
    my $files = shift;
    [grep -s $_ < 1000, @$files];
}

1;
