/**********************************************
Name: Zach Selchau, cssc0418, Red id: 820533188
Project: CS 530 Assignment 2
File: exp.l
Description: Defines the rules for tokenizing a text file.
**********************************************/
%{
#include "exp.tab.h"
%}

/*For line numbers*/
%option yylineno

%%

[a-zA-Z][a-zA-Z0-9]+    return identifier;  /*Identifiers*/
[a-zA-Z]                return identifier;  /*Case of a single character*/
[\+\-\*\/\%]            return operation;   /*Operators*/
[=]                     return equals;      /*Determining an assignment*/
[;]                     return semicolon;   /*Terminating an assignment*/
[(]                     return openParen;   /*Parenthesis*/
[)]                     return closeParen;  /*Parenthesis*/
[\n]                    return newline;     /*For concatenation*/
[ \t]+                  return whiteSpace;  /*Pass whitespace chunks as a single token*/
.                       return yytext[0];   /*Pass whatever was read*/

%%

int yywrap(void){
    return 1;
}
