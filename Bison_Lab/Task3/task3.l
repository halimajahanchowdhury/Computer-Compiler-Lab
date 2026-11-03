%option noyywrap
%{
#include <stdlib.h>
#include "task3.tab.h"
%}

%%

[0-9]+ {
    yylval.value = atoi(yytext);
    return NUMBER;
}

[ \t\r\n]+ ;

.         { return yytext[0]; }

%%
