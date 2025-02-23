/**
 * Static class that is used for debugging and create token symbols to be used
 * by cup
 */
public class Token {

  /**
   * Create a new token to be used by the cup parser
   */
  public static void CreateToken(String value, int row, int column) {
    System.out.println(value);
  }
}
