package com.uwsoft.editor.renderer.resources;

public class FontSizePair {
  public String fontName;
  
  public int fontSize;
  
  public FontSizePair(String paramString, int paramInt) {
    this.fontName = paramString;
    this.fontSize = paramInt;
  }
  
  public boolean equals(Object paramObject) {
    paramObject = (FontSizePair)paramObject;
    return (paramObject.fontName.equals(this.fontName) && paramObject.fontSize == this.fontSize);
  }
  
  public int hashCode() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.fontName);
    stringBuilder.append("_");
    stringBuilder.append(this.fontSize);
    return stringBuilder.toString().hashCode();
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.fontName);
    stringBuilder.append("_");
    stringBuilder.append(this.fontSize);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/resources/FontSizePair.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */