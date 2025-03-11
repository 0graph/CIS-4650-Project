import java.io.*;
import java_cup.runtime.*;
import Ast.*;

// C Minus Compiler

// Flags:
//      -a Parse the program and display an Abstract Syntax Tree
//      -s Parse the program and display the symbol table

public class CM {

    static public void main(String[] args) {
        if(args.length() < 1){
            System.out.println("No Args Specified. Use -a or -s");
            return;
        }

        if(args[0].equals("-a")) {
            System.out.println("Creating an Abstract Syntax Tree.");
            doAstParse();
        }
        else if (args[0].equals("-s")) {
            System.out.println("Creating a Symbol Table");
            doSymbolParse();
        } else  {
            System.out.println("Invalid Args Specified. Use -a or -s");
            return;
        }

    }

    static void doSymbolParse() {

    }

    static void doAstParse() {
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