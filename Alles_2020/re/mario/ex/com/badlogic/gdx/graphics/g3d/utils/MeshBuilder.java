package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.ArrowShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.BoxShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.CapsuleShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.ConeShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.CylinderShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.EllipseShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.PatchShapeBuilder;
import com.badlogic.gdx.graphics.g3d.utils.shapebuilders.SphereShapeBuilder;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntIntMap;
import com.badlogic.gdx.utils.ShortArray;
import java.util.Iterator;

public class MeshBuilder implements MeshPartBuilder {
  private static IntIntMap indicesMap;
  
  private static final ShortArray tmpIndices = new ShortArray();
  
  private static final FloatArray tmpVertices = new FloatArray();
  
  private static final Vector3 vTmp = new Vector3();
  
  private VertexAttributes attributes;
  
  private int biNorOffset;
  
  private final BoundingBox bounds = new BoundingBox();
  
  private int colOffset;
  
  private int colSize;
  
  private final Color color = new Color(Color.WHITE);
  
  private int cpOffset;
  
  private boolean hasColor = false;
  
  private boolean hasUVTransform = false;
  
  private ShortArray indices = new ShortArray();
  
  private int istart;
  
  private short lastIndex = (short)-1;
  
  private int norOffset;
  
  private final Matrix3 normalTransform = new Matrix3();
  
  private MeshPart part;
  
  private Array<MeshPart> parts = new Array();
  
  private int posOffset;
  
  private int posSize;
  
  private final Matrix4 positionTransform = new Matrix4();
  
  private int primitiveType;
  
  private int stride;
  
  private int tangentOffset;
  
  private final Color tempC1 = new Color();
  
  private final Vector3 tmpNormal = new Vector3();
  
  private float uOffset = 0.0F;
  
  private float uScale = 1.0F;
  
  private int uvOffset;
  
  private float vOffset = 0.0F;
  
  private float vScale = 1.0F;
  
  private final MeshPartBuilder.VertexInfo vertTmp1 = new MeshPartBuilder.VertexInfo();
  
  private final MeshPartBuilder.VertexInfo vertTmp2 = new MeshPartBuilder.VertexInfo();
  
  private final MeshPartBuilder.VertexInfo vertTmp3 = new MeshPartBuilder.VertexInfo();
  
  private final MeshPartBuilder.VertexInfo vertTmp4 = new MeshPartBuilder.VertexInfo();
  
  private float[] vertex;
  
  private boolean vertexTransformationEnabled = false;
  
  private FloatArray vertices = new FloatArray();
  
  private int vindex;
  
  static  {
    indicesMap = null;
  }
  
  private final void addVertex(float[] paramArrayOfFloat, int paramInt) {
    float f3;
    int i = this.vertices.size;
    this.vertices.addAll(paramArrayOfFloat, paramInt, this.stride);
    paramInt = this.vindex;
    this.vindex = paramInt + 1;
    this.lastIndex = (short)(short)paramInt;
    if (this.vertexTransformationEnabled) {
      transformPosition(this.vertices.items, this.posOffset + i, this.posSize, this.positionTransform);
      if (this.norOffset >= 0)
        transformNormal(this.vertices.items, this.norOffset + i, 3, this.normalTransform); 
      if (this.biNorOffset >= 0)
        transformNormal(this.vertices.items, this.biNorOffset + i, 3, this.normalTransform); 
      if (this.tangentOffset >= 0)
        transformNormal(this.vertices.items, this.tangentOffset + i, 3, this.normalTransform); 
    } 
    float f1 = this.vertices.items[this.posOffset + i];
    paramInt = this.posSize;
    float f2 = 0.0F;
    if (paramInt > 1) {
      f3 = this.vertices.items[this.posOffset + i + 1];
    } else {
      f3 = 0.0F;
    } 
    if (this.posSize > 2)
      f2 = this.vertices.items[this.posOffset + i + 2]; 
    this.bounds.ext(f1, f3, f2);
    if (this.hasColor)
      if (this.colOffset >= 0) {
        paramArrayOfFloat = this.vertices.items;
        paramInt = this.colOffset + i;
        paramArrayOfFloat[paramInt] = paramArrayOfFloat[paramInt] * this.color.r;
        paramArrayOfFloat = this.vertices.items;
        paramInt = this.colOffset + i + 1;
        paramArrayOfFloat[paramInt] = paramArrayOfFloat[paramInt] * this.color.g;
        paramArrayOfFloat = this.vertices.items;
        paramInt = this.colOffset + i + 2;
        paramArrayOfFloat[paramInt] = paramArrayOfFloat[paramInt] * this.color.b;
        if (this.colSize > 3) {
          paramArrayOfFloat = this.vertices.items;
          paramInt = this.colOffset + i + 3;
          paramArrayOfFloat[paramInt] = paramArrayOfFloat[paramInt] * this.color.a;
        } 
      } else if (this.cpOffset >= 0) {
        Color.abgr8888ToColor(this.tempC1, this.vertices.items[this.cpOffset + i]);
        this.vertices.items[this.cpOffset + i] = this.tempC1.mul(this.color).toFloatBits();
      }  
    if (this.hasUVTransform && this.uvOffset >= 0) {
      this.vertices.items[this.uvOffset + i] = this.uOffset + this.uScale * this.vertices.items[this.uvOffset + i];
      this.vertices.items[this.uvOffset + i + 1] = this.vOffset + this.vScale * this.vertices.items[i + this.uvOffset + 1];
    } 
  }
  
