package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Pool;

public interface MeshPartBuilder {
  void addMesh(Mesh paramMesh);
  
  void addMesh(Mesh paramMesh, int paramInt1, int paramInt2);
  
  void addMesh(MeshPart paramMeshPart);
  
  void addMesh(float[] paramArrayOfFloat, short[] paramArrayOfShort);
  
  void addMesh(float[] paramArrayOfFloat, short[] paramArrayOfShort, int paramInt1, int paramInt2);
  
  @Deprecated
  void arrow(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, int paramInt);
  
  @Deprecated
  void box(float paramFloat1, float paramFloat2, float paramFloat3);
  
  @Deprecated
  void box(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6);
  
  @Deprecated
  void box(VertexInfo paramVertexInfo1, VertexInfo paramVertexInfo2, VertexInfo paramVertexInfo3, VertexInfo paramVertexInfo4, VertexInfo paramVertexInfo5, VertexInfo paramVertexInfo6, VertexInfo paramVertexInfo7, VertexInfo paramVertexInfo8);
  
  @Deprecated
  void box(Matrix4 paramMatrix4);
  
  @Deprecated
  void box(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35, Vector3 paramVector36, Vector3 paramVector37, Vector3 paramVector38);
  
  @Deprecated
  void capsule(float paramFloat1, float paramFloat2, int paramInt);
  
