package Ast;

public class FunctionDec extends Dec {
  public String name;
  public VarDecList params;
  public Exp body;

  public FunctionDec(int row, int column, VarType type, String name, VarDecList params, Exp body) {
    this.row = row;
    this.col = column;
    this.type = type;
    this.name = name;
    this.body = body;
    this.params = params;
    this.body = body;
  }

  public FunctionDec(int row, int column, VarType type, String name, VarDecList params, NilExp body) {
    this.row = row;
    this.col = column;
    this.type = type;
    this.name = name;
    this.params = params;
    this.body = body;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("FunctionDec: %s", this.name);

    return result;
  }
}
