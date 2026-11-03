%option noyywrap
%{
#include "task2.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*    { return ID; }

[0-9]+ {
    return NUMBER;
}

"="       { return ASSIGN; }

";"       { return SEMI; }

[ \t\r\n]+ ;

.         { return yytext[0]; }

%%
