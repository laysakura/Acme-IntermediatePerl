use strict;
use warnings;
use utf8;
use Test::More;
use File::Basename qw(dirname);
use Cwd qw (abs_path);
use Perl::IntermediatePerl::Sec02 qw (ex1 ex3);

# ex1
{
    my $testdir = abs_path(dirname(__FILE__));
    chdir $testdir;
    print $testdir;
}
