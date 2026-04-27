%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token STRING
%token NUM
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAR
%token RPAR
%token ERROR
%token PRINT
%token CONCAT
%token LENGTH
%token IDENT
%token ASSIGN
%token VIRGULA

%start program

%%

program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAR exprlist RPAR
| expr
;

exprlist
: expr
| exprlist VIRGULA expr
;

expr
: expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| LPAR expr RPAR
| LENGTH LPAR expr RPAR
| CONCAT LPAR expr VIRGULA exprlist RPAR
| NUM
| STRING
| IDENT
;

%%
