package SymbolTable;


public class NodeType {
    String name;
    Dec def;
    int level;

    public NodeType(String name, Dec def, int level) {
        this.name = name;
        this.def = def;
        this.level = level;
    }
}