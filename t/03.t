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

subtest 'ex2' => sub {
    my $testdir  = File::Spec->rel2abs(dirname(__FILE__));
    my $dir      = catdir($testdir, 'data', '03');
    is_deeply(ex2('/XXX/'     , $dir), [map catfile($dir, $_), qw(XXX)]);
    is_deeply(ex2('/XXX/i'    , $dir), [map catfile($dir, $_), qw(XXX xxx)]);
    is_deeply(ex2('/\w/i'     , $dir), [map catfile($dir, $_), qw(XXX a b c x-y-z x_y_z xxx)]);
    is_deeply(ex2('/[^abc]$/i', $dir), [map catfile($dir, $_), qw(XXX x-y-z x_y_z xxx)]);
    is_deeply(ex2('/+((((/'       , $dir), []);  # call with wrong regex successfully returns
};

done_testing;
