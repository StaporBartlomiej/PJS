#!/bin/bash

function find2
{
	BASH_ARGV=$@
	tab=()
	flag=0
	#for arg2 in "${BASH_ARGV[@]}";
	#do
	#	echo $arg2
	#done
	#echo "${#BASH_ARGV[*]}"
	if [ "${#BASH_ARGV[*]}" -gt 2 ];
		then
		#echo xD
			for arg in "${BASH_ARGV[@]}" ; 
			do
			#echo $arg
				if [[ $arg = '/'* ]]; #tu nie wchodzi
					then
					#echo xD2
						tab+=$arg
						#echo "powiekszam tab o $arg"
				fi
				if [[ $3 != "-dir" ]] && [[ $3 != '/'* ]];
					then
					#echo "in -dir if arg=$arg"
						#if [ ${#tab[*]} = 0  ]
						#then
							#echo "tablica jest pusta"
							
						#fi
					
						grep -rn $3 ${tab[0]}
						break
						#for i in "${tab[@]}";
						#do
							#echo "grep -rn arg=$3 i=$i"
						#	grep -rn $3 ${tab[0]}
						#done
				fi
			done
	fi	
}

function find_in_current_directory()
{
	
	grep -rn $1 # word
	
	
}
function replace()
{
	
	sed -i -e "s/${1}/${2}/g" ${3} # old # new # dir
	
}

function findAFile()
{
	#echo $1 $2
	find $1 "-name" $2 #dir # file_name
	#echo $1 "-name" $2
}

function encrypt()
{
	
	gpg -c $1
}

function decrypt()
{
	echo $#
	
	gpg $1
}
function display_help()
{
	red='\033[0;31m'
	white='\033[1;37m'
	printf "\033[1;37;40mSkrypt posiada nastepujace funkcjonalnosci:"
        printf "\n1. Szuka frazy wystepujacej w plikach na 2 sposoby:"
        printf "\n   a)Szuka wystapien frazy test w podanej sciezce uruchamiajac skrypt "
        printf "w ponizszy sposob:"
	printf "\033[1;31;40m\n     ./main.py -dir sciezka1 fraza np."
        printf "\n     ./main.py -dir /home/bartek/Documents test"
	printf "\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:"
	printf "\033[1;31;40m\n       ./main.py -c test"
	printf "\033[1;37;40m\n2)Szuka pliku o nazwie pelna_nazwa_pliku i podaje jego sciezke:"
	printf "\033[1;31;40m\n    ./main.py --file/-f sciezka_katalogu_w_ktorym_ma_szukac pelna_nazwa_pliku"
	printf "\033[1;37;40m\n3)Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna)"
	printf "\033[1;31;40m\n    ./main.py --encrypt/-e /home/bartek/Documents/file.txt"
	printf "\033[1;37;40m\n4)Odszyfrowywuje zaszyfrowany wczesniej plik:"
	printf "\033[1;31;40m\n    ./main.py --decrypt/-d zaszyfrowany_plik "
	printf "\033[1;37;40m\n5)Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu:"
	printf "\033[1;31;40m\n   ./main.py --replace/-r slowo_ktore_ma_byc_zastapione nowe_slowo sciezka_do_pliku"
	printf "\033[1;37;40m "
	
}
function init()
{
	if [[ $1 = "-h" ]];
	then
		display_help
		exit
	fi
	
	if [[ $1 = "-dir" ]];
	then
		#echo "$#"
		if [[ "$#" = 3 ]];
		then
			find2 $1 $2 $3
			exit
		else
			echo "Bledne argumenty"
		fi
		
	fi
	
	if [[ $1 = "--help" ]];
	then
		display_help	
		exit
	fi
	
	if [[ $1 = "-f" ]];
	then
		if [[ "$#" = 3 ]];
		then
			findAFile $2 $3
			exit
		else
			echo "Opcja -f/--file wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "--file" ]];
	then
		if [[ "$#" = 3 ]];
		then
			findAFile $2 $3
			exit
		else
			echo "Opcja -f/--file wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "-e" ]];
	then
		if [[ "$#" = 3 ]];
		then
			encrypt $3
			exit
		else
			echo "Opcja -e/--encrypt wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "--encrypt" ]];
	then
		if [[ "$#" = 3 ]];
		then
			encrypt $3
			exit
		else
			echo "Opcja -e/--encrypt wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "-d" ]];
	then
		if [[ "$#" = 3 ]];
		then
			decrypt $3
			exit
		else
			echo "Opcja -d/--decrypt wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "--decrypt" ]];
	then
		if [[ "$#" = 3 ]];
		then
			decrypt $3
			exit
		else
			echo "Opcja -d/--decrypt wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "-r" ]];
	then
		if [[ "$#" = 4 ]];
		then
			replace $2 $3 $4
			exit
		else
			echo "Opcja -r/--replace wymaga 4 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "--replace" ]];
	then
		if [[ "$#" = 4 ]];
		then
			replace $2 $3 $4
			exit
		else
			echo "Opcja -r/--replace wymaga 4 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	if [[ $1 = "-c" ]]; then
		if [[ "$#" = 2 ]]; 
		then
			find_in_current_directory $2
		else
			echo "Bledna ilosc argumentow"
			exit
		fi
	fi
	
}
#find_in_current_directory $1
#replace $1 $2 $3
#findAFile $1 $2
#encrypt $1
#display_help
#decode $1
#find $1 $2 $3
init $@


