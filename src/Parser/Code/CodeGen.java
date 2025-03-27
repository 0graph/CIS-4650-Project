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
    } else if (ast instanceof BoolExp) {
      visit((BoolExp) ast, block, offset);
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
    } else if (operation > OpExp.DIV && operation <= OpExp.NOT) { // Comparison

      String op = "";
      switch (operation) {
        case 5: // equal
          op = "JEQ";
          break;
        case 6: // not equal
          op = "JNE";
          break;
        case 7: // less than
          op = "JLT";
          break;
        case 8: // less than or equal
          op = "JLE";
          break;
        case 9: // greater than
          op = "JGT";
          break;
        case 10: // greater than or equal
          op = "JGE";
          break;
        case 11: // not
          op = "JNE";
          break;
        
      }

      // for comparison expressions we have to convert the result to 1 or 0
      // ex. x = y < z
      // SUB y, z, x // subtract z from y store in register x (y < z if x < 0)
      // JLT x, 2 // if x (y - z) < 0, jump to +2
      // LDC 0, x     // store 0 (false) in x
      // LDA 1        // skip the next instruction
      // LDC 1, x     // store 1 (true) in x


      // subtract right from left as RA instructions compare with 0
      code = Instructions.RR("SUB", Instructions.AC, Instructions.AC, Instructions.R1, "Subtract for Comparison");
      addInstruction(code);
      // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it lands on
      // Jump to the next instruction if the result is true
      code = Instructions.RM(op, Instructions.AC, 2, Instructions.PC, "Jump to next instruction if true");
      addInstruction(code);

      // Load 0 (false) to the register
      code = Instructions.RM("LDC", Instructions.AC, 0, Instructions.AC, "Load 0 (false)");
      addInstruction(code);
      // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it lands on
      // Unconditional Jump to skip the true instruction of the result is false
      code = Instructions.RM("LDA", Instructions.PC, 1, Instructions.PC, "Unconditional Jump");
      addInstruction(code);

      // Load 1 (true) to the register
      code = Instructions.RM("LDC", Instructions.AC, 1, Instructions.AC, "Load 1 (true)");
      addInstruction(code);


    } else { // Logical
      // the code is generated inside the switch because AND / OR are special cases
      switch (operation) {
        case 12:  // and (special case)
          // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it lands on
          // if LHS <= 0 JUMP to END
          code = Instructions.RM("JLE", Instructions.AC, 4, Instructions.PC, "Jump to END if LHS <= 0");
          addInstruction(code);
          // if RHS <= 0 JUMP to ZERO
          code = Instructions.RM("JLE", Instructions.R1, 2, Instructions.PC, "Jump to ZERO if RHS <= 0");
          addInstruction(code);
          // LHS = 1
          code = Instructions.RM("LDC", Instructions.AC, 1, Instructions.AC, "LHS = 1");
          addInstruction(code);
          // JUMP to END
          code = Instructions.RM("LDA", Instructions.PC, 1, Instructions.PC, "Jump to END");
          addInstruction(code);
          // ZERO: LHS = 0
          code = Instructions.RM("LDC", Instructions.AC, 0, Instructions.AC, "LHS = 0");
          addInstruction(code);
          // END
            
            break;
        case 13: // or (special case)
          // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it lands on
          // if LHS > 0 JUMP to ONE
          code = Instructions.RM("JGT", Instructions.AC, 3, Instructions.PC, "Jump to ONE if LHS > 0");
          addInstruction(code);
          // if RHS > 0 JUMP to ONE
          code = Instructions.RM("JGT", Instructions.R1, 2, Instructions.PC, "Jump to ONE if RHS > 0");
          addInstruction(code);
          // LHS = 0
          code = Instructions.RM("LDC", Instructions.AC, 0, Instructions.AC, "LHS = 0");
          addInstruction(code);
          // JUMP to END
          code = Instructions.RM("LDA", Instructions.PC, 1, Instructions.PC, "Jump to END");
          addInstruction(code);
          // ONE: LHS = 1
          code = Instructions.RM("LDC", Instructions.AC, 1, Instructions.AC, "LHS = 1");
          addInstruction(code);
          // END:
          break;
        default:
          System.out.println("Unknown Operation: " + operation);
          break;
      }
    }

    // Save actual logic
    addInstruction(code);

    // Store value
    code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, "Store value of expression");
    addInstruction(code);
  }

  /**
   * Visit a boolean expression
   * @param expression The expression
   * @param block The current code block
   * @param offset The offset from the based frame pointer
   */
  public void visit(BoolExp expression, Block block, int offset) {
    String code;
    String comment;

    // convert boolean to integer
    Integer value = expression.value ? 1 : 0;

    // Load Constant to register
    comment = String.format("Loading Constant %b to register %d and save to memory with offset %d", value,
        Instructions.AC, offset);
    buffer.addComment(comment);

    code = Instructions.RM("LDC", Instructions.AC, value, Instructions.AC, "");
    addInstruction(code);

    // Save to Memory
    code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, "");
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
