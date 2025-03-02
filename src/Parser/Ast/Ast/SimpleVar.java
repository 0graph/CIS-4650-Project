package Ast;

/*
    SimpleVar type
*/

public class SimpleVar extends Var {
    public String name;
    
    public SimpleVar(int row, int col, String name) {
        this.row = row;
        this.col = col;
        this.name = name;
    }


    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }

    public String toString() {
        String result = String.format("SimpleVar %s:", this.name);

        return result;
    }
}