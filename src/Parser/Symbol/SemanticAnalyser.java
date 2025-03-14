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

  /**
   * Print the error given the by the expection and stack trace (now)
   * 
   * @param e The exception to print out
   */
  private void printError(Exception e) {
    e.printStackTrace();
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

  /**
   * Create a symbol table based on the results parsed
   */
  public void symbolTable(Ast ast) {
    visit(ast, table);
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
    } else if (ast instanceof VarExp) {
      visit((VarExp) ast, table);
    } else if (ast instanceof WhileExp) {
      visit((WhileExp) ast, table);
    }

    else {
      System.out.println("Implement: " + ast.getClass());
    }
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
    table = table.createInnerScope(node.name);

    visit(dec.params, table);
    visit(dec.body, table);
  }

  /**
   * Visit a compound expression that contains declaration lists
   * and expression lists
   */
  public void visit(CompoundExp exp, SymbolTable table) {
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
      printError(e);
    } catch (ExpressionExistsException e) {
      printError(e);
    }
  }

  /**
   * Visit a call to a function bruh()
   */
  public void visit(CallExp exp, SymbolTable table) {
    // TODO: That the functions that already exists are output and input, make sure
    // to add
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
        printError(e);
      }
    }

    // Check Index validity through expression
    if (idx != null) {
      // Visit First
      visit(idx, table);

      try {
        Type type = table.getExpressionType(idx);

        if (!isCompatible(type, Type.INT)) {
          System.out.println("Not Cool Array");
        }
      } catch (Exception e) {
        printError(e);
      }
    }

  }

  /**
   * Visit If Expression
   */
  public void visit(IfExp exp, SymbolTable table) {
    Exp test = exp.test;
    Exp body = exp.then;
    Exp _else = exp._else;

    // Create new SymbolTable
    SymbolTable ifTable = table.createInnerScope();
    visit(test, ifTable);
    visit(body, ifTable);

    // Else Symbol Table
    SymbolTable elseTable = table.createInnerScope();
    visit(_else, elseTable);

    // Check compatability type in test expression part
    try {
      Type type = ifTable.getExpressionType(test);

      // Make sure that the return type is a boolean
      if (isCompatible(type, Type.BOOLEAN)) {
        table.addExpression(exp, Type.BOOLEAN);
      }
    } catch (NoSuchExpressionElement e) {
      printError(e);
    } catch (ExpressionExistsException e) {
      printError(e);
    }
  }

  /**
   * Visit Int expresion
   */
  public void visit(IntExp exp, SymbolTable table) {
    // All Int expressions are integers so we just add that to the expression
    try {
      table.addExpression(exp, Type.INT);
    } catch (ExpressionExistsException e) {
      printError(e);
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
      printError(e);
    }
  }

  /**
   * Return expreesion "return (x == 1)"
   */
  public void visit(ReturnExp exp, SymbolTable table) {
    visit(exp.exp, table);

    // Get the type for this return expression
    // NOTE: We could probably make sure that the return matches the function
    // return?
    try {
      Type type = table.getExpressionType(exp);
      table.addExpression(exp, type);
    } catch (ExpressionExistsException e) {
      printError(e);
    } catch (NoSuchExpressionElement e) {
      printError(e);
    }
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
      printError(e);
    } catch (ExpressionExistsException e) {
      printError(e);
    }
  }

  /**
   * while(x > 0)...
   */
  public void visit(WhileExp exp, SymbolTable table) {
    Exp test = exp.test;
    Exp body = exp.body;

    // Create new symbol table for the inner scope
    SymbolTable testTable = table.createInnerScope();
    visit(test, testTable);
    visit(body, testTable);

    // Check Compatability types
    try {
      Type type = testTable.getExpressionType(test);

      // Make sure that the return type is a boolean
      if (isCompatible(type, Type.BOOLEAN)) {
        table.addExpression(exp, Type.BOOLEAN);
      }
    } catch (NoSuchExpressionElement e) {
      printError(e);
    } catch (ExpressionExistsException e) {
      printError(e);
    }
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
