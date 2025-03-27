/**
 * Create the instructions given the object
 */
public final class Instructions {
  // Global Pointer
  public static final int GP = 6;

  // Function Pointer
  public static final int FP = 5;

  // Program Counter
  public static final int PC = 7;

  // Register 0
  public static final int AC = 0;

  // Register 1
  public static final int R1 = 1;

  /**
   * Create an RR instruction. Example: 1: MUL 6,0,0
   *
   * @param operation The instruction
   * @param r         The register that this instruction is tied to
   * @param s         Parameter
   * @param t         Parameter
   * @param comment   comment
   */
  public static String RR(String operation, int r, int s, int t, String comment) {
    String code = String.format("%s %d,%d,%d %s\n", operation, r, s, t, comment);

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
  public static String RM(String operation, int r, int offset, int address, String comment) {
    String code = String.format("%s %d,%d(%d) %s\n", operation, r, -offset, address, comment);

    return code;
  }

  /**
   * Create an RM instruction with a relative address to the register
   * Example: 1: LD 7, -1(5)
   *
   * @param operation The operation
   * @param register  The register
   * @param address   The target address
   * @param relative  The working register with the offset of the target address
   * @param comment   Comment
   */
  public static String RM_ABS(int line, String operation, int register, int address, int relative, String comment) {

    String code = String.format("%d: %s %d,%d(%d) %s", line, operation, register, address - (line + 1), relative,
        comment);

    return code;
  }
}
