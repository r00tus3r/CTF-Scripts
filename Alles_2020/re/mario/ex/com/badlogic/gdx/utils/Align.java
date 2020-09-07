package com.badlogic.gdx.utils;

public class Align {
  public static final int bottom = 4;
  
  public static final int bottomLeft = 12;
  
  public static final int bottomRight = 20;
  
  public static final int center = 1;
  
  public static final int left = 8;
  
  public static final int right = 16;
  
  public static final int top = 2;
  
  public static final int topLeft = 10;
  
  public static final int topRight = 18;
  
  public static final boolean isBottom(int paramInt) {
    boolean bool;
    if ((paramInt & 0x4) != 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static final boolean isCenterHorizontal(int paramInt) {
    boolean bool;
    if ((paramInt & 0x8) == 0 && (paramInt & 0x10) == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static final boolean isCenterVertical(int paramInt) {
    boolean bool;
    if ((paramInt & 0x2) == 0 && (paramInt & 0x4) == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static final boolean isLeft(int paramInt) {
    boolean bool;
    if ((paramInt & 0x8) != 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static final boolean isRight(int paramInt) {
    boolean bool;
    if ((paramInt & 0x10) != 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static final boolean isTop(int paramInt) {
    boolean bool;
    if ((paramInt & 0x2) != 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static String toString(int paramInt) {
    StringBuilder stringBuilder = new StringBuilder(13);
    if ((paramInt & 0x2) != 0) {
      stringBuilder.append("top,");
    } else if ((paramInt & 0x4) != 0) {
      stringBuilder.append("bottom,");
    } else {
      stringBuilder.append("center,");
    } 
    if ((paramInt & 0x8) != 0) {
      stringBuilder.append("left");
    } else if ((paramInt & 0x10) != 0) {
      stringBuilder.append("right");
    } else {
      stringBuilder.append("center");
    } 
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Align.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */