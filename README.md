<!---------------------------------------------
Name: Zach Selchau, cssc0418, Red id: 820533188
Project: CS 530 Assignment 3
File: README.md
Description: Describes and documents project.
---------------------------------------------->

## CS 530, Spring 2019, Assignment 3
### Developed by Zach Selchau, cssc0418, 820533188

#### The Project:
    To create a program that evaluates a statement and determines if it is valid or not, specified by the BNF below.

#### BNF:
    <assignment> ::= <identifier> = <expression> ; 
    <expression> ::= <identifier> <operator> <identifier> {<operator> <identifier> } | ( <expression> ) | <identifier> <operator> ( <expression> ) | <expression> <operator> ( <expression> )
    <identifier> ::= a-zA-Z{a-zA-Z0-9}
    <operator> ::= +|-|/|*|%

#### Files Included:
**README.md**
    This file describes and documents the project.

**Makefile**
    This file allows for easy compilation and use of the program.

**exp.l**
    This file defines the tokenizing rules for flex to implement.

**exp.y**
    This file defines the parsing rules for bison to implement.

**ex1.txt**
    This is a testing file.

**ex2.txt**
    This is a testing file.

**ex3.txt**
    This is a testing file.

#### Compilation instructions
**Make Instructions:**
    make all: calls flex and bison, and compiles lex.yy.c into exp.

    make flex: compiles exp.l.

    make bison: compiles exp.y with the -d flag.

    make clear: deletes exp.tab.c, exp.tab.h, lex.yy.c, and exp.

**Running the Program:**

    exp

    ---or---
    
    exp <filename>

**NOTE**
    I created an option to pass in a filename on the command line instead of having to rename the file to ex.txt. 
    If no filename is passed then the program will default to ex.txt.

#### Operating Instructions
**Required Files**
    A file named ex.txt must exist to be tested OR the user must pass in the name of the file they would like to test on the command line.

#### Significant Design Decisions
    I decided to pass whitespace as tokens to the parser. I did this because I wanted an extremly acturate and strict syntax to be used.
    I decided to output error messages with the line number they are on.

#### Extra features:
    I decided to allow the user to use the command line to specify a file they would like to evaluate rather than the ex.txt file.

#### Known Deficiencies and Bugs
    If an error is enocuntered one character before the new line character, then the error message will display the next on the next line, and the line number will be increased and therefore off by +1.

#### Lessons Learned
*   Read as many resources as you can before deciding if something is worth implementing / pursuing.
*   A testing file is very nice when learning a new language.
*   Understanding a language is more than just knowing how to use it.