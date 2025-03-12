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
                System.out.println("Warning: Node " + node.name + " already exists at scope level " + node.level);
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
                System.out.println("Warning: Found node from level " + list.get(0).level + " still in list when checking level " + level);
                continue;
            }

            // print node and then delete it
            if(list.get(0).level == level) {
                indent(level);
                Dec def = list.get(0).def;
                System.out.print(def);

                if(def instanceof SimpleDec) {
                    System.out.println(" " + ((SimpleDec)def).type);
                } else if(def instanceof ArrayDec) {
                    System.out.println(" " + ((ArrayDec)def).type);
                }

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

        list.visit(this, level); // function, and variable decs are level 0 in global scope


        if(level == 0) {
            this.print_scope(level);
            indent(level);
            System.out.println("Exiting the global scope.");
        }
    }

    public void visit(FunctionDec dec, int level) {
        indent(level+1);
        System.out.println("Entering the scope for function " + dec.name + ":");

        dec.type.accept(this, level); // function type (same level as global)
        dec.params.accept(this, level+1); // function parameter types (same level as function scope)
        if (dec.body instanceof NilExp) {
            // this is a function prototype, we store it so later we can check if the function declaration matches
        } else {
            dec.body.accept(this, level); // function expression (same level as function scope)
        }

        this.print_scope(level+1); // print the stuff inside the function (+1)

        indent(level+1);
        System.out.println("Exiting the scope for function " + dec.name + ":");
    }

    public void visit(SimpleDec dec, int level) {
        // add to hashmap at level
        NodeType newNode = new NodeType(dec.name,dec,level);
        this.node_insert(newNode);
        dec.type.accept(this, level);
    }

    public void visit(ArrayDec dec, int level) {
        // add to hashmap at level
        NodeType newNode = new NodeType(dec.name, dec, level);
        this.node_insert(newNode);
        dec.type.accept(this, level);
    }

    public void visit(VarType type, int level) {
        // dont print anything here
    }

    public void visit(NilExp exp, int level){
        // dont think anything needs to be done here
    }

    public void visit(CallExp exp, int level){
        // TODO: Set Dec for type compatibility checking
        exp.args.accept(this, level);
    }

    public void visit(AssignExp exp, int level){
        // TODO: Set Dec for type compatibility checking
        // TODO: Check type compatibility
        exp.lhs.accept(this, level);
        exp.rhs.accept(this, level);
    }

    public void visit(VarExp exp, int level){
        // find if var's name exists in map at level
        // if it dosent -> error
        // if it does we're good -> set exp dec to the one in the map
    }

    public void visit(SimpleVar var, int level){
        // dont think if anything needs to be done
    }

    public void visit(CompoundExp exp, int level){
        if(level > 0) {
            indent(level);
            System.out.println("Entering a new block");
        }

        if (exp.decs != null) {
            exp.decs.accept(this, level+1);
        }

        if (exp.exps != null) {
            exp.exps.accept(this, level+1);
        }

        this.print_scope(level+1); // print the stuff inside the expression (+1)
        if(level > 0) {
            indent(level);
            System.out.println("Exiting the block");
        }
        
    }

    public void visit(IntExp exp, int level){
        // TODO: Set Dec for type compatibility checking
    }

    public void visit(BoolExp exp, int level){
        // TODO: Set Dec for type compatibility checking
    }

    public void visit(IndexVar var, int level){
        // dont think anything needs to be done
    }

    public void visit(ReturnExp exp, int level){
        // TODO: Set Dec for type compatibility checking
        // TODO: Check type compatibility with function's type
        exp.exp.accept(this, level);
    }

    public void visit(OpExp exp, int level){
        // TODO: Set Dec for type compatibility checking
        // TODO: Check type compatibility
        exp.lhs.accept(this, level);
        exp.rhs.accept(this, level);
    }

    public void visit(IfExp exp, int level){
        // TODO: Set Dec for type compatibility checking
        exp.test.accept(this, level);
        exp.then.accept(this, level);
        exp._else.accept(this, level);
    }

    public void visit(WhileExp exp, int level){
        // TODO: Set Dec for type compatibility checking
        exp.test.accept(this, level);
        exp.body.accept(this, level);
    }
}