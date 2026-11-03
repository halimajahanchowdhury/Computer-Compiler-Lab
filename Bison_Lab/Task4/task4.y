%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int value;
}

%token <value> TRUE FALSE
%token AND OR NOT

%type <value> expr

%left OR
%left AND
%right NOT

%%

input:
    expr '\n' {
        if ($1 == 1)
            printf("Result = TRUE\n");
        else
            printf("Result = FALSE\n");
    }
    ;

expr:
    expr AND expr {
        $$ = $1 && $3;
    }
    |
    expr OR expr {
        $$ = $1 || $3;
    }
    |
    NOT expr {
        $$ = !$2;
    }
    |
    TRUE {
        $$ = 1;
    }
    |
    FALSE {
        $$ = 0;
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