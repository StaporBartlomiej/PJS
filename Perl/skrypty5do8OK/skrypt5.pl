#!/usr/bin/perl
$first=shift;
$last=shift; #@slice wszystkie indeksy od do(jest w pythonie)

$first--;
$last--;
my @list;
#print "first before = $first\n";
#print "last before = $last\n";
if($first > $last)
{
	$flag = 1;
	$diff = $first - $last;
	($first, $last) = ($last, $first);
	

}
else
{
	$diff = $last - $first;
}

#print "first = $first \nlast = $last\n";
while(<>) #w wyrazeniu regularnym trzeba dodac /^+ \d  $/ plus trzeba zapisac opcjonalnie i \d ma byc conajmniej raz lub wiecej, na koncu musi byc newline
{
	undef @words;
	chomp; # chop obcina newline a chomp to jego odmiana
	@words = split;
	
	for($a = 0; $a < $diff+1; $a = $a + 1)
	{
		push (@list, $words[$a]);
		
		
	}
	if($flag == 0)
	{

		print join(" ", @words[$first..$last])." "; # przetestowac co sie dzieje jak jakiegos elementu brakuje
		
			
	}
	else
	{
		@reversed_list = reverse(@list);
		print join(" ", @reversed_list[$first..$last])." "; # przetestowac co sie dzieje jak jakiegos elementu brakuje
	}
	
}
print "\n";
