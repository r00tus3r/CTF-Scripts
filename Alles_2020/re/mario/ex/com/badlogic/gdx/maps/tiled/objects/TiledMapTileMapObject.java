package com.badlogic.gdx.maps.tiled.objects;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.objects.TextureMapObject;
import com.badlogic.gdx.maps.tiled.TiledMapTile;

public class TiledMapTileMapObject extends TextureMapObject {
  private boolean flipHorizontally;
  
  private boolean flipVertically;
  
  private TiledMapTile tile;
  
  public TiledMapTileMapObject(TiledMapTile paramTiledMapTile, boolean paramBoolean1, boolean paramBoolean2) {
    this.flipHorizontally = paramBoolean1;
    this.flipVertically = paramBoolean2;
    this.tile = paramTiledMapTile;
    TextureRegion textureRegion = new TextureRegion(paramTiledMapTile.getTextureRegion());
    textureRegion.flip(paramBoolean1, paramBoolean2);
    setTextureRegion(textureRegion);
  }
  
  public TiledMapTile getTile() { return this.tile; }
  
  public boolean isFlipHorizontally() { return this.flipHorizontally; }
  
  public boolean isFlipVertically() { return this.flipVertically; }
  
  public void setFlipHorizontally(boolean paramBoolean) { this.flipHorizontally = paramBoolean; }
  
  public void setFlipVertically(boolean paramBoolean) { this.flipVertically = paramBoolean; }
  
  public void setTile(TiledMapTile paramTiledMapTile) { this.tile = paramTiledMapTile; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */