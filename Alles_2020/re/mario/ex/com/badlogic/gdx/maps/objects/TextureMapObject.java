package com.badlogic.gdx.maps.objects;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapObject;

public class TextureMapObject extends MapObject {
  private float originX = 0.0F;
  
  private float originY = 0.0F;
  
  private float rotation = 0.0F;
  
  private float scaleX = 1.0F;
  
  private float scaleY = 1.0F;
  
  private TextureRegion textureRegion = null;
  
  private float x = 0.0F;
  
  private float y = 0.0F;
  
  public TextureMapObject() { this(null); }
  
  public TextureMapObject(TextureRegion paramTextureRegion) { this.textureRegion = paramTextureRegion; }
  
  public float getOriginX() { return this.originX; }
  
  public float getOriginY() { return this.originY; }
  
  public float getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scaleX; }
  
  public float getScaleY() { return this.scaleY; }
  
  public TextureRegion getTextureRegion() { return this.textureRegion; }
  
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public void setOriginX(float paramFloat) { this.originX = paramFloat; }
  
  public void setOriginY(float paramFloat) { this.originY = paramFloat; }
  
  public void setRotation(float paramFloat) { this.rotation = paramFloat; }
  
  public void setScaleX(float paramFloat) { this.scaleX = paramFloat; }
  
  public void setScaleY(float paramFloat) { this.scaleY = paramFloat; }
  
  public void setTextureRegion(TextureRegion paramTextureRegion) { this.textureRegion = paramTextureRegion; }
  
  public void setX(float paramFloat) { this.x = paramFloat; }
  
  public void setY(float paramFloat) { this.y = paramFloat; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/objects/TextureMapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */