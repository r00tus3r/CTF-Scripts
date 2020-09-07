package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.FlushablePool;

public class BaseShapeBuilder {
  protected static final Matrix4 matTmp1;
  
  private static final FlushablePool<Matrix4> matrices4Pool;
  
  protected static final Color tmpColor0 = new Color();
  
  protected static final Color tmpColor1 = new Color();
  
  protected static final Color tmpColor2 = new Color();
  
  protected static final Color tmpColor3 = new Color();
  
  protected static final Color tmpColor4 = new Color();
  
  protected static final Vector3 tmpV0 = new Vector3();
  
  protected static final Vector3 tmpV1 = new Vector3();
  
  protected static final Vector3 tmpV2 = new Vector3();
  
  protected static final Vector3 tmpV3 = new Vector3();
  
  protected static final Vector3 tmpV4 = new Vector3();
  
  protected static final Vector3 tmpV5 = new Vector3();
  
  protected static final Vector3 tmpV6 = new Vector3();
  
  protected static final Vector3 tmpV7 = new Vector3();
  
  private static final FlushablePool<Vector3> vectorPool;
  
  protected static final MeshPartBuilder.VertexInfo vertTmp0 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp1 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp2 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp3 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp4 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp5 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp6 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp7 = new MeshPartBuilder.VertexInfo();
  
  protected static final MeshPartBuilder.VertexInfo vertTmp8 = new MeshPartBuilder.VertexInfo();
  
  static  {
    matTmp1 = new Matrix4();
    vectorPool = new FlushablePool<Vector3>() {
        protected Vector3 newObject() { return new Vector3(); }
      };
    matrices4Pool = new FlushablePool<Matrix4>() {
        protected Matrix4 newObject() { return new Matrix4(); }
      };
  }
  
  protected static void freeAll() {
    vectorPool.flush();
    matrices4Pool.flush();
  }
  
  protected static Matrix4 obtainM4() { return (Matrix4)matrices4Pool.obtain(); }
  
  protected static Vector3 obtainV3() { return (Vector3)vectorPool.obtain(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */