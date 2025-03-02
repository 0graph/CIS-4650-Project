import Ast.*;
import java_cup.runtime.Symbol;

/* Parser code to change the way the parser reports errors (include
   line and column number of the error). */
parser code {:
    
    /* Change the method report_error so it will display the line and
       column of where the error occurred in the input as well as the
       reason for the error which is passed into the method in the
       String 'message'. */
    public void report_error(String message, Object info) {
   
        /* Create a StringBuffer called 'm' with the string 'Error' in it. */
        StringBuffer m = new StringBuffer("Error");
   
        /* Check if the information passed to the method is the same
           type as the type java_cup.runtime.Symbol. */
        if (info instanceof java_cup.runtime.Symbol) {
            /* Declare a java_cup.runtime.Symbol object 's' with the
               information in the object info that is being typecasted
               as a java_cup.runtime.Symbol object. */
            java_cup.runtime.Symbol s = ((java_cup.runtime.Symbol) info);
   
            /* Check if the line number in the input is greater or
               equal to zero. */
            if (s.left >= 0) {                
                /* Add to the end of the StringBuffer error message
                   the line number of the error in the input. */
                m.append(" in line "+(s.left+1));   
                /* Check if the column number in the input is greater
                   or equal to zero. */
                if (s.right >= 0)                    
                    /* Add to the end of the StringBuffer error message
                       the column number of the error in the input. */
                    m.append(", column "+(s.right+1));
            }
        }
   
        /* Add to the end of the StringBuffer error message created in
           this method the message that was passed into this method. */
        m.append(" : "+message);
   
        /* Print the contents of the StringBuffer 'm', which contains
           an error message, out on a line. */
        System.err.println(m);
    }
   
    /* Change the method report_fatal_error so when it reports a fatal
       error it will display the line and column number of where the
       fatal error occurred in the input as well as the reason for the
       fatal error which is passed into the method in the object
       'message' and then exit.*/
    public void report_fatal_error(String message, Object info) {
        report_error(message, info);
        System.exit(1);
    }

:};

/* Declare Terminals and Non-Terminals */
terminal BOOL, IF, ELSE, INT, RETURN, VOID, WHILE, TRUE, FALSE;
terminal PLUS, MINUS, TIMES, DIVIDE, LT, GT, LTE, GTE, ASSIGN, LPAREN, RPAREN, SEMI, LBRACKET, RBRACKET, LCURLY, RCURLY, COMMA;
terminal NOT, AND, OR, EQ, NEQ;
terminal String ID, NUM;
terminal ERROR;

non terminal ListAst program, declaration_list, params, args, arg_list, statement_list;
non terminal return_stmt, abool_expression, ubool_expression, simple_expression, relop, additive_expression, addop, term, mulop, signed_factor, factor;

non terminal Dec declaration, var_declaration, local_declarations, fun_declaration;
non terminal VarType type_specifier;
non terminal fun_prototype, param_list, param;
non terminal Exp compound_stmt, call, expression, var, obool_expression, statement;
non terminal iteration_stmt, selection_stmt, expression_stmt;


/* Grammer Section */
start with program; 

program ::= declaration_list:d
            {: RESULT = d; :}
            ;

declaration_list ::= declaration_list:dl declaration:d1
                    {: 
                      ListAst d = dl;

                      while(d.tail != null){
                        d = d.tail;
                      }

                      d.tail = new DecList(d1, null);
                      RESULT = dl;
                    :}
                    | declaration:d
                    {: RESULT = new DecList(d, null); :}
                    ;

declaration ::= var_declaration:d
                {: RESULT = d; :}
                | fun_declaration:f
                {: RESULT = f; :}
                | fun_prototype;

var_declaration ::= type_specifier:t ID:id SEMI 
                    {: RESULT = new  SimpleDec(tleft, tright, t, id); :}
                    | type_specifier:t ID:id LBRACKET NUM:n RBRACKET SEMI
                    {: RESULT = new ArrayDec(tleft, tright, t, id, n); :}
                    ;

type_specifier ::= BOOL:b
                   {: RESULT = new VarType(bleft, bright, VarType.BOOL); :}
                   | INT:i
                   {: RESULT = new VarType(ileft, iright, VarType.INT); :}
                   | VOID:v
                   {: RESULT = new VarType(vleft, vright, VarType.VOID); :}
                   ;

fun_declaration ::= type_specifier:t ID:id LPAREN params:p RPAREN compound_stmt:c
                    {: RESULT = new FunctionDec(tleft, tright, t, id, (VarDecList) p, c); :}
                    ;

fun_prototype ::= type_specifier ID LPAREN params RPAREN SEMI;

params ::= param_list 
          | VOID
          {: RESULT = new VarDecList(null, null);  :}
          ;

param_list ::= param_list COMMA param | param;

param ::= type_specifier ID | type_specifier ID LBRACKET RBRACKET;

compound_stmt ::= LCURLY local_declarations:d statement_list:s RCURLY;

local_declarations ::= local_declarations var_declaration | ;

statement_list ::= statement_list statement | ;

statement ::= expression_stmt | compound_stmt | selection_stmt | iteration_stmt | return_stmt;

expression_stmt ::= expression SEMI | SEMI;

selection_stmt ::= IF LPAREN expression RPAREN statement | IF LPAREN expression RPAREN statement ELSE statement;

iteration_stmt ::= WHILE LPAREN expression RPAREN statement;


/* 18-34 */

return_stmt         ::= RETURN expression SEMI
                        | RETURN SEMI
                        ;

expression          ::= var ASSIGN expression
                        | obool_expression
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

call                ::= ID:i LPAREN args:a RPAREN
                        {:
                           RESULT = new CallExp(ileft,iright,i,(ExpList) a);
                        :}
                        ;

args                ::= arg_list:a
                     {:
                        RESULT = (ExpList) a;
                     :}
                     |
                     {:
                        RESULT = new ExpList(null, null);
                     :}
                     ;

arg_list            ::= arg_list:a COMMA expression:e
                        {:
                           ListAst t = a;
                           while(t.tail != null)
                              t = t.tail;
                           t.tail = new ExpList(e,null);
                           RESULT = a;
                        :}
                        | expression:e
                        {:
                           RESULT = new ExpList(e, null);
                        :}
                        ;