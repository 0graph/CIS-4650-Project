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

  /**
   * The type of symbols
   */
  public static enum SymbolType {
    VARIABLE,
    ARRAY,
    FUNCTION
  }

  /**
   * The symbol within this scope
   */
  public class Symbol {
    public String name;
    public Integer address;
    public Integer pointer;
    public SymbolType type;
    public Integer size = 1;

    /**
     * Create a new symbol
     * Default to type of variable
     */
    public Symbol(String name, Integer address, Integer pointer) {
      this.name = name;
      this.address = address;
      this.pointer = pointer;
      this.type = SymbolType.VARIABLE;
    }

    /**
     * Create a new symbol
     */
    public Symbol(String name, Integer address, Integer pointer, SymbolType type) {
      this.name = name;
      this.address = address;
      this.pointer = pointer;
      this.type = type;
    }

    /**
     * Userd for arrays
     */
    public Symbol(String name, Integer address, Integer pointer, SymbolType type, Integer size) {
      this.name = name;
      this.address = address;
      this.pointer = pointer;
      this.type = type;
      this.size = size;
    }
  }

  // The address of this block is the instruction line number
  private int address;

  // The current offset given the instructions that have been (start at -1 since
  // the first position if the address)
  private int offset = 2;

  // the offset after the function parameters have been added
  private int paramOffset = 0;

  // The current nesting level of the block (This is used for call expressions
  // where nesting expressions are possible)
  private int level = 0;

  // The Symbols and their address in this current scope
  // The Integer holds two values: [offset, global/frame pointer]
  private HashMap<String, Symbol> symbols = new HashMap<String, Symbol>();

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
   * Get the offset for the block after the parameters have been added
   */
  public int getParamOffset() {
    return paramOffset;
  }

  /**
   * Set the offset for the parameters
   *
   * @param value The value to set the offset to
   */
  public void setParamOffset(int value) {
    paramOffset = value;
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
   * Set the offset to an arbitrary value
   *
   * @param value The value to update the offset to
   */
  public void setOffset(int value) {
    offset = value;
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
   * Cretae an address for the symbol. If the global address does not matter, set
   * it to -1
   * 
   * @param id      The id of the symbol
   * @param pointer The pointer for which this address is a part of (global
   *                pointer/frame pointer)
   */
  public void createAddress(String id, int pointer, SymbolType type) throws Exception {
    // Check if the address has already been created in this scope
    Symbol address;

    address = symbols.get(id);

    if (address != null) {
      String message = String.format("Symbol %s already has a valid address in this space!\n", id);
      throw new Exception(message);
    }

    address = new Symbol(id, offset, pointer, type);
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
  public void createAddress(String id, int pointer, int size, SymbolType type) throws Exception {
    // Check if the address has already been created in this scope
    Symbol address;

    address = symbols.get(id);

    if (address != null) {
      String message = String.format("Symbol %s already has a valid address in this space!\n", id);
      throw new Exception(message);
    }

    // The address is the first position of the array
    address = new Symbol(id, offset, pointer, type, size);
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
    Symbol symbol = new Symbol(name, address, Instructions.GP, SymbolType.FUNCTION);
    symbols.put(name, symbol);

    Block innerBlock = createNewBlock(address);

    return innerBlock;
  }

  /**
   * Get the symbol addresses in the current scope, if it exists
   *
   * @param id The symbol id
   * @return Returns the information of the symbol as an array of compatability
   *         references
   */
  public Integer[] getSymbolAddressInScope(String id) {
    Integer[] info = null;
    Symbol symbol = symbols.get(id);

    if (symbol != null) {
      info = new Integer[] { symbol.address, symbol.pointer, symbol.type.ordinal(), symbol.size };
    }

    return info;
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
