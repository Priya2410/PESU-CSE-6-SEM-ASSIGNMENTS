%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char* s);
extern int yylineno;
extern char *yytext;
%}
%token INT FLOAT DOUBLE CHAR STATIC ID INCLUDE HEADER MAIN DO WHILE IF ELSE FOR BOOL BREAK INC DEC STRLIT VNUM LT GT GTE LTE EQ NE OR AND LNOT SCOMB ECOMB SSQB ESQB SCURB ECURB
%start P
%%


P : S {printf("Valid Syntax\n");YYACCEPT;}
  ;
S : INCLUDE HEADER S
  | STATIC S
  | MAINF S
  | DECLR ';' S
  | ASSGN ';' S
  |
  ;

TYPE : INT | FLOAT | CHAR | BOOL | DOUBLE 
     ;

DECLR : TYPE List_Var | s
      ;

List_Var : List_Var ',' ID | ID 
         ;

ASSGN : TYPE ID '=' EXPR | ID '=' EXPR | STRLIT
      ;

EXPR : EXPR RELOP E | E | ID INC | ID DEC | LNOT ID|S
     ;

RELOP : GTE|LTE|EQ|NE|OR|AND|LT|GT
      ;

E : E'+'T|E'-'T|T
  ;

T : T'*'F|T'/'F|F
  ;


F : SCOMB EXPR ECOMB | ID | VNUM
  ;

MAINF : TYPE MAIN SCOMB Empty_ListVar ECOMB SCURB Stmt ECURB
     ;

Empty_ListVar : List_Var
	      |
              ;

Stmt : SingleStmt Stmt | Block Stmt | BREAK
     |
     ;

Ifelstmt : SingleStmt Stmt | Block Stmt
	 ;


SingleStmt : DECLR ';' | ASSGN ';' | IF SCOMB COND ECOMB Ifelstmt | IF SCOMB COND ECOMB Ifelstmt ELSE Ifelstmt | LOOP | DO Block WHILE COND ';'
           ;

Block : SCURB Stmt ECURB
      ;

LOOP : WHILE SCOMB COND ECOMB LOOP2
      | FOR SCOMB COND ECOMB LOOP2
      ;

COND : EXPR | ASSGN 
     ;

LOOP2 : SCURB Stmt ECURB 
      |
      ;

s : error;
%%
void yyerror(char* s)
{
printf("Error:%s,line number:%d,token:%s\n",s,yylineno,yytext);
}

int main()
{
yyparse();

}


