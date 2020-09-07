package com.brashmonkey.spriter;

public class File {
  public final int id;
  
  public final String name;
  
  public final Point pivot;
  
  public final Dimension size;
  
  File(int paramInt, String paramString, Dimension paramDimension, Point paramPoint) {
    this.id = paramInt;
    this.name = paramString;
    this.size = paramDimension;
    this.pivot = paramPoint;
  }
  
  public boolean isSprite() {
    boolean bool;
    if (this.pivot != null && this.size != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(getClass().getSimpleName());
    stringBuilder.append("|[id: ");
    stringBuilder.append(this.id);
    stringBuilder.append(", name: ");
    stringBuilder.append(this.name);
    stringBuilder.append(", size: ");
    stringBuilder.append(this.size);
    stringBuilder.append(", pivot: ");
    stringBuilder.append(this.pivot);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/File.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */