import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.FileWriter;
import java.util.ArrayList;

/**
 * The file that has all of the code instructions being generated in an internal
 * buffer
 */
public class Buffer {

  // data used for patching function calls in a secondary pass
  public class PatchData {
    public String funcName;
    public Integer PC;
    public Integer line;
    public String code;
  }


  private String name;
  private StringBuilder buffer;
  private ArrayList<PatchData> patchInstructions = new ArrayList<PatchData>();

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
   * Adds a line of code to the patch list to be patched at the end of compilation
   */
  public void addPatchInstruction(String funcName,Integer PC, Integer line, String code) {
    PatchData data = new PatchData();
    data.funcName = funcName;
    data.PC = PC;
    data.line = line;
    data.code = code;

    patchInstructions.add(data);
  }

  /**
   * Patch the buffer by finding the instructions that were added to the patch list
   * and replacing the buffer instructions with the correct function addresses
   */
  public void patchInstructions(Block block) {
    
    for (int i = 0; i < patchInstructions.size(); ++i) {
      PatchData data = patchInstructions.get(i);
      String funcName = data.funcName;
      Integer PC = data.PC;
      Integer line = data.line;
      String code = data.code;

      // Find the function name in the buffer
      int index = buffer.indexOf(code);

      if (index != -1) {
        // replace line of code with new line
        Integer[] symbol = block.getSymbolAddress(funcName);
        String comment = String.format("Patched jump to %s", funcName);
        String newCode = Instructions.RM_ABS("LDA", PC, line-1, symbol[0], PC, comment);
        buffer.replace(index, index + code.length(), newCode);
        
      } else {
        // If the function name is not found, print an error message
        System.out.println("Instruction: " + code + " not found in buffer");
      }
    }
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
   * Skip a certain amount of lines
   *
   * @param amount The amount of lines to skip
   */
  public int skipLines(int amount) {

    int i = line;
    line += amount;

    maxLine = maxLine < line ? line : maxLine;

    return i;
  }

  /**
   * Backup the line by changing it back to the location wanted
   *
   * @param location The line number to jump to
   */
  public int lineBackup(int location) {
    if (location > maxLine) {
      String comment = String.format("BUG in line backup for %d lines", location);
      buffer.append(comment);
    }

    line = location;

    return line;
  }

  /**
   * Restore the line to the max line provided
   */
  public void lineRestore() {
    line = maxLine;
  }

  /**
   * Generate a file from the string buffer created
   *
   * @param directory The complete path for this file relative to where the
   *                  program runs
   */
  public void generateFile(String directory) {
    String fileName = String.format("%s/%s.tm", directory, name);

    generate(fileName);
  }

  /**
   * Generate a file from the string buffer created
   */
  public void generateFile() {
    generateFile(name);
  }

  /**
   * Generate a file with the buffered text
   * 
   * @param name The name of the file
   */
  private void generate(String name) {
    String text = buffer.toString();
    File file = new File(name);

    try {
      if (!file.exists()) {
        file.createNewFile();
      }

      FileWriter writer = new FileWriter(file);
      writer.write(text);
      writer.close();

      System.out.println("File " + name + " Generated");
    } catch (FileNotFoundException e) {
      System.out.println("File Not Found: " + name);
      System.out.println(e);
    } catch (IOException e) {
      System.out.println("Could not generate: " + name);
      System.out.println(e);
    }
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
