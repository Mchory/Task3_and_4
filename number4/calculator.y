%{
#include <stdio.h>
int yylex();
void yyerror(const char* s);
%}

%token NUMBER

%%

input: /* empty */
      | input expr '\n'   { printf("Result: %d\n", $2); }
      ;

expr: NUMBER
    | expr '+' expr      { $$ = $1 + $3; }
    | expr '-' expr      { $$ = $1 - $3; }
    | expr '*' expr      { $$ = $1 * $3; }
    | expr '/' expr      { $$ = $1 / $3; }
    | '(' expr ')'       { $$ = $2; }
    ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}