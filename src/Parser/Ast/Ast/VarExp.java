
package Ast;

public class VarExp extends Exp {
  public Var variable;

  public VarExp(int row, int col, Var variable) {
    this.row = row;
    this.col = col;
    this.variable = variable;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("VarExp:");

    return result;
  }
}
