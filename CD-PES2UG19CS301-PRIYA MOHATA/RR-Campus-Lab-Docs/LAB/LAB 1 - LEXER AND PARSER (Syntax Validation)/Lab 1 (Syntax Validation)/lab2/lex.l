%{
    #include<stdio.h>
    #include "y.tab.h"
    extern void yyerror(const char *);
    int yylineno;
%}

digit [0-9]
letter [a-zA-Z_]

%x states

%%
\n ++yylineno;

"//".* ; //single line statess
"/*" BEGIN states;
<states>\n ++yylineno;
<states>[^*/\n]* ;
<states>"*"[^/] ;
<states>"/" ;
<states>"*/" BEGIN 0;

[\r\t' '] ;

"!"|"("|")"|"["|"]"|"{"|"}"|";"|","|"=" {return *yytext;}

#include {return INCLUDE;}
"<"({letter}|{digit}|"_")+".h>" {return HEADER;}

"[^"]*\" {return STRLITERAL;}
'.\' {return CHARLITERAL;}
{digit}+("."{digit}+)? {return NUM;}

"+"|"-"|"/"|"*"|"%" {return *yytext;}
"==" {return EQCOMP;}
">=" {return GREATEREQ;}
"<=" {return LESSEREQ;}
"!=" {return NOTEQ;}
"++" {return INC;}
"--" {return DEC;}
"||" {return OROR;}
"&&" {return ANDAND;}

int {return INT;}
char {return CHAR;}
float {return FLOAT;}
double {return DOUBLE;}
void {return VOID;}
while {return WHILE;}
for {return FOR;}
do {return DO;}
if {return IF;}
else {return ELSE;}

main {return MAIN;}

[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
. {return *yytext;}

%%

int yywrap()
{
    return 1;
}
