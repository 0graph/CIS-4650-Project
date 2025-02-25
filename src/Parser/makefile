BUILD_DIR=build
SCANNER=Scanner
PARSER=Parse

JAVAC=javac
JFLEX=jflex

LEX=lexer.l
CUP=/usr/share/java/cup.jar
CUP_CFG=$(PARSER)/parser.l
PARSER_FILES=$(BUILD_DIR)/Parser.java $(BUILD_DIR)/sym.java


all: $(BUILD_DIR)/Lexer.class $(PARSER_FILES)

$(PARSER_FILES): $(CUP_CFG)
	java -cp "$(CUP):$(SCANNER)" java_cup.Main -parser Parser -symbols sym $(CUP_CFG)

$(BUILD_DIR)/%.class: $(SCANNER)/%.java $(BUILD_DIR)/sym.java
	$(JAVAC) -cp "$(SCANNER):$(CUP)" $^ -d $(BUILD_DIR)

$(SCANNER)/Lexer.java: $(SCANNER)/$(LEX)
	$(JFLEX) $(SCANNER)/$(LEX)
	$(JFLEX) $(SCANNER)/$(LEX)

clean:
	rm -rf $(BUILD_DIR)/*
	rm -rf $(BUILD_DIR)/*
