package Ast;

public class ExpList extends ListAst {
  public ExpList(Exp head, ExpList tail) {
    this.head = head;
    this.tail = tail;
  }
}
