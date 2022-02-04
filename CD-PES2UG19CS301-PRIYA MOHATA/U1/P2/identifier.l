%{
#include<stdio.h>
%}

digit [0-9]
letter [a-zA-Z]

%%
({letter}({letter}{digit})*) printf("Identifier:%s\n",yytext);
. ;
%%
int yywrap(){return(0);}
int main(){
    yyin=fopen("input.txt","r");
    yylex();
    fclose(yyin);
    return 0;
}