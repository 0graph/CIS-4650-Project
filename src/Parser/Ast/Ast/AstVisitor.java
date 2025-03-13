package Ast;

import Ast.IfExp;

/**
 * Visitor model for moving through a syntax tree, checking changes
 */
public interface AstVisitor {
  // Declaration List:
  public default void visit(ListAst list, int level) {
  }

  // Function Declaration
  public default void visit(FunctionDec dec, int level) {
  }

  // Variable: int x;
  public default void visit(SimpleDec dec, int level) {
  }

  public default void visit(ArrayDec dec, int level) {
  }

  public default void visit(VarType type, int level) {
  }

  public default void visit(NilExp exp, int level) {
  }

  public default void visit(CallExp exp, int level) {
  }

  public default void visit(AssignExp exp, int level) {
  }

  public default void visit(VarExp exp, int level) {
  }

  public default void visit(SimpleVar var, int level) {
  }

  public default void visit(CompoundExp exp, int level) {
  }

  public default void visit(IntExp exp, int level) {
  }

  public default void visit(BoolExp exp, int level) {
  }

  public default void visit(IndexVar var, int level) {
  }

  public default void visit(ReturnExp exp, int level) {
  }

  public default void visit(OpExp exp, int level) {
  }

  public default void visit(IfExp exp, int level) {
  }

  public default void visit(WhileExp exp, int level) {
  }
}