  @Deprecated
  void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7);
  
  @Deprecated
  void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9);
  
  @Deprecated
  void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13);
  
  @Deprecated
  void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15);
  
  @Deprecated
  void circle(float paramFloat, int paramInt, Vector3 paramVector31, Vector3 paramVector32);
  
  @Deprecated
  void circle(float paramFloat1, int paramInt, Vector3 paramVector31, Vector3 paramVector32, float paramFloat2, float paramFloat3);
  
  @Deprecated
  void circle(float paramFloat, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34);
  
  @Deprecated
  void circle(float paramFloat1, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, float paramFloat2, float paramFloat3);
  
  @Deprecated
  void cone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt);
  
  @Deprecated
  void cone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5);
  
  @Deprecated
  void cylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt);
  
  @Deprecated
  void cylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5);
  
  @Deprecated
  void cylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5, boolean paramBoolean);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, float paramFloat16, float paramFloat17, float paramFloat18);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, Vector3 paramVector31, Vector3 paramVector32);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, float paramFloat16);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, float paramFloat3, float paramFloat4);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34);
  
  @Deprecated
  void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, float paramFloat3, float paramFloat4);
  
  void ensureCapacity(int paramInt1, int paramInt2);
  
  void ensureIndices(int paramInt);
  
  void ensureRectangleIndices(int paramInt);
  
  void ensureTriangleIndices(int paramInt);
  
  void ensureVertices(int paramInt);
  
  VertexAttributes getAttributes();
  
  MeshPart getMeshPart();
  
  int getPrimitiveType();
  
  Matrix4 getVertexTransform(Matrix4 paramMatrix4);
  
  void index(short paramShort);
  
  void index(short paramShort1, short paramShort2);
  
  void index(short paramShort1, short paramShort2, short paramShort3);
  
  void index(short paramShort1, short paramShort2, short paramShort3, short paramShort4);
  
  void index(short paramShort1, short paramShort2, short paramShort3, short paramShort4, short paramShort5, short paramShort6);
  
  void index(short paramShort1, short paramShort2, short paramShort3, short paramShort4, short paramShort5, short paramShort6, short paramShort7, short paramShort8);
  
  boolean isVertexTransformationEnabled();
  
  short lastIndex();
  
  void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6);
  
  void line(VertexInfo paramVertexInfo1, VertexInfo paramVertexInfo2);
  
  void line(Vector3 paramVector31, Color paramColor1, Vector3 paramVector32, Color paramColor2);
  
  void line(Vector3 paramVector31, Vector3 paramVector32);
  
  void line(short paramShort1, short paramShort2);
  
  @Deprecated
  void patch(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, int paramInt1, int paramInt2);
  
  @Deprecated
  void patch(VertexInfo paramVertexInfo1, VertexInfo paramVertexInfo2, VertexInfo paramVertexInfo3, VertexInfo paramVertexInfo4, int paramInt1, int paramInt2);
  
  @Deprecated
  void patch(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35, int paramInt1, int paramInt2);
  
  void rect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15);
  
  void rect(VertexInfo paramVertexInfo1, VertexInfo paramVertexInfo2, VertexInfo paramVertexInfo3, VertexInfo paramVertexInfo4);
  
  void rect(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35);
  
  void rect(short paramShort1, short paramShort2, short paramShort3, short paramShort4);
  
  void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  void setColor(Color paramColor);
  
  void setUVRange(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  void setUVRange(TextureRegion paramTextureRegion);
  
  void setVertexTransform(Matrix4 paramMatrix4);
  
  void setVertexTransformationEnabled(boolean paramBoolean);
  
  @Deprecated
  void sphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2);
  
  @Deprecated
  void sphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7);
  
  @Deprecated
  void sphere(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2);
  
  @Deprecated
  void sphere(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7);
  
  void triangle(VertexInfo paramVertexInfo1, VertexInfo paramVertexInfo2, VertexInfo paramVertexInfo3);
  
  void triangle(Vector3 paramVector31, Color paramColor1, Vector3 paramVector32, Color paramColor2, Vector3 paramVector33, Color paramColor3);
  
  void triangle(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33);
  
  void triangle(short paramShort1, short paramShort2, short paramShort3);
  
  short vertex(VertexInfo paramVertexInfo);
  
  short vertex(Vector3 paramVector31, Vector3 paramVector32, Color paramColor, Vector2 paramVector2);
  
  short vertex(float... paramVarArgs);
  
  public static class VertexInfo implements Pool.Poolable {
    public final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
    
    public boolean hasColor;
    
    public boolean hasNormal;
    
    public boolean hasPosition;
    
    public boolean hasUV;
    
    public final Vector3 normal = new Vector3(0.0F, 1.0F, 0.0F);
    
    public final Vector3 position = new Vector3();
    
    public final Vector2 uv = new Vector2();
    
    public VertexInfo lerp(VertexInfo param1VertexInfo, float param1Float) {
      if (this.hasPosition && param1VertexInfo.hasPosition)
        this.position.lerp(param1VertexInfo.position, param1Float); 
      if (this.hasNormal && param1VertexInfo.hasNormal)
        this.normal.lerp(param1VertexInfo.normal, param1Float); 
      if (this.hasColor && param1VertexInfo.hasColor)
        this.color.lerp(param1VertexInfo.color, param1Float); 
      if (this.hasUV && param1VertexInfo.hasUV)
        this.uv.lerp(param1VertexInfo.uv, param1Float); 
      return this;
    }
    
    public void reset() {
      this.position.set(0.0F, 0.0F, 0.0F);
      this.normal.set(0.0F, 1.0F, 0.0F);
      this.color.set(1.0F, 1.0F, 1.0F, 1.0F);
      this.uv.set(0.0F, 0.0F);
    }
    
    public VertexInfo set(VertexInfo param1VertexInfo) {
      if (param1VertexInfo == null)
        return set(null, null, null, null); 
      this.hasPosition = param1VertexInfo.hasPosition;
      this.position.set(param1VertexInfo.position);
      this.hasNormal = param1VertexInfo.hasNormal;
      this.normal.set(param1VertexInfo.normal);
      this.hasColor = param1VertexInfo.hasColor;
      this.color.set(param1VertexInfo.color);
      this.hasUV = param1VertexInfo.hasUV;
      this.uv.set(param1VertexInfo.uv);
      return this;
    }
    
    public VertexInfo set(Vector3 param1Vector31, Vector3 param1Vector32, Color param1Color, Vector2 param1Vector2) {
      byte b2;
      reset();
      byte b1 = 1;
      if (param1Vector31 != null) {
        b2 = 1;
      } else {
        b2 = 0;
      } 
      this.hasPosition = b2;
      if (this.hasPosition)
        this.position.set(param1Vector31); 
      if (param1Vector32 != null) {
        b2 = 1;
      } else {
        b2 = 0;
      } 
      this.hasNormal = b2;
      if (this.hasNormal)
        this.normal.set(param1Vector32); 
      if (param1Color != null) {
        b2 = 1;
      } else {
        b2 = 0;
      } 
      this.hasColor = b2;
      if (this.hasColor)
        this.color.set(param1Color); 
      if (param1Vector2 != null) {
        b2 = b1;
      } else {
        b2 = 0;
      } 
      this.hasUV = b2;
      if (this.hasUV)
        this.uv.set(param1Vector2); 
      return this;
    }
    
    public VertexInfo setCol(float param1Float1, float param1Float2, float param1Float3, float param1Float4) {
      this.color.set(param1Float1, param1Float2, param1Float3, param1Float4);
      this.hasColor = true;
      return this;
    }
    
    public VertexInfo setCol(Color param1Color) {
      boolean bool;
      if (param1Color != null) {
        bool = true;
      } else {
        bool = false;
      } 
      this.hasColor = bool;
      if (this.hasColor)
        this.color.set(param1Color); 
      return this;
    }
    
    public VertexInfo setNor(float param1Float1, float param1Float2, float param1Float3) {
      this.normal.set(param1Float1, param1Float2, param1Float3);
      this.hasNormal = true;
      return this;
    }
    
    public VertexInfo setNor(Vector3 param1Vector3) {
      boolean bool;
      if (param1Vector3 != null) {
        bool = true;
      } else {
        bool = false;
      } 
      this.hasNormal = bool;
      if (this.hasNormal)
        this.normal.set(param1Vector3); 
      return this;
    }
    
    public VertexInfo setPos(float param1Float1, float param1Float2, float param1Float3) {
      this.position.set(param1Float1, param1Float2, param1Float3);
      this.hasPosition = true;
      return this;
    }
    
    public VertexInfo setPos(Vector3 param1Vector3) {
      boolean bool;
      if (param1Vector3 != null) {
        bool = true;
      } else {
        bool = false;
      } 
      this.hasPosition = bool;
      if (this.hasPosition)
        this.position.set(param1Vector3); 
      return this;
    }
    
    public VertexInfo setUV(float param1Float1, float param1Float2) {
      this.uv.set(param1Float1, param1Float2);
      this.hasUV = true;
      return this;
    }
    
    public VertexInfo setUV(Vector2 param1Vector2) {
      boolean bool;
      if (param1Vector2 != null) {
        bool = true;
      } else {
        bool = false;
      } 
      this.hasUV = bool;
      if (this.hasUV)
        this.uv.set(param1Vector2); 
      return this;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */