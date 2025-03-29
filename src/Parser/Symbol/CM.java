import java.io.*;
import java_cup.runtime.*;
import Ast.*;

// C Minus Compiler

// Flags:
//      -a Parse the program and display an Abstract Syntax Tree
//      -s Parse the program and display the symbol table

public class CM {

  static public void main(String args[]) {
    // no args
    if (args.length < 1) {
      System.out.println("No Args Specified. Use -a <filepath> or -s <filepath>");
      return;
    }
    // 1 arg
    if (args.length < 2) {
      System.out.println("No File Specified. Use -a <filepath> or -s <filepath>");
      return;
    }

    String flag = args[0];

    switch (flag) {
      case "-a":
        System.out.println("Creating an Abstract Syntax Tree.");
        doAstParse(args[1]);
        break;

      case "-s":
        System.out.println("Creating a Symbol Table");
        doSymbolParse(args[1]);
        break;

      case "-c":
        System.out.println("Compiling...");
        doCompile(args[1]);
        break;

      default:
        System.out.println("Invalid Args Specified. Use -a or -s");
        break;
    }
  }

  static void doSymbolParse(String file) {
    try {
      Parser p = new Parser(new Lexer(new FileReader(file)));
      Ast result = (Ast) p.parse().value;

      AstVisitor visitor = new SemanticAnalyser();

      System.out.println("Symbol Table: ");

      SemanticAnalyser analyser = (SemanticAnalyser) visitor;
      analyser.symbolTable((DecList) result);

      System.out.println(analyser);
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }

  static void doAstParse(String file) {
    try {
      Parser p = new Parser(new Lexer(new FileReader(file)));
      Ast result = (Ast) p.parse().value;

      AstVisitor visitor = new DisplayTree();

      System.out.println("Abstract Syntax Tree: ");

      result.accept(visitor, 0);
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }

  static void doCompile(String file) {
    try {
      Parser p = new Parser(new Lexer(new FileReader(file)));
      Ast result = (Ast) p.parse().value;

      AstVisitor visitor = new CodeGen(file);

      CodeGen compiler = (CodeGen) visitor;
      compiler.compile((DecList) result);

      compiler.generateFile("Programs");

      // System.out.println(compiler);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
