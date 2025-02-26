package Ast;

/*
    ReturnExp type
*/

public class ReturnExp extends Exp {
    public Exp exp;
    
    // Note: exp may be filled with NilExp object
    public ReturnExp(int pos, Exp exp) {
        this.pos = pos;
        this.exp = exp;
    }

    public void accept( AbsynVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}