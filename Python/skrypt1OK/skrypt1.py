#!/usr/bin/python
from sys import argv


num1 = int(argv[1])


for i in range(num1):
	for j in range(num1+1):
		if(i != 0):
			if(j != 0):
				print i*j,
	print
