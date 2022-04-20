all:
	lex lexer.l
	bison -dy parser.y
	gcc lex.yy.c y.tab.c -lfl
	./a.out 
clean:
	rm -f lex.yy.c
	rm -f a.out 
	rm -f y.tab.h
	rm -f y.tab.c
	rm -f y.output
