package Ast;

public class VarDec extends Dec {
  // Name of the variable expression
  public String name;

  public VarDec(int row, int col, String name) {
    this.row = row;
    this.col = col;
    this.name = name;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("VarDec(%s)", name);

    return result;
  }
}
