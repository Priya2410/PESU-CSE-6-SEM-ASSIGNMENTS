%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *s);
extern int yylineno;
extern char *yytext;
%}

%token INT FLOAT DOUBLE CHAR FOR WHILE IF ELSE INCLUDE MAIN ID NUMBER HEADER GREATEREQ LESSEREQ EQCOMP NOTEQ INC DEC ANDAND OROR
%start Start

%%

Start : Prog { printf("Declarations are valid.\n"); YYACCEPT; };

Prog: INCLUDE '<' HEADER '>' Prog | MainF Prog | Declr ';' Prog | Assgn ';' Prog | ;

Declr: Type ListVar ;

ListVar: ListVar ',' ID | ID ;

Type: INT | FLOAT | DOUBLE | CHAR ;

Assgn: ID '=' Expr;

Expr: Expr Relop E | E ;

Relop: '<' | '>' | LESSEREQ | GREATEREQ | EQCOMP | NOTEQ ;

E: E '+' T | E '-' T | T ;

T: T '*' F | T '/' F | F  ;

F: '(' Expr ')' | ID | NUMBER ;

MainF : Type MAIN '(' Empty_ListVar ')' '{' Stmt '}' ;

Empty_ListVar : ListVar | ;

Stmt : SingleStmt Stmt | Block Stmt | ;

SingleStmt : Declr ';' | Assgn ';' | IF '(' Cond ')' Stmt | IF '(' Cond ')' Stmt ELSE Stmt | WhileL ;

Block : '{' Stmt '}' ;

WhileL: WHILE '(' Cond ')' While_2  ;

Cond: Expr | Assgn  ;

While_2 : '{' Stmt '}' |  ;

%%
void yyerror(char *s)
{
  printf("Error: %s, Line number: %d, Token: %s\n", s, yylineno, yytext);
}

int main()
{
  if(!yyparse()) {
    printf("Parsing Successful\n");
  } 
  else {
    printf("Unsuccessful\n");
  }
  return 0;
}