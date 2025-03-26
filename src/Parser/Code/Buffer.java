import java.io.File;

/**
 * The file that has all of the code instructions being generated in an internal
 * buffer
 */
public class Buffer {
  private String name;
  private StringBuilder buffer;

  // Keep track of the line numbers
  private int line;
  private int maxLine;

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
   */
  public int addInstruction(String instruction) {
    String code = String.format("%d: %s", line, instruction);
    this.buffer.append(code);

    updateLineNumber();

    return line;
  }

  /**
   * Add a comment to the buffer
   * 
   * @param comment The comment to add
   */
  public void addComment(String comment) {
    String result = String.format("* %s\n", comment);

    buffer.append(result);
  }

  /**
   * Update the line number after inserting an instruction
   */
  public int updateLineNumber() {
    ++line;

    if (maxLine < line) {
      maxLine = line;
    }

    return line;
  }

  /**
   * Return the whole instruction set as a string
   */
  public String toString() {
    String result = String.format("Instructions:\n%s\n\nLine Number: %d | Max Line Number: %d\n", buffer.toString(),
        line, maxLine);

    return result;
  }
}
