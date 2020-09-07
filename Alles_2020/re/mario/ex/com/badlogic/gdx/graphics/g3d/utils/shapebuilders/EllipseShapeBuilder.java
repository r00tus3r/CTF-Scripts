package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class EllipseShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12) {
    tmpV1.set(paramFloat8, paramFloat9, paramFloat10).crs(0.0F, 0.0F, 1.0F);
    tmpV2.set(paramFloat8, paramFloat9, paramFloat10).crs(0.0F, 1.0F, 0.0F);
    if (tmpV2.len2() > tmpV1.len2())
      tmpV1.set(tmpV2); 
    tmpV2.set(tmpV1.nor()).crs(paramFloat8, paramFloat9, paramFloat10).nor();
    build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, tmpV1.x, tmpV1.y, tmpV1.z, tmpV2.x, tmpV2.y, tmpV2.z, paramFloat11, paramFloat12);
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, float paramFloat16, float paramFloat17, float paramFloat18) {
    if (paramFloat3 <= 0.0F || paramFloat4 <= 0.0F) {
      paramMeshPartBuilder.ensureVertices(paramInt + 2);
      paramMeshPartBuilder.ensureTriangleIndices(paramInt);
    } else if (paramFloat3 == paramFloat1 && paramFloat4 == paramFloat2) {
      int i = paramInt + 1;
      paramMeshPartBuilder.ensureVertices(i);
      paramMeshPartBuilder.ensureIndices(i);
      if (paramMeshPartBuilder.getPrimitiveType() != 1)
        throw new GdxRuntimeException("Incorrect primitive type : expect GL_LINES because innerWidth == width && innerHeight == height"); 
    } else {
      int i = paramInt + 1;
      paramMeshPartBuilder.ensureVertices(i * 2);
      paramMeshPartBuilder.ensureRectangleIndices(i);
    } 
    paramFloat18 = (paramFloat18 - paramFloat17) * 0.017453292F / paramInt;
    Vector3 vector31 = tmpV1.set(paramFloat11, paramFloat12, paramFloat13).scl(paramFloat1 * 0.5F);
    Vector3 vector32 = tmpV2.set(paramFloat14, paramFloat15, paramFloat16).scl(paramFloat2 * 0.5F);
    Vector3 vector33 = tmpV3.set(paramFloat11, paramFloat12, paramFloat13).scl(paramFloat3 * 0.5F);
    Vector3 vector34 = tmpV4.set(paramFloat14, paramFloat15, paramFloat16).scl(paramFloat4 * 0.5F);
    MeshPartBuilder.VertexInfo vertexInfo1 = vertTmp3.set(null, null, null, null);
    vertexInfo1.hasNormal = true;
    vertexInfo1.hasPosition = true;
    vertexInfo1.hasUV = true;
    vertexInfo1.uv.set(0.5F, 0.5F);
    vertexInfo1.position.set(paramFloat5, paramFloat6, paramFloat7);
    vertexInfo1.normal.set(paramFloat8, paramFloat9, paramFloat10);
    MeshPartBuilder.VertexInfo vertexInfo2 = vertTmp4.set(null, null, null, null);
    vertexInfo2.hasNormal = true;
    vertexInfo2.hasPosition = true;
    vertexInfo2.hasUV = true;
    vertexInfo2.uv.set(0.5F, 0.5F);
    vertexInfo2.position.set(paramFloat5, paramFloat6, paramFloat7);
    vertexInfo2.normal.set(paramFloat8, paramFloat9, paramFloat10);
    short s1 = paramMeshPartBuilder.vertex(vertexInfo2);
    paramFloat8 = paramFloat3 / paramFloat1 * 0.5F;
    paramFloat9 = paramFloat4 / paramFloat2 * 0.5F;
    byte b = 0;
    short s2 = 0;
    short s3 = 0;
    short s4 = 0;
    short s5 = s4;
    short s6 = s3;
    short s7 = s2;
    short s8 = s1;
    while (true) {
      short s;
      if (b <= paramInt) {
        paramFloat11 = paramFloat17 * 0.017453292F + b * paramFloat18;
        paramFloat10 = MathUtils.cos(paramFloat11);
        paramFloat11 = MathUtils.sin(paramFloat11);
        vertexInfo2.position.set(paramFloat5, paramFloat6, paramFloat7).add(vector31.x * paramFloat10 + vector32.x * paramFloat11, vector31.y * paramFloat10 + vector32.y * paramFloat11, vector31.z * paramFloat10 + vector32.z * paramFloat11);
        vertexInfo2.uv.set(paramFloat10 * 0.5F + 0.5F, paramFloat11 * 0.5F + 0.5F);
        s = paramMeshPartBuilder.vertex(vertexInfo2);
        if (paramFloat3 <= 0.0F || paramFloat4 <= 0.0F) {
          if (b)
            paramMeshPartBuilder.triangle(s, s7, s8); 
        } else if (paramFloat3 == paramFloat1 && paramFloat4 == paramFloat2) {
          if (b)
            paramMeshPartBuilder.line(s, s7); 
        } else {
          Vector3 vector35 = vertexInfo1.position.set(paramFloat5, paramFloat6, paramFloat7);
          paramFloat12 = vector33.x;
          Vector3 vector36 = vector34;
          vector35.add(paramFloat12 * paramFloat10 + vector36.x * paramFloat11, vector33.y * paramFloat10 + vector36.y * paramFloat11, vector33.z * paramFloat10 + vector36.z * paramFloat11);
          vertexInfo1.uv.set(paramFloat8 * paramFloat10 + 0.5F, paramFloat9 * paramFloat11 + 0.5F);
          s7 = paramMeshPartBuilder.vertex(vertexInfo1);
          if (b)
            paramMeshPartBuilder.rect(s7, s, s5, s6); 
          s1 = s7;
          s2 = s;
          b++;
          s3 = s;
          s4 = s8;
          s8 = s4;
          s7 = s3;
          s6 = s1;
          s5 = s2;
        } 
        s1 = s6;
        s2 = s5;
      } else {
        break;
      } 
      b++;
      s3 = s;
      s4 = s8;
      s8 = s4;
      s7 = s3;
      s6 = s1;
      s5 = s2;
    } 
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, Vector3 paramVector31, Vector3 paramVector32) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, 0.0F, 0.0F, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, float paramFloat16) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, 0.0F, 0.0F, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15, paramFloat16); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, float paramFloat3, float paramFloat4) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, 0.0F, 0.0F, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramFloat3, paramFloat4); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramVector33.x, paramVector33.y, paramVector33.z, paramVector34.x, paramVector34.y, paramVector34.z); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, float paramFloat3, float paramFloat4) { build(paramMeshPartBuilder, paramFloat1, paramFloat2, 0.0F, 0.0F, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramVector33.x, paramVector33.y, paramVector33.z, paramVector34.x, paramVector34.y, paramVector34.z, paramFloat3, paramFloat4); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { build(paramMeshPartBuilder, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    paramFloat1 *= 2.0F;
    build(paramMeshPartBuilder, paramFloat1, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9);
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13) { build(paramMeshPartBuilder, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, 0.0F, 360.0F); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15) {
    paramFloat1 *= 2.0F;
    build(paramMeshPartBuilder, paramFloat1, paramFloat1, 0.0F, 0.0F, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15);
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat, int paramInt, Vector3 paramVector31, Vector3 paramVector32) { build(paramMeshPartBuilder, paramFloat, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, int paramInt, Vector3 paramVector31, Vector3 paramVector32, float paramFloat2, float paramFloat3) { build(paramMeshPartBuilder, paramFloat1, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramFloat2, paramFloat3); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) { build(paramMeshPartBuilder, paramFloat, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramVector33.x, paramVector33.y, paramVector33.z, paramVector34.x, paramVector34.y, paramVector34.z); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, float paramFloat2, float paramFloat3) { build(paramMeshPartBuilder, paramFloat1, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramVector33.x, paramVector33.y, paramVector33.z, paramVector34.x, paramVector34.y, paramVector34.z, paramFloat2, paramFloat3); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */