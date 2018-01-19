#!/usr/bin/python
#Bartlomiej Stapor gr nr 1
import sys, os, getopt, mimetypes


# -n numerowanie dla kazdego pliku osobno
# -N numerowanie globalnie dla wszystkich plikow razem
# -v ma znow wypisywac komentarze # bo domyslnie ma ich nie wypisywac
def main(argv):
    counter = 0
    flag = False
    fOption = False
    try:
        opts, args = getopt.getopt(argv,"Nnvfh")
    except getopt.GetoptError:
        print("Error getting arguments")
        sys.exit(2)
    if(len(opts) < 1):
        for _arg in sys.argv[1:]:
           #     print(_arg);
                try:
                    with open(_arg, 'r') as _file:
                        if(fOption == False):
                            if mimetypes.guess_type("/" + _arg)[0] != 'text/plain':
                                print("File is not a text file!")
                                sys.exit(2)
                        for _line in iter((_file.readline),""):
                            if(flag == False):
                                if(_line[0] != "#"):
                                    counter+= 1
                                    print("" + _line), 
                            if(flag == True):
                                    counter+= 1
                                    print("" + _line),      
                
                        if(fOption == True):
                            for _line in iter((_file.readline),""):
                                if(flag == False):
                                    if(_line[0] != "#"):
                                        counter+= 1
                                        print("" + _line), 
                                if(flag == True):
                                        counter+= 1
                                        print("" + _line),  
                except IOError as _err:
                    sys.stderr.write(os.path.basename(sys.argv[0]) + ": " + _arg + ": " + _err.strerror + "\n")    
    for opt, arg in opts:
        # print(opt)
        if opt == "-v":
            # print("in -v")
            flag = True
            #print("Flag value: " + str(flag));
        if opt == "-N":
            # print("in -N")
            for _arg in sys.argv[1:]:
           #     print(_arg);
                try:
                    with open(_arg, 'r') as _file:
                        if(fOption == False):
                            if mimetypes.guess_type("/" + _arg)[0] != 'text/plain':
                                print("File is not a text file!")
                                sys.exit(2)
                        for _line in iter((_file.readline),""):
                            if(flag == False):
                                if(_line[0] != "#"):
                                    counter+= 1
                                    print("[" + str(counter) + "]" + _line), 
                            if(flag == True):
                                    counter+= 1
                                    print("[" + str(counter) + "]" + _line),      
                
                        if(fOption == True):
                            for _line in iter((_file.readline),""):
                                if(flag == False):
                                    if(_line[0] != "#"):
                                        counter+= 1
                                        print("[" + str(counter) + "]" + _line), 
                                if(flag == True):
                                        counter+= 1
                                        print("[" + str(counter) + "]" + _line),      
                except IOError as _err:
                    sys.stderr.write(os.path.basename(sys.argv[0]) + ": " + _arg + ": " + _err.strerror + "\n")
        if opt == "-n":
            # print("in -n")
            for _arg in sys.argv[1:]:
                #print(_arg);
                try:
                    with open(_arg, 'r') as _file:
                        if(fOption == False):
                            if mimetypes.guess_type("/" + _arg)[0] != 'text/plain':
                                print("File is not a text file!");
                                sys.exit(2)
                        for _line in iter((_file.readline),""):
                            #print(flag);
                            if(flag == False):
                                if(_line[0] != "#"):
                                    counter+= 1
                                    print("[" + str(counter) + "]" + _line), 
                            if(flag == True):
                                counter+= 1
                                print("[" + str(counter) + "]" + _line), 
                            
                            #print("[" + str(counter) + "]" + _line),
                        counter = 0;
                        if(fOption == True):
                            if mimetypes.guess_type("/" + _arg)[0] != 'text/plain':
                                print("File is not a text file!");
                                sys.exit(2)
                        for _line in iter((_file.readline),""):
                            #print(flag);
                            if(flag == False):
                                if(_line[0] != "#"):
                                    counter+= 1
                                    print("[" + str(counter) + "]" + _line), 
                            if(flag == True):
                                counter+= 1
                                print("[" + str(counter) + "]" + _line), 
                            
                            #print("[" + str(counter) + "]" + _line),
                        counter = 0
                except IOError as _err:
                    sys.stderr.write(os.path.basename(sys.argv[0]) + ": " + _arg + ": " + _err.strerror + "\n")
        if opt == "-h":
            print("Available Options:\n-h - displays help\n-N - Set numeric order in all files\n-n - set numeric order in each file separately\n-v - allows to print commented lines (starting with #) in output\n-f - does not check if file is a valid file. \nIn order to use it correctly -v or -f has to be 1st parameter like in example below:\n ./cat.py -v -N test.txt test2.txt\n ./cat.py -f -N test.txt test2.txt")
        if opt == "-f":
            fOption = True


if __name__ == "__main__":
    main(sys.argv[1:])
			
			
