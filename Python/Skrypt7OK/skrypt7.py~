#!/usr/bin/python
# Bartlomiej Stapor gr 1
import subprocess, sys

dir_list = []

def find():
    for arg in sys.argv:
        if arg != "-d":
            temp = str(arg)
            if temp.startswith("/"):
                # print("Appending: " + arg)
                dir_list.append(arg)
            if not temp.startswith("/"):
                if dir_list:
                    temp = str(arg)
                    if not temp.startswith("-"):
                        for i in dir_list:
                            # print("Procesuje: " + i + "z dir_list")
                            bashCommand = "grep -rn " + arg + " " + i
                            # print("Starting bashcommand: " + bashCommand)
                            process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
                            output, error = process.communicate()
                            print("Fraza " + arg + " znaleziona w :")
                            print(output)
                        dir_list [:]= []
    print(dir_list)
find()
