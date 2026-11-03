%option noyywrap
%{
#include "task1.tab.h"
%}

%%

[0-9]       {
                yylval.value = yytext[0] - '0';
                return DIGIT;
            }

[ \t]+      ;

\n          { return '\n'; }

.           { return yytext[0]; }

%%
