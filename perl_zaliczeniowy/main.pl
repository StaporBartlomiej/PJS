#!/usr/bin/perl
use strict;
use warnings;
sub find2
{
	my ($option, $path, $word) = @_;
	chomp($path);
	chomp($word);
	my $result = "grep -r -n $word $path";
	system($result);

}

sub find_in_current_directory
{
	my ($option, $word) = @_;
	chomp($word);
	my $result = "grep -rn $word";
	system($result);
}

sub replace
{
	my ($old_word, $new_word, $path) = @_;
	chomp($old_word);
	chomp($new_word);
	chomp($path);
	my $result = "sed -i -e s/$old_word/$new_word/g $path";
	system($result);
}

sub findAFile
{
	my ($path, $file_name) = @_;
	chomp($path);
	chomp($file_name);
	my $result = "find $path -name $file_name";
	system($result);
}

#print ("$xD");
#find2($ARGV[0], $ARGV[1], $ARGV[2]); 

#find_in_current_directory($ARGV[0], $ARGV[1]);
#replace($ARGV[0], $ARGV[1], $ARGV[2]);
findAFile($ARGV[0], $ARGV[1]);

