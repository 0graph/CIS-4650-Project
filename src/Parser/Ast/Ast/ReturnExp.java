package Ast;

/*
    ReturnExp type
*/

public class ReturnExp extends Exp {
  public Exp exp;

  // Note: exp may be filled with NilExp object
  public ReturnExp(int row, int col, Exp exp) {
    this.row = row;
    this.col = col;
    this.exp = exp;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("ReturnExp:");

    return result;
  }
}
