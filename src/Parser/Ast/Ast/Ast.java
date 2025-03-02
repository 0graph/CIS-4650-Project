package Ast;

/**
 * Abstract syntax tree for the parser implementation
 */
abstract public class Ast {
  public int row, col;

  /**
   * Check whether we accept the file given to parse
   *
   * @param visitor The Visitor traversin through the node
   * @param level   The recusive level of this
   */
  abstract public void accept(AstVisitor visitor, int level);
}
