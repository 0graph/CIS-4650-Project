/**
 * Exception when there is no expression in the current scope
 */
class NoSuchExpressionElement extends Exception {

  public NoSuchExpressionElement() {

  }

  public NoSuchExpressionElement(String message) {
    super(message);
  }
}
