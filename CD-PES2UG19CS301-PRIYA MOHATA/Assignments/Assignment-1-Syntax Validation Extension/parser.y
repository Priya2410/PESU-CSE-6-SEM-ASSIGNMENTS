%{
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>

void yyerror(char* s);  // error handling function
int yylex();  // declare the function performing lexical analysis  
extern int yylineno;  // track the line number
%}

/* declare tokens */
%token T_INT T_CHAR T_DOUBLE T_WHILE T_INC T_DEC T_OROR T_ANDAND
T_EQCOMP T_NOTEQUAL T_GREATEREQ T_LESSEREQ T_LEFTSHIFT T_RIGHTSHIFT  
T_NUM T_ID T_PRINTLN T_STRING T_FLOAT T_BOOLEAN T_IF T_ELSE  
T_STRLITERAL T_DO T_INCLUDE T_HEADER T_MAIN T_FOR T_ARRAY T_OR T_AND T_INCR T_DECR

/* specify start symbol */
%start START

%%
START : PROG  { printf("Valid syntax\n"); YYACCEPT; }  /* If program fits the grammar, syntax is valid */
	;	/* Anything within {} is C code, it is the action corresponding to the production rule */

PROG : T_INCLUDE '<' T_HEADER '>' PROG	/* include header */
	| MAIN PROG    /* main function */
	| DECLR ';' PROG   /* declarations */
	| ASSGN ';' PROG   /* assignments  */
	| DEC_ASGN ';' PROG
	| FOR PROG
	| DO PROG
	| EXPR ';' PROG
	
	|	/* end of programs */
	;

FOR : T_FOR '(' DEC_ASGN';'T_ID REL_OP EXPR ';' T_ID UNARY_OP ')''{'STMT'}'
	;
DEC_ASGN: TYPE LISTVAR '=' EXPR
	;
/* Grammar for variable declaration */  
DECLR : TYPE LISTVAR
	| TYPE T_ARRAY
	;	/* always terminate with a ; */

LISTVAR : LISTVAR ',' T_ID
	| T_ID
	;

TYPE : T_INT
	| T_FLOAT
	| T_DOUBLE
	| T_CHAR
	;
	
/* Grammar for assignment */  
ASSGN : T_ID '=' EXPR
	;
	
EXPR : EXPR REL_OP E
	| E
	| EXPR LOGICAL_OP E
	| E UNARY_OP
	| UN_OP E
	;

LOGICAL_OP:T_AND
	|T_OR
	|'!'
	;
	
REL_OP : T_LESSEREQ
	| T_GREATEREQ
	| '<'
	| '>'
	| T_EQCOMP
	| T_NOTEQUAL
	;
	
UNARY_OP: T_INCR
	|T_DECR
	;
	
UN_OP   : T_INCR
	|T_DECR
	|'-'
	|'+'
	|'!'
	;
	
/* Expression Grammar */  
E : E '+' T
	| E '-' T
	| T
	;
	
T : T '*' F
	| T '/' F
	| F
	;
	
F : '(' EXPR ')'
	| T_ID
	| T_NUM
	;
	
/* Grammar for main function */
MAIN : TYPE T_MAIN '(' EMPTY_LISTVAR ')' '{' STMT '}';

/* argument list can be empty, or have a list of variables */  
EMPTY_LISTVAR : LISTVAR
	|   /* similar to lambda */
	;

/* statements can be standalone, or parts of blocks */  
STMT : STMT_NO_BLOCK STMT
	| BLOCK STMT
	| FOR 
	| DO
	| EXPR ';'
	| DEC_ASGN ';' 
	|
	;
	
/* to give IF precedence over IF-ELSE */

%nonassoc T_IFX;
%nonassoc T_ELSE;

STMT_NO_BLOCK : DECLR ';'
	| ASSGN ';'
	| T_IF COND STMT %prec T_IFX   /* if loop */
	| T_IF COND STMT T_ELSE STMT   /* if else loop */
	| WHILE
	;

DO    : T_DO BLOCK WHILE
      ;
      
BLOCK : '{' STMT '}';

/* Grammar for while loop */
WHILE : T_WHILE '(' COND ')' WHILE_2;
	

/* Condition can be an expression or an assignment */  
COND : EXPR
	| ASSGN
	;
	
// while loop may or may not have block of statements  
WHILE_2 : '{' STMT '}'
	| ';'
	;
	
%%

/* error handling function */  
void yyerror(char* s)
{
printf("Error :%s at %d \n",s,yylineno);
}

/* main function - calls the yyparse() function which will in turn drive yylex() as well */  
int main(int argc, char* argv[])
{
	yyparse();  
	return 0;
}
