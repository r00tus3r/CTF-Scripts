package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.maps.Map;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public class TiledMap extends Map {
  private Array<? extends Disposable> ownedResources;
  
  private TiledMapTileSets tilesets = new TiledMapTileSets();
  
  public void dispose() {
    Array array = this.ownedResources;
    if (array != null) {
      Iterator iterator = array.iterator();
      while (iterator.hasNext())
        ((Disposable)iterator.next()).dispose(); 
    } 
  }
  
  public TiledMapTileSets getTileSets() { return this.tilesets; }
  
  public void setOwnedResources(Array<? extends Disposable> paramArray) { this.ownedResources = paramArray; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */