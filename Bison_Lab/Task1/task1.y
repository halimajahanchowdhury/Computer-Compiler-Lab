%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int value;
}

%token <value> DIGIT
%type <value> expr

%%

line:
    expr '\n' {
        printf("Result = %d\n", $1);
    }
    ;

expr:
    expr '+' DIGIT {
        $$ = $1 + $3;
    }
    |
    expr '-' DIGIT {
        $$ = $1 - $3;
    }
    |
    DIGIT {
        $$ = $1;
    }
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main(void)
{
    return yyparse();
}
