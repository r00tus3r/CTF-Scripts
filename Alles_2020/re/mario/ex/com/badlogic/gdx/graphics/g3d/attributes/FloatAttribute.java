package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.NumberUtils;

public class FloatAttribute extends Attribute {
  public static final long AlphaTest;
  
  public static final String AlphaTestAlias = "alphaTest";
  
  public static final long Shininess = register("shininess");
  
  public static final String ShininessAlias = "shininess";
  
  public float value;
  
  static  {
    AlphaTest = register("alphaTest");
  }
  
  public FloatAttribute(long paramLong) { super(paramLong); }
  
  public FloatAttribute(long paramLong, float paramFloat) {
    super(paramLong);
    this.value = paramFloat;
  }
  
  public static FloatAttribute createAlphaTest(float paramFloat) { return new FloatAttribute(AlphaTest, paramFloat); }
  
  public static FloatAttribute createShininess(float paramFloat) { return new FloatAttribute(Shininess, paramFloat); }
  
  public int compareTo(Attribute paramAttribute) {
    byte b;
    if (this.type != paramAttribute.type)
      return (int)(this.type - paramAttribute.type); 
    float f = ((FloatAttribute)paramAttribute).value;
    if (MathUtils.isEqual(this.value, f)) {
      b = 0;
    } else if (this.value < f) {
      b = -1;
    } else {
      b = 1;
    } 
    return b;
  }
  
  public Attribute copy() { return new FloatAttribute(this.type, this.value); }
  
  public int hashCode() { return super.hashCode() * 977 + NumberUtils.floatToRawIntBits(this.value); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/FloatAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */