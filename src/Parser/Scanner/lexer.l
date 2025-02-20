/**
 * Config file for lexer token creation
 *
 */


%%

ID = [_a-zA-Z][_a-zA-Z0-9]*
NUM = [0-9]+
TRUTH = false|true

WHITESPACE = [\r|\n|\r\n]|[ \t\f]
COMMENTS = (/*({ID}|{NUM})+*/)
%%

/* Lexical Rules Section */

/* Reserved Keywords */
"bool"  {}
"if"    {}
"else"  {}
"int"   {}
"return"{}
"void"  {}
"while" {}
"true"  {}
"false" {}

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
