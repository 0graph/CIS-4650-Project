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
"bool"    { return Token.CreateToken(yytext()); }
"if"      {}
"else"    {}
"int"     {}
"return"  {}
"void"    {}
"while"   {}
"true"    {}
"false"   {}

/* Special Symbols */
"+" {}
"-" {}
"*" {}
"/" {}
"<" {}
"<=" {}
">" {}
">=" {}
"==" {}
"!=" {}
"~" {}
"||" {}
"&&" {}
"=" {}
";" {}
"," {}
"(" {}
")" {}
"[" {}
"]" {}
"{" {}
"}" {}


/* Special Tokens */
{ID} {}
{NUM} {}
{TRUTH} {}
{COMMENTS} {}
