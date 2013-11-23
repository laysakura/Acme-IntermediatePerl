use strict;
use warnings;
use utf8;
use Test::More;
use File::Basename qw(dirname);
use File::Spec::Functions;
use Acme::IntermediatePerl::Sec03 qw(ex1 ex2);

subtest 'ex1' => sub {
    my $testdir  = File::Spec->rel2abs(dirname(__FILE__));
    my $dir      = catdir($testdir, 'data', '03');
    is_deeply(
        ex1([map catfile($dir, $_), qw(a b c)]),
            [map catfile($dir, $_), qw(a   c)]
    );
};

done_testing;
