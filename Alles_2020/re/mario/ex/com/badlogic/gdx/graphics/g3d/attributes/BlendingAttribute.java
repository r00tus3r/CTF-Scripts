package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.NumberUtils;

public class BlendingAttribute extends Attribute {
  public static final String Alias = "blended";
  
  public static final long Type = register("blended");
  
  public boolean blended;
  
  public int destFunction;
  
  public float opacity = 1.0F;
  
  public int sourceFunction;
  
  public BlendingAttribute() { this(null); }
  
  public BlendingAttribute(float paramFloat) { this(true, paramFloat); }
  
  public BlendingAttribute(int paramInt1, int paramInt2) { this(paramInt1, paramInt2, 1.0F); }
  
  public BlendingAttribute(int paramInt1, int paramInt2, float paramFloat) { this(true, paramInt1, paramInt2, paramFloat); }
  
  public BlendingAttribute(BlendingAttribute paramBlendingAttribute) { this(bool, i, j, f); }
  
  public BlendingAttribute(boolean paramBoolean, float paramFloat) { this(paramBoolean, 770, 771, paramFloat); }
  
  public BlendingAttribute(boolean paramBoolean, int paramInt1, int paramInt2, float paramFloat) {
    super(Type);
    this.blended = paramBoolean;
    this.sourceFunction = paramInt1;
    this.destFunction = paramInt2;
    this.opacity = paramFloat;
  }
  
  public static final boolean is(long paramLong) {
    boolean bool;
    if ((Type & paramLong) == paramLong) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int compareTo(Attribute paramAttribute) {
    if (this.type != paramAttribute.type)
      return (int)(this.type - paramAttribute.type); 
    paramAttribute = (BlendingAttribute)paramAttribute;
    boolean bool1 = this.blended;
    boolean bool2 = paramAttribute.blended;
    byte b = 1;
    int i = 1;
    if (bool1 != bool2) {
      if (bool1) {
        b = i;
      } else {
        b = -1;
      } 
      return b;
    } 
    i = this.sourceFunction;
    int j = paramAttribute.sourceFunction;
    if (i != j)
      return i - j; 
    j = this.destFunction;
    i = paramAttribute.destFunction;
    if (j != i)
      return j - i; 
    if (MathUtils.isEqual(this.opacity, paramAttribute.opacity)) {
      b = 0;
    } else if (this.opacity >= paramAttribute.opacity) {
      b = -1;
    } 
    return b;
  }
  
  public BlendingAttribute copy() { return new BlendingAttribute(this); }
  
  public int hashCode() { return (((super.hashCode() * 947 + this.blended) * 947 + this.sourceFunction) * 947 + this.destFunction) * 947 + NumberUtils.floatToRawIntBits(this.opacity); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */