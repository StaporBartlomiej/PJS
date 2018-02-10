#!/usr/bin/python
# Bartlomiej Stapor gr 1
import subprocess, sys, os
from getpass import getpass




def find():
    flag = False
    dir_list = []
    if len(sys.argv) > 2:
        for arg in sys.argv:
            if arg != "-dir":
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
                                print("\033[1;32;40mFraza " + arg + " znaleziona w :")
                                print(output)
                            dir_list[:] = []
    # print(dir_list)
def find_in_current_directory(searched_phrase):
    directory = os.path.dirname(os.path.abspath(__file__))
    # print(searched_phrase)
    # print(directory)
    bashCommand = "grep -rn " + searched_phrase + " " + directory
    # print("Command:" + bashCommand)
    # print("Starting bashcommand: " + bashCommand)
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    print("\033[1;32;40mFraza " + searched_phrase + " znaleziona w :")

    print(output)

def replace( old_word, new_word, dir):
    if len(sys.argv) < 4:
        print("\033[1;31;40mZbyt mala ilosc argumentow!")
    else:
        print(dir)
        bashCommand = "sed -i -e s/" + old_word + "/" + new_word + "/g " + dir
        print(bashCommand)
        # print("Command:" + bashCommand)
        # print("Starting bashcommand: " + bashCommand)
        process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
        output, error = process.communicate()
        print("\033[1;32;40mSlowo " + old_word + " zostalo zamienione na: " + new_word)
        # print(output)


def file_statistics(file):
    #tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort -nr | head  -10
    bashCommand = "tr -c '[:alnum:]' '[\\n*]' < " + file + " | sort | uniq -c | sort -nr | head  -10"
    os.system(bashCommand)
    # print(bashCommand)
    # process = subprocess.Popen(bashCommand, stdout=subprocess.PIPE)
    # tr -c '[:alnum:]' '[\n*]' < $1 | sort | uniq -c | sort -nr | head  -10




def encrypt(option, file):
    condition = "which gpg >/dev/null"
    out = os.system(condition)
    if(out != 0):
        print("Skrypt do szyfrowania wymaga gpg a go nie znalazl. Prosze zainstalowac gpg aby uzyc funkcji szyfrowania/deszyfrowania.")
        exit(0)
    # else:
    #     print("gpg Installed")
    # print(out)
    # print("Podaj Haslo")
    password = getpass()

    bashCommand = "gpg --no-batch --symmetric  --armor --passphrase " + password + " " + file
    # print("Command:" + bashCommand)
    # print("Starting bashcommand: " + bashCommand)
    if option == "-er":
        os.system(bashCommand)
        os.system("rm " + file)
    else:
        os.system(bashCommand)
    # process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    # output, error = process.communicate()

    # print(output)
def decrypt(file):
    condition = "which gpg >/dev/null"
    out = os.system(condition)
    if (out != 0):
        print(
            "Skrypt do szyfrowania wymaga gpg a go nie znalazl. Prosze zainstalowac gpg aby uzyc funkcji szyfrowania/deszyfrowania.")
        exit(0)
    # else:
    #     print("gpg Installed")
    # print("file:" + file[:-4])
    password = getpass()
    bashCommand = "gpg --no-batch --passphrase " + password + " --output " + file[:-4] + " --decrypt " + file
    # bashCommand = "gpg -d --output "+file[:-4]+" " + file
    # print("Command:" + bashCommand)
    # print("Starting bashcommand: " + bashCommand)
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    # print(output)
def display_help():
    print("\033[1;37;40mSkrypt posiada nastepujace funkcjonalnosci:\n")
    print("\n1. Szuka frazy wystepujacej w plikach na 2 sposoby:\n")
    print("\n   a)Szuka wystapien frazy test w podanej sciezce uruchamiajac skrypt w ponizszy sposob: \n")
    print("\033[1;31;40m\n     ./main.py -dir sciezka1 fraza np.\n")
    print("\n     ./main.py -dir /home/bartek/Documents test\n")
    print("\033[1;37;40m\n   b)Szuka frazy test wystepujacej w plikach w aktualnym katalogu:\n")
    print("\033[1;31;40m\n       ./main.py -c test\n")
    print("\033[1;37;40m\n2. Wyswietla statystyki danego pliku. W statystykach pokazuje najczesciej wystepujace slowa uszeregowane malejaco w stosunku do ilosci wystapien."
          "W przypadku gdy plik znajduje sie w tym samym katalogu co skrypt wystarczy podac sama nazwe pliku."
          " Jesli skrypt znajduje sie w innym katalogu niz plik to nalezy podac sciezke absolutna."
          "Skrypt w 1 lini wyswietla liczbe nadmiarowych bialych znakow(np. podwojna spacja, pusta linia). W kolejnych sa najczesciej wystepujace wyrazy wraz z licznikiem wystapien:")
    print("")
    print("\033[1;31;40m\n    ./main.py -s pelna_nazwa_pliku\n\n")
    print("\033[1;37;40m\n3. Szyfruje plik podany jako argument wywolania skryptu(musi byc podana sciezka absolutna) stosujac 'gpg' czyli OpenPGP encryption and signing tool. Plik, ktory jest szyfrowany domyslnie zostaje jednak mozna go usunac po zaszyfrowaniu stosujac opcje -er:\n")
    print("\033[1;31;40m\n    ./main.py --encrypt/-e /home/bartek/Documents/file.txt\n")
    print("\033[1;31;40m\n    ./main.py -er /home/bartek/Documents/file.txt\n")
    print("\033[1;37;40m\n4. Odszyfrowywuje zaszyfrowany wczesniej plik:\n")
    print("\033[1;31;40m\n    ./main.py --decrypt/-d zaszyfrowany_plik \n")
    print("\033[1;37;40m\n5. Zastepuje slowo podane w wywolaniu skryptu na inne slowo takze podane przy wywolywaniu skryptu. Skrypt zastepuje wszystkie slowa oraz czesci slow pasujace do patternu:\n")
    print("\033[1;31;40m\n   ./main.py --replace/-r slowo_ktore_ma_byc_zastapione nowe_slowo sciezka_do_pliku\n")
    print("\033[1;37;40m \n")
