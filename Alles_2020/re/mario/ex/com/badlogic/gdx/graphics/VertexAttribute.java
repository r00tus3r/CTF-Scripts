package com.badlogic.gdx.graphics;

public final class VertexAttribute {
  public String alias;
  
  public final boolean normalized;
  
  public final int numComponents;
  
  public int offset;
  
  public final int type;
  
  public int unit;
  
  public final int usage;
  
  private final int usageIndex;
  
  public VertexAttribute(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, String paramString) { this(paramInt1, paramInt2, paramInt3, paramBoolean, paramString, 0); }
  
  public VertexAttribute(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, String paramString, int paramInt4) {
    this.usage = paramInt1;
    this.numComponents = paramInt2;
    this.type = paramInt3;
    this.normalized = paramBoolean;
    this.alias = paramString;
    this.unit = paramInt4;
    this.usageIndex = Integer.numberOfTrailingZeros(paramInt1);
  }
  
  public VertexAttribute(int paramInt1, int paramInt2, String paramString) { this(paramInt1, paramInt2, paramString, 0); }
  
  public VertexAttribute(int paramInt1, int paramInt2, String paramString, int paramInt3) { this(paramInt1, paramInt2, c, bool, paramString, paramInt3); }
  
  public static VertexAttribute Binormal() { return new VertexAttribute('Ā', 3, "a_binormal"); }
  
  public static VertexAttribute BoneWeight(int paramInt) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("a_boneWeight");
    stringBuilder.append(paramInt);
    return new VertexAttribute(64, 2, stringBuilder.toString(), paramInt);
  }
  
  public static VertexAttribute ColorPacked() { return new VertexAttribute(4, 4, 'ᐁ', true, "a_color"); }
  
  public static VertexAttribute ColorUnpacked() { return new VertexAttribute(2, 4, 'ᐆ', false, "a_color"); }
  
  public static VertexAttribute Normal() { return new VertexAttribute(8, 3, "a_normal"); }
  
  public static VertexAttribute Position() { return new VertexAttribute(true, 3, "a_position"); }
  
  public static VertexAttribute Tangent() { return new VertexAttribute('', 3, "a_tangent"); }
  
  public static VertexAttribute TexCoords(int paramInt) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("a_texCoord");
    stringBuilder.append(paramInt);
    return new VertexAttribute(16, 2, stringBuilder.toString(), paramInt);
  }
  
  public VertexAttribute copy() { return new VertexAttribute(this.usage, this.numComponents, this.type, this.normalized, this.alias, this.unit); }
  
  public boolean equals(VertexAttribute paramVertexAttribute) {
    boolean bool;
    if (paramVertexAttribute != null && this.usage == paramVertexAttribute.usage && this.numComponents == paramVertexAttribute.numComponents && this.type == paramVertexAttribute.type && this.normalized == paramVertexAttribute.normalized && this.alias.equals(paramVertexAttribute.alias) && this.unit == paramVertexAttribute.unit) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) { return !(paramObject instanceof VertexAttribute) ? false : equals((VertexAttribute)paramObject); }
  
  public int getKey() { return (this.usageIndex << 8) + (this.unit & 0xFF); }
  
  public int getSizeInBytes() {
    int i = this.type;
    if (i != 5126 && i != 5132) {
      switch (i) {
        default:
          return 0;
        case 5122:
        case 5123:
          return this.numComponents * 2;
        case 5120:
        case 5121:
          break;
      } 
      return this.numComponents;
    } 
    return this.numComponents * 4;
  }
  
  public int hashCode() { return (getKey() * 541 + this.numComponents) * 541 + this.alias.hashCode(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/VertexAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */