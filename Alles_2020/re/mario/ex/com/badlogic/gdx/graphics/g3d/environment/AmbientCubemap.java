package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class AmbientCubemap {
  private static final int NUM_VALUES = 18;
  
  public final float[] data;
  
  public AmbientCubemap() { this.data = new float[18]; }
  
  public AmbientCubemap(AmbientCubemap paramAmbientCubemap) { this(paramAmbientCubemap.data); }
  
  public AmbientCubemap(float[] paramArrayOfFloat) {
    if (paramArrayOfFloat.length == 18) {
      this.data = new float[paramArrayOfFloat.length];
      float[] arrayOfFloat = this.data;
      System.arraycopy(paramArrayOfFloat, 0, arrayOfFloat, 0, arrayOfFloat.length);
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
  
  public AmbientCubemap add(float paramFloat1, float paramFloat2, float paramFloat3) {
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.data;
      if (b < arrayOfFloat.length) {
        boolean bool = b + true;
        arrayOfFloat[b] = arrayOfFloat[b] + paramFloat1;
        b = bool + true;
        arrayOfFloat[bool] = arrayOfFloat[bool] + paramFloat2;
        arrayOfFloat[b] = arrayOfFloat[b] + paramFloat3;
        b++;
        continue;
      } 
      break;
    } 
    return this;
  }
  
  public AmbientCubemap add(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    byte b1;
    float f1 = paramFloat4 * paramFloat4;
    float f2 = paramFloat5 * paramFloat5;
    float f3 = paramFloat6 * paramFloat6;
    float f4 = f1 + f2 + f3;
    if (f4 == 0.0F)
      return this; 
    f4 = 1.0F / f4 * (f4 + 1.0F);
    paramFloat1 *= f4;
    paramFloat2 *= f4;
    paramFloat3 *= f4;
    if (paramFloat4 > 0.0F) {
      b1 = 0;
    } else {
      b1 = 3;
    } 
    float[] arrayOfFloat = this.data;
    arrayOfFloat[b1] = arrayOfFloat[b1] + f1 * paramFloat1;
    byte b2 = b1 + 1;
    arrayOfFloat[b2] = arrayOfFloat[b2] + f1 * paramFloat2;
    b1 += 2;
    arrayOfFloat[b1] = arrayOfFloat[b1] + f1 * paramFloat3;
    if (paramFloat5 > 0.0F) {
      b1 = 6;
    } else {
      b1 = 9;
    } 
    arrayOfFloat = this.data;
    arrayOfFloat[b1] = arrayOfFloat[b1] + f2 * paramFloat1;
    b2 = b1 + 1;
    arrayOfFloat[b2] = arrayOfFloat[b2] + f2 * paramFloat2;
    b1 += 2;
    arrayOfFloat[b1] = arrayOfFloat[b1] + f2 * paramFloat3;
    if (paramFloat6 > 0.0F) {
      b1 = 12;
    } else {
      b1 = 15;
    } 
    arrayOfFloat = this.data;
    arrayOfFloat[b1] = arrayOfFloat[b1] + paramFloat1 * f3;
    b2 = b1 + 1;
    arrayOfFloat[b2] = arrayOfFloat[b2] + paramFloat2 * f3;
    b1 += 2;
    arrayOfFloat[b1] = arrayOfFloat[b1] + f3 * paramFloat3;
    return this;
  }
  
  public AmbientCubemap add(float paramFloat1, float paramFloat2, float paramFloat3, Vector3 paramVector3) { return add(paramFloat1, paramFloat2, paramFloat3, paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public AmbientCubemap add(Color paramColor) { return add(paramColor.r, paramColor.g, paramColor.b); }
  
  public AmbientCubemap add(Color paramColor, float paramFloat1, float paramFloat2, float paramFloat3) { return add(paramColor.r, paramColor.g, paramColor.b, paramFloat1, paramFloat2, paramFloat3); }
  
  public AmbientCubemap add(Color paramColor, Vector3 paramVector3) { return add(paramColor.r, paramColor.g, paramColor.b, paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public AmbientCubemap add(Color paramColor, Vector3 paramVector31, Vector3 paramVector32) { return add(paramColor.r, paramColor.g, paramColor.b, paramVector32.x - paramVector31.x, paramVector32.y - paramVector31.y, paramVector32.z - paramVector31.z); }
  
  public AmbientCubemap add(Color paramColor, Vector3 paramVector31, Vector3 paramVector32, float paramFloat) {
    paramFloat /= (paramVector32.dst(paramVector31) + 1.0F);
    return add(paramColor.r * paramFloat, paramColor.g * paramFloat, paramColor.b * paramFloat, paramVector32.x - paramVector31.x, paramVector32.y - paramVector31.y, paramVector32.z - paramVector31.z);
  }
  
  public AmbientCubemap clamp() {
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.data;
      if (b < arrayOfFloat.length) {
        arrayOfFloat[b] = clamp(arrayOfFloat[b]);
        b++;
        continue;
      } 
      break;
    } 
    return this;
  }
  
  public AmbientCubemap clear() {
    byte b = 0;
    while (true) {
      float[] arrayOfFloat = this.data;
      if (b < arrayOfFloat.length) {
        arrayOfFloat[b] = 0.0F;
        b++;
        continue;
      } 
      break;
    } 
    return this;
  }
  
  public Color getColor(Color paramColor, int paramInt) {
    paramInt *= 3;
    float[] arrayOfFloat = this.data;
    return paramColor.set(arrayOfFloat[paramInt], arrayOfFloat[paramInt + 1], arrayOfFloat[paramInt + 2], 1.0F);
  }
  
  public AmbientCubemap set(float paramFloat1, float paramFloat2, float paramFloat3) {
    for (boolean bool = false; bool < 18; bool += true) {
      float[] arrayOfFloat = this.data;
      arrayOfFloat[bool] = paramFloat1;
      arrayOfFloat[bool + true] = paramFloat2;
      arrayOfFloat[bool + 2] = paramFloat3;
    } 
    return this;
  }
  
  public AmbientCubemap set(Color paramColor) { return set(paramColor.r, paramColor.g, paramColor.b); }
  
  public AmbientCubemap set(AmbientCubemap paramAmbientCubemap) { return set(paramAmbientCubemap.data); }
  
  public AmbientCubemap set(float[] paramArrayOfFloat) {
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
  
  public String toString() {
    String str = "";
    for (boolean bool = false; bool < this.data.length; bool += true) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append(Float.toString(this.data[bool]));
      stringBuilder.append(", ");
      stringBuilder.append(Float.toString(this.data[bool + true]));
      stringBuilder.append(", ");
      stringBuilder.append(Float.toString(this.data[bool + 2]));
      stringBuilder.append("\n");
      str = stringBuilder.toString();
    } 
    return str;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/AmbientCubemap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */