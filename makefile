JAVAC=javac
JFLEX=jflex
LEX=document.l

all: Token.class Lexer.class Scanner.class

%.class: %.java
	$(JAVAC) $^

Lexer.java: $(LEX)
	$(JFLEX) $(LEX)

clean:
	rm -f Lexer.java *.class *~

