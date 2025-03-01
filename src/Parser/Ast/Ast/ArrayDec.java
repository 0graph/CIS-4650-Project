package Ast;

/*
    ArrayDec type
*/

public class ArrayDec extends Dec {
    public String name;
    public NameTy typ;
    public int size;
    
    public ArrayDec(int row, int col, NameTy typ, String name, int size) {
        this.row = row;
        this.col = col;
        this.name = name;
        this.typ = typ;
        this.size = size;
    }

    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}