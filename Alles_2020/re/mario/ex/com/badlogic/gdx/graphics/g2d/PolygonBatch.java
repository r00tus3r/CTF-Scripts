package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Texture;

public interface PolygonBatch extends Batch {
  void draw(Texture paramTexture, float[] paramArrayOfFloat, int paramInt1, int paramInt2, short[] paramArrayOfShort, int paramInt3, int paramInt4);
  
  void draw(PolygonRegion paramPolygonRegion, float paramFloat1, float paramFloat2);
  
  void draw(PolygonRegion paramPolygonRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  void draw(PolygonRegion paramPolygonRegion, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PolygonBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */