package Ast;

public class WhileExp extends Exp {
  public Exp test;
  public Exp body;

  public WhileExp(int row, int column, Exp test, Exp body) {
    this.row = row;
    this.col = column;

    this.test = test;
    this.body = body;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("WhileExp:");

    return result;
  }

}
