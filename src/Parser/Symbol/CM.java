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
    if (args.length < 2) {
      String file = args[0];
      doAll(file);

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
        doSymbolParse(args[1], true);
        break;

      case "-c":
        System.out.println("Compiling...");
        doCompile(args[1], true);
        break;

      case "-h":
        System.out.println(
            "Compile a program for the Tiny Machine Assembly Language\n-a <file name> Generate an Abstract Syntax Tree for the file and do a syntax check\n-s <filename> Generate a semantic table and check for errors\n-c <filename> Compile a file to the Tiny Assembly Language. Note that this does not do a semantic check to the file being compiled\n<filename>: Compile a file");
        break;
    }
  }

  /**
   * Completely compile a file, doing a syntax and semantic check
   *
   * @param file The name of the file to compile
   */
  static void doAll(String file) {
    try {
      // Symbol Table
      doSymbolParse(file, false);

      // Compile File
      doCompile(file, false);

    } catch (Exception e) {
      System.out.println("En error was encountered during compilation.");
      e.printStackTrace();
    }
  }

  /**
   * Create a symbol tree for semantic checking of the file
   *
   * @param file  The file to parse
   * @param print Whether to print the output
   */
  static void doSymbolParse(String file, boolean print) {
    try {
      Parser p = new Parser(new Lexer(new FileReader(file)));
      Ast result = (Ast) p.parse().value;

      AstVisitor visitor = new SemanticAnalyser();

      SemanticAnalyser analyser = (SemanticAnalyser) visitor;
      analyser.symbolTable((DecList) result);

      if (print) {
        System.out.println("Symbol Table: ");

        System.out.println(analyser);
      }
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }

  /**
   * Do a syntax analysis of the file
   *
   * @param file  The file to read
   * @param print Whether to print the output
   */
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

  /**
   * Compile the file and do a print out to the console
   *
   * @param file  The file to compile
   * @param print Print to console the output
   */
  static void doCompile(String file, boolean print) {
    try {
      Parser p = new Parser(new Lexer(new FileReader(file)));
      Ast result = (Ast) p.parse().value;

      AstVisitor visitor = new CodeGen(file);

      CodeGen compiler = (CodeGen) visitor;
      compiler.compile((DecList) result);

      compiler.generateFile("Programs");

      if (print) {
        System.out.println(compiler);
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
