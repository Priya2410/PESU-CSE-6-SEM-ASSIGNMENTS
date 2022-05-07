%{
	#include "sym_tab.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#define YYSTYPE char*
	/*
		declare variables to help you keep track or store properties
		scope can be default value for this lab(implementation in the next lab)
	*/
    int type;
	void yyerror(char* s); // error handling function
	int yylex(); // declare the function performing lexical analysis
	extern int yylineno; // track the line number

%}

%token T_INT T_CHAR T_DOUBLE T_WHILE  T_INC T_DEC   T_OROR T_ANDAND T_EQCOMP T_NOTEQUAL T_GREATEREQ T_LESSEREQ T_LEFTSHIFT T_RIGHTSHIFT T_PRINTLN T_STRING  T_FLOAT T_BOOLEAN T_IF T_ELSE T_STRLITERAL T_DO T_INCLUDE T_HEADER T_MAIN T_ID T_NUM

%start START


%%
START : PROG { printf("Valid syntax\n"); YYACCEPT; }	
        ;	
	  
PROG :  MAIN PROG				
	|DECLR ';' PROG 				
	| ASSGN ';' PROG 			
	| 					
	;
	 

DECLR : TYPE LISTVAR 
	;	


LISTVAR : LISTVAR ',' VAR 
	  | VAR
	  ;

VAR: T_ID '=' EXPR 	{
				/*
					to be done in lab 3
				*/
                    if(check_symbol_table($1)==1)
                    {
                        insert_value_to_name($1,$3);
                    }
                    else {
                    int size = 1;
                    for(int i=1;i<type;i++)
                        size *= 2;
                    symbol* sym = allocate_space_for_table_entry($1, size, type, yylineno, 1);
                    insert_into_table(sym);
                    insert_value_to_name($1, $3);
                    }
            }
     | T_ID 		{
				/*
                   			check if symbol is in table
                    			if it is then print error for redeclared variable
                    			else make an entry and insert into the table
                    			revert variables to default values:type
                    		*/
                    if(check_symbol_table($1)==1)
                        yyerror("Variable is declared previously\n");
                    int size = 1;
                    for(int i=1;i<type;i++)
                        size *= 2;
                    symbol* sym = allocate_space_for_table_entry($1, size, type, yylineno, 1);
                    insert_into_table(sym);
			}	 
    ;
//assign type here to be returned to the declaration grammar
TYPE : T_INT            {type = INT;}
       | T_FLOAT        {type = FLOAT;}
       | T_DOUBLE       {type = DOUBLE;}
       | T_CHAR         {type = CHAR;}
       ;
    
/* Grammar for assignment */   
ASSGN : T_ID '=' EXPR 	{
				/*
					to be done in lab 3
				*/
                if(check_symbol_table($1)==1)
                {
                    insert_value_to_name($1,$3);
                }
                else {
                    yyerror("Undeclared variable is being used");
                }
			}
	;

EXPR : EXPR REL_OP E
       | E 
       ;
	   
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
    | T_STRLITERAL 
    ;

REL_OP :   T_LESSEREQ
	   | T_GREATEREQ
	   | '<' 
	   | '>' 
	   | T_EQCOMP
	   | T_NOTEQUAL
	   ;	


/* Grammar for main function */
MAIN : TYPE T_MAIN '(' EMPTY_LISTVAR ')' '{' STMT '}';

EMPTY_LISTVAR : LISTVAR
		|	
		;

STMT : STMT_NO_BLOCK STMT
       | BLOCK STMT
       |
       ;


STMT_NO_BLOCK : DECLR ';'
       | ASSGN ';' 
       ;

BLOCK : '{' STMT '}';

COND : EXPR 
       | ASSGN
       ;


%%


/* error handling function */
void yyerror(char* s)
{
	printf("Error :%s at %d \n",s,yylineno);
}


int main(int argc, char* argv[])
{
	/* initialise table here */
    allocate_space_for_table();
	yyparse();
	/* display final symbol table*/
    display_symbol_table();
	return 0;

}
