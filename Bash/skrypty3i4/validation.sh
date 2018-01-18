#!/bin/bash
#Bartłomiej Stąpór gr 1
function validation
{
	regex='^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])$'
	if [[ "$1" =~ $regex ]] && [[ "$2" =~ $regex ]]; then
  		echo "Argumenty prawidlowe"
  		exit 0
	else
		echo "Zly adres ip"
		exit 1
	fi
}
