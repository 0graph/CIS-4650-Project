import java.io.File;

/**
 * The file that has all of the code instructions being generated in an internal
 * buffer
 */
public class Buffer {
  private String name;
  private StringBuilder buffer;

  /**
   * Create a new file
   *
   * @param name The name of the file to create
   */
  public Buffer(String name) {
    this.name = name;

    // Generate the buffer that contains the whole file in memory
    this.buffer = new StringBuilder();
  }

  /**
   * Add the instruction to the file and return the updated line number
   * Example: 1: ADD 7,-1,0
   * 
   * @param currentLine The current line number
   * @param operation   The instruction
   * @param r           Working Register
   * @param s           Parameter
   * @param t           Parameter
   * @param comment     Random comment
   * @return The new line number for the next instruction
   */
  public int addInstructionRR(int currentLine, String operation, int r, int s, int t, String comment) {
    String code = Instructions.RR(currentLine, operation, r, s, t, comment);
    this.buffer.append(code);

    return ++currentLine;
  }

  /**
   * Create an RM instruction. Example: 1: LD 7,-1(5)
   *
   * @param line      The line number
   * @param operation The instruction
   * @param r         The destination register
   * @param offset    The offset for address
   * @param address   The address in register
   * @param comment   The address in register
   * @return The new line number for the next instruction
   */
  public int addInstructionRM(int currentLine, String operation, int r, int offset, int address, String comment) {
    String code = Instructions.RM(currentLine, operation, r, offset, address, comment);
    this.buffer.append(code);

    return ++currentLine;
  }

  /**
   * Create an RM instruction with a relative address to the program counter
   * Example: 1: LD 7, -1(5)
   *
   * @param line      The line number
   * @param operation The operation
   * @param register  The register
   * @param address   The target address
   * @param comment   Comment
   */
  public int addInstructionRMCounter(int currentLine, String operation, int register, int address, String comment) {
    String code = Instructions.RM_ABS(currentLine, operation, register, address, Instructions.PC, comment);
    this.buffer.append(code);

    return ++currentLine;
  }
}
