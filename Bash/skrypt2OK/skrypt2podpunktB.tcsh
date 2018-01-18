#!/usr/bin/tcsh -f
#Bartłomiej Stąpór gr1
set temp = '^-?[0-9]+$'
if !( $1 =~ $temp || $2 =~ $temp ) then
	echo "Argument nie jest liczba calkowita"
	exit 1
endif
if ( $1 < $2 ) then
	foreach numberI ( `seq "$1" "$2"` )
		foreach numberJ ( `seq $1 $2` )
			set result = `echo "$numberI*$numberJ" | bc`
			printf "%s	" $result
		end
	echo
	end
else
	foreach numberI ( `seq "$1" "-1" "$2"` )
		foreach numberJ ( `seq $1 "-1" $2` )
			set result = `echo "$numberI*$numberJ" | bc`
			printf "%s	" $result
		end
	echo
	end
endif
exit 0
