use strict;
use warnings;
use utf8;
use Test::More;
use File::Basename qw(dirname);
use File::Spec::Functions;
use Acme::IntermediatePerl::Sec02 qw(ex1 ex3);

subtest 'ex1' => sub {
    my $orig_dir = curdir;
    my $testdir  = File::Spec->rel2abs(dirname(__FILE__));
    my $dir      = catdir($testdir, 'data', '02');
    chdir $dir;

    my @files = qw(a b c x/y x/z);
    is_deeply(ex1(), [ map(catfile($dir, $_), @files) ]);

    chdir $orig_dir;
};

done_testing;
