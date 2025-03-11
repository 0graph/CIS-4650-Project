package Ast;

public class SimpleDec extends VarDec {
  public VarType type;
  public String name;

  public SimpleDec(int row, int column, VarType type, String name) {
    this.type = type;
    this.name = name;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("SimpleDec: %s", this.name);

    return result;
  }
  

}
