/**
 * Exception when the expression already exists in the current scope
 */
class ExpressionExistsException extends Exception {

  public ExpressionExistsException() {

  }

  public ExpressionExistsException(String message) {
    super(message);
  }
}
