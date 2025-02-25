import absyn.*;
import java_cup.runtime.Symbol;

/* Declare Terminals and Non-Terminals */
terminal BOOL, IF, ELSE, INT, RETURN, VOID, WHILE, TRUE, FALSE;
terminal PLUS, MINUS, TIMES, DIVIDE, LT, GT, LTE, GTE, ASSIGN, LPAREN, RPAREN, SEMI, LBRACKET, RBRACKET, LCURLY, RCURLY, COMMA;
terminal NOT, AND, OR, EQ, NEQ;
terminal String ID, NUM;
terminal ERROR;

non terminal program;

non terminal declaration_list, declaration, var_declaration, local_declarations, fun_declaration;
non terminal type_specifier;
non terminal fun_prototype, params, param_list, param;
non terminal compound_stmt, iteration_stmt, selection_stmt, expression_stmt, return_stmt, statement, statement_list;

/* Grammer Section */
start with program;

program ::= declaration_list;

declaration_list ::= declaration_list declaration | declaration;

declaration ::= var_declaration | fun_declaration | fun_prototype;

var_declaration ::= type_specifier ID | type_specifier ID LBRACKET NUM RBRACKET;

type_specifier ::= BOOL | INT | VOID;

fun_declaration ::= type_specifier ID LPAREN params RPAREN compound_stmt;

fun_prototype ::= type_specifier ID LPAREN params RPAREN ;

params ::= param_list | VOID;

param_list ::= param_list COMMA param | param

param ::= type_specifier ID | type_specifier ID LBRACKET RBRACKET;

compound_stmt ::= LCURLY local_declarations statement_list RCURLY;

local_declarations ::= local_declarations var_declaration | ;

statement_list ::= statement_list statement | ;

statement ::= expression_stmt | compound_stmt | selection_stmt | iteration_stmt | return_stmt;

expression_stmt ::= expression SEMI | ;

selection_stmt ::= IF LPAREN expression RPAREN statement | IF LPAREN expression RPAREN statement ELSE statement;

iteration_stmt ::= WHILE LPAREN expression RPAREN statement;

