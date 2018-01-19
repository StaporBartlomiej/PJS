#!/usr/bin/python
# Bartlomiej Stapor gr 1

import argparse
import module
import os
import stat
import subprocess
import sys


parser = argparse.ArgumentParser(description='Arg parser')

parser.add_argument('-l', action="store_true", dest='l', default=False)
parser.add_argument('-w', action="store_true", dest='w', default=False)
parser.add_argument('-c', action="store_true", dest='c', default=False)
parser.add_argument('-d', action="store_true", dest='d', default=False)
parser.add_argument('-i', action="store_true", dest='i', default=False)
parser.add_argument('-e', action="store_true", dest='e', default=False)
parser.add_argument("file", nargs='+')

args = parser.parse_args()

def argCount():
	size = 0
	for arg in vars(args):
		if getattr(args, arg) == True:
			size += 1
	return size
	

def count(filename):
	size = lines = words = bytes = numbers = integers = 0

	size = argCount()

	for line in open(filename):

		if args.e:		
			if line.startswith("#"):
				continue

		if size == 0 or (size == 1 and args.e):
			lines += 1
			words += len(line.split(" "))
			for word in line.split(" "):
				bytes += len(word)
		else:
			if args.l:
				lines += 1
			if args.w:
				words += len(line.split(" "))
			if args.c:
				for word in line.split(" "):
					bytes += len(word)
			if args.d:
				for word in line.split(" "):
					if module.isRealNumber(word):
						numbers += 1
			if args.i:
				for word in line.split(" "):
					if module.isInteger(word):
						integers += 1

	if size == 0 or (size == 1 and args.e):
		
		fileString = "%3d %3d %3s %s" % (lines, words, bytes, filename)
		print(fileString)
	else:
		fileString = ""
		if args.l:
			fileString = "%s %2d" % (fileString, lines)
		if args.w:
			fileString = "%s %3d" % (fileString, words)
		if args.c:
			fileString = "%s %3d" % (fileString, bytes)
		if args.d:
			fileString = "%s %3d" % (fileString, numbers)
		if args.i:
			fileString = "%s %3d" % (fileString, integers)

		print("%s %s" % (fileString, filename))

	global totalLines, totalWords, totalBytes, totalNumbers, totalIntegers

	totalLines += lines
	totalWords += words
	totalBytes += bytes
	totalNumbers += numbers
	totalIntegers += integers

def printTotal():
	size = argCount()
	if size == 0 or (size == 1 and args.e):
		totalString = "%3d %3d %3s %s" % (totalLines, totalWords, totalBytes, "total")
		print(totalString)
	else:
		totalString = ""
		if args.l:
			totalString = "%s %2d" % (totalString, totalLines)
		if args.w:
			totalString = "%s %3d" % (totalString, totalWords)
		if args.c:
			totalString = "%s %3d" % (totalString, totalBytes)
		if args.d:
			totalString = "%s %3d" % (totalString, totalNumbers)
		if args.i:
			totalString = "%s %3d" % (totalString, totalIntegers)

		print("%s %s" % (totalString, "total"))

totalLines = totalWords = totalBytes = totalNumbers = totalIntegers = 0
fileCount = 0

for arg in args.file:

	if not os.path.isfile(arg):
		sys.stderr.write("File %s does not exist.\n" % (arg));
		continue
	elif not os.access(arg, os.R_OK):
		sys.stderr.write("File %s does not have read permissions.\n" % (arg));
		continue
	count(arg)
	fileCount += 1

if fileCount > 1:
	printTotal()
