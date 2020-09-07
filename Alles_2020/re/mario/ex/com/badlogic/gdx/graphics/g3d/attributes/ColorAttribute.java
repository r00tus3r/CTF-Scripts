package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ColorAttribute extends Attribute {
  public static final long Ambient;
  
  public static final String AmbientAlias = "ambientColor";
  
  public static final long AmbientLight;
  
  public static final String AmbientLightAlias = "ambientLightColor";
  
  public static final long Diffuse = register("diffuseColor");
  
  public static final String DiffuseAlias = "diffuseColor";
  
  public static final long Emissive;
  
  public static final String EmissiveAlias = "emissiveColor";
  
  public static final long Fog;
  
  public static final String FogAlias = "fogColor";
  
  protected static long Mask = 0L;
  
  public static final long Reflection;
  
  public static final String ReflectionAlias = "reflectionColor";
  
  public static final long Specular = register("specularColor");
  
  public static final String SpecularAlias = "specularColor";
  
  public final Color color = new Color();
  
  static  {
    Ambient = register("ambientColor");
    Emissive = register("emissiveColor");
    Reflection = register("reflectionColor");
    AmbientLight = register("ambientLightColor");
    Fog = register("fogColor");
    Mask = Ambient | Diffuse | Specular | Emissive | Reflection | AmbientLight | Fog;
  }
  
  public ColorAttribute(long paramLong) {
    super(paramLong);
    if (is(paramLong))
      return; 
    throw new GdxRuntimeException("Invalid type specified");
  }
  
  public ColorAttribute(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this(paramLong);
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public ColorAttribute(long paramLong, Color paramColor) {
    this(paramLong);
    if (paramColor != null)
      this.color.set(paramColor); 
  }
  
  public ColorAttribute(ColorAttribute paramColorAttribute) { this(paramColorAttribute.type, paramColorAttribute.color); }
  
  public static final ColorAttribute createAmbient(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return new ColorAttribute(Ambient, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public static final ColorAttribute createAmbient(Color paramColor) { return new ColorAttribute(Ambient, paramColor); }
  
  public static final ColorAttribute createDiffuse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return new ColorAttribute(Diffuse, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public static final ColorAttribute createDiffuse(Color paramColor) { return new ColorAttribute(Diffuse, paramColor); }
  
  public static final ColorAttribute createReflection(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return new ColorAttribute(Reflection, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public static final ColorAttribute createReflection(Color paramColor) { return new ColorAttribute(Reflection, paramColor); }
  
  public static final ColorAttribute createSpecular(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return new ColorAttribute(Specular, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public static final ColorAttribute createSpecular(Color paramColor) { return new ColorAttribute(Specular, paramColor); }
  
  public static final boolean is(long paramLong) {
    boolean bool;
    if ((paramLong & Mask) != 0L) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int compareTo(Attribute paramAttribute) { return (this.type != paramAttribute.type) ? (int)(this.type - paramAttribute.type) : (((ColorAttribute)paramAttribute).color.toIntBits() - this.color.toIntBits()); }
  
  public Attribute copy() { return new ColorAttribute(this); }
  
  public int hashCode() { return super.hashCode() * 953 + this.color.toIntBits(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/ColorAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */