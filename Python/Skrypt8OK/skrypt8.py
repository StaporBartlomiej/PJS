#!/usr/bin/python
# Bartlomiej Stapor gr 1

import sys

def checkhalfMarks(k):
    number = 0
    if k == "5+":
        number = 5.25
    if k == "+5":
        number = 5.25
    if k == "5-":
        number = 4.75
    if k == "-5":
        number = 4.75

    if k == "4+":
        number = 4.25
    if k == "+4":
        number = 4.25
    if k == "4-":
        number = 3.75
    if k == "-4":
        number = 3.75

    if k == "3+":
        number = 3.25
    if k == "+3":
        number = 3.25
    if k == "3-":
        number = 2.75
    if k == "-3":
        number = 2.75

    if k == "2+":
        number = 2.25
    if k == "+2":
        number = 2.25
    if k == "2-":
        number = 1.75
    if k == "-2":
        number = 1.75
    return number

# print(len(sys.argv))
lista = []
dict = {}
total = 0
counter = 0
list_to_print = []
if len(sys.argv) < 2:
    print("There is no file specified from command line!")
    exit(0)
for arg in sys.argv[1:]:
    file = str(arg)
    # print(file)
    # print(file)
    if not file.endswith(".txt"):
        print("File is not in txt format!")
        exit(0)
    with open(file) as f:
        for i in f:
            i = i.rstrip()
            lista.append(i)
            # print(i)
    for i in lista:
        temp = i.split()
        surname = str(temp[1]).title()
        name = str(temp[0]).title()
        mark = str(temp[2])
        key = surname + " " + name
        value = []
        value.append(mark)
        if key in dict:
            dict[key].append(mark)
        else:
            dict.update({key: value})

    for key in dict:
        # print(key)
        local = 0
        localCounter = 0
        temp = dict.get(key)
        for i in temp:
            number = checkhalfMarks(i)
            if number == 0:
                number = float(i)

            total += number
            counter += 1
        for k in temp: # lista ocen

            number = checkhalfMarks(k)
            if number == 0:
                number = float(k)
            local += number
            localCounter += 1
        localAverage = round(local / localCounter, 2)
        # print(key + " " +  str(localAverage))
        student = key + " " + str(localAverage)
        list_to_print.append(student)
    average = round(total / counter, 2)
    result = sorted(list_to_print)
    print("------------------------------")
    print("Lista ocen dla pliku: " + arg)
    print("------------------------------")
    for i in result:
        print(i)
    print("Srednia wszystkich osob: " + str(average))
    lista = []
    dict = {}
    total = 0
    counter = 0
    list_to_print = []
