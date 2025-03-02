package Ast;

public class DecList extends ListAst {

  public DecList(Dec head, DecList tail) {
    this.head = head;
    this.tail = tail;
  }

  @Override
  public String toString() {
    return "DecList:";
  }
}
