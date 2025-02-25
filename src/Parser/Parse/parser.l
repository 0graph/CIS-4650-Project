import absyn.*;
import java_cup.runtime.Symbol;

/* Declare Terminals and Non-Terminals */
terminal BOOL, IF, ELSE, INT, RETURN, VOID, WHILE, TRUE, FALSE;
terminal PLUS, MINUS, TIMES, DIVIDE, LT, GT, LTE, GTE, ASSIGN, LPAREN, RPAREN, SEMI, LBRACKET, RBRACKET, LCURLY, RCURLY, COMMA;
terminal NOT, AND, OR, EQ, NEQ;
terminal String ID, NUM;
terminal ERROR;

non terminal program;
non terminal return_stmt, expression, var, obool_expression, abool_expression, ubool_expression, simple_expression, relop, additive_expression, addop, term, mulop, signed_factor, factor, call, args, arg_list;

/* Grammer Section */
start with program; 

program ::= ;


/* 18-34 */

return_stmt         ::= RETURN expression SEMI
                        | RETURN SEMI
                        ;

expression          ::= var EQ expression
                        | obool-expression
                        ;

var                 ::= ID 
                        | ID LBRACKET expression RBRACKET
                        ;

obool_expression    ::= obool_expression OR abool_expression
                        | abool_expression
                        ;

abool_expression    ::= abool_expression AND ubool_expression
                        | ubool_expression;

ubool_expression    ::= NOT ubool_expression
                        | simple_expression
                        ;

simple_expression   ::= additive_expression relop additive_expression
                        | additive_expression
                        ;

relop               ::= LTE 
                        | LT
                        | GT
                        | GTE
                        | EQ
                        | NEQ
                        ;

additive_expression ::= additive_expression addop term
                        | term
                        ;

addop               ::= PLUS
                        | MINUS
                        ;

term                ::= term mulop signed_factor
                        | signed_factor
                        ;

mulop               ::= TIMES
                        | DIVIDE
                        ;

signed_factor       ::= MINUS signed_factor
                        | factor
                        ;

factor              ::= LPAREN expression RPAREN
                        | var
                        | call
                        | NUM
                        | TRUE
                        | FALSE;

call                ::= ID LPAREN args RPAREN
                        ;

args                ::= arg_list 
                        |
                        ;

arg_list            ::= arg_list COMMA expression
                        | expression
                        ;


