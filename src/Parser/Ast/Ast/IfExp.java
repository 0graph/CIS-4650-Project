package Ast;

/*
    IfExp type
*/

public class IfExp extends Exp {
    public Exp test;
    public Exp then;
    public Exp _else;
    
    // Note: else may be filled with NilExp object
    public IfExp(int row, int col, Exp test, Exp then, Exp _else) {
        this.row = row;
        this.col = col;
        this.test = test;
        this.then = then;
        this._else = _else;
    }


    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}