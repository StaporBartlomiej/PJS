#!/usr/bin/perl
# Kacper Kowalcze gr.1

import re
import numbers

def isRealNumber(word):
	if word.isdigit():
		return 1
	elif re.match("^[-+]?[0-9]+[.]?[0-9]*[eEdDqQ]?[-+]?[0-9]*$", word):
		return 1
	else:
		return 0

def isInteger(word):
	try:
		word = int(word)
		return 1
	except ValueError:
		return 0
