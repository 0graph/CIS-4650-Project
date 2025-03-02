import Ast.*;

public class DisplayTree implements AstVisitor {
  final static int SPACES = 4;

  private void indent(int level) {
    for (int i = 0; i < level * SPACES; i++)
      System.out.print(" ");
  }

  @Override
  public void visit(VarExp exp, int level) {
    indent(level);

    System.out.println("Var Exp: " + exp.name);
  }
}
