package Ast;

/*
    NilExp type
    Note: Only certain components may be filled with NilExp objects. 
    Refer to Lec. 6 Syntax Trees for more info or the component itself.
*/

public class NilExp extends Exp {
    public NilExp(int row, int col) {
        this.row = row;
        this.col = col;
    }

    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}