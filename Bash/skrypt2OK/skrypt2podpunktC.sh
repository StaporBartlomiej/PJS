#!/bin/bash
#Bartłomiej Stąpór gr1
temp='^-?[0-9]+$'
operator='^(\+|-|\*|/|%|\^)$'

display_usage() {
	echo "This script support basic arithmetics operations like: +,-,/,*,^"
	echo "Usage: ./skrypt3.sh 4 + 2"
	echo "Attention!"
	echo "In case of arguments '/' and '*', they should be prefixed with \ "
	echo "Example: ./skrypt3.sh 4 \/ 2"
}
for i in "$@"; do
	if [ $i = "-h" ];
	then
		display_usage
		exit 0
	fi
done

if ! [[ $1 =~ $temp ]] && ! [[ $3 =~ $temp ]];
then
	echo "Argument is not an integer"
	display_usage
	exit 1
fi
if [ $1 -lt $3 ] ;
then
	for i in `seq "$1" "$3"`; do
		for j in `seq "$1" "$3"`;do
			if [[ "$2" =~ $operator ]];
			then				
				var=$(bc <<< "scale=2;$i $2 $j")
			fi
			printf "%s	" $var
		done
		echo
	done
else
	for i in `seq "$1" "-1" "$3"`; do
		for j in `seq "$1" "-1" "$3"`;do
			if [[ "$2" =~ $operator ]];
			then				
				var=$(bc <<< "scale=2;$i $2 $j")
			fi
			printf "%s	" $var
		done
		echo
	done
fi
exit 0
