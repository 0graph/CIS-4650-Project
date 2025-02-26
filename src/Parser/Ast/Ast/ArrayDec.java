package Ast;

/*
    ArrayDec type
*/

public class ArrayDec extends Dec {
    public String name;
    public NameTy typ;
    public int size;
    
    public ArrayDec(int pos, NameTy typ, String name, int size) {
        this.pos = pos;
        this.name = name;
        this.typ = typ;
        this.size = size;
    }

    public void accept( AbsynVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}