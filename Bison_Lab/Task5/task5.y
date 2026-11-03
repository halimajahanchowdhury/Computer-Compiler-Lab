%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID

%%

input:
    s '\n' {
        printf("Valid string.\n");
    }
    ;

s:
    '(' s ')'
    |
    ID
    |
    /* empty */
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Invalid string.\n");
}

int main(void)
{
    return yyparse();
}