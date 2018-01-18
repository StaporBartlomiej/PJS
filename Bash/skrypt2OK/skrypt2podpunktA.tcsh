#!/usr/bin/tcsh -f
#Bartłomiej Stąpór gr1
foreach numberI ( `seq 1 9` )
	foreach numberJ ( `seq 1 9` )
		set result = `echo "$numberI*$numberJ" | bc`
		printf "%s	" $result
	end
	echo
end

