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
      visit((OpExp) ast, block, offset);
    } else if (ast instanceof AssignExp) {
      visit((AssignExp) ast, block, offset);
    } else if (ast instanceof SimpleVar) {
      visit((SimpleVar) ast, block, flag, offset);
    } else if (ast instanceof IntExp) {
      visit((IntExp) ast, block, offset);
    } else if (ast instanceof ArrayDec) {
      visit((ArrayDec) ast, block);
    } else if (ast instanceof IndexVar) {
      visit((IndexVar) ast, block, flag, offset);
    } else if (ast instanceof CallExp) {
      visit((CallExp) ast, block, offset);
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
   * @param variable The variable declared
   * @param block    The current block for a function
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
   * Declare an array in the program
   *
   * @param variable The index variable
   * @param block    The current block
   */
  public void visit(ArrayDec variable, Block block) {
    // Store the position based on the length of the variable
    String name = variable.name;
    Integer size = variable.size;

    try {
      String comment = String.format("Making space for array variable (%s[%d])", name, size);
      buffer.addComment(comment);

      // Check if the variable is global or local
      int pointer = block.outerScope == null ? Instructions.GP : Instructions.FP;

      // Create an address for this variable in this scope
      block.createAddress(name, pointer, size);
    } catch (Exception e) { // This should never happen
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
    String code;
    String comment = String.format("Store back the result of the assignment operation");

    VarExp left = expression.lhs;
    Exp right = expression.rhs;

    buffer.addComment("--- Assignment Expression ---");

    // Assign Expression to address
    visit(left, block, true, offset + 1);

    // Visit the expression first
    visit(right, block, false, offset + 2);

    // Assign Value to Address
    buffer.addComment(comment);
    code = Instructions.RM("LD", Instructions.AC, offset + 1, Instructions.FP,
        "Load to memory the address and result value");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.R1, offset + 2, Instructions.FP, "");
    addInstruction(code);

    code = Instructions.RM("ST", Instructions.R1, 0, Instructions.AC, "");
    addInstruction(code);

    code = Instructions.RM("ST", Instructions.R1, offset, Instructions.FP, "Value Stored!");
    addInstruction(code);

    buffer.addComment("--- Assignment Expression ---");
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
    String name = variable.name;

    String code;
    String comment;

    // Get address location
    Integer[] symbol = block.getSymbolAddressInScope(name);

    // Load the address
    if (address) {
      // Create the instructions for loading the symbol address
      comment = String.format("Load address for var (%s)", name);
      code = Instructions.RM("LDA", Instructions.AC, symbol[0], symbol[1], comment);
      addInstruction(code);

      // Create the instruction to read the effective address and save it to the part
      // of memory
      comment = String.format("&%s", name);
      code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, comment);
      addInstruction(code);
    } else { // Right hand side variable
      comment = String.format("Value of %s", name);
      code = Instructions.RM("LD", Instructions.AC, symbol[0], symbol[1], comment);
      addInstruction(code);

      code = Instructions.RM("ST", Instructions.AC, offset, symbol[1], "");
      addInstruction(code);
    }
  }

  /**
   * Visiting an index of an array variable
   *
   * @param variable The array variable
   * @param block    The current code block
   * @param address  Whether this is in the assignment part
   * @param offset   The offet to the frame which is being dealt here
   */
  public void visit(IndexVar variable, Block block, boolean address, int offset) {
    String name = variable.name;
    Exp index = variable.index;

    String code;
    String comment;

    // Get the base address of the array
    Integer[] symbol = block.getSymbolAddress(name);
    Integer base = symbol[0];
    Integer pointer = symbol[1];

    // Get the value for the index that will be updated
    visit(index, block, false, offset + 1);

    // Add the Index to a register to then calculate the offset of the array index
    comment = String.format(
        "Load index calculated at offset %d and base address of array %s[] and save it to offset %d",
        offset + 1, name, offset);
    buffer.addComment(comment);

    code = Instructions.RM("LDA", Instructions.AC, base, pointer, "Load address to register");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.R1, offset + 1, Instructions.FP, "Load index value to register");
    addInstruction(code);

    code = Instructions.RR("ADD", Instructions.AC, Instructions.AC, Instructions.R1, "Add the offset to the address");
    addInstruction(code);

    // Load the Address to the position in memory
    if (address) {
      comment = String.format("Store the address given the index at offset %d", offset);

      code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, comment);
      addInstruction(code);
    } else { // Used as part of an expression in the right hands side
      comment = String.format("Value of %s[index]", name);

      code = Instructions.RM("ST", Instructions.AC, offset, pointer, comment);
      addInstruction(code);
    }
  }

  /**
   * Visit an expression
   *
   * @param expression The expression
   * @param block      The current code block
   * @param offset     The offset
   */
  public void visit(OpExp expression, Block block, int offset) {
    String code;
    String comment;

    Exp left = expression.lhs;
    Exp right = expression.rhs;
    int operation = expression.Op;

    // Setup the instructions necessary
    visit(left, block, false, offset + 1);
    visit(right, block, false, offset + 2);

    // Save the result to the address of the left side
    comment = String.format("Save the result of the operation expression to the address offset %d", offset);

    // Load Value of left
    buffer.addComment(comment);
    code = Instructions.RM("LD", Instructions.AC, offset + 1, Instructions.FP, "Load Left hand side");
    addInstruction(code);

    // Load value of right
    code = Instructions.RM("LD", Instructions.R1, offset + 2, Instructions.FP, "Load Right hand side");
    addInstruction(code);

    if (operation <= OpExp.DIV) { // Arithmetic
      String op = "";
      switch (operation) {
        case 0: // add
          op = "ADD";
          break;
        case 1: // subtract
          op = "SUB";
          break;
        case 2: // negate
          break;
        case 3: // multiplication
          op = "MUL";
          break;
        case 4: // div
          op = "DIV";
          break;
      }

      code = Instructions.RR(op, Instructions.AC, Instructions.AC, Instructions.R1, "Operation");
    } else {
    }

    // Save actual logic
    addInstruction(code);

    // Store value
    code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, "Store value of expression");
    addInstruction(code);
  }

  /**
   * Visit a number
   *
   * @param expression The expression
   * @param block      The current code block
   * @param offset     The offset from the based frame pointer
   */
  public void visit(IntExp expression, Block block, int offset) {
    // Note: Since the instruction already does the negative of a value, we have to
    // do a negative sign again
    String code;
    Integer value = expression.value;

    // Load Constant to register
    String comment = String.format("Loading Constant %d to register %d and save to memory with offset %d", value,
        Instructions.AC, offset);
    buffer.addComment(comment);
    code = Instructions.RM("LDC", Instructions.AC, -value, Instructions.AC, "");
    addInstruction(code);

    // Save to Memory
    code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, "");
    addInstruction(code);
  }

  /**
   * Call a function from inside a code block: input()
   *
   * @param call   The calling expression
   * @param block  The current block of code
   * @param offset the offset to which this starts at
   * @param level  The current level of nesting within calls (note that calls can
   *               nest and have sub-levels)
   */
  public void visit(CallExp call, Block block, int offset) {
    int level = block.getNestingLevel();

    block.incrementNestingLevel(offset); // Increment the nesting level for subsequent cals

    String name = call.func;
    ExpList arguments = call.args;

    String code;
    String comment = String.format("--- Calling %s() ---", name);

    Integer[] symbol = block.getSymbolAddress(name);
    Integer address = symbol[0];
    Integer pointer = symbol[1];

    buffer.addComment(comment);

    // Check for arguments
    visit(arguments, block, false, offset + 1);

    // Save the address of the current frame pointer
    comment = String.format("Save address of current frame pointer to memory with offset %d", offset + level);
    code = Instructions.RM("ST", Instructions.FP, offset + level, Instructions.FP, comment);
    addInstruction(code);

    // load the frame pointer to push stack
    comment = String.format("Load the frame pointer so that it starts at offset %d", offset);
    code = Instructions.RM("LDA", Instructions.FP, offset, Instructions.FP, comment);
    addInstruction(code);

    // Save the return address to the accumulator
    comment = String.format("Save the return address in the accumulator");
    code = Instructions.RM("LDA", Instructions.AC, 1, Instructions.PC, comment);
    addInstruction(code);

    // Jump to instruction
    comment = String.format("Jump to %s()", name);
    code = Instructions.RM_ABS("LDA", Instructions.PC, line + 1, address, Instructions.PC, comment);
    addInstruction(code);

    // Pop the frame once we are done
    comment = String.format("Pop the frame and return to the current frame");
    code = Instructions.RM("LD", Instructions.FP, level, Instructions.PC, comment);
    addInstruction(code);

    comment = String.format("--- Calling %s() ---", name);
    buffer.addComment(comment);

  }

  /*
   * Add an
   * instruction to
   * the instruction
   * string buffer**
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
