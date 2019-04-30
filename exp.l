%{
#include "exp.tab.h"
%}

%option yylineno

%%

[a-zA-Z][a-zA-Z0-9]+    return identifier;
[a-zA-Z]                return identifier;
[\+\-\*\/\%]            return operation;
[=]                     return equals;
[;]                     return semicolon;
[(]                     return openParen;
[)]                     return closeParen;
[\n]                    return newline;
[ \t]+                  return whiteSpace;
.                       return yytext[0];

%%

int yywrap(void){
    return 1;
}
