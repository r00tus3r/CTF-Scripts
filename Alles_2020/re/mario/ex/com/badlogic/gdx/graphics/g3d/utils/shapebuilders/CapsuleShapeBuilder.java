package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class CapsuleShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, int paramInt) {
    paramFloat1 = 2.0F * paramFloat1;
    if (paramFloat2 >= paramFloat1) {
      paramFloat2 -= paramFloat1;
      CylinderShapeBuilder.build(paramMeshPartBuilder, paramFloat1, paramFloat2, paramFloat1, paramInt, 0.0F, 360.0F, false);
      SphereShapeBuilder.build(paramMeshPartBuilder, matTmp1.setToTranslation(0.0F, 0.5F * paramFloat2, 0.0F), paramFloat1, paramFloat1, paramFloat1, paramInt, paramInt, 0.0F, 360.0F, 0.0F, 90.0F);
      SphereShapeBuilder.build(paramMeshPartBuilder, matTmp1.setToTranslation(0.0F, paramFloat2 * -0.5F, 0.0F), paramFloat1, paramFloat1, paramFloat1, paramInt, paramInt, 0.0F, 360.0F, 90.0F, 180.0F);
      return;
    } 
    throw new GdxRuntimeException("Height must be at least twice the radius");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/CapsuleShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */