%{
    int yylineno;
%}
%%
(.*)\n printf("%4d\t%s",yylineno++,yytext);
%%
int yywrap(){return(1);}
int main(){
    yyin=fopen("input.txt","r");
    yylex();
    fclose(yyin);
    return 0;
}
