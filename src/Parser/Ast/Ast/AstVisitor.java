package Ast;

/**
 * Visitor model for moving through a syntax tree, checking changes
 */
public interface AstVisitor {

  // Variable
  public void visit(VarDec exp, int level);

}
