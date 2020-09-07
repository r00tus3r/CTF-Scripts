package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.NumberUtils;

public class DepthTestAttribute extends Attribute {
  public static final String Alias = "depthStencil";
  
  protected static long Mask;
  
  public static final long Type = register("depthStencil");
  
  public int depthFunc;
  
  public boolean depthMask;
  
  public float depthRangeFar;
  
  public float depthRangeNear;
  
  static  {
    Mask = Type;
  }
  
  public DepthTestAttribute() { this(515); }
  
  public DepthTestAttribute(int paramInt) { this(paramInt, true); }
  
  public DepthTestAttribute(int paramInt, float paramFloat1, float paramFloat2) { this(paramInt, paramFloat1, paramFloat2, true); }
  
  public DepthTestAttribute(int paramInt, float paramFloat1, float paramFloat2, boolean paramBoolean) { this(Type, paramInt, paramFloat1, paramFloat2, paramBoolean); }
  
  public DepthTestAttribute(int paramInt, boolean paramBoolean) { this(paramInt, 0.0F, 1.0F, paramBoolean); }
  
  public DepthTestAttribute(long paramLong, int paramInt, float paramFloat1, float paramFloat2, boolean paramBoolean) {
    super(paramLong);
    if (is(paramLong)) {
      this.depthFunc = paramInt;
      this.depthRangeNear = paramFloat1;
      this.depthRangeFar = paramFloat2;
      this.depthMask = paramBoolean;
      return;
    } 
    throw new GdxRuntimeException("Invalid type specified");
  }
  
  public DepthTestAttribute(DepthTestAttribute paramDepthTestAttribute) { this(paramDepthTestAttribute.type, paramDepthTestAttribute.depthFunc, paramDepthTestAttribute.depthRangeNear, paramDepthTestAttribute.depthRangeFar, paramDepthTestAttribute.depthMask); }
  
  public DepthTestAttribute(boolean paramBoolean) { this(515, paramBoolean); }
  
  public static final boolean is(long paramLong) {
    boolean bool;
    if ((paramLong & Mask) != 0L) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int compareTo(Attribute paramAttribute) {
    if (this.type != paramAttribute.type)
      return (int)(this.type - paramAttribute.type); 
    paramAttribute = (DepthTestAttribute)paramAttribute;
    int i = this.depthFunc;
    int j = paramAttribute.depthFunc;
    if (i != j)
      return i - j; 
    boolean bool1 = this.depthMask;
    boolean bool2 = paramAttribute.depthMask;
    j = -1;
    if (bool1 != bool2) {
      if (!bool1)
        j = 1; 
      return j;
    } 
    if (!MathUtils.isEqual(this.depthRangeNear, paramAttribute.depthRangeNear)) {
      if (this.depthRangeNear >= paramAttribute.depthRangeNear)
        j = 1; 
      return j;
    } 
    if (!MathUtils.isEqual(this.depthRangeFar, paramAttribute.depthRangeFar)) {
      if (this.depthRangeFar >= paramAttribute.depthRangeFar)
        j = 1; 
      return j;
    } 
    return 0;
  }
  
  public Attribute copy() { return new DepthTestAttribute(this); }
  
  public int hashCode() { return (((super.hashCode() * 971 + this.depthFunc) * 971 + NumberUtils.floatToRawIntBits(this.depthRangeNear)) * 971 + NumberUtils.floatToRawIntBits(this.depthRangeFar)) * 971 + this.depthMask; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */