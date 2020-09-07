package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.ShortArray;

public class EarClippingTriangulator {
  private static final int CONCAVE = -1;
  
  private static final int CONVEX = 1;
  
  private short[] indices;
  
  private final ShortArray indicesArray = new ShortArray();
  
  private final ShortArray triangles = new ShortArray();
  
  private int vertexCount;
  
  private final IntArray vertexTypes = new IntArray();
  
  private float[] vertices;
  
  private int classifyVertex(int paramInt) {
    short[] arrayOfShort = this.indices;
    short s1 = arrayOfShort[previousIndex(paramInt)] * 2;
    short s2 = arrayOfShort[paramInt] * 2;
    paramInt = arrayOfShort[nextIndex(paramInt)] * 2;
    float[] arrayOfFloat = this.vertices;
    return computeSpannedAreaSign(arrayOfFloat[s1], arrayOfFloat[s1 + 1], arrayOfFloat[s2], arrayOfFloat[s2 + 1], arrayOfFloat[paramInt], arrayOfFloat[paramInt + 1]);
  }
  
  private static int computeSpannedAreaSign(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return (int)Math.signum(paramFloat1 * (paramFloat6 - paramFloat4) + paramFloat3 * (paramFloat2 - paramFloat6) + paramFloat5 * (paramFloat4 - paramFloat2)); }
  
  private void cutEarTip(int paramInt) {
    short[] arrayOfShort = this.indices;
    ShortArray shortArray = this.triangles;
    shortArray.add(arrayOfShort[previousIndex(paramInt)]);
    shortArray.add(arrayOfShort[paramInt]);
    shortArray.add(arrayOfShort[nextIndex(paramInt)]);
    this.indicesArray.removeIndex(paramInt);
    this.vertexTypes.removeIndex(paramInt);
    this.vertexCount--;
  }
  
  private int findEarTip() {
    int i = this.vertexCount;
    byte b;
    for (b = 0; b < i; b++) {
      if (isEarTip(b))
        return b; 
    } 
    int[] arrayOfInt = this.vertexTypes.items;
    for (b = 0; b < i; b++) {
      if (arrayOfInt[b] != -1)
        return b; 
    } 
    return 0;
  }
  
  private boolean isEarTip(int paramInt) {
    int[] arrayOfInt = this.vertexTypes.items;
    if (arrayOfInt[paramInt] == -1)
      return false; 
    int i = previousIndex(paramInt);
    int j = nextIndex(paramInt);
    short[] arrayOfShort = this.indices;
    short s1 = arrayOfShort[i] * 2;
    paramInt = arrayOfShort[paramInt] * 2;
    short s2 = arrayOfShort[j] * 2;
    float[] arrayOfFloat = this.vertices;
    float f1 = arrayOfFloat[s1];
    float f2 = arrayOfFloat[s1 + 1];
    float f3 = arrayOfFloat[paramInt];
    float f4 = arrayOfFloat[paramInt + 1];
    float f5 = arrayOfFloat[s2];
    float f6 = arrayOfFloat[s2 + 1];
    for (paramInt = nextIndex(j); paramInt != i; paramInt = nextIndex(paramInt)) {
      if (arrayOfInt[paramInt] != 1) {
        s1 = arrayOfShort[paramInt] * 2;
        float f7 = arrayOfFloat[s1];
        float f8 = arrayOfFloat[s1 + 1];
        if (computeSpannedAreaSign(f5, f6, f1, f2, f7, f8) >= 0 && computeSpannedAreaSign(f1, f2, f3, f4, f7, f8) >= 0 && computeSpannedAreaSign(f3, f4, f5, f6, f7, f8) >= 0)
          return false; 
      } 
    } 
    return true;
  }
  
  private int nextIndex(int paramInt) { return (paramInt + 1) % this.vertexCount; }
  
  private int previousIndex(int paramInt) {
    int i = paramInt;
    if (paramInt == 0)
      i = this.vertexCount; 
    return i - 1;
  }
  
  private void triangulate() {
    int i;
    int[] arrayOfInt = this.vertexTypes.items;
    while (true) {
      i = this.vertexCount;
      if (i > 3) {
        int j = findEarTip();
        cutEarTip(j);
        int k = previousIndex(j);
        i = j;
        if (j == this.vertexCount)
          i = 0; 
        arrayOfInt[k] = classifyVertex(k);
        arrayOfInt[i] = classifyVertex(i);
        continue;
      } 
      break;
    } 
    if (i == 3) {
      ShortArray shortArray = this.triangles;
      short[] arrayOfShort = this.indices;
      shortArray.add(arrayOfShort[0]);
      shortArray.add(arrayOfShort[1]);
      shortArray.add(arrayOfShort[2]);
    } 
  }
  
  public ShortArray computeTriangles(FloatArray paramFloatArray) { return computeTriangles(paramFloatArray.items, 0, paramFloatArray.size); }
  
  public ShortArray computeTriangles(float[] paramArrayOfFloat) { return computeTriangles(paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public ShortArray computeTriangles(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    this.vertices = paramArrayOfFloat;
    int i = paramInt2 / 2;
    this.vertexCount = i;
    int j = paramInt1 / 2;
    ShortArray shortArray2 = this.indicesArray;
    shortArray2.clear();
    shortArray2.ensureCapacity(i);
    shortArray2.size = i;
    short[] arrayOfShort = shortArray2.items;
    this.indices = arrayOfShort;
    if (GeometryUtils.isClockwise(paramArrayOfFloat, paramInt1, paramInt2)) {
      for (paramInt1 = 0; paramInt1 < i; paramInt1 = (short)(paramInt1 + 1))
        arrayOfShort[paramInt1] = (short)(short)(j + paramInt1); 
    } else {
      for (paramInt1 = 0; paramInt1 < i; paramInt1++)
        arrayOfShort[paramInt1] = (short)(short)(j + i - 1 - paramInt1); 
    } 
    IntArray intArray = this.vertexTypes;
    intArray.clear();
    intArray.ensureCapacity(i);
    for (paramInt1 = 0; paramInt1 < i; paramInt1++)
      intArray.add(classifyVertex(paramInt1)); 
    ShortArray shortArray1 = this.triangles;
    shortArray1.clear();
    shortArray1.ensureCapacity(Math.max(0, i - 2) * 3);
    triangulate();
    return shortArray1;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/EarClippingTriangulator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */