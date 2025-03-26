/**
 * The frame for a function in the stack
 */
public class Block {
  // The current offset given the instructions that have been
  private int offset;

  /**
   * Create a new frame with the offsets
   *
   * @param address        The current address for this frame
   * @param oldFrameOffset The previous frame offset
   * @param returnAddress  The return address for the caller
   */
  public Block(int line, int oldFrameOffset, int returnAddress) {
    this.offset = -1;

    // Add the return instruction
    addInstructionRM("ST", Instructions.AC, Instructions.FP, "store return");
  }

  /**
   * Add an RO instruction to the current file buffer
   *
   * @param operation The instruction
   * @param r         The register that this instruction is tied to
   * @param s         Parameter
   * @param t         Parameter
   * @param comment   comment
   *
   */
  public String addInstructionRR(String operation, int r, int s, int t, String comment) {
    String code = Instructions.RR(CodeGen.LINENUM, operation, r, s, t, comment);

    updateLineNumber();

    return code;
  }

  /**
   * Create an RM instruction. Example: 1: LD 7,-1(5)
   *
   * @param operation The instruction
   * @param r         The destination register
   * @param offset    The offset for address
   * @param address   The address in register
   * @param comment   comment
   */
  public String addInstructionRM(String operation, int r, int offset, int address, String comment) {
    String code = Instructions.RM(CodeGen.LINENUM, operation, r, offset, address, comment);

    updateLineNumber();

    return code;
  }

  /**
   * Create an RM instruction with a RELATIVE address to the block of code
   * Example: 1: LD 7, -1(5)
   *
   * @param operation The operation
   * @param register  The register
   * @param address   The target address
   * @param comment   Comment
   */
  public String addInstructionRM(String operation, int register, int address, String comment) {
    String code = Instructions.RM_ABS(CodeGen.LINENUM, operation, register, address, offset, comment);

    updateLineNumber();

    return code;
  }

  /**
   * Get the offset for the frame
   */
  public int getOffset() {
    return offset;
  }

  /**
   * Update the line number based on the instruction given
   */
  private void updateLineNumber() {
    offset++;

    ++CodeGen.LINENUM;
    if (CodeGen.MAXLINENUM < CodeGen.LINENUM) {
      CodeGen.MAXLINENUM = CodeGen.LINENUM;
    }
  }

}
