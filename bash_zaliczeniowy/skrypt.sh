#!/bin/bash

#function find
#{
#	if [ "$#" -gt 2 ];
#		then
#			for arg in ${BASH_ARGV[*]} ; do
#			{
#				if [ $arg -ne "-dir"];
#					then
#						
#			}
#}

function find_in_current_directory()
{
	if [ "$#" -lt 1 ];
	then
		echo "Zbyt mala ilosc argumentow"
		exit
	fi
	if [ "$#" -gt 1 ];
	then
		echo "Zbyt duza ilosc argumentow"
		exit
	fi
	grep -rn $1 # word
	
	
}
function replace()
{
	if [ "$#" -ne 3 ];
	then
		echo "Nieprawidlowa ilosc argumentow"
		exit
	fi
	sed -i -e "s/${1}/${2}/g" ${3} # old # new # dir
	
}

function findAFile()
{
	if [ "$#" -ne 2 ];
	then
		echo "Nieprawidlowa ilosc argumentow"
		exit
	fi
	find $1 "-name" $2 #dir # file_name
	#echo $1 "-name" $2
}

function encrypt()
{
	if [ "$#" -ne 1 ];
	then
		echo "Nieprawidlowa ilosc argumentow"
		exit
	fi
	gpg -c $1
}

function decrypt()
{
	echo $#
	if [ "$#" -ne 1 ];
	then
		echo "Nieprawidlowa ilosc argumentow"
		exit
	fi
	
	gpg $1
}
function display_help()
{
	red='\033[0;31m'
	white='\033[1;37m'
	printf "\033[1;37;40mSkrypt posiada nastepujace funkcjonalnosci:"
        printf "\n1. Szuka frazy wystepujacej w plikach na 2 sposoby:"
        printf "\n   a)Szuka wystapien frazy test w podanej sciezce(mozna szukac w kilku katalogach, uruchamiajac skrypt "
        printf "w ponizszy sposob:"
	printf "\033[1;31;40m\n     ./main.py -dir sciezka1 -dir sciezka2 fraza np."
        printf "\n     ./main.py -dir /home/bartek/Documents test"
	printf "\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:"
	printf "\033[1;31;40m\n       ./main.py test"
	printf "\033[1;37;40m\n2)Szuka pliku o nazwie pelna_nazwa_pliku i podaje jego sciezke:"
	printf "\033[1;31;40m\n    ./main.py --file/-f sciezka_katalogu_w_ktorym_ma_szukac pelna_nazwa_pliku"
	printf "\033[1;37;40m\n3)Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna)"
	printf "\033[1;31;40m\n    ./main.py --encrypt/-e /home/bartek/Documents/file.txt"
	printf "\033[1;37;40m\n4)Odszyfrowywuje zaszyfrowany wczesniej plik:"
	printf "\033[1;31;40m\n    ./main.py --decrypt/-d zaszyfrowany_plik "
	printf "\033[1;37;40m\n5)Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu:"
	printf "\033[1;31;40m\n   ./main.py --replace/-r sciezka_do_pliku slowo_ktore_ma_byc_zastapione nowe_slowo"
	printf "\033[1;37;40m "
	
}
function init()
{
	if [[ $1 = "-h" ]];
	then
		display_help
		exit
	fi
	
	if [[ $1 = "--help" ]];
	then
		display_help
		exit
	fi
	
	if [[ $1 = "-f" ]];
	then
		findAFile
		exit
	fi
	
	if [[ $1 = "--file" ]];
	then
		findAFile
		exit
	fi
}
#find_in_current_directory $1
#replace $1 $2 $3
#findAFile $1 $2
#encrypt $1
#display_help
#decode $1
init $1


