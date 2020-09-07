package com.badlogic.gdx.maps.objects;

import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.math.Polygon;

public class PolygonMapObject extends MapObject {
  private Polygon polygon;
  
  public PolygonMapObject() { this(new float[0]); }
  
  public PolygonMapObject(Polygon paramPolygon) { this.polygon = paramPolygon; }
  
  public PolygonMapObject(float[] paramArrayOfFloat) { this.polygon = new Polygon(paramArrayOfFloat); }
  
  public Polygon getPolygon() { return this.polygon; }
  
  public void setPolygon(Polygon paramPolygon) { this.polygon = paramPolygon; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/objects/PolygonMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */