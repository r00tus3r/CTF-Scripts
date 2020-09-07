package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapObjects;
import com.badlogic.gdx.maps.MapProperties;

public interface TiledMapTile {
  BlendMode getBlendMode();
  
  int getId();
  
  MapObjects getObjects();
  
  float getOffsetX();
  
  float getOffsetY();
  
  MapProperties getProperties();
  
  TextureRegion getTextureRegion();
  
  void setBlendMode(BlendMode paramBlendMode);
  
  void setId(int paramInt);
  
  void setOffsetX(float paramFloat);
  
  void setOffsetY(float paramFloat);
  
  void setTextureRegion(TextureRegion paramTextureRegion);
  
  public enum BlendMode {
    ALPHA, NONE;
    
    static  {
      ALPHA = new BlendMode("ALPHA", true);
      $VALUES = new BlendMode[] { NONE, ALPHA };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMapTile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */