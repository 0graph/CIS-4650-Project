import Ast.*;
//import Symbol.NodeType;
import java.util.*;

/**
 * The semantic analyzer for the file being parsed
 */
public class SemanticAnalyser implements AstVisitor {
  final static int SPACES = 4;
  public static boolean error = false;

  private SymbolTable table;
  private SymbolErrors errors;

  public SemanticAnalyser() {
    // Initialize the global scope
    this.table = new SymbolTable(null, 0);
    this.errors = new SymbolErrors();

    // Add input/output functions
    setupSystemSymbols(this.table);
  }

  /**
   * Setup the symbols that already belong to the language
   * An example would be function definitions defined by the language such as
   * "input"
   */
  private void setupSystemSymbols(SymbolTable table) {
    // Function Declarations
    NodeType input = new NodeType("input", null, 0);
    input.def = new FunctionDec(0, 0, new VarType(0, 0, Type.VOID.ordinal()), "input",
        new VarDecList(new SimpleDec(0, 0, new VarType(0, 0, Type.VOID.ordinal()), "input"), null), null);

    NodeType output = new NodeType("output", null, 0);
    output.def = new FunctionDec(0, 0, new VarType(0, 0, Type.VOID.ordinal()), "output",
        new VarDecList(new SimpleDec(0, 0, new VarType(0, 0, Type.VOID.ordinal()), "output"), null), null);

    try {
      table.addSymbol(input);
      table.addSymbol(output);
    } catch (Exception e) {
      System.err.print("Input or output has been initialized before and program will shutdown");
    }
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
    } else if (ast instanceof CallExp) {
      visit((CallExp) ast, table);
    }

    // DEBUG: This is used for debugging if there is an expression that has not been
    // implemented
    // else {
    // System.out.println("Implement: " + ast.getClass());
    // }
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
      // Check if the function declared before was a prototype
      FunctionDec prev = (FunctionDec) table.symbolInScope(dec.name).def;

      if (prev != null && (!(prev.body instanceof NilExp))) {
        errors.addRedeclaredFunctionError(dec.name, dec.row, dec.col);
      }
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
      // Check that the type is not void
      if (dec.type.getTypeValue() == Type.VOID) {
        errors.addVariableTypeError(dec.name, Type.VOID, Type.INT, dec.row, dec.col);
        node.def.type.type = Type.INT.ordinal();
      }

      table.addSymbol(node);
    } catch (SymbolExistsException e) {
      errors.addRedeclaredVariableError(dec.name, dec.row, dec.col);
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
        errors.addAssignExpressionError(lhs, left, right);
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
    NodeType node = table.symbolInAllScopes(exp.func);

    if (node == null) {
      errors.addUndeclaredFunctionError(exp.func, exp.row, exp.col);
    }

    // Make Sure Params match types
    ListAst list;

    ExpList args = exp.args;
    visit(args, table);

    // The parameters that are required in the function call
    ArrayList<Type> params = new ArrayList<Type>();
    FunctionDec declaration = (FunctionDec) node.def;

    // Add a reference to all parameters so that we can check if they match calls
    list = declaration.params;
    while (list != null) {
      Dec var = (Dec) list.head;

      if (var != null) {
        params.add(var.type.getTypeValue());
      }

      list = list.tail;
    }

    // Visit each component in the list
    list = args;

    int i = 0;
    while (list != null) {
      Exp ast = (Exp) list.head;

      if (ast != null) {
        try {
          Type argType = table.getExpressionType((Exp) ast);

          Type paramType = params.get(i);

          if (!isCompatible(paramType, argType)) {
            errors.addArgumentsError(exp.func, argType, paramType, ast.row, ast.col);
          }
        } catch (Exception e) {
          errors.addIncorrectCallsError(exp.func, ast.row, ast.col);
        }
      }

      i++;
      list = list.tail;
    }

    // Check if there are an equal amount of params and arguments
    if (i != params.size()) {
      errors.addIncorrectCallsError(exp.func, exp.row, exp.col);
    }
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
      errors.addUndeclaredVariableError(name, exp.row, exp.col);
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
          errors.addArrayIndexError(name, exp.row, exp.col);
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
      } else {
        errors.addTestError(exp.row, exp.col);
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
        errors.addOperationError(left, right, exp.row, exp.col);
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
      } else {
        errors.addTestError(exp.row, exp.col);
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

    // Symbol Table
    SymbolTable current = table;
    builder.append("Entering global scope:\n");
    builder.append(current.toString());
    builder.append("Exiting global scope.\n");

    // Errors
    ArrayList<SymbolErrors.Error> errs = errors.getErrors();
    if (errs.size() > 0) {
      builder.append("\nErrors:\n");

      // The errors accumulated while analyzing
      for (SymbolErrors.Error err : errs) {
        builder.append(err + "\n");
      }
    }

    return builder.toString();
  }
}
