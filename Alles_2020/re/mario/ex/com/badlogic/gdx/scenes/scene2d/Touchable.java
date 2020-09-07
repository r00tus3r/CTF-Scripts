package com.badlogic.gdx.scenes.scene2d;

public static enum Touchable {
  childrenOnly, disabled, enabled;
  
  static  {
    disabled = new Touchable("disabled", true);
    childrenOnly = new Touchable("childrenOnly", 2);
    $VALUES = new Touchable[] { enabled, disabled, childrenOnly };
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/Touchable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */