###########################################################
#Name: Zach Selchau, cssc0418, Red id: 820533188
#Project: CS530 Assignment 2
#File: Makefile
#Description: Allows for easy compilation of the program.
###########################################################

#variables
CC=gcc
LC=flex
YC=bison

all: flex bison
	$(CC) lex.yy.c exp.tab.c -o exp
	export PATH="./:$PATH"
	
flex:
	$(LC) exp.l
	
bison:
	$(YC) -d exp.y

clean:
	rm exp.tab.c
	rm exp.tab.h
	rm lex.yy.c
	rm -rf exp
    
#######################[ EOF: Makefile ]###################
