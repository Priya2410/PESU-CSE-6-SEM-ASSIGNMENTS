%{
/* DEFINITIONS */
#define YYSTYPE char*  // specify the data type	for	variable yylval 
#include "y.tab.h"  // y.tab.h contains token definitions
#include <stdio.h>
extern void yyerror(const char *);  // declare the error handling function
%}


/* Regular definitions */
digit [0-9]
letter [a-zA-Z]
id {letter}({letter}|{digit})*
array {id}\[{digit}+\]
digits {digit}+
opFraction (\.{digits})?  
opExponent ([Ee][+-]?{digits})?
number {digits}{opFraction}{opExponent}

%%  // Separates definitions section from rules section


\/\/(.*)  ;	// ignore comments  
[\t\n]  ;	 // ignore whitespaces
"int"    {return T_INT;}
"char"   {return T_CHAR;}
"double" {return T_DOUBLE;}
"float"  {return T_FLOAT;}
"while"  {return T_WHILE;}
"if"	 {return T_IF;}
"else"	 {return T_ELSE;}
"do"	 {return T_DO;}
"#include"  {return T_INCLUDE;}
"main"  {return T_MAIN;}
"for" {return T_FOR;}
\".*\"  {return T_STRLITERAL;}
"=="    {return T_EQCOMP;}
"++" 	{return T_INCR;}
"--" 	{return T_DECR;}
"!="    {return T_NOTEQUAL;}
">="    {return T_GREATEREQ;}
"<="    {return T_LESSEREQ;}
"("     {return *yytext;}
")"     {return *yytext;}
"."     {return *yytext;}
","     {return *yytext;}  // yytext contains the currently matched lexeme
"{"     {return *yytext;}  // single char tokens can be passed directly (they are tokens in themselves)
"}"     {return *yytext;} 
"*"     {return *yytext;}
"+"     {return *yytext;}
";"     {return *yytext;}
"-"     {return *yytext;}
"/"     {return *yytext;}
"="     {return *yytext;}
">"     {return *yytext;}
"<"     {return *yytext;}
"||"	{return T_OR;}
"&&"	{return T_AND;}
{array} {return T_ARRAY;}
{number}  {return T_NUM;}
{id}\.h   {return T_HEADER;}  // ending in .h => header file name
{id}      {return T_ID;}
.       {}  // anything else => ignore

%%	// Separates rules section from subroutines section (there are no subroutines in this case)
