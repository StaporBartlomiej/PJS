#!/bin/bash
#Bartłomiej Stąpór gr 1
function validation
{
	regex='^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])$'
	if [[ "$1" =~ $regex ]] && [[ "$2" =~ $regex ]]; then
  		echo "Argumenty prawidlowe"
	else
		echo "Zly adres ip"
		exit 1
	fi
}
function atoi
{
	IP=$1; IPNUM=0
	for (( i=0 ; i<4 ; ++i )); do
		((IPNUM+=${IP%%.*}*$((256**$((3-${i}))))))
		IP=${IP#*.}
	done
	echo $IPNUM 
} 

function itoa
{
	echo -n $(($(($(($((${1}/256))/256))/256))%256)).
	echo -n $(($(($((${1}/256))/256))%256)).
	echo -n $(($((${1}/256))%256)).
	echo $((${1}%256)) 
}
	validation $1 $2
	#echo $1
	#echo $2
	arg1=$(atoi $1)
	arg2=$(atoi $2)
	if [[ $arg1 -lt $arg2 ]]; then
		start=$(atoi $1)
		end=$(atoi $2)
	else
		start=$(atoi $2)
		end=$(atoi $1)
	fi
	#echo "start = $start"
	#echo "end = $end"
	startN=$(itoa $start)
	endN=$(itoa $end)

	#echo "startN = $startN"
	#echo "endN = $endN"

	for i in `seq $start $end`; do
	result=$(itoa $i)
	#echo $result
	#echo `ping -c 1 -W 1 {$result}`
	if ping -c 1 -W 1 "$result" &>/dev/null; then
		echo "$result żywy"
	else
		echo "$result martwy"
	fi
done
exit 0






