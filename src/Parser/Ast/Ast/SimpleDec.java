package Ast;

/*
    SimpleDec type
*/

public class SimpleDec extends Dec {
    public String name;
    public NameTy typ;
    
    public SimpleDec(int pos, NameTy typ, String name) {
        this.pos = pos;
        this.name = name;
        this.typ = typ;
    }

    public void accept( AbsynVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}