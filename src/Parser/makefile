SCANNER=./Scanner/

JAVAC=javac
JFLEX=jflex

LEX=lexer.l


all: Token.class Lexer.class

$(SCANNER)%.class: %.java
	$(JAVAC) $^

$(SCANNER)Lexer.java: $(LEX)
	$(JFLEX) $(LEX)

clean:
	rm -f Lexer.java *.class *~
