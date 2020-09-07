package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.maps.MapRenderer;

public interface TiledMapRenderer extends MapRenderer {
  void renderImageLayer(TiledMapImageLayer paramTiledMapImageLayer);
  
  void renderObject(MapObject paramMapObject);
  
  void renderObjects(MapLayer paramMapLayer);
  
  void renderTileLayer(TiledMapTileLayer paramTiledMapTileLayer);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */