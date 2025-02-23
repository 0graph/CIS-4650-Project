SCANNER=./Scanner/
JAVAC=javac
JFLEX=jflex

LEX=$(SCANNER)lexer.l


all: $(SCANNER)Token.class $(SCANNER)Lexer.class

$(SCANNER)%.class: $(SCANNER)%.java
	$(JAVAC) $^

Lexer.java: $(LEX)
	$(JFLEX) $(LEX)

clean:
	rm -f Lexer.java *.class *~
