#!/usr/bin/tcsh -f
#Bartłomiej Stąpór gr 1
set name = `basename $0`
if ( ( $name == "server.tcsh" ) && ( -e "server.sh" ) ) then
	set fileName2 = "server.sh"
else if ( ( $name == "server.tcsh" ) && ! ( -e "server.sh" ) ) then
	set fileName2 = "klient.sh -s"
else if ( ( $name == "klient.tcsh" ) && ( -e "klient.sh" ) ) then
	set fileName2 = "klient.sh"
else if ( ( $name == "klient.tcsh" ) && ! ( -e "klient.sh" ) ) then
	set fileName2 = "server.sh -c"
	
	
endif
echo $fileName2
if ( "$#" < 1 ) then
	bash ./$fileName2
else if ( "$1" == "-s" ) then
	bash ./$fileName2 -s
else if( "$1" == "-c" ) then
	bash ./$fileName2 -c
else if ( "$1" == "-p" ) then
	bash ./$fileName2 -p $2
else if ( "$1" == "-f" ) then
	bash ./$fileName2 -f $2
else if ( "$1" == "-i" ) then
	bash ./$fileName2 -i $2
else if ( "$1" == "-h" ) then
	bash ./$fileName2 -h
endif

