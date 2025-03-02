package Ast;

/*
    BoolExp type
*/

public class BoolExp extends Exp {
    public boolean value;
    
    public BoolExp(int row, int col, boolean value) {
        this.row = row;
        this.col = col;
        this.value = value;
    }


    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }

    public String toString() {
        String result = String.format("BoolExp: %b", this.value);

        return result;
    }
}