%{
#include "y.tab.h"
%}

%%

int     { return INT; }
begin   { return BEGIN; }
end     { return END; }
for     { return FOR; }
do      { return DO; }
if      { return IF; }
endif   { return ENDIF; }
endfor  { return ENDFOR; }
return  { return RETURN; }
main    { return MAIN; }
[a-zA-Z][a-zA-Z0-9_]*   { yylval.strval = strdup(yytext); return IDENTIFIER; }
[0-9]+  { yylval.numval = atoi(yytext); return CONSTANT; }
">"     { return GREATER; }
";"     { return SEMICOLON; }
[ \t\n] { /* Ignore whitespace and newline characters */ }
.       { yyerror("Unexpected character"); }

%%

int yywrap() {
    return 1;
}
