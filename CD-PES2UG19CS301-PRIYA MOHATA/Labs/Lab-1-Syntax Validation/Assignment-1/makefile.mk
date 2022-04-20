LEX = lex
YACC = yacc -d

CC = gcc

parser: y.tab.o lex.yy.o
	$(CC) -o parser y.tab.o lex.yy.o -ll -ly

lex.yy.o: lex.yy.c y.tab.h
lex.yy.o y.tab.o: y.tab.h

y.tab.c y.tab.h: parser.y
	$(YACC) -v parser.y

lex.yy.c: lexer.l
	$(LEX) lexer.l

clean:
	-rm -f *.o lex.yy.c *.tab.*  parser *.output


