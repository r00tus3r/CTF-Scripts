package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;

public class Bresenham2 {
  private final Array<GridPoint2> points = new Array();
  
  private final Pool<GridPoint2> pool = new Pool<GridPoint2>() {
      protected GridPoint2 newObject() { return new GridPoint2(); }
    };
  
  public Array<GridPoint2> line(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.pool.freeAll(this.points);
    this.points.clear();
    return line(paramInt1, paramInt2, paramInt3, paramInt4, this.pool, this.points);
  }
  
  public Array<GridPoint2> line(int paramInt1, int paramInt2, int paramInt3, int paramInt4, Pool<GridPoint2> paramPool, Array<GridPoint2> paramArray) {
    int m;
    int i = paramInt3 - paramInt1;
    int j = paramInt4 - paramInt2;
    int k = -1;
    byte b = 0;
    if (i < 0) {
      paramInt4 = -1;
      paramInt3 = -1;
    } else if (i > 0) {
      paramInt4 = 1;
      paramInt3 = 1;
    } else {
      paramInt4 = 0;
      paramInt3 = 0;
    } 
    if (j < 0) {
      m = -1;
    } else if (j > 0) {
      m = 1;
    } else {
      m = 0;
    } 
    int n = Math.abs(i);
    int i1 = Math.abs(j);
    if (n <= i1) {
      n = Math.abs(j);
      i1 = Math.abs(i);
      if (j < 0) {
        paramInt3 = k;
      } else if (j > 0) {
        paramInt3 = 1;
      } else {
        paramInt3 = 0;
      } 
      k = 0;
      j = paramInt3;
    } else {
      j = 0;
      k = paramInt3;
    } 
    i = n >> 1;
    paramInt3 = paramInt1;
    while (b <= n) {
      GridPoint2 gridPoint2 = (GridPoint2)paramPool.obtain();
      gridPoint2.set(paramInt3, paramInt2);
      paramArray.add(gridPoint2);
      paramInt1 = i + i1;
      if (paramInt1 > n) {
        paramInt1 -= n;
        paramInt3 += paramInt4;
        paramInt2 += m;
      } else {
        paramInt3 += k;
        paramInt2 += j;
      } 
      b++;
      i = paramInt1;
    } 
    return paramArray;
  }
  
  public Array<GridPoint2> line(GridPoint2 paramGridPoint21, GridPoint2 paramGridPoint22) { return line(paramGridPoint21.x, paramGridPoint21.y, paramGridPoint22.x, paramGridPoint22.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Bresenham2.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */