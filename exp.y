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

%start line
%token identifier
%token operation
%token equals
%token semicolon
%token newline
%token whiteSpace
%token openParen
%token closeParen

%%

line    :assignment newline         {printf(": is a valid assignment on line %d\n", yylineno-1);}
        |expression ws newline      {printf(": is a valid expression on line %d\n", yylineno-1);}
        |error newline              {yyerrok;}
        |line assignment newline    {printf(": is a valid assignment on line %d\n", yylineno-1);}
        |line expression ws newline {printf(": is a valid expression on line %d\n", yylineno-1);}
        |line error newline         {yyerrok;}
        ;

assignment  :id ws equ ws expression ws sc ws   {;}
            ;

expression  :id ws op ws id                             {;}
            |opar expression cpar                       {;}
            |expression ws op ws id                     {;}
            |id ws op ws opar expression cpar           {;}
            |expression ws op ws opar expression cpar   {;}
            ;

op      :operation              {printf("%s", yytext);}
        ;

id      :identifier             {printf("%s", yytext);}
        ;

ws      :whiteSpace             {printf("%s", yytext);}
        ;

opar    :openParen              {printf("(");}
        |openParen ws           {printf("(");}
        ;

cpar    :closeParen             {printf(")");}
        |ws closeParen          {printf(")");}
        ;

sc      :semicolon              {printf(";");}
        ;

equ     :equals                 {printf("=");}
        ;

%%
int main (int argc, char* argv[]){
    if(argc == 2) yyin=fopen(argv[1], "r+");
    else yyin=fopen("ex.txt","r+");
    if(yyin == NULL) return 0;
    return yyparse();
}

void yyerror (const char *s) {
    printf ("%s : is a %s on line %d\n", yytext, s, yylineno);
}

