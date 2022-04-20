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
	int type = 0;
	int size = 0;
	char* vval="~";
	int vtype=-1;
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
							{
								printf("Redeclaration error detected at line number: %d\n",yylineno);
							}
							else
							{
								symbol* s = allocate_space_for_table_entry($1, size, type, yylineno, 1);
								insert_into_table(s);
							}
			}	 

//assign type here to be returned to the declaration grammar
TYPE : T_INT {type = 2; size = sizeof(short int);}
       | T_FLOAT {type = 3; size = sizeof(float);}
       | T_DOUBLE {type = 4; size = sizeof(double);}
       | T_CHAR {type = 1; size = sizeof(char);}
       ;
    
/* Grammar for assignment */   
ASSGN : T_ID '=' EXPR 	{
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
	;

EXPR : EXPR REL_OP E
       | E {vval=$1;}
       			
       			
       			
       			
       ;
	   
E : E '+' T  {
				if(vtype==2)
					{sprintf($$,"%d",(atoi($1)+atoi($3)));}
				else if(vtype==3)
					{sprintf($$,"%lf",(atof($1)+atof($3)));}
				else
				{
					printf("Character used in arithmetic\n");
					yyerror($$);
					$$="~";
				}
			}
			
    | E '-' T 	{
				if(vtype==2)
					{sprintf($$,"%d",(atoi($1)-atoi($3)));}
				else if(vtype==3)
					{sprintf($$,"%lf",(atof($1)-atof($3)));}
				else
				{
					printf("Character used in arithmetic\n");
					yyerror($$);
					$$="~";
				}
			}
    | T {$$=$1;}
    ;
	
	
T : T '*' F 	{
				if(vtype==2)
					{sprintf($$,"%d",(atoi($1)*atoi($3)));}
				else if(vtype==3)
					{sprintf($$,"%lf",(atof($1)*atof($3)));}
				else
				{
					printf("Character used in arithmetic\n");
					yyerror($$);
					$$="~";
				}
			}
    | T '/' F  {
				if(vtype==2)
					{sprintf($$,"%d",(atoi($1)/atoi($3)));}
				else if(vtype==3)
					{sprintf($$,"%lf",(atof($1)/atof($3)));}
				else
				{
					printf("Character used in arithmetic\n");
					yyerror($$);
					$$="~";
				}
			}
    | F {$$=$1;}
    ;

F : '(' EXPR ')'
    | T_ID		{
					if(check_symbol_table($1))
					{
						char* check = retrieve_val($1);
						if(check=="~")
						{
							printf("Variable %s not initialised",$1);
							yyerror($1);
						}
						else
						{
							$$=strdup(check);
							//printf("CHECK IS%s\n",check);
							vtype=type_check(check);
							//printf("OMG GOT %d in tid\n",vtype);
							if(vtype!=type && type!=-1)
							{
								//printf("Mismatch type\n");
								yyerror($1);
							}
						}
					}
			}
    | T_NUM 		{							// {vval=strdup($1);}
					$$=strdup($1);
					//printf("CHECK IS : %s %d\n",$1,sizeof($1));
					vtype=type_check($1);
					//printf("OMG GOT %d in tnum\n",vtype);
					if(vtype!=type && type!=-1)
					{
						//printf("Mismatch type\n");
						yyerror($1);
					}
			}
    | T_STRLITERAL 	{						// {vval=strdup($1);}
						$$=strdup($1);
						vtype=1;
						if(vtype!=type)
						{
							//printf("Mismatch type\n");
							yyerror($1);
						}
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

//COND : EXPR 
       //| ASSGN
       //;


%%


/* error handling function */
void yyerror(char* s)
{
	printf("Error :%s at %d \n",s,yylineno);
}


int main(int argc, char* argv[])
{
	/* initialise table here */
	t = allocate_space_for_table();
	yyparse();
	/* display final symbol table*/
	display_symbol_table();
	return 0;

}
