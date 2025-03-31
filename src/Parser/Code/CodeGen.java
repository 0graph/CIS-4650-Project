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

  // Create the global block that contains everything
  private Block block;

  /**
   * Setup runtime environment for code
   */
  public CodeGen(String file) {
    this.globalOffset = 0;
    this.frameOffset = this.globalOffset;

    String name = getFileNameOnly(file);
    this.buffer = new Buffer(name);
    this.block = new Block();

    // Since this is the global block we don't want any preset offsets
    block.setOffset(0);
  }

  /**
   * Compile the code given
   */
  public void compile(Ast ast) {
    String code;
    int[] savedLine = new int[] { 0, 0 }; // The saved lines for backpatching
    int line = 0;

    // Generate the prelude for the code
    prelude();

    // Back patch current line
    savedLine[0] = buffer.skipLines(1);

    ioSetup();

    // Back patch
    savedLine[1] = buffer.skipLines(0);
    line = buffer.lineBackup(savedLine[0]);
    code = Instructions.RM_ABS("LDA", Instructions.PC, line, savedLine[1], Instructions.PC, "Jump around i/o code");
    addInstruction(code);
    buffer.lineRestore();

    savedLine[0] = buffer.skipLines(1);

    visit(ast, block, false, 0);

    // Back patch
    savedLine[1] = buffer.skipLines(0);
    line = buffer.lineBackup(savedLine[0]);
    code = Instructions.RM_ABS("LDA", Instructions.PC, line, savedLine[1], Instructions.PC,
        "Jump around function bodies");
    addInstruction(code);
    buffer.lineRestore();

    finale();
  }

  /**
   * Setup the code for input/output functions
   */
  public void ioSetup() {
    String code;
    // I/O instructions
    // INPUT
    buffer.addComment("code for input routine");

    // Create an address for this variable in this scope

    // add function address for input
    block.createNewBlock("input", line + 1);

    code = Instructions.RM("ST", Instructions.AC, 1, Instructions.FP, "Store return");
    addInstruction(code);

    code = Instructions.RR("IN", Instructions.AC, 0, 0, "Read integer value");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.PC, 1, Instructions.FP, "return to caller");
    addInstruction(code);

    // OUTPUT
    buffer.addComment("code for output routine");

    // add function address for output
    block.createNewBlock("output", line);

    // Create an address for this variable in this scope
    code = Instructions.RM("ST", Instructions.AC, 1, Instructions.FP, "Store return");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.AC, 2, Instructions.FP, "Load value to output");
    addInstruction(code);

    code = Instructions.RR("OUT", Instructions.AC, 0, 0, "Output integer value");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.PC, 1, Instructions.FP, "return to caller");
    addInstruction(code);
    // END I/O
  }

  /**
   * Generate the prelude for the code
   * it's the standard code that is generated at the start of the file
   */
  public void prelude() {
    String code;
    buffer.addComment("Standard Prelude");

    // PRELUDE
    code = Instructions.RM("LD", Instructions.GP, 0, Instructions.AC, "Load the global pointer with max address");
    addInstruction(code);

    code = Instructions.RM("LDA", Instructions.FP, 0, Instructions.GP, "Load the frame pointer");
    addInstruction(code);

    code = Instructions.RM("ST", Instructions.AC, 0, Instructions.AC, "Clear Location 0");
    addInstruction(code);
    // END PRELUDE

    buffer.addComment("End Standard Prelude");
  }

  /**
   * Generate the final part of the program
   */
  private void finale() {
    Integer[] main = block.getSymbolAddress("main");
    String code;
    buffer.addComment("--- Final ---");

    code = Instructions.RM("ST", Instructions.FP, block.getOffset(), Instructions.FP, "Original Pointer");
    addInstruction(code);

    code = Instructions.RM("LDA", Instructions.FP, block.getOffset(), Instructions.FP, "Push Main Frame Pointer");
    addInstruction(code);

    code = Instructions.RM("LDA", Instructions.AC, -1, Instructions.PC, "Load Accumulator with return pointer");
    addInstruction(code);

    code = Instructions.RM_ABS("LDA", Instructions.PC, line, main[0], Instructions.PC, "Jump to Location");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.FP, 0, Instructions.FP, "Pop Main Frame");
    addInstruction(code);

    code = Instructions.RR("HALT", 0, 0, 0, "Exit");
    addInstruction(code);

    buffer.addComment("--- Final ---");
    // END PRELUDE
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
      visit((ListAst) ast, block, offset);
    } else if (ast instanceof FunctionDec) {
      visit((FunctionDec) ast, block);
    } else if (ast instanceof SimpleDec) {
      visit((SimpleDec) ast, block);
    } else if (ast instanceof CompoundExp) {
      visit((CompoundExp) ast, block, offset);
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
    } else if (ast instanceof BoolExp) {
      visit((BoolExp) ast, block, offset);
    } else if (ast instanceof IfExp) {
      visit((IfExp) ast, block, offset);
    } else if (ast instanceof WhileExp) {
      visit((WhileExp) ast, block, offset);
    } else if (ast instanceof ReturnExp) {
      visit((ReturnExp) ast, block, offset);
    } else if (ast instanceof NilExp) {
      return;
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
  public void visit(ListAst list, Block block, int offset) {
    ListAst node = list;

    // Visit each component in the list
    while (node != null) {
      Ast ast = node.head;

      if (ast != null) {
        visit(ast, block, false, offset);
      }

      node = node.tail;
    }
  }

  /**
   * Go through a function declaration
   *
   * @param function The declaration list
   * @param block    The current block for a function
   */
  public void visit(FunctionDec function, Block block) {
    // Verify that this is not a function prototype
    if (function.body instanceof NilExp) {
      return;
    }

    // The name of the function
    String code;
    String name = function.name;

    // Create a new block
    buffer.addComment(String.format("--- Function Declaration (%s) ---", name));
    // Initialize the block
    code = Instructions.RM("ST", Instructions.AC, 1, Instructions.FP, "Store return");
    addInstruction(code);

    /**
     * TODO: Find a way to backpatch a function prototype so that we can link and
     * keep
     * track of where the other instructions for this function is at
     *
     * TODO: Fix the semantic analyzer given an error when an array is being used
     * properly (this is what we will use to make sure that our program is correct)
     *
     * This might take some tinkering to do
     */
    Block functionBlock = block.createNewBlock(name, line - 1);

    /**
     * This will also have to be refactored a tad bit.
     * Two scenarios:
     * - This is a function prototype so backpatch by adding the function params
     * later
     * - This is the full function definition so we go through and generate the
     * instructions
     */

    // Add the params to the function block
    visit(function.params, functionBlock, functionBlock.getOffset());

    // Visit the declarations first
    visit(((CompoundExp) function.body).decs, functionBlock,
        functionBlock.getOffset());

    // Visit the actual calls
    visit(((CompoundExp) function.body).exps, functionBlock,
        functionBlock.getOffset());

    // Return to caller
    code = Instructions.RM("LD", Instructions.PC, 1, Instructions.FP, "Return to caller");
    addInstruction(code);

    buffer.addComment(String.format("--- Function Declaration (%s) ---", name));
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
  public void visit(CompoundExp expression, Block block, int offset) {
    // There are declarations here
    if (expression.decs != null) {
      visit(expression.decs, block, offset);
    }

    // Go through both
    if (expression.exps != null) {
      visit(expression.exps, block, offset);
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
    Integer[] symbol = block.getSymbolAddress(name);

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

    code = Instructions.RR("SUB", Instructions.AC, Instructions.AC, Instructions.R1,
        "Substract the offset to the address");
    addInstruction(code);

    // Load the Address to the position in memory
    if (address) {
      comment = String.format("Store the address given the index at offset %d", offset);

      code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, comment);
      addInstruction(code);
    } else { // Used as part of an expression in the right hands side
      comment = String.format("Load the value at the %s[index] address to the AC", name);
      code = Instructions.RM("LD", Instructions.AC, 0, Instructions.AC, comment);
      addInstruction(code);

      comment = String.format("Value of %s[index]", name);
      code = Instructions.RM("ST", Instructions.AC, offset, pointer, comment);
      addInstruction(code);
    }
  }

  /**
   * Visit a return expression
   * 
   * @param exp    The expression
   * @param block  The current code block
   * @param offset The offset
   */
  public void visit(ReturnExp exp, Block block, int offset) {
    String code;
    String comment;

    buffer.addComment("--- Return Expression ---");
    // Load the return value to the accumulator
    visit(exp.exp, block, false, offset + 1);

    // code = Instructions.RM("LD", Instructions.R1, 1, Instructions.FP, "Load
    // return address");
    code = Instructions.RM("LD", Instructions.R1, 0, Instructions.AC, "Save value from return expression");
    addInstruction(code);

    code = Instructions.RM("LD", Instructions.PC, 1, Instructions.FP, "Return to caller");
    addInstruction(code);

    buffer.addComment("--- Return Expression ---");
  }

  /**
   * Visit a while expression
   * 
   * @param exp    The expression
   * @param block  The current code block
   * @param offset The offset
   */
  public void visit(WhileExp exp, Block block, int offset) {
    String code;
    String comment;

    Integer[] savedLines = new Integer[] { 0, 0, 0 };

    Exp test = exp.test;
    Exp body = exp.body;

    buffer.addComment("--- While Expression ---");

    // setup the inner instructions
    savedLines[0] = buffer.skipLines(0);
    visit(test, block, false, offset + 1);
    savedLines[1] = buffer.skipLines(2);
    visit(body, block, false, offset + 2);
    savedLines[2] = buffer.skipLines(0);

    code = Instructions.RM("LDA", Instructions.PC, line - savedLines[0] - 1, Instructions.PC,
        "Jump to test after body");
    addInstruction(code);
    int bodyLineEnd = line;

    // While Steps:
    // TEST: ... // result should be in register 0
    // JLE 0, END // Jump to end if test <= 0 (false)
    // body ...
    // LDA TEST // Jump to test always after body
    // END: ... // End of the while loop (after condition is false)

    // Load the test value
    comment = String.format("Load the test value to register %d", Instructions.AC);
    buffer.addComment(comment);

    buffer.lineBackup(savedLines[1]); // place testing code before the body

    code = Instructions.RM("LD", Instructions.AC, offset + 1, Instructions.FP, "Load test value");
    addInstruction(code);

    // Jump to the end if the test is false
    code = Instructions.RM("JLE", Instructions.AC, line - savedLines[2], Instructions.PC,
        "Jump to end if test <= 0 (false)");
    addInstruction(code);

    buffer.lineRestore();
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

    buffer.addComment("--- Operation Expression ---");

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
      // LDC 0, x // store 0 (false) in x
      // LDA 1 // skip the next instruction
      // LDC 1, x // store 1 (true) in x

      // subtract right from left as RA instructions compare with 0
      code = Instructions.RR("SUB", Instructions.AC, Instructions.AC, Instructions.R1, "Subtract for Comparison");
      addInstruction(code);
      // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it
      // lands on
      // Jump to the next instruction if the result is true
      code = Instructions.RM(op, Instructions.AC, -2, Instructions.PC, "Jump to next instruction if true");
      addInstruction(code);

      // Load 0 (false) to the register
      code = Instructions.RM("LDC", Instructions.AC, 0, Instructions.AC, "Load 0 (false)");
      addInstruction(code);

      // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it
      // lands on
      // Unconditional Jump to skip the true instruction of the result is false
      code = Instructions.RM("LDA", Instructions.PC, -1, Instructions.PC, "Unconditional Jump");
      addInstruction(code);

      // Load 1 (true) to the register
      code = Instructions.RM("LDC", Instructions.AC, -1, Instructions.AC, "Load 1 (true)");

    } else { // Logical
      // the code is generated inside the switch because AND / OR are special cases
      switch (operation) {
        case 12: // and (special case)
          // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it
          // lands on
          // if LHS <= 0 JUMP to END
          code = Instructions.RM("JLE", Instructions.AC, -4, Instructions.PC, "Jump to END if LHS <= 0");
          addInstruction(code);
          // if RHS <= 0 JUMP to ZERO
          code = Instructions.RM("JLE", Instructions.R1, -2, Instructions.PC, "Jump to ZERO if RHS <= 0");
          addInstruction(code);
          // LHS = 1
          code = Instructions.RM("LDC", Instructions.AC, -1, Instructions.AC, "LHS = 1");
          addInstruction(code);
          // JUMP to END
          code = Instructions.RM("LDA", Instructions.PC, -1, Instructions.PC, "Jump to END");
          addInstruction(code);
          // ZERO: LHS = 0
          code = Instructions.RM("LDC", Instructions.AC, 0, Instructions.AC, "LHS = 0");
          // END
          break;

        case 13: // or (special case)
          // NOTE: for Jump OPs the offset may be wrong I assumed it skips the one it
          // lands on
          // if LHS > 0 JUMP to ONE
          code = Instructions.RM("JGT", Instructions.AC, -3, Instructions.PC, "Jump to ONE if LHS > 0");
          addInstruction(code);
          // if RHS > 0 JUMP to ONE
          code = Instructions.RM("JGT", Instructions.R1, -2, Instructions.PC, "Jump to ONE if RHS > 0");
          addInstruction(code);
          // LHS = 0
          code = Instructions.RM("LDC", Instructions.AC, 0, Instructions.AC, "LHS = 0");
          addInstruction(code);
          // JUMP to END
          code = Instructions.RM("LDA", Instructions.PC, -1, Instructions.PC, "Jump to END");
          addInstruction(code);
          // ONE: LHS = 1
          code = Instructions.RM("LDC", Instructions.AC, -1, Instructions.AC, "LHS = 1");
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

    buffer.addComment("--- Operation Expression ---");
  }

  /**
   * Visit a boolean expression
   * 
   * @param expression The expression
   * @param block      The current code block
   * @param offset     The offset from the based frame pointer
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

    buffer.addComment(comment);
    buffer.addComment("Offset: " + offset);

    // Check for arguments using a for loop since we need to know how many arguments
    // we are passing it
    int initialOffset = 2; // We know the second instruction is the return address
    ListAst node = arguments;
    Ast expression;
    while (node != null) {
      expression = node.head;
      if (expression != null) {
        comment = String.format("Adding argument %d", initialOffset - 1);
        buffer.addComment(comment);

        visit(expression, block, false, offset + 1);

        // TODO: This part still needs cleaning
        // Create the instructions to include the arguments
        // This one works for arrays
        code = Instructions.RM("ST", Instructions.AC, offset + initialOffset - 1,
            Instructions.FP, "Storing argument");
        // This one works for normal variables
        // code = Instructions.RM("ST", Instructions.AC, offset + initialOffset,
        // Instructions.FP, "Storing argument");
        addInstruction(code);
      }

      node = node.tail;
      initialOffset++;
    }

    buffer.addComment("Create new activation record");

    // Save the address of the current frame pointer
    comment = String.format("Save address of current frame pointer to memory with offset %d", offset + level);
    // code = Instructions.RM("ST", Instructions.FP, offset + level,
    // Instructions.FP, comment);
    code = Instructions.RM("ST", Instructions.FP, offset, Instructions.FP, comment);
    addInstruction(code);

    // load the frame pointer to push stack
    comment = String.format("Load the frame pointer so that it starts at offset %d", offset);
    code = Instructions.RM("LDA", Instructions.FP, offset, Instructions.FP, comment);
    addInstruction(code);

    // Save the return address to the accumulator
    comment = String.format("Save the return address in the accumulator");
    code = Instructions.RM("LDA", Instructions.AC, -1, Instructions.PC, comment);
    addInstruction(code);

    // Jump to instruction
    comment = String.format("Jump to %s()", name);
    code = Instructions.RM_ABS("LDA", Instructions.PC, line, address, Instructions.PC, comment);
    addInstruction(code);

    // Pop the frame once we are done
    comment = String.format("Pop the frame and return to the current frame");
    code = Instructions.RM("LD", Instructions.FP, 0, Instructions.FP, comment);
    addInstruction(code);

    // Store result from 0 to offset

    // Load the return value to the accumulator
    // comment = String.format("Load the return value to the accumulator");
    // code = Instructions.RM("LD", Instructions.AC, 2, Instructions.FP, comment);
    // addInstruction(code);

    // Store the return value to the address
    code = Instructions.RM("ST", Instructions.AC, offset, Instructions.FP, "Store return value"); // NOTE: This is a bit
                                                                                                  // sus I don''t know
                                                                                                  // if we need levels'
    addInstruction(code);

    comment = String.format("--- Calling %s() ---", name);
    buffer.addComment(comment);

  }

  /**
   * Visit an if statement and check the boolean expresion inside
   *
   * @param expression
   * @param block      the current block
   * @param offset     The offset in the code block
   */
  public void visit(IfExp expression, Block block, int offset) {
    String code;
    String comment;

    Exp test = expression.test;
    Exp body = expression.then;
    Exp _else = expression._else;

    Integer[] savedLines = new Integer[] { 0, 0 }; // Used for backpatching

    buffer.addComment("--- If Expression ---");

    // Evaluate the test first
    visit(test, block, false, offset + 1);

    // Evaluate the inside first and backpatch the equality
    savedLines[0] = buffer.skipLines(1);

    visit(body, block, false, offset + 1);

    savedLines[1] = buffer.skipLines(0);
    int backupLine = buffer.lineBackup(savedLines[0]);

    comment = String.format("if false jump %d instructions", savedLines[1] - (backupLine + 1));
    code = Instructions.RM_ABS("JEQ", Instructions.AC, backupLine, savedLines[1], Instructions.PC, comment);
    addInstruction(code);
    buffer.lineRestore();

    // Jump to the end of the expression
    savedLines[0] = buffer.skipLines(1);

    // Visit the else
    if (_else != null) {
      visit(_else, block, false, offset + 2);
    }

    savedLines[1] = buffer.skipLines(0);
    backupLine = buffer.lineBackup(savedLines[0]);

    code = Instructions.RM_ABS("LDA", Instructions.PC, backupLine, savedLines[1], Instructions.PC, "jump around body");
    addInstruction(code);
    buffer.lineRestore();

    buffer.addComment("--- If Expression ---");
  }

  /**
   * Generate the file based on the text buffered
   * 
   * @param directory
   */
  public void generateFile(String directory) {
    buffer.generateFile(directory);
  }

  /*
   * Add an instruction to the instruction string buffer
   * 
   * @param code
   */
  private void addInstruction(String code) {
    line = buffer.addInstruction(code);
  }

  /**
   * Get the name of the file only and strip out all other information
   *
   * @param fileName The complete filename
   */
  private String getFileNameOnly(String fileName) {
    String name = fileName;

    // Get the last directory index
    int slashIndex = name.lastIndexOf('/');
    if (slashIndex != -1) {
      name = name.substring(slashIndex + 1);
    }

    // Get the filetype extension removed
    int lastDotIndex = name.lastIndexOf('.');
    if (lastDotIndex != -1) {
      // Remove the trailing extension
      name = name.substring(0, lastDotIndex);
    }

    // Any extra dots
    int innerDotIndex = name.lastIndexOf('.');
    if (innerDotIndex != -1) {
      name = name.substring(innerDotIndex + 1);
    }

    return name;
  }

  /**
   * Print out any information about code generation
   */
  public String toString() {
    return buffer.toString();
  }
}
