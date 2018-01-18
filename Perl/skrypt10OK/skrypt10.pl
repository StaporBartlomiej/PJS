#!/usr/bin/perl
#Bartłomiej Stąpór gr nr.1
use functions;
use Data::Dumper;
my $fileName = $ARGV[0];


open(my $fh,"<", $fileName) or die "Could not open $fileName";

my %data = ();
my %averageHash = ();
$average = 0;
$marksCounter = 0;
while(<$fh>)
{
	my @tab = split;
	#print("Hash was not defined!\nCreating hash!\n");
	$name = ucfirst lc $tab[0];
	$surname = ucfirst lc $tab[1];
	$fullName = "$surname $name";
	#print("Inserting $fullName with mark $tab[2]\n");
	#%data = ($fullName => $tab[2]);
	$finalMark = $tab[2];
	$mark = $finalMark;
	if ($finalMark =~ /\+\d/){
		$finalMark = substr($finalMark,1);
		$finalMark+=0.25;
	}
	if ($finalMark =~ /\-\d/){
		$ofinalMarkcena = substr($finalMark,1);
		$finalMark-=0.25;
	}
	if ($finalMark =~ /\d\+/){
		$finalMark = substr($finalMark,0,-1);
		$finalMark+=0.25;
	}
	if ($finalMark =~ /\d\-/){
		$finalMark = substr($finalMark,0,-1);
		$finalMark-=0.25;
	}
	if(dOption($finalMark) == 0 || !($finalMark =~ /\d+|\d+\.\d+/))
	{
		print STDERR "Invalid Mark!\n";
		next;
	}
	if (!($finalMark >= 1.75 && $finalMark <= 5.25 ))
	{
		print STDERR "Mark out of valid scope!\n";
		next;
	}
	
	push (@{ $data{$fullName} }, $mark);
	if (exists $averageHash{$fullName})
	{
		$averageHash{$fullName} += $mark;
	}
	else
	{
		$averageHash{$fullName} = $mark;
	}	
}
my @keys = keys %data;
for $key (@keys)
{
	$finalAverage = $averageHash{$key};
	print "$key: ",join(" ",@{$data{$key}})," : $finalAverage \n";
}



