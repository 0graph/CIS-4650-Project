package Ast;

/**
 * Visitor model for moving through a syntax tree, checking changes
 */
public interface AstVisitor {

  // Declaration List:
  public void visit(DecList decList, int level);

  // Variable: int x;
  public void visit(SimpleDec dec, int level);

  public void visit(VarType type, int level);
}
