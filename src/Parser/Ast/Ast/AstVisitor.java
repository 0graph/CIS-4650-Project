package Ast;

import Ast.IfExp;

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

  public void visit(CallExp exp, int level);

  public void visit(AssignExp exp, int level);

  public void visit(VarExp exp, int level);

  public void visit(SimpleVar var, int level);

  public void visit(CompoundExp exp, int level);

  public void visit(IntExp exp, int level);

  public void visit(BoolExp exp, int level);

  public void visit(IndexVar var, int level);

  public void visit(ReturnExp exp, int level);

  public void visit(OpExp exp, int level);

  public void visit(IfExp exp, int level);
}
