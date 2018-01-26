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
						echo xD
						#echo "powiekszam tab o $arg"
				fi
				if [[ $3 != "-dir" ]] && [[ $3 != '/'* ]];
					then
					#echo "in -dir if arg=$arg"
						#if [ ${#tab[*]} = 0  ]
						#then
							#echo "tablica jest pusta"
							
						#fi
						echo "grep -rn $3 ${tab[0]}"
						grep -rn $3 $2
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
	printf "\033[1;37;40mSkrypt posiada nastepujace funkcjonalnosci:\n"
        printf "\n1. Szuka frazy wystepujacej w plikach na 2 sposoby:\n"
        printf "\n   a)Szuka wystapien frazy test w podanej sciezce uruchamiajac skrypt \n"
        printf "w ponizszy sposob:\n"
	printf "\033[1;31;40m\n     ./main.sh -dir sciezka1 fraza np.\n"
        printf "\n     ./main.py -dir /home/bartek/Documents test\n"
	printf "\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:\n"
	printf "\033[1;31;40m\n       ./main.sh -c test\n"
	printf "\033[1;37;40m\n2. Szuka pliku o nazwie pelna_nazwa_pliku i podaje jego sciezke:\n"
	printf "\033[1;31;40m\n    ./main.sh --file/-f sciezka_katalogu_w_ktorym_ma_szukac pelna_nazwa_pliku\n"
	printf "\033[1;37;40m\n3. Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna)\n"
	printf "\033[1;31;40m\n    ./main.sh --encrypt/-e /home/bartek/Documents/file.txt\n"
	printf "\033[1;37;40m\n4. Odszyfrowywuje zaszyfrowany wczesniej plik:\n"
	printf "\033[1;31;40m\n    ./main.sh --decrypt/-d zaszyfrowany_plik \n"
	printf "\033[1;37;40m\n5. Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu:\n"
	printf "\033[1;31;40m\n   ./main.sh --replace/-r slowo_ktore_ma_byc_zastapione nowe_slowo sciezka_do_pliku\n"
	printf "\033[1;37;40m \n"
	
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
		if [[ "$#" = 2 ]];
		then
			encrypt $2
			exit
		else
			echo "Opcja -e/--encrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "--encrypt" ]];
	then
		if [[ "$#" = 2 ]];
		then
			encrypt $2
			exit
		else
			echo "Opcja -e/--encrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "-d" ]];
	then
		if [[ "$#" = 2 ]];
		then
			decrypt $2
			exit
		else
			echo "Opcja -d/--decrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
			exit
		fi
	fi
	
	if [[ $1 = "--decrypt" ]];
	then
		if [[ "$#" = 2 ]];
		then
			decrypt $2
			exit
		else
			echo "Opcja -d/--decrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
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


