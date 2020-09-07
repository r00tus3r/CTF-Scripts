package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapLayer;

public class TiledMapImageLayer extends MapLayer {
  private TextureRegion region;
  
  private float x;
  
  private float y;
  
  public TiledMapImageLayer(TextureRegion paramTextureRegion, float paramFloat1, float paramFloat2) {
    this.region = paramTextureRegion;
    this.x = paramFloat1;
    this.y = paramFloat2;
  }
  
  public TextureRegion getTextureRegion() { return this.region; }
  
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public void setTextureRegion(TextureRegion paramTextureRegion) { this.region = paramTextureRegion; }
  
  public void setX(float paramFloat) { this.x = paramFloat; }
  
  public void setY(float paramFloat) { this.y = paramFloat; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMapImageLayer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */