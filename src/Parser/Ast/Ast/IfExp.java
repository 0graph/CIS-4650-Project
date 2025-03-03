package Ast;

public class IfExp extends Exp {
  public Exp test;
  public Exp then;

  public Exp _else;

  public IfExp(int row, int column, Exp test, Exp then, Exp _else) {
    this.test = test;
    this.then = then;
    this._else = _else;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("IfExp:");

    return result;
  }
}
