package Ast;

public class CompoundExp extends Exp {
  public VarDecList decs;
  public ExpList exps;

  public CompoundExp(int row, int column, VarDecList decs, ExpList exps) {
    this.decs = decs;
    this.exps = exps;
  }

  public void accept(AstVisitor visitor, int level) {
    visitor.visit(this.decs, level);
  }

  public String toString() {
    String result = String.format("CompoundExp:");

    return result;
  }
}
