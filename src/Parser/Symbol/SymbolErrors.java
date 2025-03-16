import java.util.ArrayList;
import Ast.*;

/**
 * All of the symbol/type errors from a symbol table
 */
public class SymbolErrors {
  /**
   * The error that was found
   */
  public class Error {
    // The row where the error occured
    private int row;

    // The column where the error occured
    private int column;

    // The name of the error
    private String text;

    /**
     * Create a new error
     */
    public Error(String text, Integer row, Integer column) {
      this.text = text;
      this.column = column;
      this.row = row;
    }

    /**
     * Print the error in a nice format
     */
    public String toString() {
      String result = String.format("%s -> Called at position %d:%d", text, row, column);

      return result;
    }
  }

  // All of the errors to show after analyzing
  private ArrayList<Error> errors = new ArrayList<Error>();

  /**
   * An ArrayList containing all of the errors that were found during semantic
   * analysis
   */
  public ArrayList<Error> getErrors() {
    return errors;
  }

  /**
   * Add a new error
   * 
   * @param title  The title
   * @param row    The row
   * @param column The column of where the error was found
   */
  public void addError(String text, Integer row, Integer column) {
    Error error = new Error(text, row, column);

    // Add the error
    errors.add(error);
  }

  /**
   * Add an error when a function has already been declared and is declared again
   *
   * @param name
   * @param row
   * @param col
   */
  public void addRedeclaredVariableError(String name, Integer row, Integer col) {
    String text = String.format("Warning: variable %s has already been declared", name);

    addError(text, row, col);
  }

  /**
   * Add an error when a function that was already declared in the current scope
   * is declared again
   *
   * @param function The name of the function being redeclared
   * @param row      row of redeclaration
   * @param column   col of redeclaration
   */
  public void addRedeclaredFunctionError(String function, Integer row, Integer column) {
    String text = String.format("Warning: function %s has already been declared", function);

    addError(text, row, column);
  }

  /**
   * Add an undeclared function error
   * 
   * @param function function name
   * @param row
   * @param column
   */
  public void addUndeclaredFunctionError(String function, Integer row, Integer column) {
    String text = String.format("Warning: undeclared function %s", function);

    addError(text, row, column);
  }

  /**
   * Add an error when a variable assignment is not allowed
   * 
   * @param left      The left hand expression
   * @param leftType  The type for this expression
   * @param righttype The type for the right hand side of the expression
   * @param right     The right hand expression
   */
  public void addAssignExpressionError(Exp left, Type leftType, Type rightType) {
    String text = String.format("Warning: variable assignment not valid! %s != %s", leftType, rightType);

    addError(text, left.row, left.col);
  }

  /**
   * Add an error when a variable is being used that has not been declared before
   *
   * @param name The name of the variable
   * @param row  The row
   * @param col  The col
   */
  public void addUndeclaredVariableError(String name, Integer row, Integer col) {
    String text = String.format("Warning: reference to undeclared variable: %s", name);

    addError(text, row, col);
  }

  /**
   * Add an error when the expression inside the brackets of an array is not valid
   *
   * @param name The name of the variable
   * @param row  Row where error occurs
   * @param col  The column where the error occurs
   */
  public void addArrayIndexError(String name, Integer row, Integer col) {
    String text = String.format("Warning: Array %s cannot be indexed correctly. The index is not an integer.");

    addError(text, row, col);
  }

  /**
   * Add an error when a conditional statement does not resolve to a boolean
   *
   * @param row The row
   * @param col The col
   */
  public void addTestError(Integer row, Integer col) {
    String text = String.format("Warning: condition does not resolve into a boolean type");

    addError(text, row, col);
  }

  /**
   * Add an error when an operation between two expressions does not match
   *
   * @param left  the type for the lhs operand
   * @param right the type for the rhs operand
   * @param row   the row
   * @param col   the col
   */
  public void addOperationError(Type left, Type right, Integer row, Integer col) {
    String text = String.format("Warning: Operation not permitted. Both sides must be of the same type. %s != %s", left,
        right);

    addError(text, row, col);
  }

  /**
   * Add an error when an argument passed down to a function does not match
   *
   * @param function The name of the function
   * @param expected The expected type
   * @param type     The type that was passed
   * @param row      The row
   * @param column   The column
   */
  public void addArgumentsError(String function, Type expected, Type type, Integer row, Integer column) {
    String text = String.format("Warning: call to function %s has an unexpected type argument. Expected %s, Passed: %s",
        function, expected, type);

    addError(text, row, column);
  }

  /**
   * Add an error when there are more/less arguments than required in function
   * call
   *
   * @param function The name of the function
   * @param row
   * @param column
   */
  public void addIncorrectCallsError(String function, Integer row, Integer column) {
    String text = String.format("Warning: call to function %s does not match function declaration", function);

    addError(text, row, column);
  }

  /**
   * Add an error when the type of a variable does not make sense (e.g.: void x;)
   *
   * @param name     The name of the variable
   * @param type     The type that the variable was declared as
   * @param expected The new type the variable will be
   * @param row      The row
   * @param column   The column
   */
  public void addVariableTypeError(String name, Type type, Type expected, Integer row, Integer column) {
    String text = String.format(
        "Warning: variable %s has been declared as type %s. Variable will be updated to type %s", name, type, expected);

    addError(text, row, column);
  }
}
