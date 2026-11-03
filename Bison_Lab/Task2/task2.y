%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID NUMBER ASSIGN SEMI

%%

stmt:
    ID ASSIGN NUMBER SEMI {
        printf("Valid assignment statement.\n");
    }
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Invalid assignment statement.\n");
}

int main(void)
{
    return yyparse();
}
