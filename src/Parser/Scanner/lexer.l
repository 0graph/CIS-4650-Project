/**
 * Config file for lexer token creation
 */

import java_cup.runtime.*;


%%

%class Lexer
%type Symbol
%line
%column
%cup

%eofval{
  return null;
%eofval};

%{
  // Create Cup Symbol for parsing with no value object
  private Symbol symbol(int type){
    return new Symbol(type, yyline, yycolumn);
  }

  // Create Cup Symbol for parsing with value object
  private Symbol symbol(int type, Object value){
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

ID = [_a-zA-Z][_a-zA-Z0-9]*
NUM = [0-9]+

WHITESPACE = [\r|\n|\r\n]|[ \t\f]
COMMENTS = "/\*" ([^*]|\*+[^*/])* "\*/"
%%

/* Lexical Rules Section */

{COMMENTS} {/*Ignore Comments*/}

/* Reserved Keywords */
"bool"    { return symbol(Sym.BOOL); }
"if"      { return symbol(Sym.IF); }
"else"    { return symbol(Sym.ELSE); }
"int"     { return symbol(Sym.INT); }
"return"  { return symbol(Sym.RETURN); }
"void"    { return symbol(Sym.VOID); }
"while"   { return symbol(Sym.WHILE); }
"true"    { return symbol(Sym.TRUE); }
"false"   { return symbol(Sym.FALSE); }

/* Special Symbols */
"+"   { return symbol(Sym.PLUS); }
"-"   { return symbol(Sym.MINUS); }
"*"   { return symbol(Sym.TIMES); }
"/"   { return symbol(Sym.DIVIDE); }
"<"   { return symbol(Sym.LT); }
"<="  { return symbol(Sym.LTE); }
">"   { return symbol(Sym.GT); }
">="  { return symbol(Sym.GTE); }
"=="  { return symbol(Sym.EQ); }
"!="  { return symbol(Sym.NEQ); }
"~"   { return symbol(Sym.NOT); }
"||"  { return symbol(Sym.OR); }
"&&"  { return symbol(Sym.AND); }
"="   { return symbol(Sym.ASSIGN); }
";"   { return symbol(Sym.SEMI); }
","   { return symbol(Sym.COMMA); }
"("   { return symbol(Sym.LPAREN); }
")"   { return symbol(Sym.RPAREN); }
"["   { return symbol(Sym.LBRACKET); }
"]"   { return symbol(Sym.RBRACKET); }
"{"   { return symbol(Sym.LCURLY); }
"}"   { return symbol(Sym.RCURLY); }

/* Special Tokens */
{ID} {return symbol(Sym.ID, yytext());}
{NUM} {return symbol(Sym.NUM, yytext());}
{WHITESPACE} {/*Ignore Whitespace*/}
. { return symbol(Sym.ERROR, yytext()); }
