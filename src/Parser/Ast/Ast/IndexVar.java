package Ast;

public class IndexVar extends Var {
  public Exp index;

  public IndexVar(int row, int col, String name, Exp index) {
    this.row = row;
    this.col = col;
    this.name = name;
    this.index = index;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("IndexVar %s", this.name);

    return result;
  }
}
