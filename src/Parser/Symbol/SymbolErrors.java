import java.util.ArrayList;

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
    private String name;

    /**
     * Create a new error
     */
    public Error(String name, Integer row, Integer column) {

    }
  }

  // All of the errors to show
  private ArrayList<Error> errors = new ArrayList<Error>();

  // Add a new error
  public void addError() {
  }
}
