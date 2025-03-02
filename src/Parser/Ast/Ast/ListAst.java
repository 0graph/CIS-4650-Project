package Ast;

public class ListAst extends Ast {
  public Ast head;
  public ListAst tail;

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  /**
   * Traverse through the list of objects
   */
  public void visit(AstVisitor visitor, int level) {
    ListAst node = this;

    while (node != null) {
      Ast ast = node.head;

      if (ast != null) {
        ast.accept(visitor, level);
      }

      node = node.tail;
    }
  }
}
