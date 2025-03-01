/*
    For testing if the CUP parser is functioning as expected
*/
   
import java.io.*;
import java_cup.runtime.*;
import Ast.*;


class ShowTreeVisitor implements AstVisitor {

  final static int SPACES = 4;

  private void indent( int level ) {
    for( int i = 0; i < level * SPACES; i++ ) System.out.print( " " );
  }

  public void visit(ArrayDec exp, int level) {
    indent( level );
  }

  public void visit(AssignExp exp, int level) {
    indent( level );
  }

  public void visit(BoolExp exp, int level) {
    indent( level );
  }

  public void visit(CallExp exp, int level) {
    indent( level );
  }

  public void visit(CompoundExp exp, int level) {
    indent( level );
  }

  public void visit(DecList exp, int level) {
    while(exp != null) {
      exp.head.accept(this, level);
      exp = exp.tail;
    }
  }

  public void visit(ExpList exp, int level) {
    indent( level );
  }

  public void visit(FunctionDec exp, int level) {
    indent( level );
  }

  public void visit(IfExp exp, int level) {
    indent( level );
  }

  public void visit(IndexVar exp, int level) {
    indent( level );
  }

  public void visit(IntExp exp, int level) {
    indent( level );
  }

  public void visit(NameTy exp, int level) {
    indent( level );
    System.out.print("NameTy:");
    switch(exp.typ) {
      case NameTy.INT:
        System.out.println(" INT ");
        break;
      case NameTy.BOOL:
        System.out.println(" BOOL ");
        break;
      case NameTy.VOID:
        System.out.println(" VOID ");
        break;
      default:
        System.out.println("Unrecognized operator at line " + exp.row + " and column" + exp.col);
    }
    level++;
  }

  public void visit(NilExp exp, int level) {
    indent( level );
  }

  public void visit(OpExp exp, int level) {
    indent( level );
  }

  public void visit(ReturnExp exp, int level) {
    indent( level );
  }

  public void visit(SimpleDec exp, int level) {
    indent( level );
    System.out.println("SimpleDec:" + exp.name);
    level++;
    exp.typ.accept(this, level);

  }

  public void visit(SimpleVar exp, int level) {
    indent( level );
  }

  public void visit(VarDecList exp, int level) {
    indent( level );
  }

  public void visit(VarExp exp, int level) {
    indent( level );
  }

  public void visit(WhileExp exp, int level) {
    indent( level );
  }
}

   
public class ParserMain {
  public final static boolean SHOW_TREE = true;
  static public void main(String argv[]) {    
    /* Start the parser */
    try {
      Parser p = new Parser(new Lexer(new FileReader(argv[0])));
      DecList result = (DecList)p.parse().value;
      System.out.println("Parsing completed successfully!");
      System.out.println("Abstract Syntax Tree: ");
      AstVisitor visitor = new ShowTreeVisitor();
      result.accept(visitor, 0);
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }
}
