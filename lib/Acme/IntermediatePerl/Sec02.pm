package Acme::IntermediatePerl::Sec02;
use Exporter qw(import);
our @EXPORT = qw(ex1 ex3);

use strict;
use warnings;
use utf8;
use File::Spec::Functions;
use File::Find;

sub ex1 {
    my $files = [];
    find sub { push $files, $File::Find::name if not -d $File::Find::name }, curdir;
    [ sort map File::Spec->rel2abs($_), @$files ];
}

sub ex3 {
    1;
}

1;
