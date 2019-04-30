/**********************************************
Name: Zach Selchau, cssc0418, Red id: 820533188
Project: CS 530 Assignment 2
File: exp.y
Description: Defines the rules for parsing a text file.
**********************************************/

%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);

extern int yylineno;
extern char* yytext;
extern FILE* yyin;
%}

/*start on the line rule*/
%start line

/*all tokens*/
%token identifier
%token operation
%token equals
%token semicolon
%token newline
%token whiteSpace
%token openParen
%token closeParen

%%

line    :assignment newline         {printf(": is a valid assignment on line %d\n", yylineno-1);}   /*Assignment on first line*/
        |expression ws newline      {printf(": is a valid expression on line %d\n", yylineno-1);}   /*Expression on first line*/
        |error newline              {yyerrok;}                                                      /*Error on first line*/
        |line assignment newline    {printf(": is a valid assignment on line %d\n", yylineno-1);}   /*Assignment recurssion*/
        |line expression ws newline {printf(": is a valid expression on line %d\n", yylineno-1);}   /*Expression recurssion*/
        |line error newline         {yyerrok;}                                                      /*Error recurssion*/
        ;

assignment  :id ws equ ws expression ws sc ws   {;}             /*Basic case for assignment (only 1 case)*/
            ;

expression  :id ws op ws id                             {;}     /*Basic case*/
            |opar expression cpar                       {;}     /*Basic parenthesis case*/
            |expression ws op ws id                     {;}     /*Basic recurssion case*/
            |id ws op ws opar expression cpar           {;}     /*Parenthesis open on 2nd identifier and close on last identifier case*/
            |expression ws op ws opar expression cpar   {;}     /*Parenthesis open on nth (where n > 2) identifier and close on last identifier case*/
            ;

op      :operation              {printf("%s", yytext);}         /*Tracking and printing operations*/
        ;

id      :identifier             {printf("%s", yytext);}         /*Tracking and printing idenrifiers*/
        ;

ws      :whiteSpace             {printf("%s", yytext);}         /*Tracking and printing whitespace*/
        ;

opar    :openParen              {printf("(");}          /*Tracking and printing open parenthesis*/
        |openParen ws           {printf("(");}          /*Tracking and printing open parenthesis*/
        ;

cpar    :closeParen             {printf(")");}          /*Tracking and printing close parenthesis*/
        |ws closeParen          {printf(")");}          /*Tracking and printing close parenthesis*/
        ;

sc      :semicolon              {printf(";");}          /*Tracking and printing semicolons*/
        ;

equ     :equals                 {printf("=");}          /*Tracking and printing equal signs*/
        ;

%%
int main (int argc, char* argv[]){
    if(argc == 2) yyin=fopen(argv[1], "r+");    /*For ease of testing you can pass in a file on the command line*/
    else yyin=fopen("ex.txt","r+");             /*Open ex.txt to be read into yyparse*/
    if(yyin == NULL) return 0;                  /*Terminate if cannot open file*/
    return yyparse();
}

void yyerror (const char *s) {
    printf ("%s : is a %s on line %d\n", yytext, s, yylineno);
}

