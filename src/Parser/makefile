BUILD_DIR=build
SCANNER=Scanner
PARSER=Parse
CUP_CLASSPATH=/usr/share/java/cup.jar

JAVA=java
JAVAC=javac
JFLEX=jflex
JCUP=cup

LEX=lexer.l
PAR=parser.l

CUP=$(JAVA) -cp  $(JCUP)

all: $(BUILD_DIR)/Parser.class $(BUILD_DIR)/Lexer.class

$(BUILD_DIR)/%.class: $(SCANNER)/%.java
	$(JAVAC) -cp $(SCANNER) $^ -d $(BUILD_DIR)

$(SCANNER)/Lexer.java: $(SCANNER)/$(LEX)
	$(JFLEX) $(SCANNER)/$(LEX)

$(SCANNER)/Parser.java: $(PARSER)/$(PAR)
	$(JCUP) -d $(BUILD_DIR) 
	# $(CUP) -d $(BUILD_DIR) -expect 3 $(PARSER)/$(PAR)

clean:
	rm -rf $(BUILD_DIR)/* *.class absyn/*.class *~
