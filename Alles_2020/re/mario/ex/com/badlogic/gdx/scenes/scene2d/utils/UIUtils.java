package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.Gdx;

public class UIUtils {
  public static boolean isLinux;
  
  public static boolean isMac = System.getProperty("os.name").contains("OS X");
  
  public static boolean isWindows = System.getProperty("os.name").contains("Windows");
  
  static  {
    isLinux = System.getProperty("os.name").contains("Linux");
  }
  
  public static boolean alt() { return (Gdx.input.isKeyPressed(57) || Gdx.input.isKeyPressed(58)); }
  
  public static boolean alt(int paramInt) { return (paramInt == 57 || paramInt == 58); }
  
  public static boolean ctrl() { return isMac ? Gdx.input.isKeyPressed(63) : ((Gdx.input.isKeyPressed(129) || Gdx.input.isKeyPressed(130)) ? 1 : 0); }
  
  public static boolean ctrl(int paramInt) {
    boolean bool = isMac;
    boolean bool1 = false;
    null = false;
    if (bool) {
      if (paramInt == 63)
        null = true; 
      return null;
    } 
    if (paramInt != 129) {
      null = bool1;
      return (paramInt == 130) ? true : null;
    } 
    return true;
  }
  
  public static boolean left() { return Gdx.input.isButtonPressed(0); }
  
  public static boolean left(int paramInt) {
    boolean bool;
    if (paramInt == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean middle() { return Gdx.input.isButtonPressed(2); }
  
  public static boolean middle(int paramInt) {
    boolean bool;
    if (paramInt == 2) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean right() { return Gdx.input.isButtonPressed(1); }
  
  public static boolean right(int paramInt) {
    boolean bool = true;
    if (paramInt != 1)
      bool = false; 
    return bool;
  }
  
  public static boolean shift() { return (Gdx.input.isKeyPressed(59) || Gdx.input.isKeyPressed(60)); }
  
  public static boolean shift(int paramInt) { return (paramInt == 59 || paramInt == 60); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/UIUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */