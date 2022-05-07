%{
	#include "sym_tab.c"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#define YYSTYPE char*
	/*
		declare variables to help you keep track or store properties
		scope can be default value for this lab(implementation in the next lab)
	*/
	void yyerror(char* s); // error handling function
	int yylex(); // declare the function performing lexical analysis
	extern int yylineno; // track the line number

%}

%token T_INT T_CHAR T_DOUBLE T_WHILE  T_INC T_DEC   T_OROR T_ANDAND T_EQCOMP T_NOTEQUAL T_GREATEREQ T_LESSEREQ T_LEFTSHIFT T_RIGHTSHIFT T_PRINTLN T_STRING  T_FLOAT T_BOOLEAN T_IF T_ELSE T_STRLITERAL T_DO T_INCLUDE T_HEADER T_MAIN T_ID T_NUM

%start START


%nonassoc T_IFX
%nonassoc T_ELSE

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
				    check if symbol is in the table
				    if it is then error for redeclared variable
				    else make entry and insert into table
				    insert value coming from EXPR
				    revert variables to default values:value,type
                   		 */
			}
     | T_ID 		{
				/*
                   			finished in lab 2
                    		*/
			}	 

//assign type here to be returned to the declaration grammar
TYPE : T_INT 
       | T_FLOAT 
       | T_DOUBLE 
       | T_CHAR 
       ;
    
/* Grammar for assignment */   
ASSGN : T_ID '=' EXPR 	{
			/*
               			 Check if variable is declared in the table
               			 insert value
            		*/
			}
	;

EXPR : EXPR REL_OP E
       | E 	//store value using value variable declared before
       ;
	   
/* Expression Grammar */	   
E : E '+' T 	{ 
		/*
		        check type
		        if character type return error
		        convert to int/float perform calculation
		        convert back to string 
		        copy to grammar rule E
          	*/
		}
    | E '-' T 	{ 
		/*
			check type
			if character type return error
			convert to int/float perform calculation
			convert back to string 
			copy to grammar rule E
            	*/
		}
    | T //copy value from T to grammar rule E
    ;
	
	
T : T '*' F 	{ 
		/*
		        check type
		        if character type return error
		        convert to int/float perform calculation
		        convert back to string 
		        copy to grammar rule T
            	*/
		}
    | T '/' F 	{ 
		/*
		        check type
		        if character type return error
		        convert to int/float perform calculation
		        convert back to string 
		        copy to grammar rule T
           	*/
		}
    | F //copy value from F to grammar rule T
    ;

F : '(' EXPR ')'
    | T_ID 	{
		/*
		        check if variable is in table
		        check the value in the variable is default
		        if yes return error for variable not initialised
		        else duplicate value from T_STRLITERAL to F
		        check for type match
		        (secondary type variable used here)
            	*/
		}
    | T_NUM 	{
    		/*
		        duplicate value from T_NUM to F
		        check for type match
		        (secondary type variable used here)
                */
		}
    | T_STRLITERAL {
            	/*
			duplicate value from T_STRLITERAL to F
			check for type match
			(secondary type variable used here)
            	*/
		}
    ;



REL_OP :   T_LESSEREQ
	   | T_GREATEREQ
	   | '<' 
	   | '>' 
	   | T_EQCOMP
	   | T_NOTEQUAL
	   ;	


/* Grammar for main function */
//increment and decrement at particular points in the grammar to implement scope tracking
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
       | T_IF '(' COND ')' STMT %prec T_IFX	/* if loop*/
       | T_IF '(' COND ')' STMT T_ELSE STMT	/* if else loop */ 
       ;
       
//increment and decrement at particular points in the grammar to implement scope tracking
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
	yyparse();
	/* display final symbol table*/
	return 0;

}
