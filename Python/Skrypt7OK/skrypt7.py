#!/usr/bin/python
# Bartlomiej Stapor gr 1

import argparse
import glob, os
import subprocess

parser = argparse.ArgumentParser(description='Arg parser')

parser.add_argument('-d', action="store_true", dest='d', default=False)
parser.add_argument("file", nargs='+')
dir_tab = []
args = parser.parse_args()

def find():
    if (not file.startswith("/")):
        # print("inside")
        # print("adding")
        dir_tab.append(file)
        # print(dir_tab)
        # print(dir_tab)
    searched_phrase = file
    # print(searched_phrase)
    # print(dir_tab)
    for i in dir_tab:
        bashCommand = "grep -rn " + str(i)
        # print(bashCommand)
        process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
        output, error = process.communicate()
        print(output)

if args.d:
    for arg in args.file:

        # print(arg)
        file = str(arg)
        # print(file.startswith("/"))
        find()






#
# if args.d:
#     for arg in args.file:
#
#         # print(arg)
#         file = str(arg)
#         # print(file.startswith("/"))
#         if (file.startswith("/")):
#             # print("inside")
#
#             dir_tab.append(file)
#             # print(dir_tab)
#         else:
#             searched_phrase = file
#             # print(searched_phrase)
#             # print(dir_tab)
#             for i in dir_tab:
#                 os.chdir(i)
#                 # print("chdir set to: " + i)
#                 for j in glob.glob(searched_phrase):
#                     print("In folder " + i + ":")
#                     bashCommand = "grep"
#                     print(j)
#             dir_tab = []



# file = str(args.file)
# fileLen = len(file)
# print(file[2:fileLen-2])
# os.chdir(file[2:fileLen-2])
# for file in glob.glob("*.txt"):
#     print(file)

# for file in os.listdir("/asfsafsa"):
#     if file.endswith(".txt"):
#         print(os.path.join("/asfsafsa", file))
