%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[ \t\n]         ; // Ignore whitespace and newlines
[-+*/]          { return *yytext; }
.               { return yytext[0]; }
%%
