#!/bin/bash
#Bartłomiej Stąpór
if [ "$#" -lt 1 ];
	then
		echo $USER
		exit 0
	fi
while getopts ":hq" opt; do
	case $opt in
		h)
			echo "Program podaje login uzytkownika"
			break;;

		q)
			continue;;
		?)
			echo "Nieznana opcja"
			echo "Program podaje login uzytkownika"
			break;;
	esac
done
