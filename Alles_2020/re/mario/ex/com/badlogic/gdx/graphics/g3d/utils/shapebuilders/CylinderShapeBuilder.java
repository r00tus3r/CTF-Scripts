package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.MathUtils;

public class CylinderShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramInt, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramInt, paramFloat4, paramFloat5, true); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5, boolean paramBoolean) {
    float f1 = paramFloat2 * 0.5F;
    float f2 = 0.5F * paramFloat3;
    paramFloat2 = paramInt;
    float f3 = (paramFloat5 - paramFloat4) * 0.017453292F / paramFloat2;
    paramFloat2 = 1.0F / paramFloat2;
    MeshPartBuilder.VertexInfo vertexInfo1 = vertTmp3.set(null, null, null, null);
    vertexInfo1.hasNormal = true;
    vertexInfo1.hasPosition = true;
    vertexInfo1.hasUV = true;
    MeshPartBuilder.VertexInfo vertexInfo2 = vertTmp4.set(null, null, null, null);
    vertexInfo2.hasNormal = true;
    vertexInfo2.hasPosition = true;
    vertexInfo2.hasUV = true;
    paramMeshPartBuilder.ensureVertices((paramInt + 1) * 2);
    paramMeshPartBuilder.ensureRectangleIndices(paramInt);
    byte b = 0;
    short s1 = 0;
    short s2 = 0;
    short s3 = s2;
    short s4 = s1;
    while (b <= paramInt) {
      float f4 = b;
      float f5 = f3 * f4 + paramFloat4 * 0.017453292F;
      f4 = 1.0F - f4 * paramFloat2;
      vertexInfo1.position.set(MathUtils.cos(f5) * paramFloat1 * 0.5F, 0.0F, MathUtils.sin(f5) * f2);
      vertexInfo1.normal.set(vertexInfo1.position).nor();
      vertexInfo1.position.y = -f1;
      vertexInfo1.uv.set(f4, 1.0F);
      vertexInfo2.position.set(vertexInfo1.position);
      vertexInfo2.normal.set(vertexInfo1.normal);
      vertexInfo2.position.y = f1;
      vertexInfo2.uv.set(f4, 0.0F);
      short s5 = paramMeshPartBuilder.vertex(vertexInfo1);
      short s6 = paramMeshPartBuilder.vertex(vertexInfo2);
      if (b)
        paramMeshPartBuilder.rect(s4, s6, s5, s3); 
      b++;
      s1 = s5;
      s2 = s6;
      s4 = s2;
      s3 = s1;
    } 
    if (paramBoolean) {
      EllipseShapeBuilder.build(paramMeshPartBuilder, paramFloat1, paramFloat3, 0.0F, 0.0F, paramInt, 0.0F, f1, 0.0F, 0.0F, 1.0F, 0.0F, 1.0F, 0.0F, 0.0F, 0.0F, 0.0F, 1.0F, paramFloat4, paramFloat5);
      EllipseShapeBuilder.build(paramMeshPartBuilder, paramFloat1, paramFloat3, 0.0F, 0.0F, paramInt, 0.0F, -f1, 0.0F, 0.0F, -1.0F, 0.0F, -1.0F, 0.0F, 0.0F, 0.0F, 0.0F, 1.0F, 180.0F - paramFloat5, 180.0F - paramFloat4);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/CylinderShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */