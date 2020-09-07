package com.badlogic.gdx.maps;

import com.badlogic.gdx.utils.Disposable;

public class Map implements Disposable {
  private MapLayers layers = new MapLayers();
  
  private MapProperties properties = new MapProperties();
  
  public void dispose() {}
  
  public MapLayers getLayers() { return this.layers; }
  
  public MapProperties getProperties() { return this.properties; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/Map.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */