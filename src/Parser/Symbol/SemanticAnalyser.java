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
        ArrayList<NodeType> nodeList = this.table.get(node.name);
        if(nodeList == null) { // nothing to delete
            return false;
        }
        
        // node from less deep scope -> dont delete
        if(nodeList.get(0).level < node.level) {
            System.out.println("Warning: trying to delete node from less deep scope");
            return false;
        }

        nodeList.remove(0);

        // delete key if array is empty;
        if(nodeList.isEmpty()) {
            this.table.remove(node.name);
        } else if (nodeList.get(0).level >= node.level) {
            System.out.println("Warning: after deleting there are still nodes with >= scope in map");
        }

        return true;
    }

    // insert node to hash map
    // return false if issue
    private boolean node_insert(NodeType node) {
        ArrayList<NodeType> nodeList = this.table.get(node.name);
        if(nodeList == null) { // insert new ArrayList
            nodeList = new ArrayList<NodeType>();
            nodeList.add(node);
            this.table.put(node.name, nodeList);
        } else { // add to front of list
            // for now if node already exists at same level just ignore the new one
            if(nodeList.get(0).level == node.level) {
                System.out.println("Warning: Node already exists at same scope");
                return false;
            }
            nodeList.add(0, node);
        }
        return true;
    }

    // print variables and types before deleting them and exiting scope
    private void print_scope(int level) {
        // for each variable
        for(ArrayList<NodeType> list : this.table.values()) {

            if(list == null || list.isEmpty()) {
                System.out.println("Error: HashMap contains key with empty value");
                continue;
            }

            if(list.get(0).level > level) {
                System.out.println("Warning: Found node from greater level still in list");
                continue;
            }

            // print node and then delete it
            if(list.get(0).level == level) {
                indent(level+1);
                System.out.println(list.get(0).def);
                this.node_delete(list.get(0));
            }
        }
    }

    // check if node is in hashmap and depth is not greater then the node to look for
    // otherwise return null
    private NodeType node_lookup(NodeType node) {
        ArrayList<NodeType> nodeList = this.table.get(node.name);

        // node not found
        if(nodeList == null) {
            return null;
        }

        // I think this shouldent happen
        if(nodeList.get(0).level > node.level) {
            System.out.println("Warning: during lookup encountered top node with higher level");
            return null;
        }

        // return the top node (should be most recent scope)
        return nodeList.get(0);
    }

    // used for expression and variable type compatibility checking
    // check type
    // check if array index being accessed is valid
    // etc.
    private boolean isCompatible(Dec lhs, Dec rhs) {
        // use instanceof to convert lhs and rhs to ArrayDec/SimpleDec
        return true;
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
            this.print_scope(level);
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

        this.print_scope(level);

        indent(level);
        System.out.println("Exiting the scope for function " + dec.name);
    }

    public void visit(SimpleDec dec, int level) {
        // add to hashmap at level
        NodeType newNode = new NodeType(dec.name,dec,level);
        this.node_insert(newNode);
    }

    public void visit(ArrayDec dec, int level) {
        // add to hashmap at level
        NodeType newNode = new NodeType(dec.name, dec, level);
        this.node_insert(newNode);
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

        this.print_scope(level);
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