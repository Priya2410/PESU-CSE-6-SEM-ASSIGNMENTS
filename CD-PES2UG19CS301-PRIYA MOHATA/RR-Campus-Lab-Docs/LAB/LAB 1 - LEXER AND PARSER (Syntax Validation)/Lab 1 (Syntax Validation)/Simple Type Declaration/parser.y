%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *s);
%}
%token NL INT FLOAT CHAR ID 
%%
P : S NL	{printf("Valid Declaration\n");YYACCEPT;}
  ;
S : D
  ;
D : Type List_Var ';'
  ;
Type : INT 
     | FLOAT 
     | CHAR
     ;
List_Var : List_Var ',' ID 
	 | ID
	 ;
%%
void yyerror(char *s)
{
printf("%s\n", s);
exit(0);
}
int main()
{
if(!yyparse())
	printf("Parsing Successful\n");
else
	printf("Unsuccessful\n");
return 0;
}
