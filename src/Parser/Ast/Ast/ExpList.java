package Ast;

public class ExpList extends ListAst {
  public ExpList(Exp head, ExpList tail) {
    this.head = head;
    this.tail = tail;
  }

  public String toString() {
    return "ExpList:";
  }
}
