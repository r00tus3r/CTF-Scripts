package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.utils.Array;

public abstract class Attribute extends Object implements Comparable<Attribute> {
  private static final Array<String> types = new Array();
  
  public final long type;
  
  private final int typeBit;
  
  protected Attribute(long paramLong) {
    this.type = paramLong;
    this.typeBit = Long.numberOfTrailingZeros(paramLong);
  }
  
  public static final String getAttributeAlias(long paramLong) {
    String str;
    byte b2;
    byte b1 = -1;
    while (true) {
      b2 = b1;
      if (paramLong != 0L) {
        b2 = ++b1;
        if (b1 < 63) {
          b2 = b1;
          if ((paramLong >> b1 & 0x1L) == 0L)
            continue; 
        } 
      } 
      break;
    } 
    if (b2 >= 0 && b2 < types.size) {
      str = (String)types.get(b2);
    } else {
      str = null;
    } 
    return str;
  }
  
  public static final long getAttributeType(String paramString) {
    for (byte b = 0; b < types.size; b++) {
      if (((String)types.get(b)).compareTo(paramString) == 0)
        return 1L << b; 
    } 
    return 0L;
  }
  
  protected static final long register(String paramString) {
    long l = getAttributeType(paramString);
    if (l > 0L)
      return l; 
    types.add(paramString);
    return 1L << types.size - 1;
  }
  
  public abstract Attribute copy();
  
  protected boolean equals(Attribute paramAttribute) {
    boolean bool;
    if (paramAttribute.hashCode() == hashCode()) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) {
    if (paramObject == null)
      return false; 
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof Attribute))
      return false; 
    paramObject = (Attribute)paramObject;
    return (this.type != paramObject.type) ? false : equals(paramObject);
  }
  
  public int hashCode() { return this.typeBit * 7489; }
  
  public String toString() { return getAttributeAlias(this.type); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Attribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */