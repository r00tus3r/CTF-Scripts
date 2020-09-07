package com.badlogic.gdx.maps.tiled.tiles;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapObjects;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.TiledMapTile;

public class StaticTiledMapTile implements TiledMapTile {
  private TiledMapTile.BlendMode blendMode = TiledMapTile.BlendMode.ALPHA;
  
  private int id;
  
  private MapObjects objects;
  
  private float offsetX;
  
  private float offsetY;
  
  private MapProperties properties;
  
  private TextureRegion textureRegion;
  
  public StaticTiledMapTile(TextureRegion paramTextureRegion) { this.textureRegion = paramTextureRegion; }
  
  public StaticTiledMapTile(StaticTiledMapTile paramStaticTiledMapTile) {
    if (paramStaticTiledMapTile.properties != null)
      getProperties().putAll(paramStaticTiledMapTile.properties); 
    this.objects = paramStaticTiledMapTile.objects;
    this.textureRegion = paramStaticTiledMapTile.textureRegion;
    this.id = paramStaticTiledMapTile.id;
  }
  
  public TiledMapTile.BlendMode getBlendMode() { return this.blendMode; }
  
  public int getId() { return this.id; }
  
  public MapObjects getObjects() {
    if (this.objects == null)
      this.objects = new MapObjects(); 
    return this.objects;
  }
  
  public float getOffsetX() { return this.offsetX; }
  
  public float getOffsetY() { return this.offsetY; }
  
  public MapProperties getProperties() {
    if (this.properties == null)
      this.properties = new MapProperties(); 
    return this.properties;
  }
  
  public TextureRegion getTextureRegion() { return this.textureRegion; }
  
  public void setBlendMode(TiledMapTile.BlendMode paramBlendMode) { this.blendMode = paramBlendMode; }
  
  public void setId(int paramInt) { this.id = paramInt; }
  
  public void setOffsetX(float paramFloat) { this.offsetX = paramFloat; }
  
  public void setOffsetY(float paramFloat) { this.offsetY = paramFloat; }
  
  public void setTextureRegion(TextureRegion paramTextureRegion) { this.textureRegion = paramTextureRegion; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */