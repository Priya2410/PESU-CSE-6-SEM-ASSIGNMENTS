%{
#include<stdio.h>
#include "y.tab.h"
void yyerror(char *s);
%}
%%
int	return INT;
float	return FLOAT;
char	return CHAR;
[a-zA-Z]([a-zA-Z0-9])*	return ID;
\n	return NL;
[' '|\t]	;
.	return *yytext;
