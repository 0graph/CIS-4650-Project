/*
    For testing if the CUP parser is functioning as expected
*/

import java.io.*;
import java_cup.runtime.*;
import Ast.*;

public class ParserMain {
  public final static boolean SHOW_TREE = true;

  static public void main(String argv[]) {
    /* Start the parser */
    try {
      Parser p = new Parser(new Lexer(new FileReader(argv[0])));
      Ast result = (Ast) p.parse().value;

      AstVisitor visitor = new DisplayTree();

      System.out.println("Abstract Syntax Tree: ");

      result.accept(visitor, 0);
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }
}