  public static VertexAttributes createAttributes(long paramLong) {
    Array array = new Array();
    if ((paramLong & 0x1L) == 1L)
      array.add(new VertexAttribute(true, 3, "a_position")); 
    if ((paramLong & 0x2L) == 2L)
      array.add(new VertexAttribute(2, 4, "a_color")); 
    if ((paramLong & 0x4L) == 4L)
      array.add(new VertexAttribute(4, 4, "a_color")); 
    if ((paramLong & 0x8L) == 8L)
      array.add(new VertexAttribute(8, 3, "a_normal")); 
    if ((paramLong & 0x10L) == 16L)
      array.add(new VertexAttribute(16, 2, "a_texCoord0")); 
    VertexAttribute[] arrayOfVertexAttribute = new VertexAttribute[array.size];
    for (byte b = 0; b < arrayOfVertexAttribute.length; b++)
      arrayOfVertexAttribute[b] = (VertexAttribute)array.get(b); 
    return new VertexAttributes(arrayOfVertexAttribute);
  }
  
  private void endpart() {
    MeshPart meshPart = this.part;
    if (meshPart != null) {
      this.bounds.getCenter(meshPart.center);
      this.bounds.getDimensions(this.part.halfExtents).scl(0.5F);
      meshPart = this.part;
      meshPart.radius = meshPart.halfExtents.len();
      this.bounds.inf();
      meshPart = this.part;
      meshPart.offset = this.istart;
      meshPart.size = this.indices.size - this.istart;
      this.istart = this.indices.size;
      this.part = null;
    } 
  }
  
  private static final void transformNormal(float[] paramArrayOfFloat, int paramInt1, int paramInt2, Matrix3 paramMatrix3) {
    if (paramInt2 > 2) {
      Vector3 vector3 = vTmp;
      float f1 = paramArrayOfFloat[paramInt1];
      int i = paramInt1 + 1;
      float f2 = paramArrayOfFloat[i];
      paramInt2 = paramInt1 + 2;
      vector3.set(f1, f2, paramArrayOfFloat[paramInt2]).mul(paramMatrix3).nor();
      paramArrayOfFloat[paramInt1] = vTmp.x;
      paramArrayOfFloat[i] = vTmp.y;
      paramArrayOfFloat[paramInt2] = vTmp.z;
    } else if (paramInt2 > 1) {
      Vector3 vector3 = vTmp;
      float f = paramArrayOfFloat[paramInt1];
      paramInt2 = paramInt1 + 1;
      vector3.set(f, paramArrayOfFloat[paramInt2], 0.0F).mul(paramMatrix3).nor();
      paramArrayOfFloat[paramInt1] = vTmp.x;
      paramArrayOfFloat[paramInt2] = vTmp.y;
    } else {
      paramArrayOfFloat[paramInt1] = (vTmp.set(paramArrayOfFloat[paramInt1], 0.0F, 0.0F).mul(paramMatrix3).nor()).x;
    } 
  }
  
  private static final void transformPosition(float[] paramArrayOfFloat, int paramInt1, int paramInt2, Matrix4 paramMatrix4) {
    if (paramInt2 > 2) {
      Vector3 vector3 = vTmp;
      float f1 = paramArrayOfFloat[paramInt1];
      paramInt2 = paramInt1 + 1;
      float f2 = paramArrayOfFloat[paramInt2];
      int i = paramInt1 + 2;
      vector3.set(f1, f2, paramArrayOfFloat[i]).mul(paramMatrix4);
      paramArrayOfFloat[paramInt1] = vTmp.x;
      paramArrayOfFloat[paramInt2] = vTmp.y;
      paramArrayOfFloat[i] = vTmp.z;
    } else if (paramInt2 > 1) {
      Vector3 vector3 = vTmp;
      float f = paramArrayOfFloat[paramInt1];
      paramInt2 = paramInt1 + 1;
      vector3.set(f, paramArrayOfFloat[paramInt2], 0.0F).mul(paramMatrix4);
      paramArrayOfFloat[paramInt1] = vTmp.x;
      paramArrayOfFloat[paramInt2] = vTmp.y;
    } else {
      paramArrayOfFloat[paramInt1] = (vTmp.set(paramArrayOfFloat[paramInt1], 0.0F, 0.0F).mul(paramMatrix4)).x;
    } 
  }
  
  public void addMesh(Mesh paramMesh) { addMesh(paramMesh, 0, paramMesh.getNumIndices()); }
  
