#!/usr/bin/python
# Bartlomiej Stapor gr 1
import sys, functions




def init():
    tab = ["-h","--help","-dir","-er","--encrypt","-e","decrypt","-d","--replace","-r"]
    if sys.argv[1] == "-h" or sys.argv[1] == "--help":
        functions.display_help()
        exit(0)
    if len(sys.argv) < 2:
        print("\033[1;31;40mBlad! Brak argumentow!")
        exit(1)
    if sys.argv[1] == "-dir":
        functions.find()
        exit(0)
    if (sys.argv[1] == "-c"):
        if len(sys.argv[1]) < 2:
            print("\033[1;31;40mZbyt mala ilosc argumentow!")
            exit(1)
        else:
            if(len(sys.argv) > 3):
                print("\033[1;31;40mBledne argumenty!")
                exit(1)
            else:
                functions.find_in_current_directory(sys.argv[2])
                exit(0)

    if sys.argv[1] == "--encrypt" or sys.argv[1] == "-e" or sys.argv[1] == "-er":
        functions.encrypt(sys.argv[1], sys.argv[2])
        exit(0)
    if sys.argv[1] == "--decrypt" or sys.argv[1] == "-d":
        functions.decrypt(sys.argv[2])
        exit(0)
    if sys.argv[1] == "--replace" or sys.argv[1] == "-r":
        functions.replace(sys.argv[2],sys.argv[3], sys.argv[4])
        exit(0)
    if sys.argv[1] == "-s":
        functions.file_statistics(sys.argv[2])
        exit(0)
    if sys.argv[1] not in tab:
        print("\033[1;31;40mBledne argumenty!")
        exit(1)



if __name__ == "__main__":
    init()

# find_in_current_directory(sys.argv[1])
# findAFile(sys.argv[1],sys.argv[2])
# encrypt(sys.argv[1])
# display_help()
# decode(sys.argv[1])
#replace(sys.argv[1],sys.argv[2],sys.argv[3])
# uruchamiac np. ./skrypt7.py -d ~/PycharmProjects/ -d /home/bartek/Documents/ test
