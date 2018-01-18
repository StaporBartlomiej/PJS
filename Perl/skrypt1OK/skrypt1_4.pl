#!/usr/bin/perl
#Bartłomiej Stąpór gr nr1
use Getopt::Std;

my %options=();
getopts("Ncnp", \%options);
#print length %options;

my %N = 0; #skryp1.pl // print all
my %c = 0; #skrypt2.pl // count lines without comments
my %n = 0; #skrypt3.pl // count lines with comments
my %p = 0; #skrypt4.pl // count lines for separate files in separate way

$N = 1 if defined %options{N};
$c = 1 if defined %options{c};
$n = 1 if defined %options{n};
$p = 1 if defined %options{p};

if (length %options < 2)
{
	skrypt1();
}

#print "Other things found on command line:\n" if %ARGV[0];

foreach (@ARGV)
{
	if ($N == 1)
	{
		skrypt2();
	}
	if ($n == 1)
	{
		skrypt4();
	}
	if ($c == 1)
	{
		skrypt3();
	}
	if ($p == 1)
	{
		skrypt4();
	}
	
}

sub skrypt1 
{
	while (<>){print};
}
sub skrypt2
{
	while (<>){print unless /^#/};
}
sub skrypt3
{
	while (<>){print "$.: $_" unless /^#/};
}
sub skrypt4
{
	while (<>){print "$.: $_" unless /^#/;
		close ARGV if eof;
		}
}

