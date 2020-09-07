package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class CubemapAttribute extends Attribute {
  public static final long EnvironmentMap = register("environmentCubemap");
  
  public static final String EnvironmentMapAlias = "environmentCubemap";
  
  protected static long Mask = EnvironmentMap;
  
  public final TextureDescriptor<Cubemap> textureDescription;
  
  public CubemapAttribute(long paramLong) {
    super(paramLong);
    if (is(paramLong)) {
      this.textureDescription = new TextureDescriptor();
      return;
    } 
    throw new GdxRuntimeException("Invalid type specified");
  }
  
  public CubemapAttribute(long paramLong, Cubemap paramCubemap) {
    this(paramLong);
    this.textureDescription.texture = paramCubemap;
  }
  
  public <T extends Cubemap> CubemapAttribute(long paramLong, TextureDescriptor<T> paramTextureDescriptor) {
    this(paramLong);
    this.textureDescription.set(paramTextureDescriptor);
  }
  
  public CubemapAttribute(CubemapAttribute paramCubemapAttribute) { this(paramCubemapAttribute.type, paramCubemapAttribute.textureDescription); }
  
  public static final boolean is(long paramLong) {
    boolean bool;
    if ((paramLong & Mask) != 0L) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int compareTo(Attribute paramAttribute) { return (this.type != paramAttribute.type) ? (int)(this.type - paramAttribute.type) : this.textureDescription.compareTo(((CubemapAttribute)paramAttribute).textureDescription); }
  
  public Attribute copy() { return new CubemapAttribute(this); }
  
  public int hashCode() { return super.hashCode() * 967 + this.textureDescription.hashCode(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */