package com.brashmonkey.spriter;

public class IKObject extends Point {
  int chainLength;
  
  int iterations;
  
  public IKObject(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    super(paramFloat1, paramFloat2);
    setLength(paramInt1);
    setIterations(paramInt2);
  }
  
  public int getChainLength() { return this.chainLength; }
  
  public int getIterations() { return this.iterations; }
  
  public IKObject setIterations(int paramInt) {
    if (paramInt >= 0) {
      this.iterations = paramInt;
      return this;
    } 
    throw new SpriterException("The number of iterations has to be at least 1!");
  }
  
  public IKObject setLength(int paramInt) {
    if (paramInt >= 0) {
      this.chainLength = paramInt;
      return this;
    } 
    throw new SpriterException("The chain has to be at least 0!");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/IKObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */