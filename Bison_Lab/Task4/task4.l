%option noyywrap
%{
#include "task4.tab.h"
%}

%%

"TRUE"       { return TRUE; }

"FALSE"      { return FALSE; }

"&&"         { return AND; }

"||"         { return OR; }

"!"          { return NOT; }

[ \t\r]+     ;

\n           { return '\n'; }

.            { return yytext[0]; }

%%