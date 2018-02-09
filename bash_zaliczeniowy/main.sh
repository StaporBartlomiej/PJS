#!/bin/bash
#path="$(find /home/ -name "myFunctions.sh")"
#path="$(basename $0)"
#"$(ls -1)"
#basename $0
#source ${path}
#echo $0
#basename="$(basename $0)"
dirname="$(dirname $0)"
path="$dirname/myFunctions.sh"
#echo $path
#echo $path
#path="$(basename $0)"
source ${path}
#source ./functions.sh
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
	
#	if [[ $1 = "-f" ]];
#	then
#		if [[ "$#" = 3 ]];
#		then
#			findAFile $2 $3
#			exit
#		else
#			echo "Opcja -f/--file wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
#			exit
#		fi
#	fi
	
#	if [[ $1 = "--file" ]];
#	then
#		if [[ "$#" = 3 ]];
#		then
#			findAFile $2 $3
#			exit
#		else
#			echo "Opcja -f/--file wymaga 3 argumentow. Podana zostala nieprawidlowa ilosc argumentow."
#			exit
#		fi
#	fi
	
	if [[ $1 = "-e" ]] || [[ $1 = "-er" ]];
	then
		if [[ "$#" = 2 ]];
		then
			encrypt $1 $2
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

	if [[ $1 = "-s" ]]; then
		if [[ "$#" = 2 ]];
		then
			file_statistics $2
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


