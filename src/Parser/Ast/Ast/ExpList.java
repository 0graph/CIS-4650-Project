package Ast;

/*
    Expression List Class
*/

public class ExpList {
    public Exp head;
    public ExpList tail;

    public ExpList(Exp head, ExpList tail) {
        this.head = head;
        this.tail = tail;
    }

    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}