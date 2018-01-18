#!/usr/bin/perl
$first=shift;
$last=shift; #@slice wszystkie indeksy od do(jest w pythonie)

$first--;
$last--;
#print "first before = $first\n";
#print "last before = $last\n";

#print "first = $first \nlast = $last\n";
while(<>) #w wyrazeniu regularnym trzeba dodac /^+ \d  $/ plus trzeba zapisac opcjonalnie i \d ma byc conajmniej raz lub wiecej, na koncu musi byc newline
{	
	
	
	undef @words;
	chomp; # chop obcina newline a chomp to jego odmiana
	@words = split;
	#print ("Ilosc slow: \n",@words);
	#print "$#words \n";
	#print ("first = $first\nlast = $last\n");
	print("$words[$first] $words[$last] "); 
	
	
}
print "\n";
