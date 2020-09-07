package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class TiledMapTileSets extends Object implements Iterable<TiledMapTileSet> {
  private Array<TiledMapTileSet> tilesets = new Array();
  
  public void addTileSet(TiledMapTileSet paramTiledMapTileSet) { this.tilesets.add(paramTiledMapTileSet); }
  
  public TiledMapTile getTile(int paramInt) {
    for (int i = this.tilesets.size - 1; i >= 0; i--) {
      TiledMapTile tiledMapTile = ((TiledMapTileSet)this.tilesets.get(i)).getTile(paramInt);
      if (tiledMapTile != null)
        return tiledMapTile; 
    } 
    return null;
  }
  
  public TiledMapTileSet getTileSet(int paramInt) { return (TiledMapTileSet)this.tilesets.get(paramInt); }
  
  public TiledMapTileSet getTileSet(String paramString) {
    for (TiledMapTileSet tiledMapTileSet : this.tilesets) {
      if (paramString.equals(tiledMapTileSet.getName()))
        return tiledMapTileSet; 
    } 
    return null;
  }
  
  public Iterator<TiledMapTileSet> iterator() { return this.tilesets.iterator(); }
  
  public void removeTileSet(int paramInt) { this.tilesets.removeIndex(paramInt); }
  
  public void removeTileSet(TiledMapTileSet paramTiledMapTileSet) { this.tilesets.removeValue(paramTiledMapTileSet, true); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMapTileSets.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */