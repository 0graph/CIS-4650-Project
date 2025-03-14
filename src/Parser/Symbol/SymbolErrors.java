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
   * Add an undeclared function error
   * 
   * @param function function name
   * @param row
   * @param column
   */
  public void addUndeclaredFunctionError(String function, Integer row, Integer column) {
    String text = String.format("Warning: undeclared function %s");

    addError(text, row, column);
  }

  /**
   * Add an error when a variable assignment is not allowed
   * 
   * @param left  The left hand expression
   * @param right The right hand expression
   */
  public void addAssignExpressionError(Exp left, Exp right, Type leftType, Type rightType) {
    String text = String.format("Warning: assignment not valid! %s != %s", leftType, rightType);

    addError(text, left.row, left.col);
  }
}
