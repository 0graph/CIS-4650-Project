/**
 * Config file for lexer token creation
 */


%%

%class Lexer
%type Token

ID = [_a-zA-Z][_a-zA-Z0-9]*
NUM = [0-9]+
TRUTH = false|true

WHITESPACE = [\r|\n|\r\n]|[ \t\f]
COMMENTS = (\/*({ID}|{NUM})+*\/)
%%

/* Lexical Rules Section */

/* Reserved Keywords */
"bool"    { Token.CreateToken(yytext()); }
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
