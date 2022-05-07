a.exe: y.tab.c lex.yy.c
	gcc y.tab.c lex.yy.c
y.tab.c: parser.y
	bison -dy parser.y
lex.yy.c: lex.l  y.tab.h
	flex lex.l
	