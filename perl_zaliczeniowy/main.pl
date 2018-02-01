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

%sub findAFile
%{
%	my ($path, $file_name) = @_;
%	chomp($path);
%	chomp($file_name);
%	my $result = "find $path -name $file_name";
%	system($result);
%}

sub file_statistics
{
    my ($file) = @_;
    chomp($file);
    my $result = "tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort -nr | head  -10"
    system($result)
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
	print("\033[1;37;40mSkrypt posiada nastepujace funkcjonalnosci:\n");
	print("\n1. Szuka frazy wystepujacej w plikach na 2 sposoby:\n");
	print("\n   a)Szuka wystapien frazy test w podanej sciezce uruchamiajac skrypt w ponizszy sposob: \n");
	print("\033[1;31;40m\n     ./main.pl -dir sciezka1 fraza np.\n");
	print("\n     ./main.pl -dir /home/bartek/Documents test\n");
	print("\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:\n");
	print("\033[1;31;40m\n       ./main.pl -c test\n");
	print("\033[1;37;40m\n2. Wyswietla statystyki danego pliku. W statystykach pokazuje najczesciej wystepujace slowa uszeregowane malejaco w stosunku do ilosci wystapien. \n");
	print("\033p1;37;40m W przypadku gdy plik znajduje się w tym samym katalogu co skrypt wystarczy podac sama nazwe pliku. Jesli skrypt znajduje sie w innym katalogu niz plik to nalezy podac sciezke absolutna.");
	print("\033p1;37;40m Skrypt w 1 lini wyswietla liczbe nadmiarowych bialych znakow(np. podwojna spacja, pusta linia). W kolejnych sa najczesciej wystepujace wyrazy wraz z licznikiem wystapien:");
	print("\033[1;31;40m\n    ./main.pl -s pelna_nazwa_pliku\n\n");
	print("\033[1;37;40m\n3. Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna) stosujac 'gpg' czyli OpenPGP encryption and signing tool. Plik, ktory jest szyfrowany domyslnie zostaje jednak mozna go usunac po zaszyfrowaniu stosujac opcje -er:\n");
	print("\033[1;31;40m\n    ./main.pl --encrypt/-e /home/bartek/Documents/file.txt\n");
	print("\033[1;31;40m\n    ./main.pl -er /home/bartek/Documents/file.txt\n");
	print("\033[1;37;40m\n4. Odszyfrowywuje zaszyfrowany wczesniej plik:\n");
	print("\033[1;31;40m\n    ./main.pl --decrypt/-d zaszyfrowany_plik \n");
	print("\033[1;37;40m\n5. Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu. Skrypt zastepuje wszystkie slowa oraz czesci slow pasujace do patternu:\n");
	print("\033[1;31;40m\n   ./main.pl --replace/-r slowo_ktore_ma_byc_zastapione nowe_slowo sciezka_do_pliku\n");
	print("\033[1;37;40m \n");
	
}

sub init
{
	my $argv_len = $#ARGV +1;
	
	if( ( $ARGV[0] eq "-h" ) || ($ARGV[0] eq "--help"))
	{
		display_help();
		exit(0);
	}
	
	if ( ( $ARGV[0] eq "-dir" ) )
	{
	
		if($argv_len == 3) 
		{
			find2($ARGV[0], $ARGV[1], $ARGV[2]); 
			exit(0);
		}
		else
		{
			print ("Bledne argumenty\n");
			exit(0);
		}
		
	}
	if (  ($ARGV[0] eq "-f") || ($ARGV[0] eq "--file") )
	{
		if ( $argv_len == 3 )
		{
			findAFile($ARGV[1], $ARGV[2]);
			exit(0);
		}
		else
		{
			print ("Opcja -f/--file wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	if ( ($ARGV[0] eq "-e") || ($ARGV[0] eq "--encrypt") )
	{
		if ($argv_len == 2)
		{
			encrypt($ARGV[1]);
			exit(0);
		}
		else
		{
			print ("Opcja -e/--encrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
	if ( ($ARGV[0] eq "-d") || ($ARGV[0] eq "--decrypt") )
	{
		if ($argv_len == 2)
		{
			decrypt($ARGV[1]);
			exit(0);
		}
		else
		{
			print ("Opcja -d/--decrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
	if ( ($ARGV[0] eq "-r") || ($ARGV[0] eq "--replace") )
	{
		if ($argv_len == 4)
		{
			replace($ARGV[1], $ARGV[2], $ARGV[3]);
			exit(0);
		}
		else
		{
			print ("Opcja -r/--replace wymaga 4 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
	if ($ARGV[0] eq "-c") 
	{
		if ($argv_len == 2)
		{
			find_in_current_directory($ARGV[0], $ARGV[1]);
			exit(0);
		}
		else
		{
			print ("Opcja -r/--replace wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
}

#print ("$xD");


#
#

#
#decrypt($ARGV[0]);

init(@ARGV);


