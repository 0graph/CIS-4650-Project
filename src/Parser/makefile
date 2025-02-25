BUILD_DIR=Build
PARSE_DIR=Parse
SCANNER_DIR=Scanner

CUP=cup
# CUP_CLASSPATH=
JFLEX=jflex

LEX_FILE=$(SCANNER_DIR)/lexer.l
PAR_FILE=$(PARSE_DIR)/parser.l

all: Parser Scanner

Parser: $(PAR_FILE)
	$(CUP) -expect 3 $(PAR_FILE)
	mv parser.java $(PARSE_DIR)/Parser.java
	mv sym.java $(PARSE_DIR)/Sym.java

Scanner: $(LEX_FILE)
	$(JFLEX) $(LEX_FILE)

clean: 
	rm -rf $(BUILD_DIR) *.class *.java
