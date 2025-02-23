BUILD_DIR=build
SCANNER=Scanner
PARSER=Parse

JAVAC=javac
JFLEX=jflex

LEX=lexer.l

all: $(BUILD_DIR)/Lexer.class

$(BUILD_DIR)/%.class: $(SCANNER)/%.java
	$(JAVAC) -cp $(SCANNER) $^ -d $(BUILD_DIR)

$(SCANNER)/Lexer.java: $(SCANNER)/$(LEX)
	$(JFLEX) $(SCANNER)/$(LEX)

clean:
	rm -rf $(BUILD_DIR)/*
