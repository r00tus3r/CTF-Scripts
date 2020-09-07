package com.badlogic.gdx.maps;

import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.math.Matrix4;

public interface MapRenderer {
  void render();
  
  void render(int[] paramArrayOfInt);
  
  void setView(OrthographicCamera paramOrthographicCamera);
  
  void setView(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */