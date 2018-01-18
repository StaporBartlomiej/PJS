#!/bin/bash
#Bartłomiej Stąpór gr 1
#counter=$`sh ./counter.sh 0`
#. ./counter.sh
#temp=$(. ./counter.sh)

#czytac z pliku o nazwie portu
#port=52059
name=`basename $0`


if ! [ -e port.txt ]
then
	echo "52059" > port.txt
fi

if ! [ -e counter52059.txt ]
then
	echo "0" > counter52059.txt
fi

if ! [ -e defaultIP.txt ]
then
	echo "127.0.0.1" > defaultIP.txt
fi

if ! [ -e test.txt ]
then
	echo "test" > test.txt
fi


while getopts ":scpfih" opt; do
	case $opt in
		c)	
			while IFS= read -r p; do
				echo "Just read port: $p"
				port=$p
			done < port.txt
			while IFS= read -r p; do
				echo "Just read ip: $p"
				ipNumber=$p
			done < defaultIP.txt
			while IFS= read -r j; do
				echo "Counter: $j"
				counter=$j
			done < counter$port.txt
			echo `nc -q 1 -v $ipNumber $port < test.txt`
			;;

		s)	
			echo "Checking if port is available..."
			
			response=$(nc -w 1 -z 127.0.0.1 $port 2>&1)
			used=$?
			if [ "$used" == 0 ] ; then
				echo "Port already in use!"
				exit 1;	
			fi
			while IFS= read -r p; do
				echo "Just read port: $p"
				port=$p
			done < port.txt
			
			if ! [ -e counter$port.txt ]
			then
				echo "0" > counter$port.txt
			fi
			
			while IFS= read -r line; do
				echo "Just read counter: $line"
				counter=$line
			done < counter$port.txt
			echo "Counter: $counter"
			while true; do
				echo `nc -l -v -p $port > test.txt`
				counter=$((counter+1))
				echo "Counter: $counter"
				var2=$counter
				echo "$counter" > counter$port.txt
			done
			;;
		p)	port=$2
			echo "$port" > port.txt
			;;
		f)	while IFS= read -r p; do
				echo "Port: $p"
				port=$p
			done < port.txt
			newCounter=$2
			echo "New Counter: $newCounter"
			echo "$newCounter" > counter$port.txt
			;;
			
		i)	if [ $name == "server.sh" ]
			then
				echo "Invalid option! Works only on client!"
				exit 1
			fi
			
			ipNumber="$2"
			while IFS= read -r p; do
				echo "Just read port: $p on ip: $ipNumber"
				port=$p
			done < port.txt
			echo `timeout 2 nc -q 1 -v $ipNumber $port < test.txt`
			;;
			
		h)	echo "To run script without options make sure to rename file. For example if you want to run default server make sure file is called server.sh or ./server.tcsh for tcsh version then run it like that: ./server.sh or ./server.tcsh"	
			echo "For example if you want to run default client make sure file is called klient.sh or ./klient.tcsh for tcsh version then run it like that: ./klient.sh or ./klient.tcsh"
			echo "Script can be run only with following options:"
			echo "-s, runs script in server mode on default port"
			echo "-c, runs script in client mode on default port and ip"
			echo "-p numberOfNewPort, change default port to the one passed with argument"
			echo "-f newCounter, overwrites counter for current port. To change counter on other port, use -p option first to change default port"
			echo "-i ip, runs script in CLIENT ONLY mode to connect to ip passed in arguement"
			echo "-h, displays help."
			;;
			
		?)
		
			echo "Unknown option"
			;;
	esac
done
if ! [ "$1" == "" ]
then
	exit 0
elif [ $name == "server.sh" ]
then
	echo "Checking if port is available..."
			
			response=$(nc -w 1 -z 127.0.0.1 $port 2>&1)
			used=$?
			if [ "$used" == 0 ] ; then
				echo "Port already in use!"
				exit 1;	
			fi
			while IFS= read -r p; do
				echo "Just read port: $p"
				port=$p
			done < port.txt
			
			if ! [ -e counter$port.txt ]
			then
				echo "0" > counter$port.txt
			fi
			
			while IFS= read -r line; do
				echo "Just read counter: $line"
				counter=$line
			done < counter$port.txt
			echo "Counter: $counter"
			while true; do
				echo `nc -l -v -p $port > test.txt`
				counter=$((counter+1))
				echo "Counter: $counter"
				var2=$counter
				echo "$counter" > counter$port.txt
			done
elif [ $name == "klient.sh" ]
then
	while IFS= read -r p; do
				echo "Just read port: $p"
				port=$p
			done < port.txt
			while IFS= read -r p; do
				echo "Just read ip: $p"
				ipNumber=$p
			done < defaultIP.txt
			while IFS= read -r j; do
				echo "Counter: $j"
				counter=$j
			done < counter$port.txt
			echo `nc -q 1 -v $ipNumber $port < test.txt`
			
fi


