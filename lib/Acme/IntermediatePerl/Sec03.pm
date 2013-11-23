package Acme::IntermediatePerl::Sec03;
use Exporter qw(import);
our @EXPORT = qw(ex1 ex2);

use strict;
use warnings;
use utf8;
use File::Spec::Functions;

sub ex1 {
    my $files = shift;
    [grep -s $_ < 1000, @$files];
}

sub ex2 {
    my ($pattern, $dir) = @_;
    [sort grep eval $pattern, glob(catfile($dir, '*'))];
}

1;
