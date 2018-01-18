#!/bin/bash
#Bartłomiej Stąpór gr 1
function itoa
{
	echo -n $(($(($(($((${1}/256))/256))/256))%256)).
	echo -n $(($(($((${1}/256))/256))%256)).
	echo -n $(($((${1}/256))%256)).
	echo $((${1}%256)) 
}
echo $(itoa $1)
