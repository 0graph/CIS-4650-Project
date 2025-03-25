import java.util.ArrayList;

/**
 * The frame for a function in the stack
 */
public class Frame {
  // The current frame's line number to which all of the code content goes to
  private int line;

  // The old frame offset
  private int oldFrameOffset;

  // The return address for the previous frame to go to
  private int returnAddress;

  // The current offset given the instructions that have been
  private int offset;

  /**
   * Create a new frame with the offsets
   *
   * @param address        The current address for this frame
   * @param oldFrameOffset The previous frame offset
   * @param returnAddress  The return address for the caller
   */
  public Frame(int line, int oldFrameOffset, int returnAddress) {
    this.line = line;
    this.oldFrameOffset = oldFrameOffset;
    this.returnAddress = returnAddress;
    this.offset = 0;
  }
}
