%{
    #define YYSTYPE char*
    #include <unistd.h>
    #include "y.tab.h"
    #include <stdio.h>
    extern void yyerror(const char *); // declare the error handling function
%}

/* Regular definitions */
digit	[0-9]
letter	[a-zA-Z]
id	{letter}({letter}|{digit})*
digits	{digit}+
opFraction	(\.{digits})?
opExponent	([Ee][+-]?{digits})?
number	{digits}{opFraction}{opExponent}
%option yylineno

%%
\/\/(.*) ; // ignore comments
[\t\n] ; // ignore whitespaces
"<="         	{return LTEQ;}
">="         	{return GTEQ;}
"=="         	{return EQQ;}
"!="         	{return NEQ;}
"{" 		{return OC;}
"}" 		{return CC;}
"("		{return *yytext;}
")"		{return *yytext;}
"."         	{return *yytext;}
","         	{return *yytext;}
"*"         	{return *yytext;}
"+"         	{return *yytext;}
";"         	{return *yytext;}
"-"         	{return *yytext;}
"/"         	{return *yytext;}
"="         	{return *yytext;}
">"         	{return GT;}
"<"         	{return LT;}
{number}	{
			yylval = strdup(yytext);  //stores the value of the number to be used later for symbol table insertion
			return T_NUM;
		}
"if"		{return T_IF;}
"else"		{return T_ELSE;}
{id}        	{
					yylval = strdup(yytext); //stores the identifier to be used later for symbol table insertion
					return T_ID;
				}
.		{} // anything else => ignore
%%
