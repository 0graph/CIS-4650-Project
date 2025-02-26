package Ast;

/*
    NilExp type
    Note: Only certain components may be filled with NilExp objects. 
    Refer to Lec. 6 Syntax Trees for more info or the component itself.
*/

public class NilExp extends Exp {
    public NilExp(int pos) {
        this.pos = pos;
    }

    public void accept( AbsynVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}