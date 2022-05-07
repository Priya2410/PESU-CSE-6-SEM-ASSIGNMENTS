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



%token <text> T_ID T_NUM IF ELSE

%type <text> RELOP

%type <exp_node> E T F START ASSGN S C SEQ 

/* specify start symbol */
%start START


%%
START : SEQ {
	display_exp_tree($1);
	printf("\n");
	YYACCEPT;
};

SEQ : S SEQ { $$=init_exp_node("seq",$1,$2,NULL);}
	| S  {$$=$1;}
;

S : IF '(' C ')' '{' SEQ '}' {
		$$=init_exp_node(strdup("if"),$3,$6,NULL);
	}
	| IF '(' C ')' '{' SEQ '}' ELSE '{' SEQ '}' {
		$$=init_exp_node(strdup("if-else"),$3,$6,$10);
	}
	| ASSGN { $$=$1;}
;

C : F RELOP F {
	$$=init_exp_node(strdup($2),$1,$3,NULL);
}
;

RELOP : '<' { $$="<";}
	   | '>' { $$=">";}
	   | '>''=' { $$=">=";}
	   | '<''=' { $$="<=";} 
	   | '=''=' { $$="==";}
	   | '!''=' { $$="!=";}
;



/* Grammar for assignment */
ASSGN : T_ID '=' E ';'	{
					$$ = init_exp_node(strdup("="),init_exp_node(strdup($1),NULL,NULL,NULL),$3,NULL);
					}
	;

/* Expression Grammar */
E : E '+' T 	{
					$$ = init_exp_node(strdup("+"),$1,$3,NULL);
				}
	| E '-' T 	{
					$$ = init_exp_node(strdup("-"),$1,$3,NULL);
				}
	| T 	{ $$ = $1; }
	;
	
	
T : T '*' F 	{
				$$ = init_exp_node(strdup("*"),$1,$3,NULL);
				}
	| T '/' F 	{
				$$ = init_exp_node(strdup("/"),$1,$3,NULL);	
				}
	| F  { $$ = $1; }
	;

F : '(' E ')' { $$ = $2; }
	| T_ID 	{
			$$ = init_exp_node(strdup($1),NULL,NULL,NULL);
			}
	| T_NUM 	{
				$$ = init_exp_node(strdup($1),NULL,NULL,NULL);
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
