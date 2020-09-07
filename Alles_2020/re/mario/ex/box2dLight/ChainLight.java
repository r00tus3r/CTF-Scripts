package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.Pools;

public class ChainLight extends Light {
  public static float defaultRayStartOffset = 0.001F;
  
  protected Body body;
  
  protected float bodyAngle;
  
  protected float bodyAngleOffset;
  
  protected final Vector2 bodyPosition = new Vector2();
  
  public final FloatArray chain;
  
  protected final Rectangle chainLightBounds = new Rectangle();
  
  protected final float[] endX;
  
  protected final float[] endY;
  
  protected int rayDirection;
  
  protected final Rectangle rayHandlerBounds = new Rectangle();
  
  public float rayStartOffset = defaultRayStartOffset;
  
  protected final Matrix3 restorePosition = new Matrix3();
  
  protected final Matrix3 rotateAroundZero = new Matrix3();
  
  protected final FloatArray segmentAngles = new FloatArray();
  
  protected final FloatArray segmentLengths = new FloatArray();
  
  protected final float[] startX;
  
  protected final float[] startY;
  
  protected final Vector2 tmpEnd = new Vector2();
  
  protected final Vector2 tmpPerp = new Vector2();
  
  protected final Vector2 tmpStart = new Vector2();
  
  protected final Vector2 tmpVec = new Vector2();
  
  protected final Matrix3 zeroPosition = new Matrix3();
  
  static  {
  
  }
  
  public ChainLight(RayHandler paramRayHandler, int paramInt1, Color paramColor, float paramFloat, int paramInt2) { this(paramRayHandler, paramInt1, paramColor, paramFloat, paramInt2, null); }
  
