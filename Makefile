###########################################################
#Name: Zach Selchau
#username: cssc0418
#Project: CS530 Assignment 2
#File: Makefile
#Notes: Allows for easy compilation of the program.
###########################################################

#variables
CC=gcc
LC=lex
YC=yacc

all: exp
	$(YC) exp.y -d
	$(LC) exp.l
	$(CC) lex.yy.c y.tab.c -o exp
	export PATH="./:$PATH"

clean:
	rm y.tab.c
	rm y.tab.h
	rm lex.yy.c
	rm -rf exp
    
#######################[ EOF: Makefile ]###################