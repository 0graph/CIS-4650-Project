import java.util.ArrayList;
import java.util.HashMap;

import Ast.*;

/**
 * The tables that contain all symbols within their scopes
 * All node values can be read from here
 */
public class SymbolTable {
  private final static int SPACES = 4;
  private String name; // The name given to this Symbol Table if in a particular place

  // All child Scopes
  public ArrayList<SymbolTable> innerScopes;

  // Parent Scopes
  public SymbolTable outerScope;

  // Level of scopeness
  public Integer level;

  // All symbols within this scope
  private HashMap<String, NodeType> symbols;

  // Expressions in current scope and their types
  private HashMap<Exp, Type> expressions;

  /**
   * Create a new symbol table within a scope
   * 
   * @param outerScope The parent scope (can be null if global scope)
   * @param level      The level of the scopeness
   */
  public SymbolTable(SymbolTable outerScope, Integer level) {
    // Create empty sub scope
    this.innerScopes = new ArrayList<SymbolTable>();

    // Create empty symbol table
    this.symbols = new HashMap<String, NodeType>();

    // Create Empty expressions table
    this.expressions = new HashMap<Exp, Type>();

    // Set the parent (if any)
    this.outerScope = outerScope;

    // Set the level
    this.level = level;

    // Set the name to the level
    this.name = level.toString();
  }

  /**
   * Create a new symbol table within a scope
   * 
   * @param outerScope The parent scope (can be null if global scope)
   * @param level      The level of the scopeness
   * @param name       The name of the scope
   */
  public SymbolTable(SymbolTable outerScope, Integer level, String name) {
    // Create empty sub scope
    this.innerScopes = new ArrayList<SymbolTable>();

    // Create empty symbol table
    this.symbols = new HashMap<String, NodeType>();

    // Create Empty expressions table
    this.expressions = new HashMap<Exp, Type>();

    // Set the parent (if any)
    this.outerScope = outerScope;

    // Set the level
    this.level = level;

    // Set the name to the level
    this.name = name;
  }

  /**
   * Add a new symbol to this table
   * 
   * @param symbol The node to add
   */
  public void addSymbol(NodeType symbol) throws SymbolExistsException {
    // Check if variable exists already
    NodeType node = symbols.get(symbol.name);

    if (node != null) {
      String message = String.format("Symbol with name %s and nested level %d already exists in this scope!",
          symbol.name, symbol.level);
      throw new SymbolExistsException(message);
    }

    symbols.put(symbol.name, symbol);
  }

  /**
   * Check if the symbol already exists in this scope, returns null if it's not
   * NOTE: This will only check the variable in the current scope and not any
   * outer scopes, use "symbolInAllScopes"
   *
   * @param id The id of the symbol to check
   */
  public NodeType symbolInScope(String id) {
    NodeType node = symbols.get(id);

    return node;
  }

  public NodeType getFunctionSymbol() {
    SymbolTable current = this;
    while (current != null) {
      if (current.name.isEmpty()) {
        current = current.outerScope;
      } else {
        return current.symbolInAllScopes(current.name);
      }
    }
    return null;
  }

  /**
   * Traverses up the tree to check if the symbol is in any of the scopes
   * This returns the nearest variable within the scope if it exists
   *
   * @param id The id of the symbol to check
   */
  public NodeType symbolInAllScopes(String id) {
    NodeType symbol = null;
    SymbolTable current = this;

    // Check all scopes for variable
    while (current != null) {

      symbol = current.symbolInScope(id);

      if (symbol != null) {
        return symbol;
      }

      current = current.outerScope;
    }

    return symbol;
  }

  /**
   * Given the declaration pointer, return the node for the declaration object
   *
   * @param declaration The declaration object
   */
  public NodeType symbolInTree(Dec declaration) {
    System.out.println("TODO");
    return null;
  }

  /**
   * Given the expression pointer, return the node for this expression
   *
   * @param expression The expression object
   */
  public Exp expressionInTree(Exp expression) {
    System.out.println("TODO");
    return null;
  }

  /**
   * Returns all of the symbols that are in the current scope
   */
  public ArrayList<NodeType> getSymbolsInTable() {
    ArrayList<NodeType> symbolArray = new ArrayList<NodeType>();

    // Add all symbols to a hashmap
    symbols.entrySet().stream().forEach(entry -> symbolArray.add(entry.getValue()));

    return symbolArray;
  }

  /**
   * Creates and returns a reference to the innerscope table, already connected to
   * parent table
   */
  public SymbolTable createInnerScope() {
    SymbolTable table = new SymbolTable(this, this.level + 1);

    innerScopes.add(table);

    return table;
  }

  /**
   * Creates and returns a reference to the innerscope table, already connected to
   * parent table
   * 
   * @param name The name of the scope
   */
  public SymbolTable createInnerScope(String name) {
    SymbolTable table = new SymbolTable(this, this.level + 1, name);

    innerScopes.add(table);

    return table;
  }

  /**
   * Get the type for the expression saved in the scope
   * 
   * @param exp The pointer to an expression to check
   * @throws NoSuchExpressionElement Throws an error if the expression does not
   *                                 exit in the scope
   */
  public Type getExpressionType(Exp exp) throws NoSuchExpressionElement {
    Type type = expressions.get(exp);

    if (type == null) {
      throw new NoSuchExpressionElement("Expression was never created: " + exp.getClass());
    }

    return type;
  }

  /**
   * Add an expression to the current scope
   * 
   * @param exp  The expression as the key
   * @param type The type of this expression
   * @throws ExpressionExistsException Throws an expression exists if the
   *                                   expression has already been added
   */
  public void addExpression(Exp exp, Type type) throws ExpressionExistsException {
    try {
      getExpressionType(exp);

      throw new ExpressionExistsException("Expression already exists! Expression: " + exp);
    } catch (NoSuchExpressionElement e) {
      // Can successfully add the expression
      expressions.put(exp, type);
    }
  }

  /**
   * Print the symbol table in a root structure
   */
  public String toString() {
    return toStringHelper(this.level);
  }

  /**
   * for printing in the toString
   */
  private String indent(int level) {
    StringBuilder builder = new StringBuilder();
    for (int i = 0; i < level * SPACES; i++)
      builder.append(" ");

    return builder.toString();
  }

  /**
   * String helper function
   */
  private String toStringHelper(int level) {
    StringBuilder result = new StringBuilder();
    SymbolTable current = this;

    // Go through tree
    if (level > 0) {
      result.append(indent(level));
      result.append(String.format("Entering Scope %s:\n", name));
    }

    // Go through all Symbols
    for (NodeType node : current.symbols.values()) {
      String declaration = String.format("Symbol: %s | %s\n", node.def.toString(), node.def.type);
      result.append(indent(level + 1) + declaration);
    }

    // Recurse inner scopes
    for (SymbolTable scope : innerScopes) {
      // result.append(indent(level));
      result.append(scope.toStringHelper(scope.level + 1));
    }

    if (level > 0) {
      result.append(indent(level));
      result.append("Exiting Scope\n");
    }

    return result.toString();
  }
}
