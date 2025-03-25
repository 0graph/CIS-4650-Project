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

  /**
   * Generic visitor for ast
   *
   * @param ast  The ast we are traversing through
   * @param line The line number
   * @param flag Whether the expression is an address or not
   */
  public void visit(Ast ast, int line, boolean flag) {
    if (ast instanceof ListAst) {
      visit((ListAst) ast, line, flag);
    }

    System.out.println("Implement: " + ast.getClass());
  }

  public void visit() {
  }
}
