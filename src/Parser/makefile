BUILD_DIR=Build
PARSE_DIR=Parse
SCANNER_DIR=Scanner

CUP=cup
CUP_CLASSPATH=/usr/share/java/cup.jar
JFLEX=jflex
JAVAC=javac

LEX_FILE=$(SCANNER_DIR)/lexer.l
PAR_FILE=$(PARSE_DIR)/parser.l

all: Project

Project: Parser Scanner
	$(JAVAC) -cp "$(CUP_CLASSPATH):$(PARSE_DIR):$(SCANNER_DIR)" $(SCANNER_DIR)/Scanner.java -d $(BUILD_DIR)

Parser: $(PAR_FILE)
	$(CUP) -parser Parser -symbols Sym -expect 3 $(PAR_FILE)
	mv Parser.java $(PARSE_DIR)/Parser.java
	mv Sym.java $(PARSE_DIR)/Sym.java

Scanner: $(LEX_FILE)
	$(JFLEX) $(LEX_FILE)

clean: 
	rm -rf $(BUILD_DIR) *.class *.java
