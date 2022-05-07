%{
    #define YYSTYPE char*
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
"int" 		{return T_INT;}
"char"		{return T_CHAR;}
"double"	{return T_DOUBLE;}
"float"		{return T_FLOAT;}
"while" 	{return T_WHILE;}
"if"		{return T_IF;}
"else"		{return T_ELSE;}
"do" 		{return T_DO;}
"#include" 	{return T_INCLUDE;}
"main" 		{return T_MAIN;}
\".*\"		{yylval=strdup(yytext); return T_STRLITERAL; }
"=="		{return T_EQCOMP;}
"!="		{return T_NOTEQUAL;}
">="        	{return T_GREATEREQ;}
"<="        	{return T_LESSEREQ;}
"("		{return *yytext;}
")"		{return *yytext;}
"."         	{return *yytext;}
","         	{return *yytext;}
"{"         	{return *yytext;}
"}"         	{return *yytext;}
"*"         	{return *yytext;}
"+"         	{return *yytext;}
";"         	{return *yytext;}
"-"         	{return *yytext;}
"/"         	{return *yytext;}
"="         	{return *yytext;}
">"         	{return *yytext;}
"<"         	{return *yytext;}
{number}	{
			yylval=strdup(yytext);  //stores the value of the number to be used later for symbol table insertion
			return T_NUM;
		}
{id}\.h	{return T_HEADER;}  // ending in .h => header file name
{id}        	{
			yylval=strdup(yytext); //stores the identifier to be used later for symbol table insertion
			return T_ID;
		}
.		{} // anything else => ignore
%%



