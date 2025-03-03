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
terminal NOT, AND, OR, EQ, NEQ, UMINUS;
terminal String ID, NUM;
terminal ERROR;

non terminal ListAst program, declaration_list, local_declarations, params, statement_list, args, arg_list, param_list;
non terminal addop, mulop, relop;

non terminal Dec declaration, var_declaration, fun_declaration, param;
non terminal VarType type_specifier;
non terminal fun_prototype;
non terminal Exp compound_stmt, statement, expression_stmt, call, expression, var, obool_expression, factor, term, signed_factor, additive_expression, abool_expression, ubool_expression, simple_expression, return_stmt, selection_stmt;
non terminal iteration_stmt;

precedence right ASSIGN;
precedence left OR;
precedence left AND;
precedence left EQ, NEQ;
precedence left LT, GT, LTE, GTE;
precedence left PLUS, MINUS;
precedence left TIMES, DIVIDE;
precedence right UMINUS, NOT;


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

fun_declaration   ::= type_specifier:t ID:id LPAREN params:p RPAREN compound_stmt:c
                     {: RESULT = new FunctionDec(tleft, tright, t, id, (VarDecList) p, c); :}
                     ;

fun_prototype     ::= type_specifier:t ID:i LPAREN params:p RPAREN SEMI
                      {: RESULT = p;  :}
                      ;

params ::= param_list:l
          {: RESULT = l; :}
          | VOID
          {: RESULT = new VarDecList(null, null); :}
          ;

param_list ::= param_list:l COMMA param:p
              {: 
                  ListAst t = l;
                  while(t.tail != null)
                    t = t.tail;

                  t.tail = new VarDecList((VarDec) p, null);
                  RESULT = l;
              :}
              | param:p
              {: RESULT = new VarDecList((VarDec) p, null); :}
              ;

param ::= type_specifier:t ID:id
          {: RESULT = new SimpleDec(tleft, tright, t, id); :}
          | type_specifier:t ID:id LBRACKET RBRACKET
          {: RESULT = new ArrayDec(tleft, tright, t, id, "0"); :}
          ;

compound_stmt ::= LCURLY local_declarations:d statement_list:s RCURLY
                  {: RESULT = new CompoundExp(dleft, dright, (VarDecList) d, (ExpList) s); :}
                  ;

local_declarations ::= local_declarations:l var_declaration:v
                       {: RESULT = new VarDecList((VarDec) v, (VarDecList) l); :}
                       |
                       ;

statement_list ::= statement_list:l statement:s
                   {: RESULT = new ExpList(s, (ExpList) l); :}
                   | ;

statement ::= expression_stmt:e
              {: RESULT = e; :}
              | compound_stmt:c
              {: RESULT = c; :}
              | selection_stmt:s
              {: RESULT = s; :}
              | iteration_stmt | return_stmt;

expression_stmt ::= expression:e SEMI 
                    {: RESULT = e; :}
                    | SEMI:s
                    {: RESULT = new NilExp(sleft, sright); :}
                    ;

selection_stmt ::= IF LPAREN expression:e RPAREN statement:s
               {: RESULT = new IfExp(eleft, eright, e, s, new NilExp(sleft, sright)); :}
               | IF LPAREN expression:e RPAREN statement:s ELSE statement:_e
               {: RESULT = new IfExp(eleft, eright, e, s, _e); :}
               ;

iteration_stmt ::= WHILE LPAREN expression RPAREN statement;


/* 18-34 */

return_stmt         ::= RETURN expression:e SEMI
                        {: RESULT = new ReturnExp(eleft, eright, e); :}
                        | RETURN:r SEMI
                        {: RESULT = new ReturnExp(rleft, rright, new NilExp(rleft, rright)); :}
                        ;

expression          ::= var:v ASSIGN expression:e
                        {: RESULT = new AssignExp(vleft, vright, (VarExp)v, e); :}
                        | obool_expression:o
                        {: RESULT = o; :}
                        ;

var                 ::= ID:i 
                        {: RESULT = new VarExp(ileft, iright, new SimpleVar(ileft, iright, i)); :}
                        | ID:i LBRACKET expression:e RBRACKET
                        {: RESULT = new VarExp(ileft, iright, new IndexVar(ileft, iright, i, e)); :}
                        ;

obool_expression    ::= obool_expression:o1 OR abool_expression:o2
                        {: RESULT = new OpExp(o1left, o1right, o1, OpExp.OR, o2); :}
                        | abool_expression:a
                        {: RESULT = a; :}
                        ;

abool_expression    ::= abool_expression:a1 AND ubool_expression:a2
                        {: RESULT = new OpExp(a1left, a1right, a1, OpExp.AND, a2); :}
                        | ubool_expression:u
                        {: RESULT = u; :}
                        ;

ubool_expression    ::= NOT ubool_expression:u
                        {: RESULT = new OpExp(uleft, uright, new NilExp(uleft, uright), OpExp.NOT, u); :}
                        %prec NOT
                        | simple_expression:s
                        {: RESULT = s; :}
                        ;

simple_expression   ::= additive_expression:a1 relop:r additive_expression:a2
                        {: RESULT = new OpExp(a1left, a1right, a1, (int)r, a2); :}
                        | additive_expression:a1
                        {: RESULT = a1; :}
                        ;

relop                ::= LTE
                        {: RESULT = OpExp.LE; :}
                        | LT
                        {: RESULT = OpExp.LT; :}
                        | GT
                        {: RESULT = OpExp.GT; :}
                        | GTE
                        {: RESULT = OpExp.GE; :}
                        | EQ
                        {: RESULT = OpExp.EQ; :}
                        | NEQ
                        {: RESULT = OpExp.NE; :}
                        ;


additive_expression ::= additive_expression:e addop:a term:t
                        {: RESULT = new OpExp(eleft, eright, e, (int)a, t); :}
                        | term:t
                        {: RESULT = t; :}
                        ;

addop               ::= PLUS
                        {: RESULT = OpExp.PLUS; :}
                        | MINUS
                        {: RESULT = OpExp.MINUS; :}
                        ;

term                ::= term:t mulop:m signed_factor:f
                        {: RESULT = new OpExp(tleft, tright, t, (int)m, f); :}
                        | signed_factor:f
                        {: RESULT = f; :}
                        ;

mulop               ::= TIMES
                        {: RESULT = OpExp.MUL; :}
                        | DIVIDE
                        {: RESULT = OpExp.DIV; :}
                        ;

signed_factor       ::= MINUS:m signed_factor:f
                        {: RESULT = new OpExp(mleft,mright, new NilExp(fleft, fright), OpExp.UMINUS, f); :}
                        %prec UMINUS
                        | factor:f
                        {: RESULT = f; :}
                        ;

factor              ::= LPAREN expression:e RPAREN
                        {: RESULT = e; :}
                        | var:v
                        {: RESULT = v; :}
                        | call:c
                        {: RESULT = c; :}
                        | NUM:n
                        {: RESULT = new IntExp(nleft, nright, n); :}
                        | TRUE:t
                        {: RESULT = new BoolExp(tleft, tright, true); :}
                        | FALSE:f 
                        {: RESULT = new BoolExp(fleft, fright, false); :}
                        ;

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
