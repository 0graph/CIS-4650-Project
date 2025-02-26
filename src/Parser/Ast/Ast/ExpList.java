package Ast;

/*
    Expression List Class
*/

public class ExpList {
    public Exp head;
    public ExpList tail;

    public DecList(Exp head, ExpList tail) {
        this.head = head;
        this.tail = tail;
    }
}