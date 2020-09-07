package com.badlogic.gdx.graphics.g2d;

public class PolygonRegion {
  final TextureRegion region;
  
  final float[] textureCoords;
  
  final short[] triangles;
  
  final float[] vertices;
  
  public PolygonRegion(TextureRegion paramTextureRegion, float[] paramArrayOfFloat, short[] paramArrayOfShort) {
    this.region = paramTextureRegion;
    this.vertices = paramArrayOfFloat;
    this.triangles = paramArrayOfShort;
    float[] arrayOfFloat = new float[paramArrayOfFloat.length];
    this.textureCoords = arrayOfFloat;
    float f1 = paramTextureRegion.u;
    float f2 = paramTextureRegion.v;
    float f3 = paramTextureRegion.u2;
    float f4 = paramTextureRegion.v2;
    int i = paramTextureRegion.regionWidth;
    int j = paramTextureRegion.regionHeight;
    int k = paramArrayOfFloat.length;
    for (boolean bool = false; bool < k; bool += true) {
      arrayOfFloat[bool] = paramArrayOfFloat[bool] / i * (f3 - f1) + f1;
      boolean bool1 = bool + true;
      arrayOfFloat[bool1] = (1.0F - paramArrayOfFloat[bool1] / j) * (f4 - f2) + f2;
    } 
  }
  
  public TextureRegion getRegion() { return this.region; }
  
  public float[] getTextureCoords() { return this.textureCoords; }
  
  public short[] getTriangles() { return this.triangles; }
  
  public float[] getVertices() { return this.vertices; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PolygonRegion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */