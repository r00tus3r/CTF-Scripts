package com.badlogic.gdx;

import com.badlogic.gdx.utils.GdxRuntimeException;

public class Version {
  public static final int MAJOR;
  
  public static final int MINOR;
  
  public static final int REVISION;
  
  public static final String VERSION = "1.9.10";
  
  static  {
    try {
      String[] arrayOfString = "1.9.10".split("\\.");
      int i = arrayOfString.length;
      int j = 0;
      if (i < 1) {
        i = 0;
      } else {
        i = Integer.valueOf(arrayOfString[0]).intValue();
      } 
      MAJOR = i;
      if (arrayOfString.length < 2) {
        i = 0;
      } else {
        i = Integer.valueOf(arrayOfString[1]).intValue();
      } 
      MINOR = i;
      if (arrayOfString.length < 3) {
        i = j;
      } else {
        i = Integer.valueOf(arrayOfString[2]).intValue();
      } 
      REVISION = i;
      return;
    } catch (Throwable throwable) {
      throw new GdxRuntimeException("Invalid version 1.9.10", throwable);
    } 
  }
  
  public static boolean isHigher(int paramInt1, int paramInt2, int paramInt3) { return isHigherEqual(paramInt1, paramInt2, paramInt3 + 1); }
  
  public static boolean isHigherEqual(int paramInt1, int paramInt2, int paramInt3) {
    int i = MAJOR;
    boolean bool1 = true;
    boolean bool2 = true;
    boolean bool = true;
    if (i != paramInt1) {
      if (i <= paramInt1)
        bool = false; 
      return bool;
    } 
    paramInt1 = MINOR;
    if (paramInt1 != paramInt2) {
      if (paramInt1 > paramInt2) {
        bool = bool1;
      } else {
        bool = false;
      } 
      return bool;
    } 
    if (REVISION >= paramInt3) {
      bool = bool2;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean isLower(int paramInt1, int paramInt2, int paramInt3) { return isLowerEqual(paramInt1, paramInt2, paramInt3 - 1); }
  
  public static boolean isLowerEqual(int paramInt1, int paramInt2, int paramInt3) {
    int i = MAJOR;
    boolean bool1 = true;
    boolean bool2 = true;
    boolean bool = true;
    if (i != paramInt1) {
      if (i >= paramInt1)
        bool = false; 
      return bool;
    } 
    paramInt1 = MINOR;
    if (paramInt1 != paramInt2) {
      if (paramInt1 < paramInt2) {
        bool = bool1;
      } else {
        bool = false;
      } 
      return bool;
    } 
    if (REVISION <= paramInt3) {
      bool = bool2;
    } else {
      bool = false;
    } 
    return bool;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Version.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */