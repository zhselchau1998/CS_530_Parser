/**********************************************
Name: Zach Selchau, cssc0418, Red id: 820533188
Project: CS 530 Assignment 2
File: exp.l
Description: Defines the rules for tokenizing a text file.
**********************************************/
%{
#include "exp.tab.h"
%}

%option yylineno/*For line numbers*/

%%

[a-zA-Z][a-zA-Z0-9]+    return identifier;
[a-zA-Z]                return identifier;/*Case of a single character*/
[\+\-\*\/\%]            return operation;
[=]                     return equals;
[;]                     return semicolon;
[(]                     return openParen;
[)]                     return closeParen;
[\n]                    return newline;
[ \t]+                  return whiteSpace;
.                       return yytext[0];/*Pass whatever was read*/

%%

int yywrap(void){
    return 1;
}
