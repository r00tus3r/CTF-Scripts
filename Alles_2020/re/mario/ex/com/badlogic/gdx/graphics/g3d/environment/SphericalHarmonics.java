package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class SphericalHarmonics {
  private static final float[] coeff = { 0.282095F, 0.488603F, 0.488603F, 0.488603F, 1.092548F, 1.092548F, 1.092548F, 0.315392F, 0.546274F };
  
  public final float[] data;
  
  public SphericalHarmonics() { this.data = new float[27]; }
  
  public SphericalHarmonics(float[] paramArrayOfFloat) {
    if (paramArrayOfFloat.length == 27) {
      this.data = (float[])paramArrayOfFloat.clone();
      return;
    } 
    throw new GdxRuntimeException("Incorrect array size");
  }
  
  private static final float clamp(float paramFloat) {
    float f;
    if (paramFloat < 0.0F) {
      f = 0.0F;
    } else {
      f = paramFloat;
      if (paramFloat > 1.0F)
        f = 1.0F; 
    } 
    return f;
  }
  
  public SphericalHarmonics set(float paramFloat1, float paramFloat2, float paramFloat3) {
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.data;
      if (b < arrayOfFloat.length) {
        boolean bool = b + true;
        arrayOfFloat[b] = paramFloat1;
        b = bool + true;
        arrayOfFloat[bool] = paramFloat2;
        arrayOfFloat[b] = paramFloat3;
        b++;
        continue;
      } 
      break;
    } 
    return this;
  }
  
  public SphericalHarmonics set(Color paramColor) { return set(paramColor.r, paramColor.g, paramColor.b); }
  
  public SphericalHarmonics set(AmbientCubemap paramAmbientCubemap) { return set(paramAmbientCubemap.data); }
  
  public SphericalHarmonics set(float[] paramArrayOfFloat) {
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.data;
      if (b < arrayOfFloat.length) {
        arrayOfFloat[b] = paramArrayOfFloat[b];
        b++;
        continue;
      } 
      break;
    } 
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */