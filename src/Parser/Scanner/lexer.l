/**
 * Config file for lexer token creation
 */

import java_cup.runtime.*;


%%

%class Lexer
%type Token
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
TRUTH = false|true

WHITESPACE = [\r|\n|\r\n]|[ \t\f]
COMMENTS = (\/*({ID}|{NUM})+*\/)
%%

/* Lexical Rules Section */

/* Reserved Keywords */
"bool"    { return symbol(sym.BOOL); }
"if"      { return symbol(sym.IF); }
"else"    { return symbol(sym.ELSE); }
"int"     { return symbol(sym.INT); }
"return"  { return symbol(sym.RETURN); }
"void"    { return symbol(sym.VOID); }
"while"   { return symbol(sym.WHILE); }
"true"    { return symbol(sym.TRUE); }
"false"   { return symbol(sym.FALSE); }

/* Special Symbols */
"+"   { return symbol(sym.PLUS); }
"-"   { return symbol(sym.MINUS); }
"*"   { return symbol(sym.TIMES); }
"/"   { return symbol(sym.DIVIDE); }
"<"   { return symbol(sym.LT); }
"<="  { return symbol(sym.LTE); }
">"   { return symbol(sym.GT); }
">="  { return symbol(sym.GTE); }
"=="  { return symbol(sym.EQ); }
"!="  { return symbol(sym.NEQ); }
"~"   { return symbol(sym.NOT); }
"||"  { return symbol(sym.OR); }
"&&"  { return symbol(sym.AND); }
"="   { return symbol(sym.ASSIGN); }
";"   { return symbol(sym.SEMI); }
","   { return symbol(sym.COMMA); }
"("   { return symbol(sym.LPAREN); }
")"   { return symbol(sym.RPAREN); }
"["   { return symbol(sym.LBRACKET); }
"]"   { return symbol(sym.RBRACKET); }
"{"   { return symbol(sym.LCURLY); }
"}"   { return symbol(sym.RCURLY); }

/* Special Tokens */
{ID} {}
{NUM} {}
{TRUTH} {}
{COMMENTS} {}
