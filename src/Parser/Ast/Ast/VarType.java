package Ast;

public class VarType extends Ast {
  public final static int BOOL = Type.BOOLEAN.ordinal();
  public final static int INT = Type.INT.ordinal();
  public final static int VOID = Type.VOID.ordinal();

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
      case 0:
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

  /**
   * Return the type value assigned as a value from the enum
   */
  public Type getTypeValue() {
    if (type == BOOL) {
      return Type.BOOLEAN;
    } else if (type == INT) {
      return Type.INT;
    } else {
      return Type.VOID;
    }
  }
}
