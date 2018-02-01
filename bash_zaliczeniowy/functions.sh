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
				if [[ $arg = '/'* ]];
					then
					#echo xD2
						tab+=$arg
#						echo xD
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

function file_statistics()
{
#    tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort -ir | awk 'NR>=1' | head  -10
    tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort -nr | head  -10

}
function find_in_current_directory()
{

	grep -rn $1 # word


}
function replace()
{

	sed -i -e "s/${1}/${2}/g" ${3} # old # new # dir

}

#function findAFile()
#{
#	#echo $1 $2
#	find $1 "-name" $2 #dir # file_name
#	#echo $1 "-name" $2
#}

function encrypt()
{
#echo $1
    if [[ $1 = "-er" ]];
	then
#	    echo xD
	    gpg -c $2
	    wait
	    rm $2

	else
#	    echo xD2
	    gpg -c $2
	fi

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
        printf "\n     ./main.sh -dir /home/bartek/Documents test\n"
	printf "\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:\n"
	printf "\033[1;31;40m\n       ./main.sh -c test\n"
	printf "\033[1;37;40m\n2. Wyswietla statystyki danego pliku. W statystykach pokazuje najczesciej wystepujace slowa uszeregowane malejaco w stosunku do ilosci wystapien."
	printf "\033[1;37;40m W przypadku gdy plik znajduje sie w tym samym katalogu co skrypt wystarczy podac sama nazwe pliku. Jesli skrypt znajduje sie w innym katalogu niz plik to nalezy podac sciezke absolutna."
	printf "\033[1;37;40m Skrypt w 1 lini wyswietla liczbe nadmiarowych bialych znakow(np. podwojna spacja, pusta linia). W kolejnych sa najczesciej wystepujace wyrazy wraz z licznikiem wystapien:"
	printf "\033[1;31;40m\n    ./main.sh -s pelna_nazwa_pliku\n"
	printf "\033[1;37;40m\n3. Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna) stosujac 'gpg' czyli OpenPGP encryption and signing tool. Plik, ktory jest szyfrowany domyslnie zostaje jednak mozna go usunac po zaszyfrowaniu stosujac opcje -er:\n"
	printf "\033[1;31;40m\n    ./main.sh --encrypt/-e /home/bartek/Documents/file.txt\n"
	printf "\033[1;31;40m\n    ./main.sh -er /home/bartek/Documents/file.txt\n"
	printf "\033[1;37;40m\n4. Odszyfrowywuje zaszyfrowany wczesniej plik:\n"
	printf "\033[1;31;40m\n    ./main.sh --decrypt/-d zaszyfrowany_plik \n"
	printf "\033[1;37;40m\n5. Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu. Skrypt zastepuje wszystkie slowa oraz czesci slow pasujace do patternu:\n"
	printf "\033[1;31;40m\n   ./main.sh --replace/-r slowo_ktore_ma_byc_zastapione nowe_slowo sciezka_do_pliku\n"
	printf "\033[1;37;40m \n"

}