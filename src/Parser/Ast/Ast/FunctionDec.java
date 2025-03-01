package Ast;

/*
    FunctionDec type
*/

public class FunctionDec extends Dec {
    public String name;
    public NameTy result;
    public VarDecList params;
    public Exp body;
    
    public FunctionDec(int row, int col, NameTy result, String name, VarDecList params, Exp body) {
        this.row = row;
        this.col = col;
        this.name = name;
        this.result = result;
        this.params = params;
        this.body = body;
    }

    public void accept( AstVisitor visitor, int level ) {
        visitor.visit( this, level );
    }
}