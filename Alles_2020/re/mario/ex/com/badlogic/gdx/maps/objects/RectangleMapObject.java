package com.badlogic.gdx.maps.objects;

import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.math.Rectangle;

public class RectangleMapObject extends MapObject {
  private Rectangle rectangle;
  
  public RectangleMapObject() { this(0.0F, 0.0F, 1.0F, 1.0F); }
  
  public RectangleMapObject(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.rectangle = new Rectangle(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public Rectangle getRectangle() { return this.rectangle; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/objects/RectangleMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */