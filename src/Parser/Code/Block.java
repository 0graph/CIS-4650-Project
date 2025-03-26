import java.util.HashMap;

/**
 * The block for a function in the instruction space
 */
public class Block {
  // The address of this block in memory
  private int address;

  // The current offset given the instructions that have been
  private int offset = -1;

  /**
   * Create a new block with the offsets
   */
  public Block() {
    this.address = 0;

    // Add the return instruction
    // addInstructionRM("ST", Instructions.AC, Instructions.FP, "store return");
  }

  public Block(int address) {
    this.address = address;
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
  public String createInstructionRR(String operation, int r, int s, int t, String comment) {
    String code = Instructions.RR(operation, r, s, t, comment);

    incrementOffset();

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
  public String createInstructionRM(String operation, int r, int offset, int address, String comment) {
    String code = Instructions.RM(operation, r, offset, address, comment);

    incrementOffset();

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
  public String createInstructionRM(String operation, int register, int address, String comment) {
    String code = Instructions.RM(operation, register, offset, address, comment);

    incrementOffset();

    return code;
  }

  /**
   * Get the offset for the block
   */
  public int getOffset() {
    return offset;
  }

  /**
   * Increment the offset of the block by one
   */
  public void incrementOffset() {
    offset++;
  }

  /**
   * Create an address for this symbol relative to this block (frame pointer)
   */
  public void createLocalAddress(String symbol) throws Exception {

  }

  // Continue from here:
  // You need to create a seperate
  /**
   * Create a global address for the symbol (line number)
   */
  public void createGlobalAddress(String symbol) throws Exception {
  }
}
