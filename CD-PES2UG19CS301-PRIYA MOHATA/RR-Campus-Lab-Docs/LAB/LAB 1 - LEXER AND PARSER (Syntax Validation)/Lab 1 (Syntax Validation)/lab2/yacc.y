%{
    #include<stdio.h>
    #include<stdlib.h>

    int yylex();
    void yyerror(const char *s);

    extern FILE *yyin;
    extern int yylineno;
    extern char *yytext;
    static int hasErrors;

%}

%token INCLUDE HEADER NUM EQCOMP GREATEREQ LESSEREQ NOTEQ INC DEC OROR ANDAND NOT INT CHAR FLOAT DOUBLE VOID WHILE FOR DO IF ELSE MAIN ID STRLITERAL CHARLITERAL

%start START
%nonassoc REDUCE
%nonassoc ELSE

%%
START   :   PROG
        ;

PROG    :   INCLUDE HEADER PROG |   MAINFUNC PROG |   DECL ';' PROG |   IDENT ';' PROG |   error ';' {yyerrok; yyclearin;} PROG
        | ;

DECL    :   TYPE VARLIST;

INDEX   :   '[' EXPR ']';

TYPE    :   INT        |   CHAR        |   FLOAT        |   DOUBLE        |   VOID        ;

VARLIST :   IDENT ',' VARLIST |   IDENT        |   ASSGN ',' VARLIST |   ASSGN;

IDENT   :   ID        |   IDENT INDEX;

ASSGN   :   IDENT '=' EXPR        ;

EXPR    :   EXPR '+' TERM        |   EXPR '-' TERM        |   EXPR '*' TERM        |   EXPR '/' TERM        |   EXPR '%' TERM        |   EXPR RELOP TERM        |   TERM        |   EXPR OROR TERM        |   EXPR ANDAND TERM        |   EXPR ',' EXPR|   ASSGN;

TERM    :   IDENT |   NUM  |   UNARY TERM  |  '!'TERM  |   INC IDENT   |   DEC IDENT  |   IDENT INC |   IDENT DEC | STRLITERAL  |   CHARLITERAL | '(' EXPR ')'        ;

UNARY   :   '+'|   '-';

RELOP   :   EQCOMP        |   GREATEREQ        |   LESSEREQ        |   NOTEQ        |   '<'        |   '>';

MAINFUNC:  TYPE MAIN '(' ARGS ')' '{' BODY '}';

BODY    :   STMT BODY |  ;

ARGS    :   TYPE IDENT',' ARGS |   TYPE IDENT|        ;

STMT    :   SINGLE
        |   BLOCK
        ;

SINGLE  :   DECL ';'
        |   EXPR ';'
        |   IFELSE
        |   WHILE '(' COND ')' STMT
        |   error STMT {yyerrok; yyclearin;}
        |   FOR_L
        |   DO BLOCK WHILE '(' COND ')' ';'
        |   /* LAMBDA */ ';'
        ;

FOR_L   :   FOR '(' FOR_I ';' FOR_C ';' FOR_U ')' STMT
        ;

FOR_I   :   EXPR
        |   DECL
        |   
        ;

FOR_C   :   COND
        |   
        ;

FOR_U   :   EXPR
        |   
        ;

IFELSE  :   IF '(' COND ')' STMT %prec REDUCE
        |   IF '(' COND ')' STMT ELSE STMT
        ;

BLOCK   : '{' BODY '}'
        ;

COND    :   EXPR
        ;

%%


void yyerror(const char * err)
{
    ++hasErrors;
    printf("Error: %s, Line number: %d, token: %s\n", err, yylineno, yytext);
}

int main(int argc, char *argv[]) {


    // For Reading Filename from cmdline
    if(argc == 1)
        yyin = yyin;
    else
        yyin = fopen(argv[1], "r");


    if(!yyparse() && !hasErrors){
        printf("Valid syntax\n");
    };

//  fclose(yyin);
    return 0;
}
