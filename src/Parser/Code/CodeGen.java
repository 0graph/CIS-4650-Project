import Ast.*;

/**
 * Generates the intermediate code based on the symbols parsed
 */
public class CodeGen implements AstVisitor {
  // The current instruction and max instruction number that can be accessed
  public static int LINENUM = 0;
  public static int MAXLINENUM = 0;

  public int globalOffset; // The global offset in memory
  public int frameOffset; // The frame offset for the next function in memory

  // The symbol table that keeps track of extra things
  private SymbolTable table;

  // Buffer for the final file being created
  private Buffer buffer;

  /**
   * Setup runtime environment for code
   */
  public CodeGen() {
    this.globalOffset = 0;
    this.frameOffset = this.globalOffset;

    this.buffer = new Buffer("test.tm");
  }

  /**
   * Compile the code given
   */
  public void compile(Ast ast) {
    Block block = new Block();
    String code = block.addInstructionRM("ST", Instructions.AC, Instructions.FP, "store return");

    buffer.addInstruction(code);

    visit(ast, block, false);
  }

  /**
   * Create a symbol table given the parsing object
   */
  public void CreateSymbolTable() {
    // semanticAnalyser.
    System.out.println("TODO");
  }

  /**
   * Generic visitor for ast
   *
   * @param ast  The ast we are traversing through
   * @param line The line number
   * @param flag Whether the expression is an address or not
   */
  public void visit(Ast ast, Block block, boolean flag) {
    if (ast instanceof ListAst) {
      // visit((ListAst) ast, line, flag);
    }

    System.out.println("Implement: " + ast.getClass());

  }

  public void visit() {
  }

  /**
   * Print out any information about code generation
   */
  public String toString() {
    return buffer.toString();
  }
}
