package Ast;

/**
 * Visitor model for moving through a syntax tree, checking changes
 */
public interface AstVisitor {

  public void visit(Object exp, int level);

}
