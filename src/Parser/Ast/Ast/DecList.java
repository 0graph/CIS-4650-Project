package Ast;

public class DecList extends Ast {
  public Dec head;
  public DecList tail;

  public DecList(Dec head, DecList tail) {
    this.head = head;
    this.tail = tail;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public void visit(AstVisitor visitor, int level) {
    DecList node = this;

    while (node != null) {
      node.head.accept(visitor, level);
      node = node.tail;
    }
  }
}
