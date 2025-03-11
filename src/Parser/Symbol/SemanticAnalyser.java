package SymbolTable;
import Ast.*;

public class SemanticAnalyser implements AstVisitor {
    public static boolean error = false;
    HashMap<String, ArrayList<NodeType>> table;

    public SemanticAnalyser() {
        this.table = new HashMap<String, ArrayList<NodeType>>();

    }

    // add visitor methods here in postorder traversal
}