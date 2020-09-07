package com.uwsoft.editor.renderer.data;

public class ResolutionEntryVO {
  public int base;
  
  public int height;
  
  public String name;
  
  public int width;
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.width);
    stringBuilder.append("x");
    stringBuilder.append(this.height);
    stringBuilder.append(" (");
    stringBuilder.append(this.name);
    stringBuilder.append(")");
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/ResolutionEntryVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */