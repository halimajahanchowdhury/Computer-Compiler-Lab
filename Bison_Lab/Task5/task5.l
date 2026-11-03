%option noyywrap
%{
#include "task5.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*    { return ID; }

"("       { return '('; }

")"       { return ')'; }

[ \t\r]+  ;

\n        { return '\n'; }

.         { return yytext[0]; }

%%