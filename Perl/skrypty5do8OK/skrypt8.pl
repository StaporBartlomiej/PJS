#!/usr/bin/perl
#Bartłomiej Stąpór gr1
$first=shift;
$last=shift; 
$sep=shift;

$first--;
$last--;

while(<>)
{	
	undef @words;
	chomp; 
	@words = split(/[$sep]/, $_);

	print("$words[$first] $words[$last] \n"); 
	
	
}
print "\n";
#uruchomienie ./skrypt8.pl 1 3 , test2.txt 
