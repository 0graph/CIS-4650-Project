package Ast;

public class ArrayDec extends VarDec {
  public int size;

  public ArrayDec(int row, int column, VarType type, String name, String size) {
    this.type = type;
    this.name = name;

    this.size = Integer.parseInt(size);

    this.row = row;
    this.col = column;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String result = String.format("ArrayDec: %s | Size: %s", this.name, this.size);

    return result;
  }
}
