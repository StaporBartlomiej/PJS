#!/bin/bash
#Bartłomiej Stąpór gr1
#temp='^-?(0-9)+$'
temp='^-?[0-9]+$'
if ! [[ $1 =~ $temp ]] || ! [[ $2 =~ $temp ]];
then
	echo "Argument nie jest liczba calkowita"
	exit 1
fi
if [ $1 -lt $2 ] ;
then
	for i in `seq "$1" "$2"`; do
		for j in `seq "$1" "$2"`;do
			var=$(($i*$j))
			printf "%s	" $var
		done
		echo
	done
else
	for i in `seq "$1" "-1" "$2"`; do
		for j in `seq "$1" "-1" "$2"`;do
			var=$(($i*$j))
			printf "%s	" $var
		done
		echo
	done
fi
exit 0
