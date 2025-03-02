package Ast;

/**
 * Visitor model for moving through a syntax tree, checking changes
 */
public interface AstVisitor {
  // Declaration List:
  public void visit(ListAst list, int level);

  // Function Declaration
  public void visit(FunctionDec dec, int level);

  // Variable: int x;
  public void visit(SimpleDec dec, int level);

  public void visit(ArrayDec dec, int level);

  public void visit(VarType type, int level);

  public void visit(NilExp exp, int level);

  public void visit(CompoundExp exp, int level);

}
