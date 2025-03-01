
package Ast;

public class VarExp extends Exp {
  public Var variable;

  public VarExp( int row, int col, Var variable ) {
    this.row = row;
    this.col = col;
    this.name = name;
  }

  public void accept( AstVisitor visitor, int level ) {
    visitor.visit( this, level );
  }
}
