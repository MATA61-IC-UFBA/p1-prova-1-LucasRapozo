%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

Digito    [0-9]
Decimal   {Digito}+
Real      {Digito}+"."{Digito}+
Char      [A-Za-z]
String    "{Char}{Char}+"
Id        [A-Za-z_][A-Za-z0-9_]*

%%
[ \t]+ ;
"//".* ;

"print"   {return PRINT;}
"concat"  {return CONCAT;}
"length"  {return LENGTH;}
"="       {return ASSIGN;}
{Id}      {return IDENT;}
{String}  {return STRING;}
{Real}    {return NUM;}
{Decimal} {return NUM;}
"+"       {return PLUS;}
"-"       {return MINUS;}
"*"       {return TIMES;}
"/"       {return DIV;}
"("       {return LPAR;}
")"       {return RPAR;}
\n        {return EOL;}
.         {return ERROR;}

%%
