/**
 * Generates the intermediate code based on the symbols parsed
 */
public class CodeGen implements AstVisitor {
  public int globalOffset; // The global offset in memory
  public int frameOffset; // The frame offset for the next function in memory
  public int lineNumber; // The line number of the next instruction

  /**
   * Setup runtime environment for code
   */
  public CodeGen() {
    this.globalOffset = 0;
    this.frameOffset = this.globalOffset;
    this.lineNumber = 0;
  }

  public void visit(Ast ast) {
  }
}
