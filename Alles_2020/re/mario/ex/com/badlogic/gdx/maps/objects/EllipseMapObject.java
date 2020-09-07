package com.badlogic.gdx.maps.objects;

import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.math.Ellipse;

public class EllipseMapObject extends MapObject {
  private Ellipse ellipse;
  
  public EllipseMapObject() { this(0.0F, 0.0F, 1.0F, 1.0F); }
  
  public EllipseMapObject(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.ellipse = new Ellipse(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public Ellipse getEllipse() { return this.ellipse; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/objects/EllipseMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */