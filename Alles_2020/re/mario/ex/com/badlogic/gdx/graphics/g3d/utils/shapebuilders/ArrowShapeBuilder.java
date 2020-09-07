package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;

public class ArrowShapeBuilder extends BaseShapeBuilder {
  public static void build(MeshPartBuilder paramMeshPartBuilder, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, int paramInt) {
    Vector3 vector31 = obtainV3().set(paramFloat1, paramFloat2, paramFloat3);
    Vector3 vector32 = obtainV3().set(paramFloat4, paramFloat5, paramFloat6);
    paramFloat6 = vector31.dst(vector32);
    paramFloat5 = paramFloat6 * paramFloat7;
    double d1 = paramFloat5;
    double d2 = Math.sqrt(0.3333333432674408D);
    Double.isNaN(d1);
    paramFloat4 = (float)(d1 * d2) * 2.0F;
    paramFloat6 -= paramFloat5;
    paramFloat7 = paramFloat4 * paramFloat8;
    Vector3 vector33 = obtainV3().set(vector32).sub(vector31).nor();
    Vector3 vector34 = obtainV3().set(vector33).crs(Vector3.Z);
    if (vector34.isZero())
      vector34.set(Vector3.X); 
    vector34.crs(vector33).nor();
    Vector3 vector35 = obtainV3().set(vector33).crs(vector34).nor();
    vector31 = obtainV3().set(vector32).sub(vector31).nor();
    Matrix4 matrix41 = paramMeshPartBuilder.getVertexTransform(obtainM4());
    Matrix4 matrix43 = obtainM4();
    float[] arrayOfFloat = matrix43.val;
    arrayOfFloat[0] = vector35.x;
    arrayOfFloat[4] = vector33.x;
    arrayOfFloat[8] = vector34.x;
    arrayOfFloat[1] = vector35.y;
    arrayOfFloat[5] = vector33.y;
    arrayOfFloat[9] = vector34.y;
    arrayOfFloat[2] = vector35.z;
    arrayOfFloat[6] = vector33.z;
    arrayOfFloat[10] = vector34.z;
    Matrix4 matrix42 = obtainM4();
    matrix43.setTranslation(obtainV3().set(vector31).scl(paramFloat6 / 2.0F).add(paramFloat1, paramFloat2, paramFloat3));
    paramMeshPartBuilder.setVertexTransform(matrix42.set(matrix43).mul(matrix41));
    CylinderShapeBuilder.build(paramMeshPartBuilder, paramFloat7, paramFloat6, paramFloat7, paramInt);
    matrix43.setTranslation(obtainV3().set(vector31).scl(paramFloat6).add(paramFloat1, paramFloat2, paramFloat3));
    paramMeshPartBuilder.setVertexTransform(matrix42.set(matrix43).mul(matrix41));
    ConeShapeBuilder.build(paramMeshPartBuilder, paramFloat4, paramFloat5, paramFloat4, paramInt);
    paramMeshPartBuilder.setVertexTransform(matrix41);
    freeAll();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */