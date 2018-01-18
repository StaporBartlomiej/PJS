#!/usr/bin/tcsh -f
#Bartłomiej Stąpór gr 1
if ( ( `./validation.sh $1` == "1" ) || ( `./validation.sh $2` == "1" ) ) then
	echo "Zly adres ip"
 	exit 1
endif
set arg1 = `./atoi.sh $1`;
set arg2 = `./atoi.sh $2`;
set temp = 0

if (  $arg1 > $arg2  ) then
	set temp = $arg1
	set arg1 = $arg2
	set arg2 = $temp
	
endif
foreach ip ( `seq $arg1 1 $arg2` )
	set result=`./itoa.sh $ip`
if ( `timeout 2 ping $result` == "" ) then 
	echo $result "martwy"
else
	echo $result "zywy"
endif
end
