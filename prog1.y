%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
void yyerror(const char *s);
%}

%token INT BEGIN END FOR DO IF ENDIF ENDFOR RETURN MAIN INT_TYPE IDENTIFIER CONSTANT GREATER SEMICOLON

%%

program : INT MAIN '(' ')' block RETURN '(' expression ')' SEMICOLON
        { printf("Parsed successfully\n"); exit(0); }

block : BEGIN declarations statements END { printf("Block parsed\n"); }

declarations : INT_TYPE IDENTIFIER SEMICOLON declarations
            | /* empty */
            { printf("Declarations parsed\n"); }

statements : statement SEMICOLON statements
           | /* empty */
           { printf("Statements parsed\n"); }

statement : assignment
          | if_statement
          | for_statement
          { printf("Statement parsed\n"); }

assignment : INT IDENTIFIER '=' expression { printf("Assignment parsed\n"); }

if_statement : IF expression block ENDIF { printf("If statement parsed\n"); }

for_statement : FOR expression DO block ENDFOR { printf("For statement parsed\n"); }

expression : term
           | term GREATER term { printf("Expression parsed\n"); }

term : IDENTIFIER { printf("Term parsed\n"); }
     | CONSTANT { printf("Term parsed\n"); }

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
