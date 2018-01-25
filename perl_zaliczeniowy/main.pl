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

sub encrypt
{
	my ($file) = @_;
	chomp($file);
	my $result = "gpg -c $file";
	system($result);
}
sub decrypt
{
	my ($file) = @_;
	chomp($file);
	my $result = "gpg $file";
	system($result);
}
sub display_help
{
	print("\033[1;37;40mSkrypt posiada nastepujace funkcjonalnosci:");
	print("\n1. Szuka frazy wystepujacej w plikach na 2 sposoby:");
	print("\n   a)Szuka wystapien frazy test w podanej sciezce uruchamiajac skrypt ");
	print("w ponizszy sposob:");
	print("\033[1;31;40m\n     ./main.py -dir sciezka1 fraza np.");
	print("\n     ./main.py -dir /home/bartek/Documents test");
	print("\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:");
	print("\033[1;31;40m\n       ./main.py -c test");
	print("\033[1;37;40m\n2. Szuka pliku o nazwie pelna_nazwa_pliku i podaje jego sciezke:");
	print("\033[1;31;40m\n    ./main.py --file/-f sciezka_katalogu_w_ktorym_ma_szukac pelna_nazwa_pliku");
	print("\033[1;37;40m\n3. Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna)");
	print("\033[1;31;40m\n    ./main.py --encrypt/-e /home/bartek/Documents/file.txt");
	print("\033[1;37;40m\n4. Odszyfrowywuje zaszyfrowany wczesniej plik:");
	print("\033[1;31;40m\n    ./main.py --decrypt/-d zaszyfrowany_plik ");
	print("\033[1;37;40m\n5. Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu:");
	print("\033[1;31;40m\n   ./main.py --replace/-r slowo_ktore_ma_byc_zastapione nowe_slowo sciezka_do_pliku");
	print("\033[1;37;40m ");
	
}

sub init
{
	my $argv_len = $#ARGV +1;
	
	if( ( $ARGV[0] eq "-h" ) || ($ARGV[0] eq "--help"))
	{
		display_help();
	}
	
	if ( ( $ARGV[0] eq "-dir" ) && ($argv_len == 3) )
	{
		
	}
}

#print ("$xD");
#find2($ARGV[0], $ARGV[1], $ARGV[2]); 

#find_in_current_directory($ARGV[0], $ARGV[1]);
#replace($ARGV[0], $ARGV[1], $ARGV[2]);
#findAFile($ARGV[0], $ARGV[1]);
#encrypt($ARGV[0]);
#decrypt($ARGV[0]);

print ($xD);
print("\n");
init(@ARGV);


