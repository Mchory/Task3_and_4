%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Valid Python Identifier: %s\n", yytext);
}
.|\n    { /* ignore other characters */ }
%%

int main() {
    yylex();
    return 0;
}
