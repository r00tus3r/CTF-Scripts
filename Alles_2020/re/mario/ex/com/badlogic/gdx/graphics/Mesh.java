package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.IndexArray;
import com.badlogic.gdx.graphics.glutils.IndexBufferObject;
import com.badlogic.gdx.graphics.glutils.IndexBufferObjectSubData;
import com.badlogic.gdx.graphics.glutils.IndexData;
import com.badlogic.gdx.graphics.glutils.InstanceBufferObject;
import com.badlogic.gdx.graphics.glutils.InstanceData;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.graphics.glutils.VertexArray;
import com.badlogic.gdx.graphics.glutils.VertexBufferObject;
import com.badlogic.gdx.graphics.glutils.VertexBufferObjectSubData;
import com.badlogic.gdx.graphics.glutils.VertexBufferObjectWithVAO;
import com.badlogic.gdx.graphics.glutils.VertexData;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.FloatBuffer;
import java.nio.ShortBuffer;
import java.util.HashMap;
import java.util.Map;

public class Mesh implements Disposable {
  static final Map<Application, Array<Mesh>> meshes = new HashMap();
  
  boolean autoBind = true;
  
  final IndexData indices;
  
  InstanceData instances;
  
  boolean isInstanced = false;
  
  final boolean isVertexArray;
  
  private final Vector3 tmpV = new Vector3();
  
  final VertexData vertices;
  
