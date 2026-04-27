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
String    \"[^\"\n]*\"
Id        [A-Za-z_][A-Za-z0-9_]*

%%
[ \t\n\r]+ ;
"//".* ;

"print"   {return PRINT;}
"concat"  {return CONCAT;}
"length"  {return LENGTH;}

{String}  {return STRING;}
{Real}    {return NUM;}
{Decimal} {return NUM;}
"+"       {return PLUS;}
"-"       {return MINUS;}
"*"       {return TIMES;}
"/"       {return DIV;}
"("       {return LPAR;}
")"       {return RPAR;}
"="       {return ASSIGN;}
","       {return VIRGULA;}

{Id}      {return IDENT;}
.         {return ERROR;}

%%
