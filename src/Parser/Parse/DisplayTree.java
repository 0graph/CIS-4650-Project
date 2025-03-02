import Ast.*;

public class DisplayTree implements AstVisitor {
  final static int SPACES = 4;

  private void indent(int level) {
    for (int i = 0; i < level * SPACES; i++)
      System.out.print(" ");
  }

  public void visit(ArrayDec dec, int level) {
    indent(level);

    System.out.println(dec);

    level++;
    dec.type.accept(this, level);
  }

  public void visit(FunctionDec dec, int level) {
    indent(level);

    level++;
    dec.type.accept(this, level);
    dec.params.accept(this, level);
  }

  public void visit(SimpleDec dec, int level) {
    indent(level);

    System.out.println(dec);

    level++;
    dec.type.accept(this, level);
  }

  public void visit(VarType type, int level) {
    indent(level);

    System.out.println(type);
  }

  public void visit(ListAst list, int level) {
    list.visit(this, level);
  }

  public void visit(CompoundExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;

    exp.decs.accept(this, level);
    // exp.exps.accept(this, level);
  }
}
