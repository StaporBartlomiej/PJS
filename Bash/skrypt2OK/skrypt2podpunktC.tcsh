#!/usr/bin/tcsh -f
#Bartłomiej Stąpór gr1
set temp = '^-?[0-9]+$'

foreach var ($*)
	if ( "$var" == "-h" ) then
		echo "This script support basic arithmetics operations like: +,-,/,*,^"
		echo "Usage: ./skrypt3.sh 4 + 2"
		echo "Attention!"
		echo "In case of arguments '/' and '*', they should be prefixed with \ "
		echo "Example: ./skrypt3.sh 4 \/ 2"
		exit 0
	endif
end

if !( $1 =~ $temp &&  $3 =~ $temp ) then
	echo "Argument is not an integer"
	echo "This script support basic arithmetics operations like: +,-,/,*,^"
	echo "Usage: ./skrypt3.sh 4 + 2"
	echo "Attention!"
	echo "In case of arguments '/' and '*', they should be prefixed with \ "
	echo "Example: ./skrypt3.sh 4 \/ 2"
	exit 1
endif
if ($1 < $3) then
	foreach numberI ( `seq "$1" "$3"` )
		foreach numberJ ( `seq "$1" "$3"` )		
				set result = `echo "$numberI$2$numberJ" | bc`
				printf "%s	" $result
		end
	echo
	end
else
	foreach numberI ( `seq "$1" "-1" "$3"` )
		foreach numberJ ( `seq "$1" "-1" "$3"` )			
				set result = `echo "$numberI$2$numberJ" | bc`
				printf "%s	" $result
		end
	echo
	end
endif
exit 0
