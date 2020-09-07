package com.badlogic.gdx.maps.objects;

import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.math.Polyline;

public class PolylineMapObject extends MapObject {
  private Polyline polyline;
  
  public PolylineMapObject() { this(new float[0]); }
  
  public PolylineMapObject(Polyline paramPolyline) { this.polyline = paramPolyline; }
  
  public PolylineMapObject(float[] paramArrayOfFloat) { this.polyline = new Polyline(paramArrayOfFloat); }
  
  public Polyline getPolyline() { return this.polyline; }
  
  public void setPolyline(Polyline paramPolyline) { this.polyline = paramPolyline; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/objects/PolylineMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */