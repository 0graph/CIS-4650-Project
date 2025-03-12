import Ast.*;
//import Symbol.NodeType;
import java.util.*;

// NOTES:
// when visiting expressions, set it's Dec to the evaluated type based
// on the LHS and RHS of the expression, if incompatible set to false

// 

public class SemanticAnalyser implements AstVisitor {
    final static int SPACES = 4;
    public static boolean error = false;
    HashMap<String, ArrayList<NodeType>> table;

    public SemanticAnalyser() {
        this.table = new HashMap<String, ArrayList<NodeType>>();

    }

    // for printing scopes
    private void indent(int level) {
        for (int i = 0; i < level * SPACES; i++)
        System.out.print(" ");
    }

    // check if node is in hash map and
    // check if node in hash map is from same or deeper scope before deleting
    private boolean node_delete(NodeType node) {

    }

    // insert node to hash map
    private void node_insert(NodeType node) {

    }

    // check if node is in hashmap and depth is not greater then the node to look for
    // otherwise return null
    private Optional<NodeType> node_lookup(NodeType node) {

    }


    public boolean TypeEqual(VarType ty1, VarType ty2) {
        return ty1.type == ty2.type;
    }

    // add visitor methods here in postorder traversal
    // use level to detect scope

    public void visit(ListAst list, int level) {
        if(level == 0) {
            indent(level);
            System.out.println("Entering the global scope.");
        }

        list.visit(this, level+1);

        if(level == 0) {
            indent(level);
            System.out.println("Exiting the global scope.");
        }
    }

    public void visit(FunctionDec dec, int level) {
        indent(level);
        System.out.println("Entering the scope for function " + dec.name);

        dec.type.accept(this, level); // function type (same level as function)
        dec.params.accept(this, level+1); // function parameter types (same level as function scope)
        if (dec.body instanceof NilExp) {
            // this is a function prototype, we store it so later we can check if the function declaration matches
        } else {
            dec.body.accept(this, level+1); // function expression (same level as function scope)
        }

        indent(level);
        System.out.println("Exiting the scope for function " + dec.name);
    }

    public void visit(SimpleDec dec, int level) {
        // add to hashmap at level
    }

    public void visit(ArrayDec dec, int level) {
        // add to hashmap at level
    }

    public void visit(VarType type, int level) {
        // dont think we need to implement anything here, type should be accesed at the declaration itself
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
        indent(level);
        System.out.println("Entering a new block");

        indent(level);
        System.out.println("Exiting the block");
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