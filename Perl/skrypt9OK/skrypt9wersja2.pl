#!/usr/bin/perl
#Bartłomiej Stąpór gr nr.1

use Getopt::Std;
use functions;
%options=();
getopts("hdielcw",\%options);
my $optionsLength = scalar(%options);
my $fileName = $ARGV[0];
my ($lines, $words, $chars, $numbers, $realNumbers,$commentsLines) = (0,0,0,0,0,0);


if( $options{h} )
{
	print ("----------------------------------------------------------\nUsage ./skrypt9.pl -option -filename\nAvailable options:\n-h - displays help,\n-i - displays amount of total numbers,\n-d - displays amount of any numbers,\n-e - forces script not to count lines that starts with #.\n----------------------------------------------------------\n");
	die;
}



open(my $fh, "<", $fileName) or die "Could not open $fileName";
while (<$fh>) {
	if( $options{e} )
	{
		$lines = eOption($_,$lines,);
	}
	if ( $optionsLength == null || $options{l})
	{
		$lines++;
	}
	$chars += length($_);
	$words += scalar(split);
	my @tab = split;
	foreach my $i (@tab)
	{
		if( $options{d} )
		{
			$realNumbers = dOption($i,$realNumbers);
		}
		if ( $optionsLength == null )
		{
			$realNumbers = dOption($i,$realNumbers);
		}
    		if( $options{i} )
		{
			$numbers = iOption($i,$numbers);
		}
		if ( $optionsLength == null )
		{
			$numbers = iOption($i,$numbers);
		}
		
	}
}
if( $options{w} )
{
	print("words=$words\n");
}
if( $options{c} )
{
	print("chars=$chars\n");
}
if( $options{l} )
{
	print("lines=$lines\n");
}
if( $options{i} )
{
	print("numbers=$numbers\n");
}
if( $options{d} )
{
	print("realNumbers=$realNumbers\n");
}
if( $options{e} )
{
	print("lines=$lines words=$words chars=$chars numbers=$numbers realNumbers=$realNumbers\n");
}
if ( $optionsLength == null )
{
	print("lines=$lines words=$words chars=$chars numbers=$numbers realNumbers=$realNumbers\n");
}




