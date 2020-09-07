package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.MathUtils;

public class ConeShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramInt, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramInt, paramFloat4, paramFloat5, true); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5, boolean paramBoolean) {
    paramMeshPartBuilder.ensureVertices(paramInt + 2);
    paramMeshPartBuilder.ensureTriangleIndices(paramInt);
    float f1 = paramFloat1 * 0.5F;
    float f2 = paramFloat2 * 0.5F;
    paramFloat2 = paramInt;
    float f3 = (paramFloat5 - paramFloat4) * 0.017453292F / paramFloat2;
    float f4 = 1.0F / paramFloat2;
    MeshPartBuilder.VertexInfo vertexInfo = vertTmp3.set(null, null, null, null);
    vertexInfo.hasNormal = true;
    vertexInfo.hasPosition = true;
    vertexInfo.hasUV = true;
    short s1 = paramMeshPartBuilder.vertex(vertTmp4.set(null, null, null, null).setPos(0.0F, f2, 0.0F).setNor(0.0F, 1.0F, 0.0F).setUV(0.5F, 0.0F));
    byte b = 0;
    short s2 = 0;
    short s3 = s2;
    paramFloat2 = f1;
    while (b <= paramInt) {
      float f = b;
      f1 = f3 * f + paramFloat4 * 0.017453292F;
      vertexInfo.position.set(MathUtils.cos(f1) * paramFloat2, 0.0F, MathUtils.sin(f1) * paramFloat3 * 0.5F);
      vertexInfo.normal.set(vertexInfo.position).nor();
      vertexInfo.position.y = -f2;
      vertexInfo.uv.set(1.0F - f * f4, 1.0F);
      short s = paramMeshPartBuilder.vertex(vertexInfo);
      if (b)
        paramMeshPartBuilder.triangle(s1, s, s3); 
      b++;
      s2 = s;
      s3 = s2;
    } 
    if (paramBoolean)
      EllipseShapeBuilder.build(paramMeshPartBuilder, paramFloat1, paramFloat3, 0.0F, 0.0F, paramInt, 0.0F, -f2, 0.0F, 0.0F, -1.0F, 0.0F, -1.0F, 0.0F, 0.0F, 0.0F, 0.0F, 1.0F, 180.0F - paramFloat5, 180.0F - paramFloat4); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */