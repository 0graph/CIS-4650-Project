import Ast.*;

public class NodeType {
  public String name;
  public Dec def;
  public int level;
  public SymbolType type;

  /**
   * Check whether the symbol is a variable, array, or function
   */
  public enum SymbolType {
    VARIABLE,
    ARRAY,
    FUNCTION
  }

  public NodeType() {

  }

  /**
   * Create a new node that defaults to the variable symbol
   */
  public NodeType(String name, Dec def, int level) {
    this.name = name;
    this.def = def;
    this.level = level;

    // Default to a normal variable
    this.type = SymbolType.VARIABLE;
  }

  /**
   * Create a new node with a particular symbol type
   */
  public NodeType(String name, Dec def, int level, SymbolType type) {
    this.name = name;
    this.def = def;
    this.level = level;
    this.type = type;
  }
}
