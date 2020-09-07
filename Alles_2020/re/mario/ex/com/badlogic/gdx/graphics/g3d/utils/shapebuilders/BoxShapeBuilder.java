package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;

public class BoxShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3) { build(paramMeshPartBuilder, 0.0F, 0.0F, 0.0F, paramFloat1, paramFloat2, paramFloat3); }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    float f1 = paramFloat4 * 0.5F;
    float f2 = paramFloat5 * 0.5F;
    float f3 = 0.5F * paramFloat6;
    paramFloat5 = paramFloat1 - f1;
    paramFloat4 = paramFloat2 - f2;
    paramFloat6 = paramFloat3 - f3;
    paramFloat1 += f1;
    paramFloat2 += f2;
    paramFloat3 += f3;
    build(paramMeshPartBuilder, obtainV3().set(paramFloat5, paramFloat4, paramFloat6), obtainV3().set(paramFloat5, paramFloat2, paramFloat6), obtainV3().set(paramFloat1, paramFloat4, paramFloat6), obtainV3().set(paramFloat1, paramFloat2, paramFloat6), obtainV3().set(paramFloat5, paramFloat4, paramFloat3), obtainV3().set(paramFloat5, paramFloat2, paramFloat3), obtainV3().set(paramFloat1, paramFloat4, paramFloat3), obtainV3().set(paramFloat1, paramFloat2, paramFloat3));
    freeAll();
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, MeshPartBuilder.VertexInfo paramVertexInfo1, MeshPartBuilder.VertexInfo paramVertexInfo2, MeshPartBuilder.VertexInfo paramVertexInfo3, MeshPartBuilder.VertexInfo paramVertexInfo4, MeshPartBuilder.VertexInfo paramVertexInfo5, MeshPartBuilder.VertexInfo paramVertexInfo6, MeshPartBuilder.VertexInfo paramVertexInfo7, MeshPartBuilder.VertexInfo paramVertexInfo8) {
    paramMeshPartBuilder.ensureVertices(8);
    short s1 = paramMeshPartBuilder.vertex(paramVertexInfo1);
    short s2 = paramMeshPartBuilder.vertex(paramVertexInfo3);
    short s3 = paramMeshPartBuilder.vertex(paramVertexInfo4);
    short s4 = paramMeshPartBuilder.vertex(paramVertexInfo2);
    short s5 = paramMeshPartBuilder.vertex(paramVertexInfo5);
    short s6 = paramMeshPartBuilder.vertex(paramVertexInfo7);
    short s7 = paramMeshPartBuilder.vertex(paramVertexInfo8);
    short s8 = paramMeshPartBuilder.vertex(paramVertexInfo6);
    int i = paramMeshPartBuilder.getPrimitiveType();
    if (i == 1) {
      paramMeshPartBuilder.ensureIndices(24);
      paramMeshPartBuilder.rect(s1, s2, s3, s4);
      paramMeshPartBuilder.rect(s6, s5, s8, s7);
      paramMeshPartBuilder.index(s1, s5, s4, s8, s3, s7, s2, s6);
    } else if (i == 0) {
      paramMeshPartBuilder.ensureRectangleIndices(2);
      paramMeshPartBuilder.rect(s1, s2, s3, s4);
      paramMeshPartBuilder.rect(s6, s5, s8, s7);
    } else {
      paramMeshPartBuilder.ensureRectangleIndices(6);
      paramMeshPartBuilder.rect(s1, s2, s3, s4);
      paramMeshPartBuilder.rect(s6, s5, s8, s7);
      paramMeshPartBuilder.rect(s1, s4, s8, s5);
      paramMeshPartBuilder.rect(s6, s7, s3, s2);
      paramMeshPartBuilder.rect(s6, s2, s1, s5);
      paramMeshPartBuilder.rect(s3, s7, s8, s4);
    } 
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, Matrix4 paramMatrix4) {
    build(paramMeshPartBuilder, obtainV3().set(-0.5F, -0.5F, -0.5F).mul(paramMatrix4), obtainV3().set(-0.5F, 0.5F, -0.5F).mul(paramMatrix4), obtainV3().set(0.5F, -0.5F, -0.5F).mul(paramMatrix4), obtainV3().set(0.5F, 0.5F, -0.5F).mul(paramMatrix4), obtainV3().set(-0.5F, -0.5F, 0.5F).mul(paramMatrix4), obtainV3().set(-0.5F, 0.5F, 0.5F).mul(paramMatrix4), obtainV3().set(0.5F, -0.5F, 0.5F).mul(paramMatrix4), obtainV3().set(0.5F, 0.5F, 0.5F).mul(paramMatrix4));
    freeAll();
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35, Vector3 paramVector36, Vector3 paramVector37, Vector3 paramVector38) {
    if ((paramMeshPartBuilder.getAttributes().getMask() & 0x198L) == 0L) {
      build(paramMeshPartBuilder, vertTmp1.set(paramVector31, null, null, null), vertTmp2.set(paramVector32, null, null, null), vertTmp3.set(paramVector33, null, null, null), vertTmp4.set(paramVector34, null, null, null), vertTmp5.set(paramVector35, null, null, null), vertTmp6.set(paramVector36, null, null, null), vertTmp7.set(paramVector37, null, null, null), vertTmp8.set(paramVector38, null, null, null));
    } else {
      paramMeshPartBuilder.ensureVertices(24);
      paramMeshPartBuilder.ensureRectangleIndices(6);
      Vector3 vector3 = tmpV1.set(paramVector31).lerp(paramVector34, 0.5F).sub(tmpV2.set(paramVector35).lerp(paramVector38, 0.5F)).nor();
      paramMeshPartBuilder.rect(paramVector31, paramVector32, paramVector34, paramVector33, vector3);
      paramMeshPartBuilder.rect(paramVector36, paramVector35, paramVector37, paramVector38, vector3.scl(-1.0F));
      vector3 = tmpV1.set(paramVector31).lerp(paramVector37, 0.5F).sub(tmpV2.set(paramVector32).lerp(paramVector38, 0.5F)).nor();
      paramMeshPartBuilder.rect(paramVector35, paramVector31, paramVector33, paramVector37, vector3);
      paramMeshPartBuilder.rect(paramVector32, paramVector36, paramVector38, paramVector34, vector3.scl(-1.0F));
      vector3 = tmpV1.set(paramVector31).lerp(paramVector36, 0.5F).sub(tmpV2.set(paramVector33).lerp(paramVector38, 0.5F)).nor();
      paramMeshPartBuilder.rect(paramVector35, paramVector36, paramVector32, paramVector31, vector3);
      paramMeshPartBuilder.rect(paramVector33, paramVector34, paramVector38, paramVector37, vector3.scl(-1.0F));
    } 
  }
  
  public static void build(MeshPartBuilder paramMeshPartBuilder, BoundingBox paramBoundingBox) {
    paramMeshPartBuilder.box(paramBoundingBox.getCorner000(obtainV3()), paramBoundingBox.getCorner010(obtainV3()), paramBoundingBox.getCorner100(obtainV3()), paramBoundingBox.getCorner110(obtainV3()), paramBoundingBox.getCorner001(obtainV3()), paramBoundingBox.getCorner011(obtainV3()), paramBoundingBox.getCorner101(obtainV3()), paramBoundingBox.getCorner111(obtainV3()));
    freeAll();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/BoxShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */