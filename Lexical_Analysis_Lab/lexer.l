%option noyywrap

%{
#include <stdio.h>
int line_num = 1;
%}

DIGIT [0-9]
ID [a-zA-Z_][a-zA-Z0-9_]*
NUMBER ([0-9]+(\.[0-9]*)?|\.[0-9]+)

%%

"//"[^\n]*    ;

[ \t\r]+      ;
\n            { line_num++; }

"int"|"float"|"if"|"return"|"true"|"char"|"do"  { printf("KEYWORD: %s\n", yytext); }

">="|"=="|"!="|"<="|">"|"<"|"="|"+"|"-"|"*"|"/"|"%"  { printf("OPERATOR: %s\n", yytext); }

"("|")"|"{"|"}"|";"|","|"["|"]"  { printf("DELIMITER: %s\n", yytext); }

{NUMBER}      { printf("NUMBER: %s\n", yytext); }

{ID}          { printf("IDENTIFIER: %s\n", yytext); }

.             { printf("LEXICAL ERROR at line %d: %s\n", line_num, yytext); }

%%

int main(void)
{
    yylex();
    return 0;
}