package Ast;

/*
    IntExp type
*/

public class IntExp extends Exp {
    public int value;
    
    public IntExp(int pos, int value) {
        this.pos = pos;
        this.value = value;
    }

    public void accept( AbsynVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}