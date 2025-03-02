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

    System.out.println(dec);

    level++;

    dec.type.accept(this, level);
    dec.params.accept(this, level);
    dec.body.accept(this, level);
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
    indent(level);

    System.out.println(list);

    level++;
    list.visit(this, level);
  }

  public void visit(CompoundExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;

    exp.decs.accept(this, level);
    // exp.exps.accept(this, level);
  }

  public void visit(NilExp exp, int level) {
    indent(level);

    System.out.println(exp);
  }

  public void visit(CallExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;

    exp.args.accept(this, level);
  }

  public void visit(AssignExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;

    exp.lhs.accept(this, level);
    exp.rhs.accept(this, level);
  }

  public void visit(VarExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;
    exp.variable.accept(this, level);
  }

  public void visit(SimpleVar var, int level) {
    indent(level);

    System.out.println(var);

    level++;
  }

  public void visit(IntExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;
  }

  public void visit(BoolExp exp, int level) {
    indent(level);

    System.out.println(exp);

    level++;
  }

  public void visit(IndexVar var, int level) {
    indent(level);

    System.out.println(var);

    level++;

    var.index.accept(this, level);
  }

  public void visit(OpExp exp, int level) {
    indent(level);
    
    System.out.println(exp);

    level++;
  }

  public void visit(IndexVar var, int level) {
    indent(level);
    
    System.out.println(var);

    level++;
    var.index.accept(this, level);
  }

  public void visit(ReturnExp exp, int level) {
    indent(level);
    
    System.out.println(exp);

    level++;
    exp.exp.accept(this, level);
  }
}
