package Ast;

/*
    Declaration List Class
*/

public class DecList {
    public Dec head;
    public DecList tail;

    public DecList(Dec head, DecList tail) {
        this.head = head;
        this.tail = tail;
    }

    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}