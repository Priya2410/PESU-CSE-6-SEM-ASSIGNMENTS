%{
	#include "abstract_syntax_tree.c"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror(char* s); 											// error handling function
	int yylex(); 													// declare the function performing lexical analysis
	extern int yylineno; 											// track the line number
%}

%union																// union to allow nodes to store return different datatypes
{
	char* text;
	expression_node* exp_node;
}



%token <text> T_ID T_NUM

%type <exp_node> E T F

/* specify start symbol */
%start START


%%
START : ASSGN	{ 
					printf("Syntax performed is Valid\n");
	 				YYACCEPT;										// If program fits the grammar, syntax is valid
	 			}

/* Grammar for assignment */
ASSGN : T_ID '=' E	{
						// displaying the expression tree
						display_exp_tree($3); 
					}
	;

/* Expression Grammar */
E : E '+' T 	{
					// create a new node of the AST and set left and right children appropriately
					$$ = init_exp_node(strdup("+"), $1, $3);


				}
	| E '-' T 	{
					// create a new node of the AST and set left and right children appropriately
					$$ = init_exp_node(strdup("-"), $1, $3);

				}
	| T { 
			$$ = $1; 
		}
	;
	
	
T : T '*' F 	{
					// create a new node of the AST and set left and right children appropriately
					$$ = init_exp_node(strdup("*"), $1, $3);
				}
	| T '/' F 	{
					// create a new node of the AST and set left and right children appropriately
					$$ = init_exp_node(strdup("/"), $1, $3);
				}
	| F {
			//pass AST node to the parent
			$$ = $1;
		}
	;

F : '(' E ')' { $$ = $2; }
	| T_ID 		{
					// creating a terminal node of the AST
					$$ = init_exp_node(strdup($1), NULL, NULL);
				}
	| T_NUM 	{
					// creating a terminal node of the AST
					$$ = init_exp_node(strdup($1), NULL, NULL);
				}
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
