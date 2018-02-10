#!/usr/bin/perl
package myFunctions;
use strict;
use warnings;
my $rc;
BEGIN
	{
		require Exporter;
		our @ISA = qw(Exporter);
		our @EXPORT = qw(find2 find_in_current_directory replace file_statistics encrypt decrypt display_help);
		$rc = eval
		{
			require Term::ReadKey;
			Term::ReadKey->import();
			1;
		};

	}




#require Exporter;
#our @ISA = qw(Exporter);
#our @EXPORT = qw(find2 find_in_current_directory replace file_statistics encrypt decrypt display_help);





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


sub file_statistics
{
    my ($file) = @_;
    chomp($file);
    my $result = "tr -c '[:alnum:]' '[\n*]' < $file | sort | uniq -c | sort -nr | head  -10";
    system($result);
}

sub encrypt
{
    #print("XD");
	my ($option, $file) = @_;

	chomp($file);
	chomp($option);
	#print($option);
    #print($file);


	my $condition = "which gpg >/dev/null";
#	print($condition);
	my $out = system($condition);
#	print($out);
	if ($out != 0)
	{
		print("Skrypt do szyfrowania wymaga gpg a go nie znalazl. Prosze zainstalowac gpg aby uzyc funkcji szyfrowania/deszyfrowania.");
		exit(0);


	}
#	else {
#		print("gpg Installed\n");
#	}

	if ( $option eq "-er" )
	{
		if($rc)
		{
			print("Podaj haslo:\n");
			ReadMode 'noecho';
			my $password = ReadLine 0;
			chomp $password;
			ReadMode 'normal';
#			print($password);
			my $command = "gpg --no-batch --symmetric  --armor --passphrase $password $file";
			system($command);
#			exit(0);
			my $rm = "rm $file";
			system($rm);


		}
		else {
			print("Do poprawnego działania skrypt wymaga modulu Term::ReadKey a go nie wykryl. Prosze o zainstalowanie modulu Term::ReadKey\nNa przyklad komenda: cpan Term::ReadKey
\n");
			exit(0);
		}
#		my $read = system("read -s pass");
#		print($password);
#	    my $result = "gpg -c $file";
#	    system($result);
#	    my $rm = "rm $file";m
#	    system($rm);
	}
	else
	{
		if($rc)
		{
			print("Podaj haslo:\n");
			ReadMode 'noecho';
			my $password = ReadLine 0;
			chomp $password;
			ReadMode 'normal';
			#			print($password);
			my $command = "gpg --no-batch --symmetric  --armor --passphrase $password $file";
			system($command);
			#			exit(0);


		}
		else {
			print("Do poprawnego działania skrypt wymaga modulu Term::ReadKey a go nie wykryl. Prosze o zainstalowanie modulu Term::ReadKey\nNa przyklad komenda: cpan Term::ReadKey
\n");
			exit(0);
		}
#	    my $result = "gpg -c $file";
#        system($result);
	}


}
sub decrypt
{
	my ($file) = @_;
	chomp($file);
	my $condition = "which gpg >/dev/null";
	#	print($condition);
	my $out = system($condition);
	#	print($out);
	if ($out != 0)
	{
		print("Skrypt do szyfrowania wymaga gpg a go nie znalazl. Prosze zainstalowac gpg aby uzyc funkcji szyfrowania/deszyfrowania.");
		exit(0);


	}

#	else {
##		print("gpg Installed\n");
#	}
	if($rc)
	{
		print("Podaj haslo:\n");
		ReadMode 'noecho';
		my $password = ReadLine 0;
		chomp $password;
		ReadMode 'normal';
		#			print($password);
		my $name = substr($file, 0, -4);
		my $command = "gpg --no-batch --passphrase $password --output $name --decrypt $file";
		system($command);
		#			exit(0);


	}
	else {
		print("Do poprawnego działania skrypt wymaga modulu Term::ReadKey a go nie wykryl. Prosze o zainstalowanie modulu Term::ReadKey\nNa przyklad komenda: cpan Term::ReadKey
\n");
		exit(0);
	}
#	my $string = substr($file, 0, -4);
##	print($string);
#	my $result = "gpg -d --output $string $file";
#	system($result);
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
	print("\033[1;37;40m W przypadku gdy plik znajduje sie w tym samym katalogu co skrypt wystarczy podac sama nazwe pliku. Jesli skrypt znajduje sie w innym katalogu niz plik to nalezy podac sciezke absolutna.");
	print("\033[1;37;40m Skrypt w 1 lini wyswietla liczbe nadmiarowych bialych znakow(np. podwojna spacja, pusta linia). W kolejnych sa najczesciej wystepujace wyrazy wraz z licznikiem wystapien:");
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
1;
