package Ast;

/*
    IntExp type
*/

public class IntExp extends Exp {
  public int value;

  public IntExp(int row, int col, String value) {
    this.row = row;
    this.col = col;
    this.value = Integer.parseInt(value);
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("IntExp: %s", this.value);

    return result;
  }
}
