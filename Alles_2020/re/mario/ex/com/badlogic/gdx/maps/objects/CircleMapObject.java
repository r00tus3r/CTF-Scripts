package com.badlogic.gdx.maps.objects;

import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.math.Circle;

public class CircleMapObject extends MapObject {
  private Circle circle;
  
  public CircleMapObject() { this(0.0F, 0.0F, 1.0F); }
  
  public CircleMapObject(float paramFloat1, float paramFloat2, float paramFloat3) { this.circle = new Circle(paramFloat1, paramFloat2, paramFloat3); }
  
  public Circle getCircle() { return this.circle; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/objects/CircleMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */