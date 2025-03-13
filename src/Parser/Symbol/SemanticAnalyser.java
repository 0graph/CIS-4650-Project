import Ast.*;
//import Symbol.NodeType;
import java.util.*;

// NOTES:
// when visiting expressions, set it's Dec to the evaluated type based
// on the LHS and RHS of the expression, if incompatible set to false

// ISSUES:

public class SemanticAnalyser implements AstVisitor {
  final static int SPACES = 4;
  public static boolean error = false;
  HashMap<String, ArrayList<NodeType>> _table;
  SymbolTable table;

  public SemanticAnalyser() {
    this._table = new HashMap<String, ArrayList<NodeType>>();

    // Initialize the global scope
    this.table = new SymbolTable(null, 0);
  }

  // for printing scopes
  private void indent(int level) {
    for (int i = 0; i < level * SPACES; i++)
      System.out.print(" ");
  }

  // check if node is in hash map and
  // check if node in hash map is from same or deeper scope before deleting
  private boolean node_delete(NodeType node) {
    ArrayList<NodeType> nodeList = this._table.get(node.name);
    if (nodeList == null) { // nothing to delete
      return false;
    }

    // node from less deep scope -> dont delete
    if (nodeList.get(0).level < node.level) {
      System.out.println("Warning: trying to delete node from less deep scope");
      return false;
    }

    nodeList.remove(0);

    // delete key if array is empty;
    if (nodeList.isEmpty()) {
      this._table.remove(node.name);
    } else if (nodeList.get(0).level >= node.level) {
      System.out.println("Warning: after deleting there are still nodes with >= scope in map");
    }

    return true;
  }

  // insert node to hash map
  // return false if issue
  private boolean node_insert(NodeType node) {
    ArrayList<NodeType> nodeList = this._table.get(node.name);
    if (nodeList == null) { // insert new ArrayList
      nodeList = new ArrayList<NodeType>();
      nodeList.add(node);
      this._table.put(node.name, nodeList);
    } else { // add to front of list
      // for now if node already exists at same level just ignore the new one
      if (nodeList.get(0).level == node.level) {
        System.out
            .println("Warning: variable " + node.name + " already exists at same scope level (" + node.level + ")");
        this.error = true;
        return false;
      }
      nodeList.add(0, node);
    }
    return true;
  }

  // print variables and types before deleting them and exiting scope
  private void print_scope(int level) {
    ArrayList<NodeType> toDelete = new ArrayList<NodeType>();

    // for each variable
    for (ArrayList<NodeType> list : this._table.values()) {

      if (list == null || list.isEmpty()) {
        System.out.println("Error: HashMap contains key with empty value");
        continue;
      }

      if (list.get(0).level > level) {
        System.out.println(
            "Warning: Found node from level " + list.get(0).level + " still in list when checking level " + level);
        continue;
      }

      // print node and then delete it
      if (list.get(0).level == level) {
        indent(level);
        Dec def = list.get(0).def;
        System.out.print(def);

        if (def instanceof SimpleDec) {
          System.out.println(" " + ((SimpleDec) def).type);
        } else if (def instanceof ArrayDec) {
          System.out.println(" " + ((ArrayDec) def).type);
        } else if (def instanceof FunctionDec) {
          System.out.println(" " + ((FunctionDec) def).type);
        } else {
          System.out.println("");
        }

        toDelete.add(list.get(0));
      }
    }

    for (NodeType node : toDelete) {
      this.node_delete(node);
    }
  }

  // check if node is in hashmap and depth is not greater then the node to look
  // for
  // otherwise return null
  private NodeType node_lookup(NodeType node) {
    ArrayList<NodeType> nodeList = this._table.get(node.name);

    // node not found
    if (nodeList == null) {
      return null;
    }

    // I think this shouldent happen
    if (nodeList.get(0).level > node.level) {
      System.out.println("Warning: during lookup encountered top node with higher level");
      return null;
    }

    // return the top node (should be most recent scope)
    return nodeList.get(0);
  }

  /**
   * used for expression and variable type compatibility checking
   * check type
   * check if array index being accessed is valid
   * 
   * @param lhs Light hand side
   * @param rhs Right hand side
   */
  private boolean isCompatible(Type lhs, Type rhs) {
    return lhs == rhs;
  }

  // add visitor methods here in postorder traversal
  // use level to detect scope

  /**
   * Create a symbol table based on the results parsed
   */
  public void symbolTable(Ast ast) {
    visit(ast, table);
  }

  /**
   * Visit a list structure and add to symbol table
   */
  public void visit(ListAst list, SymbolTable table) {
    ListAst node = list;

    // Visit each component in the list
    while (node != null) {
      Ast ast = node.head;

      if (ast != null) {
        visit(ast, table);
      }

      node = node.tail;
    }
  }

  /**
   * Generic ast object visitor
   */
  public void visit(Ast ast, SymbolTable table) {
    if (ast instanceof ListAst) {
      visit((ListAst) ast, table);
    } else if (ast instanceof SimpleDec) {
      visit((SimpleDec) ast, table);
    } else if (ast instanceof FunctionDec) {
      visit((FunctionDec) ast, table);
    } else if (ast instanceof CompoundExp) {
      visit((CompoundExp) ast, table);
    } else if (ast instanceof AssignExp) {
      visit((AssignExp) ast, table);
    } else if (ast instanceof IfExp) {
      visit((IfExp) ast, table);
    } else if (ast instanceof ReturnExp) {
      visit((ReturnExp) ast, table);
    } else if (ast instanceof IntExp) {
      visit((IntExp) ast, table);
    } else if (ast instanceof ArrayDec) {
      visit((ArrayDec) ast, table);
    } else if (ast instanceof OpExp) {
      visit((OpExp) ast, table);
    } else if (ast instanceof BoolExp) {
      visit((BoolExp) ast, table);
    }

    else {
      System.out.println("Implement: " + ast.getClass());
    }
  }

  /**
   * Visit a function declarations
   */
  public void visit(FunctionDec dec, SymbolTable table) {
    NodeType node = new NodeType(dec.name, dec, table.level);

    // Add symbol to scope
    try {
      table.addSymbol(node);
    } catch (SymbolExistsException e) { // Symbol Declared before
      System.out.println(e);
    }

    // Visit the symbols in function, create new symbol table
    table = table.createInnerScope();

    visit(dec.params, table);
    visit(dec.body, table);
  }

  /**
   * Visit a compound expression that contains declaration lists
   * and expression lists
   */
  public void visit(CompoundExp exp, SymbolTable table) {
    // Create the inner scope
    table = table.createInnerScope();

    if (exp.decs != null) {
      visit(exp.decs, table);
    }

    if (exp.exps != null) {
      visit(exp.exps, table);
    }
  }

  /**
   * Visit a simple variable declaration: int x;
   */
  public void visit(SimpleDec dec, SymbolTable table) {
    NodeType node = new NodeType(dec.name, dec, table.level);

    try {
      table.addSymbol(node);
    } catch (SymbolExistsException e) {
      System.out.println(e);
    }
  }

  /**
   * Visit a simple array declaration: int x[2];
   */
  public void visit(ArrayDec dec, SymbolTable table) {
    NodeType node = new NodeType(dec.name, dec, table.level);

    try {
      table.addSymbol(node);
    } catch (SymbolExistsException e) {
      System.out.println(e);
    }
  }

  /**
   * Visit an assign exp: x = 10;
   */
  public void visit(AssignExp exp, SymbolTable table) {
    VarExp lhs = exp.lhs;
    Exp rhs = exp.rhs;

    // Visit to get the symbols before checking the types
    visit(lhs, table);
    visit(rhs, table);

    // Check for the right expressions
    try {
      Type left = table.getExpressionType(lhs);
      Type right = table.getExpressionType(rhs);

      if (isCompatible(left, right)) {
        table.addExpression(exp, left);
      } else {
        // TODO: Make the Error better
        System.out.println("Expressions are not compatible!");
      }
    } catch (NoSuchExpressionElement e) {
      System.out.println("Cannot Assign!");
      System.out.println(e);

      e.printStackTrace();
    } catch (ExpressionExistsException e) {
      System.out.println(e);

      e.printStackTrace();
    }
  }

  /**
   * Visit a call to a function bruh()
   */
  public void visit(CallExp exp, SymbolTable table) {
    NodeType node = table.symbolInAllScopes(exp.func);

    if (node == null) {
      System.out.println(
          "Warning: undeclared function " + exp.func + " being called at row " + exp.row + " and column " + exp.col);
    }

    visit(exp.args, table);
  }

  /**
   * Visit an expression for a var: x { / something /}
   */
  public void visit(VarExp exp, SymbolTable table) {
    String name = "";
    Exp idx = null;

    // x = 0;
    if (exp.variable instanceof SimpleVar) {
      name = ((SimpleVar) exp.variable).name;

    } else if (exp.variable instanceof IndexVar) { // x[3 + 2];
      name = ((IndexVar) exp.variable).name;
      idx = ((IndexVar) exp.variable).index;
    }

    // Look up variable
    NodeType node = table.symbolInAllScopes(name);
    if (node == null) {
      System.out.println(
          "Warning: reference to undeclared variable " + name + " at row " + exp.row + " and column " + exp.col);
    } else {
      // Update the type to this expression
      Type type = node.def.type.getTypeValue();

      try {
        table.addExpression(exp, type);
      } catch (ExpressionExistsException e) {
        System.out.println(e);
        e.printStackTrace();
      }
    }

    // Check Index validity through expression

  }

  /**
   * Visit If Expression
   */
  public void visit(IfExp exp, SymbolTable table) {

    // Create new SymbolTable
    SymbolTable ifTable = table.createInnerScope();
    visit(exp.test, ifTable);
    visit(exp.then, ifTable);

    // Else Symbol Table
    SymbolTable elseTable = table.createInnerScope();
    visit(exp._else, elseTable);

    // Set Dec for type compatibility checking
  }

  /**
   * Visit Int expresion
   */
  public void visit(IntExp exp, SymbolTable table) {
    // All Int expressions are integers so we just add that to the expression
    try {
      table.addExpression(exp, Type.INT);
    } catch (ExpressionExistsException e) {
      System.out.println(e);

      e.printStackTrace();
    }
  }

  /**
   * Visit a simple boolean
   */
  public void visit(BoolExp exp, SymbolTable table) {
    // All boolean expressions are booleans
    try {
      table.addExpression(exp, Type.BOOLEAN);
    } catch (ExpressionExistsException e) {
      System.out.println(e);

      e.printStackTrace();
    }
  }

  /**
   * Return expreesion "return (x == 1)"
   */
  public void visit(ReturnExp exp, SymbolTable table) {
    visit(exp.exp, table);
  }

  /**
   * Operations such as 1 + 1
   */
  public void visit(OpExp exp, SymbolTable table) {
    Exp lhs = exp.lhs;
    Exp rhs = exp.rhs;

    // Visit first to get symbols before checking types
    visit(lhs, table);
    visit(rhs, table);

    // Check for the right expressions
    try {
      Type left = table.getExpressionType(lhs);
      Type right = table.getExpressionType(rhs);

      if (isCompatible(left, right)) {
        table.addExpression(exp, left);
      } else {
        // TODO: Make the error better
        System.out.println("Expressions are not compatible");
      }
    } catch (NoSuchExpressionElement e) {
      System.out.println("Cannot Assign!");
      System.out.println(e);

      e.printStackTrace();
    } catch (ExpressionExistsException e) {
      System.out.println(e);

      e.printStackTrace();
    }

  }

  public void visit(ListAst list, int level) {
    if (level == 0) {
      indent(level);
      System.out.println("Entering the global scope.");
    }

    list.visit(this, level); // function, and variable decs are level 0 in global scope

    if (level == 0) {
      this.print_scope(level);
      indent(level);
      System.out.println("Exiting the global scope.");
    }
  }

  public void visit(FunctionDec dec, int level) {
    NodeType newNode = new NodeType(dec.name, dec, level);
    NodeType lNode = this.node_lookup(newNode);
    if (lNode == null) { // not declared before
      this.node_insert(newNode);
    } else {
      // check if previous node was a prototype or a decl
      // and update accordingly
      FunctionDec fDec = (FunctionDec) lNode.def;
      if (fDec.body instanceof NilExp) {

        // if previous node was a prototype, update the node to be a declaration
        // so that future redeclarations can be detected
        if (dec.body instanceof NilExp) {
          System.out.println("Warning: Function prototype declared twice");
        } else {
          // TODO: Check if declaration and prototype types are matching
          // TODO: Check if parameter types are matching

          // update
          lNode.def = dec;
        }
      } else {
        System.out.println("Warning: Redeclared function detected at row " + dec.row + " and column " + dec.col);
      }
    }

    indent(level + 1);
    System.out.println("Entering the scope for function " + dec.name + ":");

    dec.type.accept(this, level); // function type (same level as global)
    dec.params.accept(this, level + 1); // function parameter types (same level as function scope)
    if (dec.body instanceof NilExp) {
      // this is a function prototype, we store it so later we can check if the
      // function declaration matches
    } else {
      dec.body.accept(this, level); // function expression (same level as function scope)
    }

    this.print_scope(level + 1); // print the stuff inside the function (+1)

    indent(level + 1);
    System.out.println("Exiting the scope for function " + dec.name + ":");
  }

  public void visit(SimpleDec dec, int level) {
    // add to hashmap at level
    NodeType newNode = new NodeType(dec.name, dec, level);
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

  public void visit(NilExp exp, int level) {
    // dont think anything needs to be done here
  }

  public void visit(CallExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
    NodeType newNode = new NodeType(exp.func, null, level);
    NodeType foundNode = this.node_lookup(newNode);
    if (foundNode == null) { // function not declared
      // Note: might need to check if function is actually declared or just a
      // prototype
      System.out.println(
          "Warning: undeclared function " + exp.func + " being called at row " + exp.row + " and column " + exp.col);
    }
    exp.args.accept(this, level);
  }

  public void visit(AssignExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
    // TODO: Check type compatibility
    exp.lhs.accept(this, level);
    exp.rhs.accept(this, level);
  }

  public void visit(VarExp exp, int level) {
    String name = "";
    Exp idx = null;

    if (exp.variable instanceof SimpleVar) {
      name = ((SimpleVar) exp.variable).name;
    } else if (exp.variable instanceof IndexVar) {
      name = ((IndexVar) exp.variable).name;
      idx = ((IndexVar) exp.variable).index;
    }

    NodeType newNode = new NodeType(name, null, level);
    NodeType foundNode = this.node_lookup(newNode);
    if (foundNode == null) { // variable is undeclared
      System.out.println(
          "Warning: reference to undeclared variable " + name + " at row " + exp.row + " and column " + exp.col);
      this.error = true;
    }

    // check if index being accessed is valid
    // not sure how to do that since index is an expression

  }

  public void visit(SimpleVar var, int level) {
    // dont think if anything needs to be done
  }

  public void visit(CompoundExp exp, int level) {
    if (level > 0) {
      indent(level);
      System.out.println("Entering a new block");
    }

    if (exp.decs != null) {
      exp.decs.accept(this, level + 1);
    }

    if (exp.exps != null) {
      exp.exps.accept(this, level + 1);
    }

    this.print_scope(level + 1); // print the stuff inside the expression (+1)
    if (level > 0) {
      indent(level);
      System.out.println("Exiting the block");
    }
  }

  public void visit(IntExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
  }

  public void visit(BoolExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
  }

  public void visit(IndexVar var, int level) {
    // dont think anything needs to be done
  }

  public void visit(ReturnExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
    // TODO: Check type compatibility with function's type
    exp.exp.accept(this, level);
  }

  public void visit(OpExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
    // TODO: Check type compatibility
    exp.lhs.accept(this, level);
    exp.rhs.accept(this, level);
  }

  public void visit(IfExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
    exp.test.accept(this, level);
    exp.then.accept(this, level);
    exp._else.accept(this, level);
  }

  public void visit(WhileExp exp, int level) {
    // TODO: Set Dec for type compatibility checking
    exp.test.accept(this, level);
    exp.body.accept(this, level);
  }

  /**
   * Go through symbol tables and print them out
   */
  public String toString() {
    StringBuilder builder = new StringBuilder();
    SymbolTable current = table;

    builder.append("Entering global scope:\n");
    builder.append(current.toString());
    builder.append("Exiting global scope.\n");

    return builder.toString();
  }
}
