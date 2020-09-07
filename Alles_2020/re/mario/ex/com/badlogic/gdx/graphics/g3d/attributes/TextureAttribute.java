package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.NumberUtils;

public class TextureAttribute extends Attribute {
  public static final long Ambient;
  
  public static final String AmbientAlias = "ambientTexture";
  
  public static final long Bump;
  
  public static final String BumpAlias = "bumpTexture";
  
  public static final long Diffuse = register("diffuseTexture");
  
  public static final String DiffuseAlias = "diffuseTexture";
  
  public static final long Emissive;
  
  public static final String EmissiveAlias = "emissiveTexture";
  
  protected static long Mask = 0L;
  
  public static final long Normal;
  
  public static final String NormalAlias = "normalTexture";
  
  public static final long Reflection;
  
  public static final String ReflectionAlias = "reflectionTexture";
  
  public static final long Specular = register("specularTexture");
  
  public static final String SpecularAlias = "specularTexture";
  
  public float offsetU = 0.0F;
  
  public float offsetV = 0.0F;
  
  public float scaleU = 1.0F;
  
  public float scaleV = 1.0F;
  
  public final TextureDescriptor<Texture> textureDescription;
  
  public int uvIndex = 0;
  
  static  {
    Bump = register("bumpTexture");
    Normal = register("normalTexture");
    Ambient = register("ambientTexture");
    Emissive = register("emissiveTexture");
    Reflection = register("reflectionTexture");
    Mask = Diffuse | Specular | Bump | Normal | Ambient | Emissive | Reflection;
  }
  
  public TextureAttribute(long paramLong) {
    super(paramLong);
    if (is(paramLong)) {
      this.textureDescription = new TextureDescriptor();
      return;
    } 
    throw new GdxRuntimeException("Invalid type specified");
  }
  
  public TextureAttribute(long paramLong, Texture paramTexture) {
    this(paramLong);
    this.textureDescription.texture = paramTexture;
  }
  
  public TextureAttribute(long paramLong, TextureRegion paramTextureRegion) {
    this(paramLong);
    set(paramTextureRegion);
  }
  
  public <T extends Texture> TextureAttribute(long paramLong, TextureDescriptor<T> paramTextureDescriptor) {
    this(paramLong);
    this.textureDescription.set(paramTextureDescriptor);
  }
  
  public <T extends Texture> TextureAttribute(long paramLong, TextureDescriptor<T> paramTextureDescriptor, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this(paramLong, paramTextureDescriptor, paramFloat1, paramFloat2, paramFloat3, paramFloat4, 0); }
  
  public <T extends Texture> TextureAttribute(long paramLong, TextureDescriptor<T> paramTextureDescriptor, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt) {
    this(paramLong, paramTextureDescriptor);
    this.offsetU = paramFloat1;
    this.offsetV = paramFloat2;
    this.scaleU = paramFloat3;
    this.scaleV = paramFloat4;
    this.uvIndex = paramInt;
  }
  
  public TextureAttribute(TextureAttribute paramTextureAttribute) { this(paramTextureAttribute.type, paramTextureAttribute.textureDescription, paramTextureAttribute.offsetU, paramTextureAttribute.offsetV, paramTextureAttribute.scaleU, paramTextureAttribute.scaleV, paramTextureAttribute.uvIndex); }
  
  public static TextureAttribute createAmbient(Texture paramTexture) { return new TextureAttribute(Ambient, paramTexture); }
  
  public static TextureAttribute createAmbient(TextureRegion paramTextureRegion) { return new TextureAttribute(Ambient, paramTextureRegion); }
  
  public static TextureAttribute createBump(Texture paramTexture) { return new TextureAttribute(Bump, paramTexture); }
  
  public static TextureAttribute createBump(TextureRegion paramTextureRegion) { return new TextureAttribute(Bump, paramTextureRegion); }
  
  public static TextureAttribute createDiffuse(Texture paramTexture) { return new TextureAttribute(Diffuse, paramTexture); }
  
  public static TextureAttribute createDiffuse(TextureRegion paramTextureRegion) { return new TextureAttribute(Diffuse, paramTextureRegion); }
  
  public static TextureAttribute createEmissive(Texture paramTexture) { return new TextureAttribute(Emissive, paramTexture); }
  
  public static TextureAttribute createEmissive(TextureRegion paramTextureRegion) { return new TextureAttribute(Emissive, paramTextureRegion); }
  
  public static TextureAttribute createNormal(Texture paramTexture) { return new TextureAttribute(Normal, paramTexture); }
  
  public static TextureAttribute createNormal(TextureRegion paramTextureRegion) { return new TextureAttribute(Normal, paramTextureRegion); }
  
  public static TextureAttribute createReflection(Texture paramTexture) { return new TextureAttribute(Reflection, paramTexture); }
  
  public static TextureAttribute createReflection(TextureRegion paramTextureRegion) { return new TextureAttribute(Reflection, paramTextureRegion); }
  
  public static TextureAttribute createSpecular(Texture paramTexture) { return new TextureAttribute(Specular, paramTexture); }
  
  public static TextureAttribute createSpecular(TextureRegion paramTextureRegion) { return new TextureAttribute(Specular, paramTextureRegion); }
  
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
    long l1 = this.type;
    long l2 = paramAttribute.type;
    byte b = -1;
    if (l1 != l2) {
      if (this.type >= paramAttribute.type)
        b = 1; 
      return b;
    } 
    paramAttribute = (TextureAttribute)paramAttribute;
    int i = this.textureDescription.compareTo(paramAttribute.textureDescription);
    if (i != 0)
      return i; 
    int j = this.uvIndex;
    i = paramAttribute.uvIndex;
    if (j != i)
      return j - i; 
    if (!MathUtils.isEqual(this.scaleU, paramAttribute.scaleU)) {
      if (this.scaleU > paramAttribute.scaleU)
        b = 1; 
      return b;
    } 
    if (!MathUtils.isEqual(this.scaleV, paramAttribute.scaleV)) {
      if (this.scaleV > paramAttribute.scaleV)
        b = 1; 
      return b;
    } 
    if (!MathUtils.isEqual(this.offsetU, paramAttribute.offsetU)) {
      if (this.offsetU > paramAttribute.offsetU)
        b = 1; 
      return b;
    } 
    if (!MathUtils.isEqual(this.offsetV, paramAttribute.offsetV)) {
      if (this.offsetV > paramAttribute.offsetV)
        b = 1; 
      return b;
    } 
    return 0;
  }
  
  public Attribute copy() { return new TextureAttribute(this); }
  
  public int hashCode() { return (((((super.hashCode() * 991 + this.textureDescription.hashCode()) * 991 + NumberUtils.floatToRawIntBits(this.offsetU)) * 991 + NumberUtils.floatToRawIntBits(this.offsetV)) * 991 + NumberUtils.floatToRawIntBits(this.scaleU)) * 991 + NumberUtils.floatToRawIntBits(this.scaleV)) * 991 + this.uvIndex; }
  
  public void set(TextureRegion paramTextureRegion) {
    this.textureDescription.texture = paramTextureRegion.getTexture();
    this.offsetU = paramTextureRegion.getU();
    this.offsetV = paramTextureRegion.getV();
    this.scaleU = paramTextureRegion.getU2() - this.offsetU;
    this.scaleV = paramTextureRegion.getV2() - this.offsetV;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/TextureAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */