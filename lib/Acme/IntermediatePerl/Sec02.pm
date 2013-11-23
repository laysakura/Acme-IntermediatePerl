package Acme::IntermediatePerl::Sec02;
use Exporter qw(import);
our @EXPORT = qw(ex1 ex3);

use strict;
use warnings;
use utf8;
use File::Spec::Functions;
use File::Find;
use Business::ISBN;
use Search::Fulltext;

sub ex1 {
    my $files = [];
    find sub { push $files, $File::Find::name if not -d $File::Find::name }, curdir;
    [ sort map File::Spec->rel2abs($_), @$files ];
}

sub ex3 {
    my $isbn = Business::ISBN->new('978-4-87311-628-0');
    {
        group_code     => $isbn->group_code,
        publisher_code => $isbn->publisher_code,
    };
}

1;
