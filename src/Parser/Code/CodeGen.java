import Ast.*;

/**
 * Generates the intermediate code based on the symbols parsed
 */
public final class CodeGen implements AstVisitor {

  public int globalOffset; // The global offset in memory
  public int frameOffset; // The frame offset for the next function in memory

  // Buffer for the final file being created
  private Buffer buffer;

  // The current instruction
  private int line = 0;

  // CONTINUE: Add a small symbol table implemention that is a tree that just
  // keeps track of the address of certain instructions.
  // Debating if the blocks function should be used for this or not...

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
      visit((ListAst) ast, block, flag);
      // visit((ListAst) ast, line, flag);
    } else if (ast instanceof FunctionDec) {
      visit((FunctionDec) ast, block, flag);
    } else if (ast instanceof SimpleDec) {
      visit((SimpleDec) ast, block);
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
    // The name of the function
    String name = function.name;

    // Create a new block
    buffer.addComment(String.format("Entering Function Declaration (%s)", name));
    Block functionBlock = block.createNewBlock(name, line);

    // Create Initialize the block
    String code = functionBlock.createInstructionRM("ST", Instructions.AC, Instructions.FP, "store return");
    addInstruction(code);

    /**
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
  public void visit(SimpleDec variable, Block block) {
    // Save the address of the variable within the block and globally
    String name = variable.name;

    try {
      String comment = String.format("Making Space for variable (%s)", name);
      buffer.addComment(comment);
      block.createAddress(name, line);

      updateLineNumber();

    } catch (Exception e) { // This should never ever happen at this stage
      e.printStackTrace();
    }

  }

  /**
   * Add an instruction to the instruction string buffer
   *
   * @param code
   */
  private void addInstruction(String code) {
    line = buffer.addInstruction(code);
  }

  /**
   * Increment the line number
   */
  private void updateLineNumber() {
    line = buffer.updateLineNumber();
  }

  /**
   * Print out any information about code generation
   */
  public String toString() {
    return buffer.toString();
  }
}
