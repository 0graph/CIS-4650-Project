/*
    For testing if the CUP parser is functioning as expected
*/
   
import java.io.*;
import java_cup.runtime.*;
   
public class ParserMain {
  public final static boolean SHOW_TREE = true;
  static public void main(String argv[]) {    
    /* Start the parser */
    try {
      Parser p = new Parser(new Lexer(new FileReader(argv[0])));
      Symbol res = p.parse();
      System.out.println("Parsing completed successfully!");
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }
}
