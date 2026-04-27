%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token NUM
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAR
%token RPAR
%token EOL 0
%token ERROR

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

expr
: expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| LPAR expr RPAR
| NUM
;

%%
