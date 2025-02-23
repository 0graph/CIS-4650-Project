/**
 * Static class that is used for debugging and create token symbols to be used
 * by cup
 */
public class Token {

  public static void main(String[] args) {
    System.out.println("Yeea");
  }

  /**
   * Contrustuctor
   */
  public Token() {

  }

  /**
   * Create a new token to be used by the cup parser
   */
  public static Token CreateToken(String value, int row, int column) {
    System.out.println(value);

    return null;
  }

  /**
   * Create a new token to be used by the cup parser
   */
  public static Token CreateToken(String value) {
    System.out.println(value);

    return null;

  }
}
