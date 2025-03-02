package Ast;

public class VarType extends Ast {
  public final static int BOOL = 0;
  public final static int INT = 1;
  public final static int VOID = 2;

  public int type;

  public VarType(int row, int col, int type) {
    this.row = row;
    this.col = col;
    this.type = type;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this, level);
  }

  public String toString() {
    String typeName = "";

    switch (this.type) {
      case 0: // BOOL
        typeName = "BOOL";
        break;

      case 1:
        typeName = "INT";
        break;

      default:
        typeName = "VOID";
        break;

    }

    String result = String.format("TYPE(%s)", typeName);

    return result;
  }
}