  public void addMesh(Mesh paramMesh, int paramInt1, int paramInt2) {
    if (this.attributes.equals(paramMesh.getVertexAttributes())) {
      if (paramInt2 <= 0)
        return; 
      int i = paramMesh.getNumVertices() * this.stride;
      tmpVertices.clear();
      tmpVertices.ensureCapacity(i);
      FloatArray floatArray = tmpVertices;
      floatArray.size = i;
      paramMesh.getVertices(floatArray.items);
      tmpIndices.clear();
      tmpIndices.ensureCapacity(paramInt2);
      ShortArray shortArray = tmpIndices;
      shortArray.size = paramInt2;
      paramMesh.getIndices(paramInt1, paramInt2, shortArray.items, 0);
      addMesh(tmpVertices.items, tmpIndices.items, 0, paramInt2);
      return;
    } 
    throw new GdxRuntimeException("Vertex attributes do not match");
  }
  
  public void addMesh(MeshPart paramMeshPart) {
    if (paramMeshPart.primitiveType == this.primitiveType) {
      addMesh(paramMeshPart.mesh, paramMeshPart.offset, paramMeshPart.size);
      return;
    } 
    throw new GdxRuntimeException("Primitive type doesn't match");
  }
  
  public void addMesh(float[] paramArrayOfFloat, short[] paramArrayOfShort) {
    short s = (short)(this.lastIndex + 1);
    ensureVertices(paramArrayOfFloat.length / this.stride);
    int i = 0;
    int j;
    for (j = 0; j < paramArrayOfFloat.length; j += this.stride)
      addVertex(paramArrayOfFloat, j); 
    ensureIndices(paramArrayOfShort.length);
    for (j = i; j < paramArrayOfShort.length; j++)
      index((short)(paramArrayOfShort[j] + s)); 
  }
  
  public void addMesh(float[] paramArrayOfFloat, short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    IntIntMap intIntMap = indicesMap;
    if (intIntMap == null) {
      indicesMap = new IntIntMap(paramInt2);
    } else {
      intIntMap.clear();
      indicesMap.ensureCapacity(paramInt2);
    } 
    ensureIndices(paramInt2);
    int i = paramArrayOfFloat.length / this.stride;
    if (i >= paramInt2)
      i = paramInt2; 
    ensureVertices(i);
    for (i = 0; i < paramInt2; i++) {
      short s = paramArrayOfShort[paramInt1 + i];
      int j = indicesMap.get(s, -1);
      int k = j;
      if (j < 0) {
        addVertex(paramArrayOfFloat, this.stride * s);
        intIntMap = indicesMap;
        k = this.lastIndex;
        intIntMap.put(s, k);
      } 
      index((short)k);
    } 
  }
  
