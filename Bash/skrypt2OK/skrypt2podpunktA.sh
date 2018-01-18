#!/bin/bash
#Bartłomiej Stąpór gr1

for i in `seq 1 9`; do
	for j in `seq 1 9`;do
		printf "$(($i * $j))	"
	done
	echo
done
