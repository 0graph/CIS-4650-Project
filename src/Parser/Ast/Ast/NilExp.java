package Ast;

public class NilExp extends Exp {
  public int row;
  public int column;

  public NilExp(int row, int column) {
    this.row = row;
    this.column = column;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    return "Nil";
  }
}
