package Ast;

/*
    CompoundExp type
*/

public class CompoundExp extends Exp {
    public VarListDec decs;
    public ExpList exps;
    
    public CompoundExp(int pos, VarListDec decs, ExpList exps) {
        this.pos = pos;
        this.decs = decs;
        this.exps = exps;
    }

    public void accept( AbsynVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}