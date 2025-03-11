package Symbol;
import Ast.*;
//import Symbol.NodeType;
import java.util.*;

public class SemanticAnalyser implements AstVisitor {
    final static int SPACES = 4;
    public static boolean error = false;
    //HashMap<String, ArrayList<NodeType>> table;

    public SemanticAnalyser() {
        //this.table = new HashMap<String, ArrayList<NodeType>>();

    }

    private void indent(int level) {
        for (int i = 0; i < level * SPACES; i++)
        System.out.print(" ");
    }


    public boolean TypeEqual(VarType ty1, VarType ty2) {
        return ty1.type == ty2.type;
    }

    // add visitor methods here in postorder traversal
    // use level to detect scope

    public void visit(ListAst list, int level) {
        indent(level);

        if(level == 0) {
            System.out.println("Entering the global scope.");
        }


        list.visit(this, level+1);


        if(level == 0) {
            System.out.println("Exiting the global scope.");
        }
    }

    public void visit(FunctionDec dec, int level) {
        indent(level);
        System.out.println("Entering the scope for function " + dec.name);


        System.out.println("Exiting the scope for function " + dec.name);
    }

    public void visit(SimpleDec dec, int level) {

    }

    public void visit(ArrayDec dec, int level) {

    }

    public void visit(VarType type, int level) {

    }

    public void visit(NilExp exp, int level){
    
    }

    public void visit(CallExp exp, int level){
        
    }

    public void visit(AssignExp exp, int level){
        
    }

    public void visit(VarExp exp, int level){
        
    }

    public void visit(SimpleVar var, int level){
        
    }

    public void visit(CompoundExp exp, int level){
        
    }

    public void visit(IntExp exp, int level){
        
    }

    public void visit(BoolExp exp, int level){
        
    }

    public void visit(IndexVar var, int level){
        
    }

    public void visit(ReturnExp exp, int level){
        
    }

    public void visit(OpExp exp, int level){
        
    }

    public void visit(IfExp exp, int level){
        
    }

    public void visit(WhileExp exp, int level){

    }
}