  public Mesh(VertexDataType paramVertexDataType, boolean paramBoolean, int paramInt1, int paramInt2, VertexAttributes paramVertexAttributes) {
    int i = null.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType[paramVertexDataType.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          this.vertices = new VertexArray(paramInt1, paramVertexAttributes);
          this.indices = new IndexArray(paramInt2);
          this.isVertexArray = true;
        } else {
          this.vertices = new VertexBufferObjectWithVAO(paramBoolean, paramInt1, paramVertexAttributes);
          this.indices = new IndexBufferObjectSubData(paramBoolean, paramInt2);
          this.isVertexArray = false;
        } 
      } else {
        this.vertices = new VertexBufferObjectSubData(paramBoolean, paramInt1, paramVertexAttributes);
        this.indices = new IndexBufferObjectSubData(paramBoolean, paramInt2);
        this.isVertexArray = false;
      } 
    } else {
      this.vertices = new VertexBufferObject(paramBoolean, paramInt1, paramVertexAttributes);
      this.indices = new IndexBufferObject(paramBoolean, paramInt2);
      this.isVertexArray = false;
    } 
    addManagedMesh(Gdx.app, this);
  }
  
  public Mesh(VertexDataType paramVertexDataType, boolean paramBoolean, int paramInt1, int paramInt2, VertexAttribute... paramVarArgs) { this(paramVertexDataType, paramBoolean, paramInt1, paramInt2, new VertexAttributes(paramVarArgs)); }
  
  protected Mesh(VertexData paramVertexData, IndexData paramIndexData, boolean paramBoolean) {
    this.vertices = paramVertexData;
    this.indices = paramIndexData;
    this.isVertexArray = paramBoolean;
    addManagedMesh(Gdx.app, this);
  }
  
  public Mesh(boolean paramBoolean, int paramInt1, int paramInt2, VertexAttributes paramVertexAttributes) {
    this.vertices = makeVertexBuffer(paramBoolean, paramInt1, paramVertexAttributes);
    this.indices = new IndexBufferObject(paramBoolean, paramInt2);
    this.isVertexArray = false;
    addManagedMesh(Gdx.app, this);
  }
  
  public Mesh(boolean paramBoolean, int paramInt1, int paramInt2, VertexAttribute... paramVarArgs) {
    this.vertices = makeVertexBuffer(paramBoolean, paramInt1, new VertexAttributes(paramVarArgs));
    this.indices = new IndexBufferObject(paramBoolean, paramInt2);
    this.isVertexArray = false;
    addManagedMesh(Gdx.app, this);
  }
  
  public Mesh(boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, VertexAttributes paramVertexAttributes) {
    this.vertices = makeVertexBuffer(paramBoolean1, paramInt1, paramVertexAttributes);
    this.indices = new IndexBufferObject(paramBoolean2, paramInt2);
    this.isVertexArray = false;
    addManagedMesh(Gdx.app, this);
  }
  
  private static void addManagedMesh(Application paramApplication, Mesh paramMesh) {
    Array array1 = (Array)meshes.get(paramApplication);
    Array array2 = array1;
    if (array1 == null)
      array2 = new Array(); 
    array2.add(paramMesh);
    meshes.put(paramApplication, array2);
  }
  
  public static void clearAllMeshes(Application paramApplication) { meshes.remove(paramApplication); }
  
  public static String getManagedStatus() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Managed meshes/app: { ");
    for (Application application : meshes.keySet()) {
      stringBuilder.append(((Array)meshes.get(application)).size);
      stringBuilder.append(" ");
    } 
    stringBuilder.append("}");
    return stringBuilder.toString();
  }
  
  public static void invalidateAllMeshes(Application paramApplication) {
    Array array = (Array)meshes.get(paramApplication);
    if (array == null)
      return; 
    for (byte b = 0; b < array.size; b++) {
      ((Mesh)array.get(b)).vertices.invalidate();
      ((Mesh)array.get(b)).indices.invalidate();
    } 
  }
  
  private VertexData makeVertexBuffer(boolean paramBoolean, int paramInt, VertexAttributes paramVertexAttributes) { return (Gdx.gl30 != null) ? new VertexBufferObjectWithVAO(paramBoolean, paramInt, paramVertexAttributes) : new VertexBufferObject(paramBoolean, paramInt, paramVertexAttributes); }
  
  public static void transform(Matrix4 paramMatrix4, float[] paramArrayOfFloat, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    if (paramInt2 >= 0 && paramInt3 >= 1 && paramInt2 + paramInt3 <= paramInt1) {
      if (paramInt4 >= 0 && paramInt5 >= 1 && (paramInt4 + paramInt5) * paramInt1 <= paramArrayOfFloat.length) {
        Vector3 vector3 = new Vector3();
        paramInt2 += paramInt4 * paramInt1;
        int i = 0;
        paramInt4 = 0;
        int j = 0;
        int k = paramInt2;
        if (paramInt3 != 1) {
          paramInt4 = i;
          k = paramInt2;
          if (paramInt3 != 2) {
            paramInt4 = j;
            if (paramInt3 == 3)
              while (paramInt4 < paramInt5) {
                float f1 = paramArrayOfFloat[paramInt2];
                paramInt3 = paramInt2 + 1;
                float f2 = paramArrayOfFloat[paramInt3];
                k = paramInt2 + 2;
                vector3.set(f1, f2, paramArrayOfFloat[k]).mul(paramMatrix4);
                paramArrayOfFloat[paramInt2] = vector3.x;
                paramArrayOfFloat[paramInt3] = vector3.y;
                paramArrayOfFloat[k] = vector3.z;
                paramInt2 += paramInt1;
                paramInt4++;
              }  
          } else {
            while (paramInt4 < paramInt5) {
              float f = paramArrayOfFloat[k];
              paramInt2 = k + 1;
              vector3.set(f, paramArrayOfFloat[paramInt2], 0.0F).mul(paramMatrix4);
              paramArrayOfFloat[k] = vector3.x;
              paramArrayOfFloat[paramInt2] = vector3.y;
              k += paramInt1;
              paramInt4++;
            } 
          } 
        } else {
          while (paramInt4 < paramInt5) {
            vector3.set(paramArrayOfFloat[k], 0.0F, 0.0F).mul(paramMatrix4);
            paramArrayOfFloat[k] = vector3.x;
            k += paramInt1;
            paramInt4++;
          } 
        } 
        return;
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("start = ");
      stringBuilder.append(paramInt4);
      stringBuilder.append(", count = ");
      stringBuilder.append(paramInt5);
      stringBuilder.append(", vertexSize = ");
      stringBuilder.append(paramInt1);
      stringBuilder.append(", length = ");
      stringBuilder.append(paramArrayOfFloat.length);
      throw new IndexOutOfBoundsException(stringBuilder.toString());
    } 
    IndexOutOfBoundsException indexOutOfBoundsException = new IndexOutOfBoundsException();
    throw indexOutOfBoundsException;
  }
  
  public static void transformUV(Matrix3 paramMatrix3, float[] paramArrayOfFloat, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (paramInt3 >= 0 && paramInt4 >= 1 && (paramInt3 + paramInt4) * paramInt1 <= paramArrayOfFloat.length) {
      Vector2 vector2 = new Vector2();
      paramInt3 = paramInt2 + paramInt3 * paramInt1;
      for (paramInt2 = 0; paramInt2 < paramInt4; paramInt2++) {
        float f = paramArrayOfFloat[paramInt3];
        int i = paramInt3 + 1;
        vector2.set(f, paramArrayOfFloat[i]).mul(paramMatrix3);
        paramArrayOfFloat[paramInt3] = vector2.x;
        paramArrayOfFloat[i] = vector2.y;
        paramInt3 += paramInt1;
      } 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("start = ");
    stringBuilder.append(paramInt3);
    stringBuilder.append(", count = ");
    stringBuilder.append(paramInt4);
    stringBuilder.append(", vertexSize = ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(", length = ");
    stringBuilder.append(paramArrayOfFloat.length);
    IndexOutOfBoundsException indexOutOfBoundsException = new IndexOutOfBoundsException(stringBuilder.toString());
    throw indexOutOfBoundsException;
  }
  
  public void bind(ShaderProgram paramShaderProgram) { bind(paramShaderProgram, null); }
  
  public void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    this.vertices.bind(paramShaderProgram, paramArrayOfInt);
    InstanceData instanceData = this.instances;
    if (instanceData != null && instanceData.getNumInstances() > 0)
      this.instances.bind(paramShaderProgram, paramArrayOfInt); 
    if (this.indices.getNumIndices() > 0)
      this.indices.bind(); 
  }
  
  public BoundingBox calculateBoundingBox() {
    BoundingBox boundingBox = new BoundingBox();
    calculateBoundingBox(boundingBox);
    return boundingBox;
  }
  
  public BoundingBox calculateBoundingBox(BoundingBox paramBoundingBox, int paramInt1, int paramInt2) { return extendBoundingBox(paramBoundingBox.inf(), paramInt1, paramInt2); }
  
  public BoundingBox calculateBoundingBox(BoundingBox paramBoundingBox, int paramInt1, int paramInt2, Matrix4 paramMatrix4) { return extendBoundingBox(paramBoundingBox.inf(), paramInt1, paramInt2, paramMatrix4); }
  
  public void calculateBoundingBox(BoundingBox paramBoundingBox) {
    int i = getNumVertices();
    if (i != 0) {
      FloatBuffer floatBuffer = this.vertices.getBuffer();
      paramBoundingBox.inf();
      VertexAttribute vertexAttribute = getVertexAttribute(1);
      int j = vertexAttribute.offset / 4;
      int k = (this.vertices.getAttributes()).vertexSize / 4;
      int m = vertexAttribute.numComponents;
      byte b1 = 0;
      byte b2 = 0;
      int n = 0;
      int i1 = j;
      if (m != 1) {
        i1 = j;
        b2 = b1;
        if (m != 2) {
          i1 = n;
          if (m == 3)
            while (i1 < i) {
              paramBoundingBox.ext(floatBuffer.get(j), floatBuffer.get(j + 1), floatBuffer.get(j + 2));
              j += k;
              i1++;
            }  
        } else {
          while (b2 < i) {
            paramBoundingBox.ext(floatBuffer.get(i1), floatBuffer.get(i1 + 1), 0.0F);
            i1 += k;
            b2++;
          } 
        } 
      } else {
        while (b2 < i) {
          paramBoundingBox.ext(floatBuffer.get(i1), 0.0F, 0.0F);
          i1 += k;
          b2++;
        } 
      } 
      return;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("No vertices defined");
    throw gdxRuntimeException;
  }
  
  public float calculateRadius(float paramFloat1, float paramFloat2, float paramFloat3) { return calculateRadius(paramFloat1, paramFloat2, paramFloat3, 0, getNumIndices(), null); }
  
  public float calculateRadius(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2) { return calculateRadius(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, null); }
  
  public float calculateRadius(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Matrix4 paramMatrix4) { return (float)Math.sqrt(calculateRadiusSquared(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramMatrix4)); }
  
  public float calculateRadius(Vector3 paramVector3) { return calculateRadius(paramVector3.x, paramVector3.y, paramVector3.z, 0, getNumIndices(), null); }
  
  public float calculateRadius(Vector3 paramVector3, int paramInt1, int paramInt2) { return calculateRadius(paramVector3.x, paramVector3.y, paramVector3.z, paramInt1, paramInt2, null); }
  
  public float calculateRadius(Vector3 paramVector3, int paramInt1, int paramInt2, Matrix4 paramMatrix4) { return calculateRadius(paramVector3.x, paramVector3.y, paramVector3.z, paramInt1, paramInt2, paramMatrix4); }
  
  public float calculateRadiusSquared(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Matrix4 paramMatrix4) {
    int i = getNumIndices();
    if (paramInt1 >= 0 && paramInt2 >= 1) {
      int j = paramInt1 + paramInt2;
      if (j <= i) {
        FloatBuffer floatBuffer = this.vertices.getBuffer();
        ShortBuffer shortBuffer = this.indices.getBuffer();
        VertexAttribute vertexAttribute = getVertexAttribute(1);
        i = vertexAttribute.offset / 4;
        int k = (this.vertices.getAttributes()).vertexSize / 4;
        paramInt2 = vertexAttribute.numComponents;
        float f1 = 0.0F;
        float f2 = 0.0F;
        if (paramInt2 != 1) {
          if (paramInt2 != 2) {
            if (paramInt2 == 3) {
              paramInt2 = paramInt1;
              paramInt1 = i;
              while (true) {
                f1 = f2;
                if (paramInt2 < j) {
                  i = shortBuffer.get(paramInt2) * k + paramInt1;
                  this.tmpV.set(floatBuffer.get(i), floatBuffer.get(i + 1), floatBuffer.get(i + 2));
                  if (paramMatrix4 != null)
                    this.tmpV.mul(paramMatrix4); 
                  float f = this.tmpV.sub(paramFloat1, paramFloat2, paramFloat3).len2();
                  f1 = f2;
                  if (f > f2)
                    f1 = f; 
                  paramInt2++;
                  f2 = f1;
                  continue;
                } 
                break;
              } 
            } 
          } else {
            for (f1 = 0.0F; paramInt1 < j; f1 = f2) {
              paramInt2 = shortBuffer.get(paramInt1) * k + i;
              this.tmpV.set(floatBuffer.get(paramInt2), floatBuffer.get(paramInt2 + 1), 0.0F);
              if (paramMatrix4 != null)
                this.tmpV.mul(paramMatrix4); 
              float f = this.tmpV.sub(paramFloat1, paramFloat2, paramFloat3).len2();
              f2 = f1;
              if (f > f1)
                f2 = f; 
              paramInt1++;
            } 
          } 
        } else {
          for (f1 = 0.0F; paramInt1 < j; f1 = f2) {
            paramInt2 = shortBuffer.get(paramInt1);
            this.tmpV.set(floatBuffer.get(paramInt2 * k + i), 0.0F, 0.0F);
            if (paramMatrix4 != null)
              this.tmpV.mul(paramMatrix4); 
            float f = this.tmpV.sub(paramFloat1, paramFloat2, paramFloat3).len2();
            f2 = f1;
            if (f > f1)
              f2 = f; 
            paramInt1++;
          } 
        } 
        return f1;
      } 
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Not enough indices");
    throw gdxRuntimeException;
  }
  
  public Mesh copy(boolean paramBoolean) { return copy(paramBoolean, false, null); }
  
  public Mesh copy(boolean paramBoolean1, boolean paramBoolean2, int[] paramArrayOfInt) { // Byte code:
    //   0: aload_0
    //   1: invokevirtual getVertexSize : ()I
    //   4: iconst_4
    //   5: idiv
    //   6: istore #4
    //   8: aload_0
    //   9: invokevirtual getNumVertices : ()I
    //   12: istore #5
    //   14: iload #5
    //   16: iload #4
    //   18: imul
    //   19: newarray float
    //   21: astore #6
    //   23: aload_0
    //   24: iconst_0
    //   25: aload #6
    //   27: arraylength
    //   28: aload #6
    //   30: invokevirtual getVertices : (II[F)[F
    //   33: pop
    //   34: aconst_null
    //   35: astore #7
    //   37: aload_3
    //   38: ifnull -> 245
    //   41: iconst_0
    //   42: istore #8
    //   44: iconst_0
    //   45: istore #9
    //   47: iconst_0
    //   48: istore #10
    //   50: iload #8
    //   52: aload_3
    //   53: arraylength
    //   54: if_icmpge -> 112
    //   57: iload #9
    //   59: istore #11
    //   61: iload #10
    //   63: istore #12
    //   65: aload_0
    //   66: aload_3
    //   67: iload #8
    //   69: iaload
    //   70: invokevirtual getVertexAttribute : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   73: ifnull -> 98
    //   76: iload #9
    //   78: aload_0
    //   79: aload_3
    //   80: iload #8
    //   82: iaload
    //   83: invokevirtual getVertexAttribute : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   86: getfield numComponents : I
    //   89: iadd
    //   90: istore #11
    //   92: iload #10
    //   94: iconst_1
    //   95: iadd
    //   96: istore #12
    //   98: iinc #8, 1
    //   101: iload #11
    //   103: istore #9
    //   105: iload #12
    //   107: istore #10
    //   109: goto -> 50
    //   112: iload #9
    //   114: ifle -> 245
    //   117: iload #10
    //   119: anewarray com/badlogic/gdx/graphics/VertexAttribute
    //   122: astore #13
    //   124: iload #9
    //   126: newarray short
    //   128: astore #14
    //   130: iconst_0
    //   131: istore #11
    //   133: iconst_0
    //   134: istore #10
    //   136: iconst_m1
    //   137: istore #12
    //   139: iconst_m1
    //   140: istore #9
    //   142: aload #13
    //   144: astore #15
    //   146: aload #14
    //   148: astore #16
    //   150: iload #10
    //   152: istore #8
    //   154: iload #11
    //   156: aload_3
    //   157: arraylength
    //   158: if_icmpge -> 255
    //   161: aload_0
    //   162: aload_3
    //   163: iload #11
    //   165: iaload
    //   166: invokevirtual getVertexAttribute : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   169: astore #16
    //   171: aload #16
    //   173: ifnonnull -> 179
    //   176: goto -> 239
    //   179: iconst_0
    //   180: istore #8
    //   182: iload #8
    //   184: aload #16
    //   186: getfield numComponents : I
    //   189: if_icmpge -> 216
    //   192: iinc #12, 1
    //   195: aload #14
    //   197: iload #12
    //   199: aload #16
    //   201: getfield offset : I
    //   204: iload #8
    //   206: iadd
    //   207: i2s
    //   208: i2s
    //   209: sastore
    //   210: iinc #8, 1
    //   213: goto -> 182
    //   216: iinc #9, 1
    //   219: aload #13
    //   221: iload #9
    //   223: aload #16
    //   225: invokevirtual copy : ()Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   228: aastore
    //   229: iload #10
    //   231: aload #16
    //   233: getfield numComponents : I
    //   236: iadd
    //   237: istore #10
    //   239: iinc #11, 1
    //   242: goto -> 142
    //   245: aconst_null
    //   246: astore #15
    //   248: aload #15
    //   250: astore #16
    //   252: iconst_0
    //   253: istore #8
    //   255: aload #16
    //   257: astore #13
    //   259: iload #8
    //   261: istore #11
    //   263: aload #16
    //   265: ifnonnull -> 306
    //   268: iload #4
    //   270: newarray short
    //   272: astore #13
    //   274: iconst_0
    //   275: istore #10
    //   277: iload #10
    //   279: iload #4
    //   281: if_icmpge -> 302
    //   284: aload #13
    //   286: iload #10
    //   288: iload #10
    //   290: i2s
    //   291: sastore
    //   292: iload #10
    //   294: iconst_1
    //   295: iadd
    //   296: i2s
    //   297: istore #10
    //   299: goto -> 277
    //   302: iload #4
    //   304: istore #11
    //   306: aload_0
    //   307: invokevirtual getNumIndices : ()I
    //   310: istore #17
    //   312: iload #5
    //   314: istore #10
    //   316: aload #6
    //   318: astore #16
    //   320: aload #7
    //   322: astore_3
    //   323: iload #17
    //   325: ifle -> 574
    //   328: iload #17
    //   330: newarray short
    //   332: astore #7
    //   334: aload_0
    //   335: aload #7
    //   337: invokevirtual getIndices : ([S)V
    //   340: iload_2
    //   341: ifne -> 362
    //   344: iload #5
    //   346: istore #10
    //   348: aload #6
    //   350: astore #16
    //   352: aload #7
    //   354: astore_3
    //   355: iload #11
    //   357: iload #4
    //   359: if_icmpeq -> 574
    //   362: aload #6
    //   364: arraylength
    //   365: newarray float
    //   367: astore #16
    //   369: iconst_0
    //   370: istore #9
    //   372: iconst_0
    //   373: istore #10
    //   375: iload #9
    //   377: iload #17
    //   379: if_icmpge -> 571
    //   382: aload #7
    //   384: iload #9
    //   386: saload
    //   387: iload #4
    //   389: imul
    //   390: istore #18
    //   392: iload_2
    //   393: ifeq -> 495
    //   396: iconst_0
    //   397: istore #12
    //   399: iconst_m1
    //   400: istore #8
    //   402: iconst_0
    //   403: istore #19
    //   405: iload #8
    //   407: istore #5
    //   409: iload #12
    //   411: iload #10
    //   413: if_icmpge -> 498
    //   416: iload #8
    //   418: istore #5
    //   420: iload #8
    //   422: ifge -> 498
    //   425: iconst_1
    //   426: istore #5
    //   428: iload #19
    //   430: aload #13
    //   432: arraylength
    //   433: if_icmpge -> 476
    //   436: iload #5
    //   438: ifeq -> 476
    //   441: aload #16
    //   443: iload #12
    //   445: iload #11
    //   447: imul
    //   448: iload #19
    //   450: iadd
    //   451: faload
    //   452: aload #6
    //   454: iload #18
    //   456: aload #13
    //   458: iload #19
    //   460: saload
    //   461: iadd
    //   462: faload
    //   463: fcmpl
    //   464: ifeq -> 470
    //   467: iconst_0
    //   468: istore #5
    //   470: iinc #19, 1
    //   473: goto -> 428
    //   476: iload #5
    //   478: ifeq -> 485
    //   481: iload #12
    //   483: istore #8
    //   485: iload #12
    //   487: iconst_1
    //   488: iadd
    //   489: i2s
    //   490: istore #12
    //   492: goto -> 402
    //   495: iconst_m1
    //   496: istore #5
    //   498: iload #5
    //   500: ifle -> 514
    //   503: aload #7
    //   505: iload #9
    //   507: iload #5
    //   509: i2s
    //   510: sastore
    //   511: goto -> 565
    //   514: iconst_0
    //   515: istore #12
    //   517: iload #12
    //   519: aload #13
    //   521: arraylength
    //   522: if_icmpge -> 553
    //   525: aload #16
    //   527: iload #10
    //   529: iload #11
    //   531: imul
    //   532: iload #12
    //   534: iadd
    //   535: aload #6
    //   537: aload #13
    //   539: iload #12
    //   541: saload
    //   542: iload #18
    //   544: iadd
    //   545: faload
    //   546: fastore
    //   547: iinc #12, 1
    //   550: goto -> 517
    //   553: aload #7
    //   555: iload #9
    //   557: iload #10
    //   559: i2s
    //   560: i2s
    //   561: sastore
    //   562: iinc #10, 1
    //   565: iinc #9, 1
    //   568: goto -> 375
    //   571: aload #7
    //   573: astore_3
    //   574: aload #15
    //   576: ifnonnull -> 614
    //   579: aload_3
    //   580: ifnonnull -> 589
    //   583: iconst_0
    //   584: istore #12
    //   586: goto -> 593
    //   589: aload_3
    //   590: arraylength
    //   591: istore #12
    //   593: new com/badlogic/gdx/graphics/Mesh
    //   596: dup
    //   597: iload_1
    //   598: iload #10
    //   600: iload #12
    //   602: aload_0
    //   603: invokevirtual getVertexAttributes : ()Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   606: invokespecial <init> : (ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V
    //   609: astore #15
    //   611: goto -> 644
    //   614: aload_3
    //   615: ifnonnull -> 624
    //   618: iconst_0
    //   619: istore #12
    //   621: goto -> 628
    //   624: aload_3
    //   625: arraylength
    //   626: istore #12
    //   628: new com/badlogic/gdx/graphics/Mesh
    //   631: dup
    //   632: iload_1
    //   633: iload #10
    //   635: iload #12
    //   637: aload #15
    //   639: invokespecial <init> : (ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    //   642: astore #15
    //   644: aload #15
    //   646: aload #16
    //   648: iconst_0
    //   649: iload #10
    //   651: iload #11
    //   653: imul
    //   654: invokevirtual setVertices : ([FII)Lcom/badlogic/gdx/graphics/Mesh;
    //   657: pop
    //   658: aload_3
    //   659: ifnull -> 669
    //   662: aload #15
    //   664: aload_3
    //   665: invokevirtual setIndices : ([S)Lcom/badlogic/gdx/graphics/Mesh;
    //   668: pop
    //   669: aload #15
    //   671: areturn }
  
  public Mesh disableInstancedRendering() {
    if (this.isInstanced) {
      this.isInstanced = false;
      this.instances.dispose();
      this.instances = null;
    } 
    return this;
  }
  
  public void dispose() {
    if (meshes.get(Gdx.app) != null)
      ((Array)meshes.get(Gdx.app)).removeValue(this, true); 
    this.vertices.dispose();
    InstanceData instanceData = this.instances;
    if (instanceData != null)
      instanceData.dispose(); 
    this.indices.dispose();
  }
  
  public Mesh enableInstancedRendering(boolean paramBoolean, int paramInt, VertexAttribute... paramVarArgs) {
    if (!this.isInstanced) {
      this.isInstanced = true;
      this.instances = new InstanceBufferObject(paramBoolean, paramInt, paramVarArgs);
      return this;
    } 
    throw new GdxRuntimeException("Trying to enable InstancedRendering on same Mesh instance twice. Use disableInstancedRendering to clean up old InstanceData first");
  }
  
  public BoundingBox extendBoundingBox(BoundingBox paramBoundingBox, int paramInt1, int paramInt2) { return extendBoundingBox(paramBoundingBox, paramInt1, paramInt2, null); }
  
  public BoundingBox extendBoundingBox(BoundingBox paramBoundingBox, int paramInt1, int paramInt2, Matrix4 paramMatrix4) {
    int i = getNumIndices();
    int j = getNumVertices();
    if (i != 0)
      j = i; 
    if (paramInt1 >= 0 && paramInt2 >= 1) {
      int k = paramInt1 + paramInt2;
      if (k <= j) {
        FloatBuffer floatBuffer = this.vertices.getBuffer();
        ShortBuffer shortBuffer = this.indices.getBuffer();
        VertexAttribute vertexAttribute = getVertexAttribute(1);
        int m = vertexAttribute.offset / 4;
        j = (this.vertices.getAttributes()).vertexSize / 4;
        paramInt2 = vertexAttribute.numComponents;
        if (paramInt2 != 1) {
          if (paramInt2 != 2) {
            if (paramInt2 == 3) {
              paramInt2 = paramInt1;
              if (i > 0) {
                while (paramInt1 < k) {
                  paramInt2 = shortBuffer.get(paramInt1) * j + m;
                  this.tmpV.set(floatBuffer.get(paramInt2), floatBuffer.get(paramInt2 + 1), floatBuffer.get(paramInt2 + 2));
                  if (paramMatrix4 != null)
                    this.tmpV.mul(paramMatrix4); 
                  paramBoundingBox.ext(this.tmpV);
                  paramInt1++;
                } 
              } else {
                while (paramInt2 < k) {
                  paramInt1 = paramInt2 * j + m;
                  this.tmpV.set(floatBuffer.get(paramInt1), floatBuffer.get(paramInt1 + 1), floatBuffer.get(paramInt1 + 2));
                  if (paramMatrix4 != null)
                    this.tmpV.mul(paramMatrix4); 
                  paramBoundingBox.ext(this.tmpV);
                  paramInt2++;
                } 
              } 
            } 
          } else {
            paramInt2 = paramInt1;
            if (i > 0) {
              while (paramInt1 < k) {
                paramInt2 = shortBuffer.get(paramInt1) * j + m;
                this.tmpV.set(floatBuffer.get(paramInt2), floatBuffer.get(paramInt2 + 1), 0.0F);
                if (paramMatrix4 != null)
                  this.tmpV.mul(paramMatrix4); 
                paramBoundingBox.ext(this.tmpV);
                paramInt1++;
              } 
            } else {
              while (paramInt2 < k) {
                paramInt1 = paramInt2 * j + m;
                this.tmpV.set(floatBuffer.get(paramInt1), floatBuffer.get(paramInt1 + 1), 0.0F);
                if (paramMatrix4 != null)
                  this.tmpV.mul(paramMatrix4); 
                paramBoundingBox.ext(this.tmpV);
                paramInt2++;
              } 
            } 
          } 
        } else {
          paramInt2 = paramInt1;
          if (i > 0) {
            while (paramInt1 < k) {
              paramInt2 = shortBuffer.get(paramInt1);
              this.tmpV.set(floatBuffer.get(paramInt2 * j + m), 0.0F, 0.0F);
              if (paramMatrix4 != null)
                this.tmpV.mul(paramMatrix4); 
              paramBoundingBox.ext(this.tmpV);
              paramInt1++;
            } 
          } else {
            while (paramInt2 < k) {
              this.tmpV.set(floatBuffer.get(paramInt2 * j + m), 0.0F, 0.0F);
              if (paramMatrix4 != null)
                this.tmpV.mul(paramMatrix4); 
              paramBoundingBox.ext(this.tmpV);
              paramInt2++;
            } 
          } 
        } 
        return paramBoundingBox;
      } 
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Invalid part specified ( offset=");
    stringBuilder.append(paramInt1);
    stringBuilder.append(", count=");
    stringBuilder.append(paramInt2);
    stringBuilder.append(", max=");
    stringBuilder.append(j);
    stringBuilder.append(" )");
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  public void getIndices(int paramInt1, int paramInt2, short[] paramArrayOfShort, int paramInt3) {
    int i = getNumIndices();
    int j = paramInt2;
    if (paramInt2 < 0)
      j = i - paramInt1; 
    if (paramInt1 >= 0 && paramInt1 < i && paramInt1 + j <= i) {
      if (paramArrayOfShort.length - paramInt3 >= j) {
        paramInt2 = getIndicesBuffer().position();
        getIndicesBuffer().position(paramInt1);
        getIndicesBuffer().get(paramArrayOfShort, paramInt3, j);
        getIndicesBuffer().position(paramInt2);
        return;
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("not enough room in indices array, has ");
      stringBuilder1.append(paramArrayOfShort.length);
      stringBuilder1.append(" shorts, needs ");
      stringBuilder1.append(j);
      throw new IllegalArgumentException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Invalid range specified, offset: ");
    stringBuilder.append(paramInt1);
    stringBuilder.append(", count: ");
    stringBuilder.append(j);
    stringBuilder.append(", max: ");
    stringBuilder.append(i);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void getIndices(int paramInt1, short[] paramArrayOfShort, int paramInt2) { getIndices(paramInt1, -1, paramArrayOfShort, paramInt2); }
  
  public void getIndices(short[] paramArrayOfShort) { getIndices(paramArrayOfShort, 0); }
  
  public void getIndices(short[] paramArrayOfShort, int paramInt) { getIndices(0, paramArrayOfShort, paramInt); }
  
  public ShortBuffer getIndicesBuffer() { return this.indices.getBuffer(); }
  
  public int getMaxIndices() { return this.indices.getNumMaxIndices(); }
  
  public int getMaxVertices() { return this.vertices.getNumMaxVertices(); }
  
  public int getNumIndices() { return this.indices.getNumIndices(); }
  
  public int getNumVertices() { return this.vertices.getNumVertices(); }
  
  public VertexAttribute getVertexAttribute(int paramInt) {
    VertexAttributes vertexAttributes = this.vertices.getAttributes();
    int i = vertexAttributes.size();
    for (byte b = 0; b < i; b++) {
      if ((vertexAttributes.get(b)).usage == paramInt)
        return vertexAttributes.get(b); 
    } 
    return null;
  }
  
  public VertexAttributes getVertexAttributes() { return this.vertices.getAttributes(); }
  
  public int getVertexSize() { return (this.vertices.getAttributes()).vertexSize; }
  
  public float[] getVertices(int paramInt1, int paramInt2, float[] paramArrayOfFloat) { return getVertices(paramInt1, paramInt2, paramArrayOfFloat, 0); }
  
  public float[] getVertices(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    int i = getNumVertices() * getVertexSize() / 4;
    int j = paramInt2;
    if (paramInt2 == -1) {
      paramInt2 = i - paramInt1;
      j = paramInt2;
      if (paramInt2 > paramArrayOfFloat.length - paramInt3)
        j = paramArrayOfFloat.length - paramInt3; 
    } 
    if (paramInt1 >= 0 && j > 0 && paramInt1 + j <= i && paramInt3 >= 0 && paramInt3 < paramArrayOfFloat.length) {
      if (paramArrayOfFloat.length - paramInt3 >= j) {
        paramInt2 = getVerticesBuffer().position();
        getVerticesBuffer().position(paramInt1);
        getVerticesBuffer().get(paramArrayOfFloat, paramInt3, j);
        getVerticesBuffer().position(paramInt2);
        return paramArrayOfFloat;
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("not enough room in vertices array, has ");
      stringBuilder.append(paramArrayOfFloat.length);
      stringBuilder.append(" floats, needs ");
      stringBuilder.append(j);
      throw new IllegalArgumentException(stringBuilder.toString());
    } 
    throw new IndexOutOfBoundsException();
  }
  
  public float[] getVertices(int paramInt, float[] paramArrayOfFloat) { return getVertices(paramInt, -1, paramArrayOfFloat); }
  
  public float[] getVertices(float[] paramArrayOfFloat) { return getVertices(0, -1, paramArrayOfFloat); }
  
  public FloatBuffer getVerticesBuffer() { return this.vertices.getBuffer(); }
  
  public void render(ShaderProgram paramShaderProgram, int paramInt) {
    int i;
    if (this.indices.getNumMaxIndices() > 0) {
      i = getNumIndices();
    } else {
      i = getNumVertices();
    } 
    render(paramShaderProgram, paramInt, 0, i, this.autoBind);
  }
  
  public void render(ShaderProgram paramShaderProgram, int paramInt1, int paramInt2, int paramInt3) { render(paramShaderProgram, paramInt1, paramInt2, paramInt3, this.autoBind); }
  
  public void render(ShaderProgram paramShaderProgram, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean) {
    StringBuilder stringBuilder;
    if (paramInt3 == 0)
      return; 
    if (paramBoolean)
      bind(paramShaderProgram); 
    if (this.isVertexArray) {
      if (this.indices.getNumIndices() > 0) {
        ShortBuffer shortBuffer = this.indices.getBuffer();
        int i = shortBuffer.position();
        int j = shortBuffer.limit();
        shortBuffer.position(paramInt2);
        shortBuffer.limit(paramInt2 + paramInt3);
        Gdx.gl20.glDrawElements(paramInt1, paramInt3, 5123, shortBuffer);
        shortBuffer.position(i);
        shortBuffer.limit(j);
      } else {
        Gdx.gl20.glDrawArrays(paramInt1, paramInt2, paramInt3);
      } 
    } else {
      byte b;
      if (this.isInstanced) {
        b = this.instances.getNumInstances();
      } else {
        b = 0;
      } 
      if (this.indices.getNumIndices() > 0) {
        if (paramInt3 + paramInt2 <= this.indices.getNumMaxIndices()) {
          if (this.isInstanced && b) {
            Gdx.gl30.glDrawElementsInstanced(paramInt1, paramInt3, 5123, paramInt2 * 2, b);
          } else {
            Gdx.gl20.glDrawElements(paramInt1, paramInt3, 5123, paramInt2 * 2);
          } 
        } else {
          stringBuilder = new StringBuilder();
          stringBuilder.append("Mesh attempting to access memory outside of the index buffer (count: ");
          stringBuilder.append(paramInt3);
          stringBuilder.append(", offset: ");
          stringBuilder.append(paramInt2);
          stringBuilder.append(", max: ");
          stringBuilder.append(this.indices.getNumMaxIndices());
          stringBuilder.append(")");
          throw new GdxRuntimeException(stringBuilder.toString());
        } 
      } else if (this.isInstanced && b > 0) {
        Gdx.gl30.glDrawArraysInstanced(paramInt1, paramInt2, paramInt3, b);
      } else {
        Gdx.gl20.glDrawArrays(paramInt1, paramInt2, paramInt3);
      } 
    } 
    if (paramBoolean)
      unbind(stringBuilder); 
  }
  
  public void scale(float paramFloat1, float paramFloat2, float paramFloat3) {
    VertexAttribute vertexAttribute = getVertexAttribute(1);
    int i = vertexAttribute.offset / 4;
    int j = vertexAttribute.numComponents;
    int k = getNumVertices();
    int m = getVertexSize() / 4;
    float[] arrayOfFloat = new float[k * m];
    getVertices(arrayOfFloat);
    byte b = 0;
    int n = 0;
    int i1 = 0;
    int i2 = i;
    if (j != 1) {
      i2 = i;
      n = b;
      if (j != 2) {
        i2 = i1;
        if (j == 3)
          while (i2 < k) {
            arrayOfFloat[i] = arrayOfFloat[i] * paramFloat1;
            n = i + 1;
            arrayOfFloat[n] = arrayOfFloat[n] * paramFloat2;
            n = i + 2;
            arrayOfFloat[n] = arrayOfFloat[n] * paramFloat3;
            i += m;
            i2++;
          }  
      } else {
        while (n < k) {
          arrayOfFloat[i2] = arrayOfFloat[i2] * paramFloat1;
          i = i2 + 1;
          arrayOfFloat[i] = arrayOfFloat[i] * paramFloat2;
          i2 += m;
          n++;
        } 
      } 
    } else {
      while (n < k) {
        arrayOfFloat[i2] = arrayOfFloat[i2] * paramFloat1;
        i2 += m;
        n++;
      } 
    } 
    setVertices(arrayOfFloat);
  }
  
  public void setAutoBind(boolean paramBoolean) { this.autoBind = paramBoolean; }
  
  public Mesh setIndices(short[] paramArrayOfShort) {
    this.indices.setIndices(paramArrayOfShort, 0, paramArrayOfShort.length);
    return this;
  }
  
  public Mesh setIndices(short[] paramArrayOfShort, int paramInt1, int paramInt2) {
    this.indices.setIndices(paramArrayOfShort, paramInt1, paramInt2);
    return this;
  }
  
  public Mesh setInstanceData(FloatBuffer paramFloatBuffer) {
    InstanceData instanceData = this.instances;
    if (instanceData != null) {
      instanceData.setInstanceData(paramFloatBuffer, paramFloatBuffer.limit());
      return this;
    } 
    throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
  }
  
  public Mesh setInstanceData(FloatBuffer paramFloatBuffer, int paramInt) {
    InstanceData instanceData = this.instances;
    if (instanceData != null) {
      instanceData.setInstanceData(paramFloatBuffer, paramInt);
      return this;
    } 
    throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
  }
  
  public Mesh setInstanceData(float[] paramArrayOfFloat) {
    InstanceData instanceData = this.instances;
    if (instanceData != null) {
      instanceData.setInstanceData(paramArrayOfFloat, 0, paramArrayOfFloat.length);
      return this;
    } 
    throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
  }
  
  public Mesh setInstanceData(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    InstanceData instanceData = this.instances;
    if (instanceData != null) {
      instanceData.setInstanceData(paramArrayOfFloat, paramInt1, paramInt2);
      return this;
    } 
    throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
  }
  
  public Mesh setVertices(float[] paramArrayOfFloat) {
    this.vertices.setVertices(paramArrayOfFloat, 0, paramArrayOfFloat.length);
    return this;
  }
  
  public Mesh setVertices(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    this.vertices.setVertices(paramArrayOfFloat, paramInt1, paramInt2);
    return this;
  }
  
  public void transform(Matrix4 paramMatrix4) { transform(paramMatrix4, 0, getNumVertices()); }
  
  public void transform(Matrix4 paramMatrix4, int paramInt1, int paramInt2) {
    VertexAttribute vertexAttribute = getVertexAttribute(1);
    int i = vertexAttribute.offset / 4;
    int j = getVertexSize() / 4;
    int k = vertexAttribute.numComponents;
    getNumVertices();
    int m = paramInt2 * j;
    float[] arrayOfFloat = new float[m];
    paramInt1 *= j;
    getVertices(paramInt1, m, arrayOfFloat);
    transform(paramMatrix4, arrayOfFloat, j, i, k, 0, paramInt2);
    updateVertices(paramInt1, arrayOfFloat);
  }
  
  public void transformUV(Matrix3 paramMatrix3) { transformUV(paramMatrix3, 0, getNumVertices()); }
  
  protected void transformUV(Matrix3 paramMatrix3, int paramInt1, int paramInt2) {
    int i = (getVertexAttribute(16)).offset / 4;
    int j = getVertexSize() / 4;
    float[] arrayOfFloat = new float[getNumVertices() * j];
    getVertices(0, arrayOfFloat.length, arrayOfFloat);
    transformUV(paramMatrix3, arrayOfFloat, j, i, paramInt1, paramInt2);
    setVertices(arrayOfFloat, 0, arrayOfFloat.length);
  }
  
  public void unbind(ShaderProgram paramShaderProgram) { unbind(paramShaderProgram, null); }
  
  public void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    this.vertices.unbind(paramShaderProgram, paramArrayOfInt);
    InstanceData instanceData = this.instances;
    if (instanceData != null && instanceData.getNumInstances() > 0)
      this.instances.unbind(paramShaderProgram, paramArrayOfInt); 
    if (this.indices.getNumIndices() > 0)
      this.indices.unbind(); 
  }
  
  public Mesh updateInstanceData(int paramInt, FloatBuffer paramFloatBuffer) { return updateInstanceData(paramInt, paramFloatBuffer, 0, paramFloatBuffer.limit()); }
  
  public Mesh updateInstanceData(int paramInt1, FloatBuffer paramFloatBuffer, int paramInt2, int paramInt3) {
    this.instances.updateInstanceData(paramInt1, paramFloatBuffer, paramInt2, paramInt3);
    return this;
  }
  
  public Mesh updateInstanceData(int paramInt, float[] paramArrayOfFloat) { return updateInstanceData(paramInt, paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public Mesh updateInstanceData(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    this.instances.updateInstanceData(paramInt1, paramArrayOfFloat, paramInt2, paramInt3);
    return this;
  }
  
  public Mesh updateVertices(int paramInt, float[] paramArrayOfFloat) { return updateVertices(paramInt, paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public Mesh updateVertices(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    this.vertices.updateVertices(paramInt1, paramArrayOfFloat, paramInt2, paramInt3);
    return this;
  }
  
  public enum VertexDataType {
    VertexArray, VertexBufferObject, VertexBufferObjectSubData, VertexBufferObjectWithVAO;
    
    static  {
      $VALUES = new VertexDataType[] { VertexArray, VertexBufferObject, VertexBufferObjectSubData, VertexBufferObjectWithVAO };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Mesh.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */