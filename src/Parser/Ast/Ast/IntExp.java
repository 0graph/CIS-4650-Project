package Ast;

/*
    IntExp type
*/

public class IntExp extends Exp {
    public int value;
    
    public IntExp(int row, int col, int value) {
        this.row = row;
        this.col = col;
        this.value = value;
    }


    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}