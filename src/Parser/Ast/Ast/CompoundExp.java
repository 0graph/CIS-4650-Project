package Ast;

/*
    CompoundExp type
*/

public class CompoundExp extends Exp {
    public VarDecList decs;
    public ExpList exps;
    
    public CompoundExp(int row, int col, VarDecList decs, ExpList exps) {
        this.row = row;
        this.col = col;
        this.decs = decs;
        this.exps = exps;
    }


    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}