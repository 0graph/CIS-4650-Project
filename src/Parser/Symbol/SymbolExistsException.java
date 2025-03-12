/**
 * Exception when a symbol already exists in this scope
 */
class SymbolExistsException extends Exception {
  public SymbolExistsException() {
  }

  public SymbolExistsException(String message) {
    super(message);
  }
}
