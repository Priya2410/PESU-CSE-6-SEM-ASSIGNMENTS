all:
	lex lexer.l
	yacc parse.y -d
	gcc y.tab.c lex.yy.c -ll -ly
