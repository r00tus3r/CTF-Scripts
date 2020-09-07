package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.ShortArray;

public class SphereShapeBuilder extends BaseShapeBuilder {
  private static final Matrix3 normalTransform;
  
  private static final ShortArray tmpIndices = new ShortArray();
  
  static  {
    normalTransform = new Matrix3();
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, 0.0F, 360.0F, 0.0F, 180.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { build(paramMeshPartBuilder, matTmp1.idt(), paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramFloat4, paramFloat5, paramFloat6, paramFloat7); }
  
  @Deprecated
  public static void build(MeshPartBuilder paramMeshPartBuilder, Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2) { build(paramMeshPartBuilder, paramMatrix4, paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, 0.0F, 360.0F, 0.0F, 180.0F); }
  
  @Deprecated
  public static void build(MeshPartBuilder paramMeshPartBuilder, Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) {
    int i = paramInt1;
    int j = paramInt2;
    paramFloat1 *= 0.5F;
    float f1 = paramFloat2 * 0.5F;
    float f2 = 0.5F * paramFloat3;
    paramFloat3 = paramFloat4 * 0.017453292F;
    float f3 = i;
    float f4 = (paramFloat5 - paramFloat4) * 0.017453292F / f3;
    paramFloat2 = paramFloat6 * 0.017453292F;
    paramFloat4 = j;
    paramFloat5 = (paramFloat7 - paramFloat6) * 0.017453292F / paramFloat4;
    f3 = 1.0F / f3;
    paramFloat4 = 1.0F / paramFloat4;
    MeshPartBuilder.VertexInfo vertexInfo = vertTmp3.set(null, null, null, null);
    vertexInfo.hasNormal = true;
    vertexInfo.hasPosition = true;
    vertexInfo.hasUV = true;
    normalTransform.set(paramMatrix4);
    int k = i + 3;
    tmpIndices.clear();
    tmpIndices.ensureCapacity(i * 2);
    tmpIndices.size = k;
    int m = i + 1;
    paramMeshPartBuilder.ensureVertices((j + 1) * m);
    paramMeshPartBuilder.ensureRectangleIndices(i);
    i = 0;
    j = 0;
    paramFloat7 = paramFloat3;
    paramFloat3 = f1;
    paramFloat6 = f2;
    while (i <= paramInt2) {
      f2 = i;
      float f = paramFloat2 + paramFloat5 * f2;
      f2 *= paramFloat4;
      f1 = MathUtils.sin(f);
      f = MathUtils.cos(f);
      byte b = 0;
      while (true) {
        int n = paramInt1;
        if (b <= n) {
          float f5 = b;
          float f6 = paramFloat7 + f4 * f5;
          vertexInfo.position.set(MathUtils.cos(f6) * paramFloat1 * f1, f * paramFloat3, MathUtils.sin(f6) * paramFloat6 * f1);
          vertexInfo.normal.set(vertexInfo.position).mul(normalTransform).nor();
          vertexInfo.position.mul(paramMatrix4);
          vertexInfo.uv.set(1.0F - f5 * f3, f2);
          tmpIndices.set(j, paramMeshPartBuilder.vertex(vertexInfo));
          int i1 = j + k;
          if (i > 0 && b)
            paramMeshPartBuilder.rect(tmpIndices.get(j), tmpIndices.get((i1 - 1) % k), tmpIndices.get((i1 - n + 2) % k), tmpIndices.get((i1 - m) % k)); 
          j = (j + 1) % tmpIndices.size;
          b++;
          continue;
        } 
        break;
      } 
      i++;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */