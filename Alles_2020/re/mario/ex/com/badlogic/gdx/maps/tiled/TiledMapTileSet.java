package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.utils.IntMap;
import java.util.Iterator;

public class TiledMapTileSet extends Object implements Iterable<TiledMapTile> {
  private String name;
  
  private MapProperties properties = new MapProperties();
  
  private IntMap<TiledMapTile> tiles = new IntMap();
  
  public String getName() { return this.name; }
  
  public MapProperties getProperties() { return this.properties; }
  
  public TiledMapTile getTile(int paramInt) { return (TiledMapTile)this.tiles.get(paramInt); }
  
  public Iterator<TiledMapTile> iterator() { return this.tiles.values().iterator(); }
  
  public void putTile(int paramInt, TiledMapTile paramTiledMapTile) { this.tiles.put(paramInt, paramTiledMapTile); }
  
  public void removeTile(int paramInt) { this.tiles.remove(paramInt); }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public int size() { return this.tiles.size; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMapTileSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */