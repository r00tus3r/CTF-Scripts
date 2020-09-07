package com.badlogic.gdx.graphics;

import com.badlogic.gdx.utils.Disposable;

public interface Cursor extends Disposable {
  public enum SystemCursor {
    Arrow, Crosshair, Hand, HorizontalResize, Ibeam, VerticalResize;
    
    static  {
      Crosshair = new SystemCursor("Crosshair", 2);
      Hand = new SystemCursor("Hand", 3);
      HorizontalResize = new SystemCursor("HorizontalResize", 4);
      VerticalResize = new SystemCursor("VerticalResize", 5);
      $VALUES = new SystemCursor[] { Arrow, Ibeam, Crosshair, Hand, HorizontalResize, VerticalResize };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Cursor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */