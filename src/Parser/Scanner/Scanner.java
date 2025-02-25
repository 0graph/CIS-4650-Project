import java.io.IOException;

/**
 * Scanner implementation to check whether the lexer is working
 */
public class Scanner {
  private Lexer scanner = null;

  public Scanner(Lexer lexer) {
    scanner = lexer;
  }

  public Symbol getNextToken() throws IOException {
    return scanner.next_token();
  }

  public static void main(String argv[]) {
    try {
      Scanner scanner = new Scanner(new Lexer(new InputStreamReader(System.in)));
      Symbol tok = null;
      while ((tok = scanner.getNextToken()) != null) {
        System.out.print(sym.terminalNames[tok.sym]);
        if (tok.value != null)
          System.out.print("(" + tok.value + ")");
        System.out.println();
      }
    } catch (Exception e) {
      System.out.println("Unexpected exception:");
      e.printStackTrace();
    }
  }
}
