%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int value;
}

%token <value> NUMBER

%%

input:
    NUMBER {
        if ($1 % 2 == 0)
            printf("%d is Even\n", $1);
        else
            printf("%d is Odd\n", $1);
    }
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Invalid input.\n");
}

int main(void)
{
    return yyparse();
}