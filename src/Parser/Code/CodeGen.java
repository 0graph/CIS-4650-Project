import Ast.*;

/**
 * Generates the intermediate code based on the symbols parsed
 */
public final class CodeGen implements AstVisitor {
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
    // Create the Global Block
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
  public static void visit(Ast ast, Block block, boolean flag) {
    if (ast instanceof ListAst) {
      visit((ListAst) ast, block, flag);
      // visit((ListAst) ast, line, flag);
    } else if (ast instanceof FunctionDec) {
      visit((FunctionDec) ast, block, flag);
    }

    System.out.println("Implement: " + ast.getClass());

  }

  /**
   * Go through a declaration list
   *
   * @param list  The declaration list
   * @param block The current block for a function
   * @param flag  Flag for info
   */
  public void visit(ListAst list, Block block, boolean flag) {
    ListAst node = list;

    // Visit each component in the list
    while (node != null) {
      Ast ast = node.head;

      if (ast != null) {
        visit(ast, block, flag);
      }

      node = node.tail;
    }
  }

  /**
   * Go through a function declaration
   *
   * @param function The declaration list
   * @param block    The current block for a function
   * @param flag     Flag for info
   */
  public void visit(FunctionDec function, Block block, boolean flag) {
    // Create a new block
    Block functionBlock = new Block();

    /**
     * TODO: Add a way to save the address of the function block for later
     * batckpatching
     *
     * This will also have to be refactored a tad bit.
     * Two scenarios:
     * - This is a function prototype so backpatch by adding the function params
     * later
     * - This is the full function definition so we go through and generate the
     * instructions
     */

    // Add the params to the function block
    visit(function.params, functionBlock, flag);

    // Add the function body to the function block
    visit(function.body, functionBlock, flag);
  }

  /**
   * Go through the declaration of a simple variable expression
   *
   * @param varaible The variable declared
   * @param block    The current block for a function
   * @param flag     Flag for info
   */
  public void visit(SimpleDec variable, Block block, boolean flag) {
    // TODO: Save the address of the variable declaration for later use

    // Increment the offset of where the function body starts at
    block.incrementOffset();

  }

  /**
   * Print out any information about code generation
   */
  public String toString() {
    return buffer.toString();
  }
}
