/**
 * Create the instructions given the object
 */
public final class Instructions {
  /**
   * Create an RO instruction. Example: 1: MUL 6,0,0
   *
   * @param line      The line number
   * @param operation The instruction
   * @param r         The register that this instruction is tied to
   * @param s         Parameter
   * @param t         Parameter
   * @param comment   The instruction
   */
  public String RR(int line, String operation, int r, int s, int t, String comment) {
    String code = String.format("%d: %s %d,%d,%d %s\n", line, operation, r, s, t, comment);

    return code;
  }

  /**
   * Create an RM instruction. Example: 1: LD 7,-1(5)
   *
   * @param line      The line number
   * @param operation The instruction
   * @param register  The destination register
   * @param offset    The offset for address
   * @param address   The address in register
   */
  public String RM(int line, String operation, int register, int offset, int address, String comment) {
    String code = String.format("%d: %s %d,%d(%d) %s\n", line, operation, register, offset, address, comment);

    return code;
  }

  /**
   * Create an RM instruction with a relative address to the program counter.
   * Example: 1: LD 7, -1(5)
   *
   * @param line      The line number
   * @param operation The destination register
   * @param register  The offset for address
   * @param address   The address in register
   * @param location  The current instruction location
   * @param pc        The PC counter
   */
  public String RM_ABS(int line, String operation, int register, int address, int location, int pc) {

    String code = String.format("%d: %s %d,%d(%d) %s", line, operation, register, address - (location + 1), pc);

    return code;
  }
}
