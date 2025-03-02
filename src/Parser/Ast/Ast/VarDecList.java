package Ast;

public class VarDecList extends ListAst {
  public VarDec head;
  public VarDecList tail;

  public VarDecList(VarDec head, VarDecList tail) {
    this.head = head;
    this.tail = tail;
  }

  @Override
  public String toString() {
    return "VarDecList:";
  }
}
