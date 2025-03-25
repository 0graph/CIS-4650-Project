/**
 * Create the instructions given the object
 */
public final class Instructions {
  /**
   * Create an RO instruction. Example: MUL 6,0,0
   *
   * @param operation The instruction
   * @param r         The register that this instruction is tied to
   * @param s         Parameter
   * @param t         Parameter
   * @param comment   The instruction
   */
  public String RR(String operation, int r, int s, int t, String comment) {
    String code = String.format("%s %d,%d,%d %s\n", operation, r, s, t, comment);

    return code;
  }

  /**
   * Create an RM instruction. Example :LD 7,-1(5)
   *
   * @param operation The instruction
   * @param register  The destination register
   * @param offset    The offset for address
   * @param address   The address in register
   */
  public String RM(String operation, int register, int offset, int address, String comment) {
    String code = String.format("%s %d,%d(%d) %s\n", operation, register, offset, address, comment);

    return code;
  }

  /**
   * Create an RM instruction with a relative address to the program counter
   *
   * @param operation The destination register
   * @param register  The offset for address
   * @param address   The address in register
   * @param location  The current instruction location
   * @param pc        The PC counter
   */
  public String RM_ABS(String operation, int register, int address, int location, int pc) {

    String code = String.format("%s %d,%d(%d) %s", operation, register, address - (location + 1), pc);

    return code;
  }
}