  public ChainLight(RayHandler paramRayHandler, int paramInt1, Color paramColor, float paramFloat, int paramInt2, float[] paramArrayOfFloat) {
    super(paramRayHandler, paramInt1, paramColor, paramFloat, 0.0F);
    this.rayDirection = paramInt2;
    this.vertexNum = (this.vertexNum - 1) * 2;
    this.endX = new float[paramInt1];
    this.endY = new float[paramInt1];
    this.startX = new float[paramInt1];
    this.startY = new float[paramInt1];
    if (paramArrayOfFloat != null) {
      floatArray = new FloatArray(paramArrayOfFloat);
    } else {
      floatArray = new FloatArray();
    } 
    this.chain = floatArray;
    this.lightMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum, false, new VertexAttribute[] { new VertexAttribute(true, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, true, "s") });
    this.softShadowMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum * 2, false, new VertexAttribute[] { new VertexAttribute(true, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, true, "s") });
    setMesh();
  }
  
  void applyAttachment() {
    if (this.body != null && !this.staticLight) {
      this.restorePosition.setToTranslation(this.bodyPosition);
      this.rotateAroundZero.setToRotationRad(this.bodyAngle + this.bodyAngleOffset);
      for (byte b = 0; b < this.rayNum; b++) {
        this.tmpVec.set(this.startX[b], this.startY[b]).mul(this.rotateAroundZero).mul(this.restorePosition);
        this.startX[b] = this.tmpVec.x;
        this.startY[b] = this.tmpVec.y;
        this.tmpVec.set(this.endX[b], this.endY[b]).mul(this.rotateAroundZero).mul(this.restorePosition);
        this.endX[b] = this.tmpVec.x;
        this.endY[b] = this.tmpVec.y;
      } 
    } 
  }
  
  public void attachToBody(Body paramBody) { attachToBody(paramBody, 0.0F); }
  
  public void attachToBody(Body paramBody, float paramFloat) {
    this.body = paramBody;
    this.bodyPosition.set(paramBody.getPosition());
    this.bodyAngleOffset = paramFloat * 0.017453292F;
    this.bodyAngle = paramBody.getAngle();
    applyAttachment();
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public boolean contains(float paramFloat1, float paramFloat2) { // Byte code:
    //   0: aload_0
    //   1: getfield chainLightBounds : Lcom/badlogic/gdx/math/Rectangle;
    //   4: fload_1
    //   5: fload_2
    //   6: invokevirtual contains : (FF)Z
    //   9: istore_3
    //   10: iconst_0
    //   11: istore #4
    //   13: iload_3
    //   14: ifne -> 19
    //   17: iconst_0
    //   18: ireturn
    //   19: ldc com/badlogic/gdx/utils/FloatArray
    //   21: invokestatic obtain : (Ljava/lang/Class;)Ljava/lang/Object;
    //   24: checkcast com/badlogic/gdx/utils/FloatArray
    //   27: astore #5
    //   29: aload #5
    //   31: invokevirtual clear : ()V
    //   34: iconst_0
    //   35: istore #6
    //   37: iload #6
    //   39: aload_0
    //   40: getfield rayNum : I
    //   43: if_icmpge -> 80
    //   46: aload #5
    //   48: iconst_2
    //   49: newarray float
    //   51: dup
    //   52: iconst_0
    //   53: aload_0
    //   54: getfield mx : [F
    //   57: iload #6
    //   59: faload
    //   60: fastore
    //   61: dup
    //   62: iconst_1
    //   63: aload_0
    //   64: getfield my : [F
    //   67: iload #6
    //   69: faload
    //   70: fastore
    //   71: invokevirtual addAll : ([F)V
    //   74: iinc #6, 1
    //   77: goto -> 37
    //   80: aload_0
    //   81: getfield rayNum : I
    //   84: iconst_1
    //   85: isub
    //   86: istore #6
    //   88: iload #6
    //   90: iconst_m1
    //   91: if_icmple -> 128
    //   94: aload #5
    //   96: iconst_2
    //   97: newarray float
    //   99: dup
    //   100: iconst_0
    //   101: aload_0
    //   102: getfield startX : [F
    //   105: iload #6
    //   107: faload
    //   108: fastore
    //   109: dup
    //   110: iconst_1
    //   111: aload_0
    //   112: getfield startY : [F
    //   115: iload #6
    //   117: faload
    //   118: fastore
    //   119: invokevirtual addAll : ([F)V
    //   122: iinc #6, -1
    //   125: goto -> 88
    //   128: iconst_0
    //   129: istore #7
    //   131: iconst_0
    //   132: istore #8
    //   134: iload #7
    //   136: aload #5
    //   138: getfield size : I
    //   141: if_icmpge -> 291
    //   144: aload #5
    //   146: getfield items : [F
    //   149: iload #7
    //   151: faload
    //   152: fstore #9
    //   154: aload #5
    //   156: getfield items : [F
    //   159: iload #7
    //   161: iconst_1
    //   162: iadd
    //   163: faload
    //   164: fstore #10
    //   166: aload #5
    //   168: getfield items : [F
    //   171: astore #11
    //   173: iload #7
    //   175: iconst_2
    //   176: iadd
    //   177: istore #12
    //   179: aload #11
    //   181: iload #12
    //   183: aload #5
    //   185: getfield size : I
    //   188: irem
    //   189: faload
    //   190: fstore #13
    //   192: aload #5
    //   194: getfield items : [F
    //   197: iload #7
    //   199: iconst_3
    //   200: iadd
    //   201: aload #5
    //   203: getfield size : I
    //   206: irem
    //   207: faload
    //   208: fstore #14
    //   210: fload #10
    //   212: fload_2
    //   213: fcmpg
    //   214: ifgt -> 224
    //   217: fload_2
    //   218: fload #14
    //   220: fcmpg
    //   221: iflt -> 246
    //   224: iload #8
    //   226: istore #6
    //   228: fload #14
    //   230: fload_2
    //   231: fcmpg
    //   232: ifgt -> 280
    //   235: iload #8
    //   237: istore #6
    //   239: fload_2
    //   240: fload #10
    //   242: fcmpg
    //   243: ifge -> 280
    //   246: iload #8
    //   248: istore #6
    //   250: fload_1
    //   251: fload #13
    //   253: fload #9
    //   255: fsub
    //   256: fload #14
    //   258: fload #10
    //   260: fsub
    //   261: fdiv
    //   262: fload_2
    //   263: fload #10
    //   265: fsub
    //   266: fmul
    //   267: fload #9
    //   269: fadd
    //   270: fcmpg
    //   271: ifge -> 280
    //   274: iload #8
    //   276: iconst_1
    //   277: iadd
    //   278: istore #6
    //   280: iload #12
    //   282: istore #7
    //   284: iload #6
    //   286: istore #8
    //   288: goto -> 134
    //   291: iload #8
    //   293: iconst_1
    //   294: iand
    //   295: iconst_1
    //   296: if_icmpne -> 302
    //   299: iconst_1
    //   300: istore #4
    //   302: aload #5
    //   304: invokestatic free : (Ljava/lang/Object;)V
    //   307: iload #4
    //   309: ireturn }
  
  protected boolean cull() {
    boolean bool = this.rayHandler.culling;
    boolean bool1 = false;
    if (!bool) {
      this.culled = false;
    } else {
      updateBoundingRects();
      bool = bool1;
      if (this.chainLightBounds.width > 0.0F) {
        bool = bool1;
        if (this.chainLightBounds.height > 0.0F) {
          bool = bool1;
          if (!this.chainLightBounds.overlaps(this.rayHandlerBounds))
            bool = true; 
        } 
      } 
      this.culled = bool;
    } 
    return this.culled;
  }
  
  public void debugRender(ShapeRenderer paramShapeRenderer) {
    paramShapeRenderer.setColor(Color.YELLOW);
    FloatArray floatArray = (FloatArray)Pools.obtain(FloatArray.class);
    floatArray.clear();
    int i;
    for (i = 0; i < this.rayNum; i++) {
      floatArray.addAll(new float[] { this.mx[i], this.my[i] });
    } 
    for (i = this.rayNum - 1; i > -1; i--) {
      floatArray.addAll(new float[] { this.startX[i], this.startY[i] });
    } 
    paramShapeRenderer.polygon(floatArray.shrink());
    Pools.free(floatArray);
  }
  
  public Body getBody() { return this.body; }
  
  public float getX() { return this.tmpPosition.x; }
  
  public float getY() { return this.tmpPosition.y; }
  
  void render() {
    if (this.rayHandler.culling && this.culled)
      return; 
    RayHandler rayHandler = this.rayHandler;
    rayHandler.lightRenderedLastFrame++;
    this.lightMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum);
    if (this.soft && !this.xray)
      this.softShadowMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum); 
  }
  
  @Deprecated
  public void setDirection(float paramFloat) {}
  
  public void setDistance(float paramFloat) {
    float f = paramFloat * RayHandler.gammaCorrectionParameter;
    paramFloat = f;
    if (f < 0.01F)
      paramFloat = 0.01F; 
    this.distance = paramFloat;
    this.dirty = true;
  }
  
  protected void setMesh() {
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b1 < this.rayNum; b2++) {
      float[] arrayOfFloat = this.segments;
      boolean bool1 = b2 + true;
      arrayOfFloat[b2] = this.startX[b1];
      arrayOfFloat = this.segments;
      b2 = bool1 + true;
      arrayOfFloat[bool1] = this.startY[b1];
      arrayOfFloat = this.segments;
      bool1 = b2 + true;
      arrayOfFloat[b2] = this.colorF;
      arrayOfFloat = this.segments;
      boolean bool2 = bool1 + true;
      arrayOfFloat[bool1] = 1.0F;
      arrayOfFloat = this.segments;
      b2 = bool2 + true;
      arrayOfFloat[bool2] = this.mx[b1];
      arrayOfFloat = this.segments;
      bool1 = b2 + true;
      arrayOfFloat[b2] = this.my[b1];
      arrayOfFloat = this.segments;
      b2 = bool1 + true;
      arrayOfFloat[bool1] = this.colorF;
      this.segments[b2] = 1.0F - this.f[b1];
      b1++;
    } 
    this.lightMesh.setVertices(this.segments, 0, b2);
    if (this.soft && !this.xray) {
      b1 = 0;
      for (b2 = 0; b1 < this.rayNum; b2 = b + 1) {
        float[] arrayOfFloat = this.segments;
        byte b = b2 + 1;
        arrayOfFloat[b2] = this.mx[b1];
        arrayOfFloat = this.segments;
        b2 = b + 1;
        arrayOfFloat[b] = this.my[b1];
        arrayOfFloat = this.segments;
        b = b2 + 1;
        arrayOfFloat[b2] = this.colorF;
        float f = 1.0F - this.f[b1];
        arrayOfFloat = this.segments;
        b2 = b + 1;
        arrayOfFloat[b] = f;
        this.tmpPerp.set(this.mx[b1], this.my[b1]).sub(this.startX[b1], this.startY[b1]).nor().scl(this.softShadowLength * f).add(this.mx[b1], this.my[b1]);
        arrayOfFloat = this.segments;
        b = b2 + 1;
        arrayOfFloat[b2] = this.tmpPerp.x;
        arrayOfFloat = this.segments;
        b2 = b + 1;
        arrayOfFloat[b] = this.tmpPerp.y;
        arrayOfFloat = this.segments;
        b = b2 + 1;
        arrayOfFloat[b2] = zeroColorBits;
        this.segments[b] = 0.0F;
        b1++;
      } 
      this.softShadowMesh.setVertices(this.segments, 0, b2);
    } 
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    this.tmpPosition.x = paramFloat1;
    this.tmpPosition.y = paramFloat2;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public void setPosition(Vector2 paramVector2) {
    this.tmpPosition.x = paramVector2.x;
    this.tmpPosition.y = paramVector2.y;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  void update() {
    if (this.dirty) {
      updateChain();
      applyAttachment();
    } else {
      updateBody();
    } 
    if (cull())
      return; 
    if (this.staticLight && !this.dirty)
      return; 
    this.dirty = false;
    updateMesh();
  }
  
  void updateBody() {
    if (this.body != null && !this.staticLight) {
      Vector2 vector2 = this.body.getPosition();
      this.tmpVec.set(0.0F, 0.0F).sub(this.bodyPosition);
      this.bodyPosition.set(vector2);
      this.zeroPosition.setToTranslation(this.tmpVec);
      this.restorePosition.setToTranslation(this.bodyPosition);
      this.rotateAroundZero.setToRotationRad(this.bodyAngle).inv().rotateRad(this.body.getAngle());
      this.bodyAngle = this.body.getAngle();
      for (byte b = 0; b < this.rayNum; b++) {
        this.tmpVec.set(this.startX[b], this.startY[b]).mul(this.zeroPosition).mul(this.rotateAroundZero).mul(this.restorePosition);
        this.startX[b] = this.tmpVec.x;
        this.startY[b] = this.tmpVec.y;
        this.tmpVec.set(this.endX[b], this.endY[b]).mul(this.zeroPosition).mul(this.rotateAroundZero).mul(this.restorePosition);
        this.endX[b] = this.tmpVec.x;
        this.endY[b] = this.tmpVec.y;
      } 
    } 
  }
  
  protected void updateBoundingRects() {
    float[] arrayOfFloat = this.startX;
    byte b = 0;
    float f1 = arrayOfFloat[0];
    float f2 = arrayOfFloat[0];
    arrayOfFloat = this.startY;
    float f3 = arrayOfFloat[0];
    float f4 = arrayOfFloat[0];
    while (b < this.rayNum) {
      arrayOfFloat = this.startX;
      if (f1 <= arrayOfFloat[b])
        f1 = arrayOfFloat[b]; 
      if (f1 <= this.mx[b])
        f1 = this.mx[b]; 
      arrayOfFloat = this.startX;
      if (f2 >= arrayOfFloat[b])
        f2 = arrayOfFloat[b]; 
      if (f2 >= this.mx[b])
        f2 = this.mx[b]; 
      arrayOfFloat = this.startY;
      if (f3 <= arrayOfFloat[b])
        f3 = arrayOfFloat[b]; 
      if (f3 <= this.my[b])
        f3 = this.my[b]; 
      arrayOfFloat = this.startY;
      if (f4 >= arrayOfFloat[b])
        f4 = arrayOfFloat[b]; 
      if (f4 >= this.my[b])
        f4 = this.my[b]; 
      b++;
    } 
    this.chainLightBounds.set(f2, f4, f1 - f2, f3 - f4);
    this.rayHandlerBounds.set(this.rayHandler.x1, this.rayHandler.y1, this.rayHandler.x2 - this.rayHandler.x1, this.rayHandler.y2 - this.rayHandler.y1);
  }
  
  public void updateChain() {
    Vector2 vector21 = (Vector2)Pools.obtain(Vector2.class);
    Vector2 vector22 = (Vector2)Pools.obtain(Vector2.class);
    Vector2 vector23 = (Vector2)Pools.obtain(Vector2.class);
    Vector2 vector24 = (Vector2)Pools.obtain(Vector2.class);
    Vector2 vector25 = (Vector2)Pools.obtain(Vector2.class);
    Spinor spinor1 = (Spinor)Pools.obtain(Spinor.class);
    Spinor spinor2 = (Spinor)Pools.obtain(Spinor.class);
    Spinor spinor3 = (Spinor)Pools.obtain(Spinor.class);
    Spinor spinor4 = (Spinor)Pools.obtain(Spinor.class);
    Spinor spinor5 = (Spinor)Pools.obtain(Spinor.class);
    Spinor spinor6 = (Spinor)Pools.obtain(Spinor.class);
    Spinor spinor7 = (Spinor)Pools.obtain(Spinor.class);
    int i = this.chain.size / 2 - 1;
    this.segmentAngles.clear();
    this.segmentLengths.clear();
    int j = 0;
    float f = 0.0F;
    int k = 0;
    while (j < this.chain.size - 2) {
      float[] arrayOfFloat = this.chain.items;
      byte b1 = j + 2;
      vector21.set(arrayOfFloat[b1], this.chain.items[j + 3]).sub(this.chain.items[j], this.chain.items[j + true]);
      this.segmentLengths.add(vector21.len());
      this.segmentAngles.add(vector21.rotate90(this.rayDirection).angle() * 0.017453292F);
      f += this.segmentLengths.items[k];
      k++;
      j = b1;
    } 
    j = this.rayNum;
    int m = 0;
    byte b = 0;
    k = i;
    for (i = m; i < k; i++) {
      if (i == 0) {
        f1 = this.segmentAngles.items[i];
      } else {
        f1 = this.segmentAngles.items[i - 1];
      } 
      spinor2.set(f1);
      spinor3.set(this.segmentAngles.items[i]);
      if (i == this.segmentAngles.size - 1) {
        f1 = this.segmentAngles.items[i];
      } else {
        f1 = this.segmentAngles.items[i + 1];
      } 
      spinor4.set(f1);
      Spinor spinor = spinor5.set(spinor2);
      spinor.slerp(spinor3, 0.5F);
      spinor6.set(spinor3).slerp(spinor4, 0.5F);
      m = i * 2;
      vector23.set(this.chain.items[m], this.chain.items[m + 1]);
      vector24.set(this.chain.items[m + 2], this.chain.items[m + 3]).sub(vector23).nor();
      float f2 = j;
      float f1 = f / f2;
      if (i == k - 1) {
        m = j;
      } else {
        m = (int)(this.segmentLengths.items[i] / f * f2);
      } 
      for (byte b1 = 0; b1 < m; b1++) {
        float f3 = b1 * f1;
        spinor7.set(spinor5).slerp(spinor6, f3 / this.segmentLengths.items[i]);
        f2 = spinor7.angle();
        vector25.set(this.rayStartOffset, 0.0F).rotateRad(f2);
        vector21.set(vector24).scl(f3).add(vector23).add(vector25);
        this.startX[b] = vector21.x;
        this.startY[b] = vector21.y;
        vector22.set(this.distance, 0.0F).rotateRad(f2).add(vector21);
        this.endX[b] = vector22.x;
        this.endY[b] = vector22.y;
        b++;
      } 
      j -= m;
      f -= this.segmentLengths.items[i];
    } 
    Pools.free(vector21);
    Pools.free(vector22);
    Pools.free(vector23);
    Pools.free(vector24);
    Pools.free(vector25);
    Pools.free(spinor2);
    Pools.free(spinor3);
    Pools.free(spinor4);
    Pools.free(spinor5);
    Pools.free(spinor6);
    Pools.free(spinor7);
    Pools.free(spinor1);
  }
  
  protected void updateMesh() {
    for (byte b = 0; b < this.rayNum; b++) {
      this.m_index = b;
      this.f[b] = 1.0F;
      this.tmpEnd.x = this.endX[b];
      this.mx[b] = this.tmpEnd.x;
      this.tmpEnd.y = this.endY[b];
      this.my[b] = this.tmpEnd.y;
      Vector2 vector2 = this.tmpStart;
      vector2.x = this.startX[b];
      vector2.y = this.startY[b];
      if (this.rayHandler.world != null && !this.xray)
        this.rayHandler.world.rayCast(this.ray, this.tmpStart, this.tmpEnd); 
    } 
    setMesh();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/ChainLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */