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
   * Create an instruction and add it to the file buffer that is being created
   *
   * @param instruction
   * @param line        The current line number
   */
  public int addInstruction(String instruction, int line) {

    this.buffer.append(instruction);

    return ++line;
  }
}
