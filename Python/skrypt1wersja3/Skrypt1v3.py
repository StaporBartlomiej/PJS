#!/usr/bin/python
#Bartlomiej Stapor gr nr. 1
from math import sqrt
from sys import argv


# Functions
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def setUpVariable(i):
    if (argv[i][1] == "="):
        if (is_number(argv[i][2:])):
            # print("argv[" + str(i) + "][1] = " + (argv[i][2:]))
            variable = float(argv[i][2:])
            return variable
        else:
            print("Value is not a number. Expected number and found: " + argv[i][2:])
            exit(1)
    else:
        print("Incorrect format, lack of '='")
        exit(1)


def solve2(a,b,c):
    """Rozwiazywanie rownania kwadratowego a * x * x + b * x + c = 0."""
    if(a == ""):
        aSet = False
        while (aSet == False):
            try:
                a = float(input("Podaj a:"))
            except ValueError:
                print("a niepoprawne")
                continue
            aSet = True
    if (b == ""):
        bSet = False
        while (bSet == False):
            try:
                b = float(input("Podaj b:"))
            except ValueError:
                print("b niepoprawne")
                continue
            bSet = True
    if (c == ""):
        cSet = False
        while (cSet == False):
            try:
                c = float(input("Podaj c:"))
            except ValueError:
                print("c niepoprawne")
                continue
            cSet = True
    if(not isinstance(a,float)):
        if (not isinstance(a,int)):
            raise ValueError("Bad arguments")
    if (not isinstance(b,float)):
        if(not isinstance(b,int)):
            raise ValueError("Bad arguments")
    if (not isinstance(c,float)):
        if(not isinstance(c,int)):
            raise ValueError("Bad arguments")
    if (a==0):
        return ("To nie jest rownanie kwadratowe")

    delta = (b*b - 4*a*c)
    # print("a: " + str(a))
    # print("b: " + str(b))
    # print("c: " + str(c))
    # print("Delta: " + str(delta))
    if(delta<0):
        x1 = round(( (-b) / (2*a) ),2)
        x2 = round( sqrt(-delta)/ (2*a),2 )
        return "x1 = x2 = "+str(x1) + "+/-i "+ str(x2)
    elif(delta == 0):
        x1 = round(( (-b) / (2*a) ),2)
        return "x1 = x2 = " + str(x1)
    else:
        x1 = round(((-b+sqrt(delta))/(2*a)),2)
        x2 = round(((-b-sqrt(delta))/(2*a)),2)
        return "x1 = "+str(x1) + "\nx2 = "+ str(x2)

#main

a = ""
b = ""
c = ""

for i in range(len(argv)):
    if (len(argv) > 4):
        print("Zbyt duza ilosc argumentow")
        exit(1)
    if (i != 0):
        if(argv[i][0] == "a"):
            # print("argv[" + str(i) +"][0] = " + argv[i][0])
            a = setUpVariable(i)
        elif(argv[i][0] == "b"):
            b = setUpVariable(i)
        elif(argv[i][0] == "c"):
            c = setUpVariable(i)
        else:
            if(i == 1):
                print("Incorrect format. 1 argument is not an alphabetic in range {a,b,c}. Expected 'a' and found: " + argv[1][0])
                exit(1)
            if(i == 2):
                print("Incorrect format. 2 argument is not an alphabetic in range {a,b,c}. Expected 'a' and found: " + argv[2][0])
                exit(1)
            if(i == 3):
                print("Incorrect format. 3 argument is not an alphabetic in range {a,b,c}. Expected 'a' and found: " + argv[3][0])
                exit(1)
# print(myList.count('4.5'))
print(solve2(a,b,c))
