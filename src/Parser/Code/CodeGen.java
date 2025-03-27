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

    visit(ast, block, false, 0);
  }

  /**
   * Generic visitor for ast
   *
   * @param ast   The ast we are traversing through
   * @param block The line number
   * @param flag  Whether the expression is an address or not
   */
  public void visit(Ast ast, Block block, boolean flag, int offset) {
    if (ast instanceof ListAst) {
      visit((ListAst) ast, block);
      // visit((ListAst) ast, line, flag);
    } else if (ast instanceof FunctionDec) {
      visit((FunctionDec) ast, block);
    } else if (ast instanceof SimpleDec) {
      visit((SimpleDec) ast, block);
    } else if (ast instanceof CompoundExp) {
      visit((CompoundExp) ast, block);
    } else if (ast instanceof VarExp) {
      visit((VarExp) ast, block, flag, offset);
    } else if (ast instanceof OpExp) {
      visit((OpExp) ast, block);
    } else if (ast instanceof AssignExp) {
      visit((AssignExp) ast, block, offset);
    } else if (ast instanceof SimpleVar) {
      visit((SimpleVar) ast, block, flag, offset);
    } else {
      System.out.println("Implement: " + ast.getClass());
    }
  }

  /**
   * Go through a declaration list
   *
   * @param list  The declaration list
   * @param block The current block for a function
   * @param flag  Flag for info
   */
  public void visit(ListAst list, Block block) {
    ListAst node = list;

    // Visit each component in the list
    while (node != null) {
      Ast ast = node.head;

      if (ast != null) {
        visit(ast, block, false, block.getOffset());
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
  public void visit(FunctionDec function, Block block) {
    // The name of the function
    String name = function.name;

    // Create a new block
    buffer.addComment(String.format("Entering Function Declaration (%s)", name));
    Block functionBlock = block.createNewBlock(name, line);

    // Initialize the block
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
    visit(function.params, functionBlock);

    // Add the function body to the function block
    visit(function.body, functionBlock, true, block.getOffset());
  }

  /**
   * Go through the declaration of a simple variable expression
   *
   * @param varaible The variable declared
   * @param block    The current block for a function
   * @param flag     Flag for info
   */
  public void visit(SimpleDec variable, Block block) {
    // Save the address of the variable within the block
    String name = variable.name;

    try {
      String comment = String.format("Making Space for variable (%s)", name);
      buffer.addComment(comment);

      // Check if the variable is global or local
      int pointer = block.outerScope == null ? Instructions.GP : Instructions.FP;

      // Create an address for this variable in this scope
      block.createAddress(name, pointer);

    } catch (Exception e) { // This should never ever happen at this stage
      e.printStackTrace();
    }

  }

  /**
   * Go through a group of expressions that contains the declaration lists and all
   * other things
   *
   * @param expression The Complete expression
   * @param block      The current code block
   */
  public void visit(CompoundExp expression, Block block) {
    // There are declarations here
    if (expression.decs != null) {
      visit(expression.decs, block);
    }

    // Go through both
    if (expression.exps != null) {
      visit(expression.exps, block);
    }
  }

  /**
   * Visit an assignment: x = 10;
   *
   * @param expression The expression
   * @param block      The current code block
   * @param offset     The offset from the frame pointer that this operation takes
   *                   place in
   */
  public void visit(AssignExp expression, Block block, int offset) {
    VarExp left = expression.lhs;
    Exp right = expression.rhs;

    buffer.addComment("Creating Assignment Expression...");

    // Visit the expression first
    visit(right, block, false, offset + 2);

    // Assign Expression to address
    visit(left, block, true, offset + 1);
  }

  /**
   * The var expression that contains a reference to the variable it wants to use
   * 
   * @param expression The expression
   * @param block      The current scope
   * @param address    Whether this expression refers to an address
   * @param offset     The offset relative to the start of the block
   */
  public void visit(VarExp expression, Block block, boolean address, int offset) {
    visit(expression.variable, block, address, offset);
  }

  /**
   * Check for the variable being used and retrieve the address location
   *
   * @param variable The variable
   * @param block    the current scope
   * @param address  The address
   * @param offset   the offset
   */
  public void visit(SimpleVar variable, Block block, boolean address, int offset) {
    String code;
    String comment;

    String name = variable.name;

    // Load the address
    if (address) {
      // Get address location
      Integer[] symbol = block.getSymbolAddressInScope(name);

      // Create the instructions for loading the symbol address
      comment = String.format("Load address for var (%s)", name);
      code = block.createInstructionRM("LDA", Instructions.AC, symbol[0], symbol[1], comment);
      addInstruction(code);

      // Create the instruction to read the effective address and save it to the part
      // of memory
      comment = String.format("&%s", name);
      code = block.createInstructionRM("ST", Instructions.AC, offset, Instructions.FP, comment);
      addInstruction(code);
    }
  }

  /**
   * Visit an assignment: x = 10;
   *
   * @param expression The expression
   * @param block      The current code block
   */
  public void visit(OpExp expression, Block block) {
    Exp left = expression.lhs;
    Exp right = expression.rhs;

    // visit(right, block, false);
    // visit(left, block, false);

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
