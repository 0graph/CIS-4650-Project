BUILD_DIR=Build
PARSE_DIR=Parse
SCANNER_DIR=Scanner
AST_DIR=Ast
SYM_DIR=Symbol

CUP=cup
CUP_CLASSPATH=/usr/share/java/cup.jar
JFLEX=jflex
JAVAC=javac

LEX_FILE=$(SCANNER_DIR)/lexer.l
PAR_FILE=$(PARSE_DIR)/parser.l
SCANNER_FILES=$(wildcard $(SCANNER_DIR)/*.java)
PARSER_FILES=$(wildcard $(PARSE_DIR)/*.java)

all: $(BUILD_DIR)/ParserMain.class $(BUILD_DIR)/Scanner.class $(BUILD_DIR)/CM.class

$(BUILD_DIR)/ParserMain.class: $(PARSE_DIR)/*.java $(PAR_FILE) $(AST_DIR)/Ast/*.java
	$(CUP) -parser Parser -symbols Sym -expect 3 $(PAR_FILE)
	mv Parser.java $(PARSE_DIR)/Parser.java
	mv Sym.java $(PARSE_DIR)/Sym.java
	$(JAVAC) -cp "$(CUP_CLASSPATH):$(PARSE_DIR):$(SCANNER_DIR):$(AST_DIR)" $(PARSE_DIR)/ParserMain.java -d $(BUILD_DIR)

$(BUILD_DIR)/CM.class: $(SYM_DIR)/*.java
	$(JAVAC) -cp "$(CUP_CLASSPATH):$(SYM_DIR):$(PARSE_DIR):$(SCANNER_DIR):$(AST_DIR)" $(SYM_DIR)/CM.java -d $(BUILD_DIR)

$(BUILD_DIR)/Scanner.class: $(SCANNER_DIR)/*.java $(LEX_FILE)
	$(JFLEX) $(LEX_FILE)
	$(JAVAC) -cp "$(CUP_CLASSPATH):$(PARSE_DIR):$(SCANNER_DIR)" $(SCANNER_DIR)/Scanner.java -d $(BUILD_DIR)

clean: 
	rm -rf $(BUILD_DIR)/* *.class *.java
