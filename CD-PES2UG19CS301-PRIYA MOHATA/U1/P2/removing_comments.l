%%
\/\/(.*); 
\/\*(.*\n*)*.*\*\/; 
%% 
int yywrap(){return(0);}
int main(){
    yyin=fopen("input.txt","r");
    yylex();
    return 0;
}