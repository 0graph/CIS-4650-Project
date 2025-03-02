package Ast;

public class VarDecList extends ListAst {
  public VarDecList(VarDec head, VarDecList tail) {
    this.head = head;
    this.tail = tail;
  }

  @Override
  public String toString() {
    return "VarDecList:";
  }
}
