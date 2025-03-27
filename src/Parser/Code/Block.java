import java.util.ArrayList;
import java.util.HashMap;

/**
 * The block for a function in the instruction space
 */
public class Block {
  // Keep track of the scopes within blocks in case we need to reference anything
  // in the tree
  public Block outerScope;
  public ArrayList<Block> innerScopes = new ArrayList<Block>();

  // The address of this block is the instruction line number
  private int address;

  // The current offset given the instructions that have been (start at -1 since
  // the first position if the address)
  private int offset = 1;

  // The current nesting level of the block (This is used for call expressions
  // where nesting expressions are possible)
  private int level = 0;

  // The Symbols and their address in this current scope
  // The Integer holds two values: [offset, global/frame pointer]
  private HashMap<String, Integer[]> symbols = new HashMap<String, Integer[]>();

  /**
   * Create a new block with the offsets
   */
  public Block() {
    this.address = 0;
  }

  /**
   * Create a block with an address
   * 
   * @param address The global address for this code block
   */
  public Block(int address) {
    this.address = address;
  }

  /**
   * Create a block with an address and a previous outer scope
   *
   * @param address The global address for this code block
   * @param parent  The parent scope to allow for easy symbol look up
   */
  public Block(int address, Block parent) {
    this.address = address;
    this.outerScope = parent;
  }

  /**
   * Get the offset for the block
   */
  public int getOffset() {
    return offset;
  }

  /**
   * Returns the nesting level for call expressions
   *
   * @return The current nesting level
   */
  public int getNestingLevel() {
    return level;
  }

  /**
   * Increment the offset of the block by one
   */
  public void incrementOffset() {
    offset++;
  }

  /**
   * increment the nesting level by 1
   *
   * @param amount The amount to increment it by
   */
  public void incrementNestingLevel(int amount) {
    level += amount;
  }

  /**
   * Add an RO instruction to the current file buffer
   *
   * @param operation The instruction
   * @param r         The register that this instruction is tied to
   * @param s         Parameter
   * @param t         Parameter
   * @param comment   comment
   *
   */
  public String createInstructionRR(String operation, int r, int s, int t, String comment) {
    String code = Instructions.RR(operation, r, s, t, comment);

    incrementOffset();

    return code;
  }

  /**
   * Create an RM instruction. Example: 1: LD 7,-1(5)
   * Note: This does not increment the offset
   *
   * @param operation The instruction
   * @param r         The destination register
   * @param offset    The offset for address
   * @param address   The address in register
   * @param comment   comment
   */
  public String createInstructionRM(String operation, int r, int offset, int address, String comment) {
    String code = Instructions.RM(operation, r, -offset, address, comment);

    return code;
  }

  /**
   * Create an RM instruction with a RELATIVE address to the block of code
   * Example: 1: LD 7, -1(5)
   *
   * @param operation The operation
   * @param register  The register
   * @param address   The target address
   * @param comment   Comment
   */
  public String createInstructionRM(String operation, int register, int address, String comment) {
    String code = Instructions.RM(operation, register, -offset, address, comment);

    incrementOffset();

    return code;
  }

  /**
   * Cretae an address for the symbol. If the global address does not matter, set
   * it to -1
   * 
   * @param id      The id of the symbol
   * @param pointer The pointer for which this address is a part of (global
   *                pointer/frame pointer)
   */
  public void createAddress(String id, int pointer) throws Exception {
    // Check if the address has already been created in this scope
    Integer[] address;

    address = symbols.get(id);

    if (address != null) {
      String message = String.format("Symbol %s already has a valid address in this space!\n", id);
      throw new Exception(message);
    }

    address = new Integer[] { offset, pointer };
    symbols.put(id, address);

    // Increase the offset
    incrementOffset();
  }

  /**
   * Cretae an address for the symbol. If the global address does not matter, set
   * it to -1
   * 
   * @param id      The id of the symbol
   * @param pointer The pointer for which this address is a part of (global
   *                pointer/frame pointer)
   * @param size    The offset amount
   */
  public void createAddress(String id, int pointer, int size) throws Exception {
    // Check if the address has already been created in this scope
    Integer[] address;

    address = symbols.get(id);

    if (address != null) {
      String message = String.format("Symbol %s already has a valid address in this space!\n", id);
      throw new Exception(message);
    }

    // The address is the first position of the array
    address = new Integer[] { offset, pointer };
    symbols.put(id, address);

    // Increase the offset
    offset = offset + size;
  }

  /**
   * Creates a inner block based on the outer block created
   * 
   * @param address The global address for the code block
   * @return The newly created code block
   */
  public Block createNewBlock(int address) {
    Block innerBlock = new Block(address, this);

    // Add the block to the new scope
    innerScopes.add(innerBlock);

    // incrementOffset();

    return innerBlock;
  }

  /**
   * Creates a inner block based on the outer block created
   * 
   * @param name    The name of the block
   * @param address The global address for the code block
   * @return The newly created code block
   */
  public Block createNewBlock(String name, int address) {
    // Add the current block as a symbol
    Integer[] symbol = new Integer[] { offset, address };
    symbols.put(name, symbol);

    Block innerBlock = createNewBlock(address);

    return innerBlock;
  }

  /**
   * Get the symbol addresses in the current scope, if it exists
   *
   * @param id The symbol id
   */
  public Integer[] getSymbolAddressInScope(String id) {
    Integer[] symbol = symbols.get(id);

    return symbol;
  }

  /**
   * Returns both the local and global address for a symbol given
   * the name. Note that this will recurse towards the root (global space)
   * and return the closes node that matches the name. If no symbol is found
   * this will return null
   *
   * @param id The id of the symbol
   * @return Both the global and local address of the symbol
   */
  public Integer[] getSymbolAddress(String id) {
    Block current = this;

    // Go up
    while (current != null) {
      Integer[] address = current.getSymbolAddressInScope(id);

      if (address != null) {
        return address;
      }

      current = current.outerScope;
    }

    return null;
  }
}
