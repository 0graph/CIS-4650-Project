package Ast;

/*
    OpExp type
*/

public class OpExp extends Exp {
    // constants for Op field
    public final static int PLUS = 0;
    public final static int MINUS = 1;
    public final static int UMINUS = 2;
    public final static int MUL = 3;
    public final static int DIV = 4;
    public final static int EQ = 5;
    public final static int NE = 6;
    public final static int LT = 7;
    public final static int LE = 8;
    public final static int GT = 9;
    public final static int GE = 10;
    public final static int NOT = 11;
    public final static int AND = 12;
    public final static int OR = 13;
    
    public Exp lhs;
    public int Op;
    public Exp rhs;
    
    // Note: lhs may be filled with NilExp
    public OpExp(int row, int col, Exp lhs, int Op, Exp rhs) {
        this.row = row;
        this.col = col;
        this.lhs = lhs;
        this.Op = Op;
        this.rhs = rhs;
    }

    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}