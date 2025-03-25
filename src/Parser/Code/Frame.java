import java.util.ArrayList;

/**
 * The frame for a function in the stack
 * 
 * @deprecated Don't use this, I don't think we are going to need this (I think)
 */
public class Frame {
  // The current frame's offset in the frame stack pointer (the address)
  private int address;

  // The old frame offset
  private int oldFrameOffset;

  // The return address for the previous frame to go to
  private int returnAddress;

  // The instructions that are a part of this frame
  private ArrayList<String> instructions;

  /**
   * Create a new frame with the offsets
   *
   * @param address        The current address for this frame
   * @param oldFrameOffset The previous frame offset
   * @param returnAddress  The return address for the caller
   */
  public Frame(int address, int oldFrameOffset, int returnAddress) {
    this.address = address;
    this.oldFrameOffset = oldFrameOffset;
    this.returnAddress = returnAddress;
  }

  /**
   * Push a new frame relative to this frame
   */
  public Frame PushFrame(int offset) {
    return null;
  }

}