  @Deprecated
  public void arrow(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, int paramInt) { ArrowShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramInt); }
  
  public void begin(long paramLong) { begin(createAttributes(paramLong), -1); }
  
  public void begin(long paramLong, int paramInt) { begin(createAttributes(paramLong), paramInt); }
  
  public void begin(VertexAttributes paramVertexAttributes) { begin(paramVertexAttributes, -1); }
  
  public void begin(VertexAttributes paramVertexAttributes, int paramInt) {
    if (this.attributes == null) {
      this.attributes = paramVertexAttributes;
      this.vertices.clear();
      this.indices.clear();
      this.parts.clear();
      int i = 0;
      this.vindex = 0;
      int j = -1;
      this.lastIndex = (short)-1;
      this.istart = 0;
      this.part = null;
      this.stride = paramVertexAttributes.vertexSize / 4;
      float[] arrayOfFloat = this.vertex;
      if (arrayOfFloat == null || arrayOfFloat.length < this.stride)
        this.vertex = new float[this.stride]; 
      VertexAttribute vertexAttribute = paramVertexAttributes.findByUsage(1);
      if (vertexAttribute != null) {
        int k;
        this.posOffset = vertexAttribute.offset / 4;
        this.posSize = vertexAttribute.numComponents;
        vertexAttribute = paramVertexAttributes.findByUsage(8);
        if (vertexAttribute == null) {
          k = -1;
        } else {
          k = vertexAttribute.offset / 4;
        } 
        this.norOffset = k;
        vertexAttribute = paramVertexAttributes.findByUsage(256);
        if (vertexAttribute == null) {
          k = -1;
        } else {
          k = vertexAttribute.offset / 4;
        } 
        this.biNorOffset = k;
        vertexAttribute = paramVertexAttributes.findByUsage(128);
        if (vertexAttribute == null) {
          k = -1;
        } else {
          k = vertexAttribute.offset / 4;
        } 
        this.tangentOffset = k;
        vertexAttribute = paramVertexAttributes.findByUsage(2);
        if (vertexAttribute == null) {
          k = -1;
        } else {
          k = vertexAttribute.offset / 4;
        } 
        this.colOffset = k;
        if (vertexAttribute == null) {
          k = i;
        } else {
          k = vertexAttribute.numComponents;
        } 
        this.colSize = k;
        vertexAttribute = paramVertexAttributes.findByUsage(4);
        if (vertexAttribute == null) {
          k = -1;
        } else {
          k = vertexAttribute.offset / 4;
        } 
        this.cpOffset = k;
        VertexAttribute vertexAttribute1 = paramVertexAttributes.findByUsage(16);
        if (vertexAttribute1 == null) {
          k = j;
        } else {
          k = vertexAttribute1.offset / 4;
        } 
        this.uvOffset = k;
        setColor(null);
        setVertexTransform(null);
        setUVRange(null);
        this.primitiveType = paramInt;
        this.bounds.inf();
        return;
      } 
      throw new GdxRuntimeException("Cannot build mesh without position attribute");
    } 
    throw new RuntimeException("Call end() first");
  }
  
  @Deprecated
  public void box(float paramFloat1, float paramFloat2, float paramFloat3) { BoxShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3); }
  
  @Deprecated
  public void box(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { BoxShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6); }
  
  @Deprecated
  public void box(MeshPartBuilder.VertexInfo paramVertexInfo1, MeshPartBuilder.VertexInfo paramVertexInfo2, MeshPartBuilder.VertexInfo paramVertexInfo3, MeshPartBuilder.VertexInfo paramVertexInfo4, MeshPartBuilder.VertexInfo paramVertexInfo5, MeshPartBuilder.VertexInfo paramVertexInfo6, MeshPartBuilder.VertexInfo paramVertexInfo7, MeshPartBuilder.VertexInfo paramVertexInfo8) { BoxShapeBuilder.build(this, paramVertexInfo1, paramVertexInfo2, paramVertexInfo3, paramVertexInfo4, paramVertexInfo5, paramVertexInfo6, paramVertexInfo7, paramVertexInfo8); }
  
  @Deprecated
  public void box(Matrix4 paramMatrix4) { BoxShapeBuilder.build(this, paramMatrix4); }
  
  @Deprecated
  public void box(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35, Vector3 paramVector36, Vector3 paramVector37, Vector3 paramVector38) { BoxShapeBuilder.build(this, paramVector31, paramVector32, paramVector33, paramVector34, paramVector35, paramVector36, paramVector37, paramVector38); }
  
  @Deprecated
  public void capsule(float paramFloat1, float paramFloat2, int paramInt) { CapsuleShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt); }
  
  @Deprecated
  public void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { EllipseShapeBuilder.build(this, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7); }
  
  @Deprecated
  public void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { EllipseShapeBuilder.build(this, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9); }
  
  @Deprecated
  public void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13) { EllipseShapeBuilder.build(this, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13); }
  
  @Deprecated
  public void circle(float paramFloat1, int paramInt, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15) { EllipseShapeBuilder.build(this, paramFloat1, paramInt, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15); }
  
  @Deprecated
  public void circle(float paramFloat, int paramInt, Vector3 paramVector31, Vector3 paramVector32) { EllipseShapeBuilder.build(this, paramFloat, paramInt, paramVector31, paramVector32); }
  
  @Deprecated
  public void circle(float paramFloat1, int paramInt, Vector3 paramVector31, Vector3 paramVector32, float paramFloat2, float paramFloat3) { EllipseShapeBuilder.build(this, paramFloat1, paramInt, paramVector31, paramVector32, paramFloat2, paramFloat3); }
  
  @Deprecated
  public void circle(float paramFloat, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) { EllipseShapeBuilder.build(this, paramFloat, paramInt, paramVector31, paramVector32, paramVector33, paramVector34); }
  
  @Deprecated
  public void circle(float paramFloat1, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, float paramFloat2, float paramFloat3) { circle(paramFloat1, paramInt, paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, paramVector33.x, paramVector33.y, paramVector33.z, paramVector34.x, paramVector34.y, paramVector34.z, paramFloat2, paramFloat3); }
  
  public void clear() {
    this.vertices.clear();
    this.indices.clear();
    this.parts.clear();
    this.vindex = 0;
    this.lastIndex = (short)-1;
    this.istart = 0;
    this.part = null;
  }
  
  @Deprecated
  public void cone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) { cone(paramFloat1, paramFloat2, paramFloat3, paramInt, 0.0F, 360.0F); }
  
  @Deprecated
  public void cone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5) { ConeShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramInt, paramFloat4, paramFloat5); }
  
  @Deprecated
  public void cylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) { CylinderShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramInt); }
  
  @Deprecated
  public void cylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5) { CylinderShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramInt, paramFloat4, paramFloat5); }
  
  @Deprecated
  public void cylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, float paramFloat4, float paramFloat5, boolean paramBoolean) { CylinderShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramInt, paramFloat4, paramFloat5, paramBoolean); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, float paramFloat16, float paramFloat17, float paramFloat18) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15, paramFloat16, paramFloat17, paramFloat18); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, Vector3 paramVector31, Vector3 paramVector32) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramInt, paramVector31, paramVector32); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, float paramFloat16) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15, paramFloat16); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramVector31, paramVector32); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, float paramFloat3, float paramFloat4) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramVector31, paramVector32, paramFloat3, paramFloat4); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramVector31, paramVector32, paramVector33, paramVector34); }
  
  @Deprecated
  public void ellipse(float paramFloat1, float paramFloat2, int paramInt, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, float paramFloat3, float paramFloat4) { EllipseShapeBuilder.build(this, paramFloat1, paramFloat2, paramInt, paramVector31, paramVector32, paramVector33, paramVector34, paramFloat3, paramFloat4); }
  
  public Mesh end() { return end(new Mesh(true, this.vertices.size / this.stride, this.indices.size, this.attributes)); }
  
  public Mesh end(Mesh paramMesh) {
    endpart();
    VertexAttributes vertexAttributes = this.attributes;
    if (vertexAttributes != null) {
      if (vertexAttributes.equals(paramMesh.getVertexAttributes())) {
        if (paramMesh.getMaxVertices() * this.stride >= this.vertices.size) {
          if (paramMesh.getMaxIndices() >= this.indices.size) {
            paramMesh.setVertices(this.vertices.items, 0, this.vertices.size);
            paramMesh.setIndices(this.indices.items, 0, this.indices.size);
            Iterator iterator = this.parts.iterator();
            while (iterator.hasNext())
              ((MeshPart)iterator.next()).mesh = paramMesh; 
            this.parts.clear();
            this.attributes = null;
            this.vertices.clear();
            this.indices.clear();
            return paramMesh;
          } 
          StringBuilder stringBuilder1 = new StringBuilder();
          stringBuilder1.append("Mesh can't hold enough indices: ");
          stringBuilder1.append(paramMesh.getMaxIndices());
          stringBuilder1.append(" < ");
          stringBuilder1.append(this.indices.size);
          throw new GdxRuntimeException(stringBuilder1.toString());
        } 
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Mesh can't hold enough vertices: ");
        stringBuilder.append(paramMesh.getMaxVertices());
        stringBuilder.append(" * ");
        stringBuilder.append(this.stride);
        stringBuilder.append(" < ");
        stringBuilder.append(this.vertices.size);
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
      throw new GdxRuntimeException("Mesh attributes don't match");
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Call begin() first");
    throw gdxRuntimeException;
  }
  
  public void ensureCapacity(int paramInt1, int paramInt2) {
    ensureVertices(paramInt1);
    ensureIndices(paramInt2);
  }
  
  public void ensureIndices(int paramInt) { this.indices.ensureCapacity(paramInt); }
  
  public void ensureRectangleIndices(int paramInt) {
    int i = this.primitiveType;
    if (i == 0) {
      ensureIndices(paramInt * 4);
    } else if (i == 1) {
      ensureIndices(paramInt * 8);
    } else {
      ensureIndices(paramInt * 6);
    } 
  }
  
  public void ensureRectangles(int paramInt) {
    ensureVertices(paramInt * 4);
    ensureRectangleIndices(paramInt);
  }
  
  @Deprecated
  public void ensureRectangles(int paramInt1, int paramInt2) {
    ensureVertices(paramInt1);
    ensureRectangleIndices(paramInt2);
  }
  
  public void ensureTriangleIndices(int paramInt) {
    int i = this.primitiveType;
    if (i == 1) {
      ensureIndices(paramInt * 6);
    } else {
      if (i == 4 || i == 0) {
        ensureIndices(paramInt * 3);
        return;
      } 
      throw new GdxRuntimeException("Incorrect primtive type");
    } 
  }
  
  @Deprecated
  public void ensureTriangles(int paramInt) {
    ensureVertices(paramInt * 3);
    ensureTriangleIndices(paramInt);
  }
  
  @Deprecated
  public void ensureTriangles(int paramInt1, int paramInt2) {
    ensureVertices(paramInt1);
    ensureTriangleIndices(paramInt2);
  }
  
  public void ensureVertices(int paramInt) { this.vertices.ensureCapacity(this.stride * paramInt); }
  
  public VertexAttributes getAttributes() { return this.attributes; }
  
  public int getFloatsPerVertex() { return this.stride; }
  
  public void getIndices(short[] paramArrayOfShort, int paramInt) {
    if (this.attributes != null) {
      if (paramInt >= 0 && paramInt <= paramArrayOfShort.length - this.indices.size) {
        System.arraycopy(this.indices.items, 0, paramArrayOfShort, paramInt, this.indices.size);
        return;
      } 
      throw new GdxRuntimeException("Array to small or offset out of range");
    } 
    throw new GdxRuntimeException("Must be called in between #begin and #end");
  }
  
  protected short[] getIndices() { return this.indices.items; }
  
  public MeshPart getMeshPart() { return this.part; }
  
  public int getNumIndices() { return this.indices.size; }
  
  public int getNumVertices() { return this.vertices.size / this.stride; }
  
  public int getPrimitiveType() { return this.primitiveType; }
  
  public Matrix4 getVertexTransform(Matrix4 paramMatrix4) { return paramMatrix4.set(this.positionTransform); }
  
  public void getVertices(float[] paramArrayOfFloat, int paramInt) {
    if (this.attributes != null) {
      if (paramInt >= 0 && paramInt <= paramArrayOfFloat.length - this.vertices.size) {
        System.arraycopy(this.vertices.items, 0, paramArrayOfFloat, paramInt, this.vertices.size);
        return;
      } 
      throw new GdxRuntimeException("Array to small or offset out of range");
    } 
    throw new GdxRuntimeException("Must be called in between #begin and #end");
  }
  
  protected float[] getVertices() { return this.vertices.items; }
  
  public void index(short paramShort) { this.indices.add(paramShort); }
  
  public void index(short paramShort1, short paramShort2) {
    ensureIndices(2);
    this.indices.add(paramShort1);
    this.indices.add(paramShort2);
  }
  
  public void index(short paramShort1, short paramShort2, short paramShort3) {
    ensureIndices(3);
    this.indices.add(paramShort1);
    this.indices.add(paramShort2);
    this.indices.add(paramShort3);
  }
  
  public void index(short paramShort1, short paramShort2, short paramShort3, short paramShort4) {
    ensureIndices(4);
    this.indices.add(paramShort1);
    this.indices.add(paramShort2);
    this.indices.add(paramShort3);
    this.indices.add(paramShort4);
  }
  
  public void index(short paramShort1, short paramShort2, short paramShort3, short paramShort4, short paramShort5, short paramShort6) {
    ensureIndices(6);
    this.indices.add(paramShort1);
    this.indices.add(paramShort2);
    this.indices.add(paramShort3);
    this.indices.add(paramShort4);
    this.indices.add(paramShort5);
    this.indices.add(paramShort6);
  }
  
  public void index(short paramShort1, short paramShort2, short paramShort3, short paramShort4, short paramShort5, short paramShort6, short paramShort7, short paramShort8) {
    ensureIndices(8);
    this.indices.add(paramShort1);
    this.indices.add(paramShort2);
    this.indices.add(paramShort3);
    this.indices.add(paramShort4);
    this.indices.add(paramShort5);
    this.indices.add(paramShort6);
    this.indices.add(paramShort7);
    this.indices.add(paramShort8);
  }
  
  public boolean isVertexTransformationEnabled() { return this.vertexTransformationEnabled; }
  
  public short lastIndex() { return this.lastIndex; }
  
  public void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { line(this.vertTmp1.set(null, null, null, null).setPos(paramFloat1, paramFloat2, paramFloat3), this.vertTmp2.set(null, null, null, null).setPos(paramFloat4, paramFloat5, paramFloat6)); }
  
  public void line(MeshPartBuilder.VertexInfo paramVertexInfo1, MeshPartBuilder.VertexInfo paramVertexInfo2) {
    ensureVertices(2);
    line(vertex(paramVertexInfo1), vertex(paramVertexInfo2));
  }
  
  public void line(Vector3 paramVector31, Color paramColor1, Vector3 paramVector32, Color paramColor2) { line(this.vertTmp1.set(paramVector31, null, paramColor1, null), this.vertTmp2.set(paramVector32, null, paramColor2, null)); }
  
  public void line(Vector3 paramVector31, Vector3 paramVector32) { line(this.vertTmp1.set(paramVector31, null, null, null), this.vertTmp2.set(paramVector32, null, null, null)); }
  
  public void line(short paramShort1, short paramShort2) {
    if (this.primitiveType == 1) {
      index(paramShort1, paramShort2);
      return;
    } 
    throw new GdxRuntimeException("Incorrect primitive type");
  }
  
  public MeshPart part(String paramString, int paramInt) { return part(paramString, paramInt, new MeshPart()); }
  
  public MeshPart part(String paramString, int paramInt, MeshPart paramMeshPart) {
    if (this.attributes != null) {
      endpart();
      this.part = paramMeshPart;
      paramMeshPart = this.part;
      paramMeshPart.id = paramString;
      paramMeshPart.primitiveType = paramInt;
      this.primitiveType = paramInt;
      this.parts.add(paramMeshPart);
      setColor(null);
      setVertexTransform(null);
      setUVRange(null);
      return this.part;
    } 
    throw new RuntimeException("Call begin() first");
  }
  
  @Deprecated
  public void patch(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, int paramInt1, int paramInt2) { PatchShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15, paramInt1, paramInt2); }
  
  @Deprecated
  public void patch(MeshPartBuilder.VertexInfo paramVertexInfo1, MeshPartBuilder.VertexInfo paramVertexInfo2, MeshPartBuilder.VertexInfo paramVertexInfo3, MeshPartBuilder.VertexInfo paramVertexInfo4, int paramInt1, int paramInt2) { PatchShapeBuilder.build(this, paramVertexInfo1, paramVertexInfo2, paramVertexInfo3, paramVertexInfo4, paramInt1, paramInt2); }
  
  @Deprecated
  public void patch(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35, int paramInt1, int paramInt2) { PatchShapeBuilder.build(this, paramVector31, paramVector32, paramVector33, paramVector34, paramVector35, paramInt1, paramInt2); }
  
  public void rect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15) { rect(this.vertTmp1.set(null, null, null, null).setPos(paramFloat1, paramFloat2, paramFloat3).setNor(paramFloat13, paramFloat14, paramFloat15).setUV(0.0F, 1.0F), this.vertTmp2.set(null, null, null, null).setPos(paramFloat4, paramFloat5, paramFloat6).setNor(paramFloat13, paramFloat14, paramFloat15).setUV(1.0F, 1.0F), this.vertTmp3.set(null, null, null, null).setPos(paramFloat7, paramFloat8, paramFloat9).setNor(paramFloat13, paramFloat14, paramFloat15).setUV(1.0F, 0.0F), this.vertTmp4.set(null, null, null, null).setPos(paramFloat10, paramFloat11, paramFloat12).setNor(paramFloat13, paramFloat14, paramFloat15).setUV(0.0F, 0.0F)); }
  
  public void rect(MeshPartBuilder.VertexInfo paramVertexInfo1, MeshPartBuilder.VertexInfo paramVertexInfo2, MeshPartBuilder.VertexInfo paramVertexInfo3, MeshPartBuilder.VertexInfo paramVertexInfo4) {
    ensureVertices(4);
    rect(vertex(paramVertexInfo1), vertex(paramVertexInfo2), vertex(paramVertexInfo3), vertex(paramVertexInfo4));
  }
  
  public void rect(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34, Vector3 paramVector35) { rect(this.vertTmp1.set(paramVector31, paramVector35, null, null).setUV(0.0F, 1.0F), this.vertTmp2.set(paramVector32, paramVector35, null, null).setUV(1.0F, 1.0F), this.vertTmp3.set(paramVector33, paramVector35, null, null).setUV(1.0F, 0.0F), this.vertTmp4.set(paramVector34, paramVector35, null, null).setUV(0.0F, 0.0F)); }
  
  public void rect(short paramShort1, short paramShort2, short paramShort3, short paramShort4) {
    int i = this.primitiveType;
    if (i == 4) {
      index(paramShort1, paramShort2, paramShort3, paramShort3, paramShort4, paramShort1);
    } else if (i == 1) {
      index(paramShort1, paramShort2, paramShort2, paramShort3, paramShort3, paramShort4, paramShort4, paramShort1);
    } else {
      if (i == 0) {
        index(paramShort1, paramShort2, paramShort3, paramShort4);
        return;
      } 
      throw new GdxRuntimeException("Incorrect primitive type");
    } 
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.hasColor = this.color.equals(Color.WHITE) ^ true;
  }
  
  public void setColor(Color paramColor) {
    boolean bool;
    Color color1 = this.color;
    if (paramColor != null) {
      bool = true;
    } else {
      bool = false;
    } 
    this.hasColor = bool;
    if (!bool)
      paramColor = Color.WHITE; 
    color1.set(paramColor);
  }
  
  public void setUVRange(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    boolean bool;
    this.uOffset = paramFloat1;
    this.vOffset = paramFloat2;
    this.uScale = paramFloat3 - paramFloat1;
    this.vScale = paramFloat4 - paramFloat2;
    if (!MathUtils.isZero(paramFloat1) || !MathUtils.isZero(paramFloat2) || !MathUtils.isEqual(paramFloat3, 1.0F) || !MathUtils.isEqual(paramFloat4, 1.0F)) {
      bool = true;
    } else {
      bool = false;
    } 
    this.hasUVTransform = bool;
  }
  
  public void setUVRange(TextureRegion paramTextureRegion) {
    boolean bool;
    if (paramTextureRegion != null) {
      bool = true;
    } else {
      bool = false;
    } 
    this.hasUVTransform = bool;
    if (!bool) {
      this.vOffset = 0.0F;
      this.uOffset = 0.0F;
      this.vScale = 1.0F;
      this.uScale = 1.0F;
    } else {
      setUVRange(paramTextureRegion.getU(), paramTextureRegion.getV(), paramTextureRegion.getU2(), paramTextureRegion.getV2());
    } 
  }
  
  public void setVertexTransform(Matrix4 paramMatrix4) {
    boolean bool;
    if (paramMatrix4 != null) {
      bool = true;
    } else {
      bool = false;
    } 
    this.vertexTransformationEnabled = bool;
    if (this.vertexTransformationEnabled) {
      this.positionTransform.set(paramMatrix4);
      this.normalTransform.set(paramMatrix4).inv().transpose();
    } else {
      this.positionTransform.idt();
      this.normalTransform.idt();
    } 
  }
  
  public void setVertexTransformationEnabled(boolean paramBoolean) { this.vertexTransformationEnabled = paramBoolean; }
  
  @Deprecated
  public void sphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2) { SphereShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2); }
  
  @Deprecated
  public void sphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { SphereShapeBuilder.build(this, paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramFloat4, paramFloat5, paramFloat6, paramFloat7); }
  
  @Deprecated
  public void sphere(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2) { SphereShapeBuilder.build(this, paramMatrix4, paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2); }
  
  @Deprecated
  public void sphere(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { SphereShapeBuilder.build(this, paramMatrix4, paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramFloat4, paramFloat5, paramFloat6, paramFloat7); }
  
  public void triangle(MeshPartBuilder.VertexInfo paramVertexInfo1, MeshPartBuilder.VertexInfo paramVertexInfo2, MeshPartBuilder.VertexInfo paramVertexInfo3) {
    ensureVertices(3);
    triangle(vertex(paramVertexInfo1), vertex(paramVertexInfo2), vertex(paramVertexInfo3));
  }
  
  public void triangle(Vector3 paramVector31, Color paramColor1, Vector3 paramVector32, Color paramColor2, Vector3 paramVector33, Color paramColor3) { triangle(this.vertTmp1.set(paramVector31, null, paramColor1, null), this.vertTmp2.set(paramVector32, null, paramColor2, null), this.vertTmp3.set(paramVector33, null, paramColor3, null)); }
  
  public void triangle(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33) { triangle(this.vertTmp1.set(paramVector31, null, null, null), this.vertTmp2.set(paramVector32, null, null, null), this.vertTmp3.set(paramVector33, null, null, null)); }
  
  public void triangle(short paramShort1, short paramShort2, short paramShort3) {
    int i = this.primitiveType;
    if (i == 4 || i == 0) {
      index(paramShort1, paramShort2, paramShort3);
      return;
    } 
    if (i == 1) {
      index(paramShort1, paramShort2, paramShort2, paramShort3, paramShort3, paramShort1);
    } else {
      throw new GdxRuntimeException("Incorrect primitive type");
    } 
  }
  
  public short vertex(MeshPartBuilder.VertexInfo paramVertexInfo) {
    Color color1;
    Vector3 vector32;
    Vector3 vector31;
    boolean bool = paramVertexInfo.hasPosition;
    Vector2 vector2 = null;
    if (bool) {
      vector31 = paramVertexInfo.position;
    } else {
      vector31 = null;
    } 
    if (paramVertexInfo.hasNormal) {
      vector32 = paramVertexInfo.normal;
    } else {
      vector32 = null;
    } 
    if (paramVertexInfo.hasColor) {
      color1 = paramVertexInfo.color;
    } else {
      color1 = null;
    } 
    if (paramVertexInfo.hasUV)
      vector2 = paramVertexInfo.uv; 
    return vertex(vector31, vector32, color1, vector2);
  }
  
  public short vertex(Vector3 paramVector31, Vector3 paramVector32, Color paramColor, Vector2 paramVector2) {
    if (this.vindex <= 32767) {
      this.vertex[this.posOffset] = paramVector31.x;
      if (this.posSize > 1)
        this.vertex[this.posOffset + 1] = paramVector31.y; 
      if (this.posSize > 2)
        this.vertex[this.posOffset + 2] = paramVector31.z; 
      if (this.norOffset >= 0) {
        Vector3 vector3 = paramVector32;
        if (paramVector32 == null)
          vector3 = this.tmpNormal.set(paramVector31).nor(); 
        this.vertex[this.norOffset] = vector3.x;
        this.vertex[this.norOffset + 1] = vector3.y;
        this.vertex[this.norOffset + 2] = vector3.z;
      } 
      if (this.colOffset >= 0) {
        Color color1 = paramColor;
        if (paramColor == null)
          color1 = Color.WHITE; 
        this.vertex[this.colOffset] = color1.r;
        this.vertex[this.colOffset + 1] = color1.g;
        this.vertex[this.colOffset + 2] = color1.b;
        if (this.colSize > 3)
          this.vertex[this.colOffset + 3] = color1.a; 
      } else if (this.cpOffset > 0) {
        Color color1 = paramColor;
        if (paramColor == null)
          color1 = Color.WHITE; 
        this.vertex[this.cpOffset] = color1.toFloatBits();
      } 
      if (paramVector2 != null) {
        int i = this.uvOffset;
        if (i >= 0) {
          this.vertex[i] = paramVector2.x;
          this.vertex[this.uvOffset + 1] = paramVector2.y;
        } 
      } 
      addVertex(this.vertex, 0);
      return this.lastIndex;
    } 
    throw new GdxRuntimeException("Too many vertices used");
  }
  
  public short vertex(float... paramVarArgs) {
    int i = paramVarArgs.length;
    int j = this.stride;
    int k;
    for (k = 0; k <= i - j; k += this.stride)
      addVertex(paramVarArgs, k); 
    return this.lastIndex;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/MeshBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */