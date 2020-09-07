package com.badlogic.gdx.math;

public final class GeometryUtils {
  private static final Vector2 tmp1 = new Vector2();
  
  private static final Vector2 tmp2 = new Vector2();
  
  private static final Vector2 tmp3 = new Vector2();
  
  public static boolean barycoordInsideTriangle(Vector2 paramVector2) {
    boolean bool;
    if (paramVector2.x >= 0.0F && paramVector2.y >= 0.0F && paramVector2.x + paramVector2.y <= 1.0F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean colinear(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    boolean bool;
    if (Math.abs((paramFloat5 - paramFloat3) * (paramFloat4 - paramFloat2) - (paramFloat3 - paramFloat1) * (paramFloat6 - paramFloat4)) < 1.0E-6F) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static void ensureCCW(float[] paramArrayOfFloat) { ensureCCW(paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public static void ensureCCW(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (!isClockwise(paramArrayOfFloat, paramInt1, paramInt2))
      return; 
    int i = paramInt2 / 2;
    for (int j = paramInt1; j < i + paramInt1; j += 2) {
      int k = paramInt1 + paramInt2 - 2 - j;
      float f1 = paramArrayOfFloat[j];
      int m = j + 1;
      float f2 = paramArrayOfFloat[m];
      paramArrayOfFloat[j] = paramArrayOfFloat[k];
      int n = k + 1;
      paramArrayOfFloat[m] = paramArrayOfFloat[n];
      paramArrayOfFloat[k] = f1;
      paramArrayOfFloat[n] = f2;
    } 
  }
  
  public static float fromBarycoord(Vector2 paramVector2, float paramFloat1, float paramFloat2, float paramFloat3) { return (1.0F - paramVector2.x - paramVector2.y) * paramFloat1 + paramVector2.x * paramFloat2 + paramVector2.y * paramFloat3; }
  
  public static Vector2 fromBarycoord(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24, Vector2 paramVector25) {
    float f = 1.0F - paramVector21.x - paramVector21.y;
    paramVector25.x = paramVector22.x * f + paramVector21.x * paramVector23.x + paramVector21.y * paramVector24.x;
    paramVector25.y = f * paramVector22.y + paramVector21.x * paramVector23.y + paramVector21.y * paramVector24.y;
    return paramVector25;
  }
  
  public static boolean isClockwise(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    boolean bool = false;
    if (paramInt2 <= 2)
      return false; 
    paramInt2 = paramInt2 + paramInt1 - 2;
    float f1 = paramArrayOfFloat[paramInt2];
    float f2 = paramArrayOfFloat[paramInt2 + 1];
    float f3 = 0.0F;
    while (paramInt1 <= paramInt2) {
      float f4 = paramArrayOfFloat[paramInt1];
      float f5 = paramArrayOfFloat[paramInt1 + 1];
      f3 += f1 * f5 - f2 * f4;
      paramInt1 += 2;
      f1 = f4;
      f2 = f5;
    } 
    if (f3 < 0.0F)
      bool = true; 
    return bool;
  }
  
  public static float lowestPositiveRoot(float paramFloat1, float paramFloat2, float paramFloat3) {
    paramFloat3 = paramFloat2 * paramFloat2 - 4.0F * paramFloat1 * paramFloat3;
    if (paramFloat3 < 0.0F)
      return NaNF; 
    paramFloat3 = (float)Math.sqrt(paramFloat3);
    float f = 1.0F / paramFloat1 * 2.0F;
    paramFloat2 = -paramFloat2;
    paramFloat1 = (paramFloat2 - paramFloat3) * f;
    paramFloat2 = (paramFloat2 + paramFloat3) * f;
    if (paramFloat1 > paramFloat2) {
      paramFloat3 = paramFloat2;
      paramFloat2 = paramFloat1;
    } else {
      paramFloat3 = paramFloat1;
    } 
    return (paramFloat3 > 0.0F) ? paramFloat3 : ((paramFloat2 > 0.0F) ? paramFloat2 : NaNF);
  }
  
  public static float polygonArea(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    paramInt2 = paramInt2 + paramInt1 - 2;
    float f1 = paramArrayOfFloat[paramInt2];
    float f2 = paramArrayOfFloat[paramInt2 + 1];
    float f3 = 0.0F;
    while (paramInt1 <= paramInt2) {
      float f4 = paramArrayOfFloat[paramInt1];
      float f5 = paramArrayOfFloat[paramInt1 + 1];
      f3 += f1 * f5 - f2 * f4;
      paramInt1 += 2;
      f1 = f4;
      f2 = f5;
    } 
    return f3 * 0.5F;
  }
  
  public static Vector2 polygonCentroid(float[] paramArrayOfFloat, int paramInt1, int paramInt2, Vector2 paramVector2) {
    if (paramInt2 >= 6) {
      paramInt2 = paramInt2 + paramInt1 - 2;
      float f1 = paramArrayOfFloat[paramInt2];
      float f2 = paramArrayOfFloat[paramInt2 + 1];
      float f3 = 0.0F;
      float f4 = 0.0F;
      float f5 = 0.0F;
      while (paramInt1 <= paramInt2) {
        float f6 = paramArrayOfFloat[paramInt1];
        float f7 = paramArrayOfFloat[paramInt1 + 1];
        float f8 = f1 * f7 - f6 * f2;
        f5 += f8;
        f3 += (f1 + f6) * f8;
        f4 += (f2 + f7) * f8;
        paramInt1 += 2;
        f1 = f6;
        f2 = f7;
      } 
      if (f5 == 0.0F) {
        paramVector2.x = 0.0F;
        paramVector2.y = 0.0F;
      } else {
        f1 = f5 * 0.5F * 6.0F;
        paramVector2.x = f3 / f1;
        paramVector2.y = f4 / f1;
      } 
      return paramVector2;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("A polygon must have 3 or more coordinate pairs.");
    throw illegalArgumentException;
  }
  
  public static Vector2 quadrilateralCentroid(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, Vector2 paramVector2) {
    paramFloat3 = (paramFloat3 + paramFloat1 + paramFloat5) / 3.0F;
    paramFloat4 = (paramFloat4 + paramFloat2 + paramFloat6) / 3.0F;
    paramFloat1 = (paramFloat1 + paramFloat7 + paramFloat5) / 3.0F;
    paramFloat2 = (paramFloat2 + paramFloat8 + paramFloat6) / 3.0F;
    paramVector2.x = paramFloat3 - (paramFloat3 - paramFloat1) / 2.0F;
    paramVector2.y = paramFloat4 - (paramFloat4 - paramFloat2) / 2.0F;
    return paramVector2;
  }
  
  public static Vector2 toBarycoord(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24, Vector2 paramVector25) {
    paramVector23 = tmp1.set(paramVector23).sub(paramVector22);
    paramVector24 = tmp2.set(paramVector24).sub(paramVector22);
    paramVector21 = tmp3.set(paramVector21).sub(paramVector22);
    float f1 = paramVector23.dot(paramVector23);
    float f2 = paramVector23.dot(paramVector24);
    float f3 = paramVector24.dot(paramVector24);
    float f4 = paramVector21.dot(paramVector23);
    float f5 = paramVector21.dot(paramVector24);
    float f6 = f1 * f3 - f2 * f2;
    paramVector25.x = (f3 * f4 - f2 * f5) / f6;
    paramVector25.y = (f1 * f5 - f2 * f4) / f6;
    return paramVector25;
  }
  
  public static float triangleArea(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return Math.abs((paramFloat1 - paramFloat5) * (paramFloat4 - paramFloat2) - (paramFloat1 - paramFloat3) * (paramFloat6 - paramFloat2)) * 0.5F; }
  
  public static Vector2 triangleCentroid(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, Vector2 paramVector2) {
    paramVector2.x = (paramFloat1 + paramFloat3 + paramFloat5) / 3.0F;
    paramVector2.y = (paramFloat2 + paramFloat4 + paramFloat6) / 3.0F;
    return paramVector2;
  }
  
  public static Vector2 triangleCircumcenter(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, Vector2 paramVector2) {
    float f1 = paramFloat3 - paramFloat1;
    float f2 = paramFloat4 - paramFloat2;
    float f3 = paramFloat5 - paramFloat3;
    float f4 = paramFloat6 - paramFloat4;
    float f5 = f3 * f2 - f1 * f4;
    if (Math.abs(f5) >= 1.0E-6F) {
      float f = f5 * 2.0F;
      f5 = paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2;
      paramFloat3 = paramFloat3 * paramFloat3 + paramFloat4 * paramFloat4;
      paramFloat4 = paramFloat5 * paramFloat5 + paramFloat6 * paramFloat6;
      paramVector2.set((f4 * f5 + (paramFloat2 - paramFloat6) * paramFloat3 + f2 * paramFloat4) / f, -(f5 * f3 + paramFloat3 * (paramFloat1 - paramFloat5) + paramFloat4 * f1) / f);
      return paramVector2;
    } 
    throw new IllegalArgumentException("Triangle points must not be colinear.");
  }
  
  public static float triangleCircumradius(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    float f = paramFloat4 - paramFloat2;
    if (Math.abs(f) < 1.0E-6F) {
      f = -(paramFloat5 - paramFloat3) / (paramFloat6 - paramFloat4);
      paramFloat5 = (paramFloat5 + paramFloat3) / 2.0F;
      paramFloat6 = (paramFloat4 + paramFloat6) / 2.0F;
      paramFloat4 = (paramFloat3 + paramFloat1) / 2.0F;
      paramFloat3 = f * (paramFloat4 - paramFloat5) + paramFloat6;
    } else {
      float f1 = paramFloat6 - paramFloat4;
      if (Math.abs(f1) < 1.0E-6F) {
        f = -(paramFloat3 - paramFloat1) / f;
        paramFloat6 = (paramFloat1 + paramFloat3) / 2.0F;
        f1 = (paramFloat4 + paramFloat2) / 2.0F;
        paramFloat4 = (paramFloat5 + paramFloat3) / 2.0F;
        paramFloat3 = f * (paramFloat4 - paramFloat6) + f1;
      } else {
        f = -(paramFloat3 - paramFloat1) / f;
        float f2 = -(paramFloat5 - paramFloat3) / f1;
        f1 = (paramFloat1 + paramFloat3) / 2.0F;
        paramFloat5 = (paramFloat3 + paramFloat5) / 2.0F;
        paramFloat3 = (paramFloat2 + paramFloat4) / 2.0F;
        paramFloat4 = (f * f1 - paramFloat5 * f2 + (paramFloat4 + paramFloat6) / 2.0F - paramFloat3) / (f - f2);
        paramFloat3 = f * (paramFloat4 - f1) + paramFloat3;
      } 
    } 
    paramFloat1 -= paramFloat4;
    paramFloat2 -= paramFloat3;
    return (float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2));
  }
  
  public static float triangleQuality(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return Math.min((float)Math.sqrt((paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2)), Math.min((float)Math.sqrt((paramFloat3 * paramFloat3 + paramFloat4 * paramFloat4)), (float)Math.sqrt((paramFloat5 * paramFloat5 + paramFloat6 * paramFloat6)))) / triangleCircumradius(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/GeometryUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */