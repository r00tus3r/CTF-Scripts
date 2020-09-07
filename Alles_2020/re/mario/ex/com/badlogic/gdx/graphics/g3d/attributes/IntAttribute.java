package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;

public class IntAttribute extends Attribute {
  public static final long CullFace = register("cullface");
  
  public static final String CullFaceAlias = "cullface";
  
  public int value;
  
  public IntAttribute(long paramLong) { super(paramLong); }
  
  public IntAttribute(long paramLong, int paramInt) {
    super(paramLong);
    this.value = paramInt;
  }
  
  public static IntAttribute createCullFace(int paramInt) { return new IntAttribute(CullFace, paramInt); }
  
  public int compareTo(Attribute paramAttribute) { return (this.type != paramAttribute.type) ? (int)(this.type - paramAttribute.type) : (this.value - ((IntAttribute)paramAttribute).value); }
  
  public Attribute copy() { return new IntAttribute(this.type, this.value); }
  
  public int hashCode() { return super.hashCode() * 983 + this.value; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/IntAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */