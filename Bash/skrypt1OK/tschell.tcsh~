#!/usr/bin/tcsh -f
#Bartłomiej Stąpór
if("$#" < 1) then
	echo "$USER"
endif
foreach var ($*)
	if("$var" == "-q") then
		break
	else if("$var" == "-h") then
		echo "Program podaje login uzytkownika"
		break
	else if("$var" =~ -*) then
		echo "Nieznana opcja"
		echo "Program podaje login uzytkownika"
	else if("$var" !~ -*) then
		echo "Brak opcji"
		echo "$USER"
	endif
end
