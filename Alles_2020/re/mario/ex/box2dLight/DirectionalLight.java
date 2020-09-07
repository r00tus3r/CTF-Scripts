package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;

public class DirectionalLight extends Light {
  protected float cos;
  
  protected final Vector2[] end = new Vector2[this.rayNum];
  
  protected float sin;
  
  protected final Vector2[] start = new Vector2[this.rayNum];
  
  public DirectionalLight(RayHandler paramRayHandler, int paramInt, Color paramColor, float paramFloat) {
    super(paramRayHandler, paramInt, paramColor, Float.POSITIVE_INFINITY, paramFloat);
    for (paramInt = 0; paramInt < this.rayNum; paramInt++) {
      this.start[paramInt] = new Vector2();
      this.end[paramInt] = new Vector2();
    } 
    this.lightMesh = new Mesh(Mesh.VertexDataType.VertexArray, this.staticLight, this.vertexNum, false, new VertexAttribute[] { new VertexAttribute(true, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, true, "s") });
    this.softShadowMesh = new Mesh(Mesh.VertexDataType.VertexArray, this.staticLight, this.vertexNum, false, new VertexAttribute[] { new VertexAttribute(true, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, true, "s") });
    update();
  }
  
  @Deprecated
  public void attachToBody(Body paramBody) {}
  
  public boolean contains(float paramFloat1, float paramFloat2) { // Byte code:
    //   0: aload_0
    //   1: getfield mx : [F
    //   4: astore_3
    //   5: aload_0
    //   6: getfield rayNum : I
    //   9: istore #4
    //   11: aload_0
    //   12: getfield start : [Lcom/badlogic/gdx/math/Vector2;
    //   15: iconst_0
    //   16: aaload
    //   17: getfield x : F
    //   20: fstore #5
    //   22: aload_3
    //   23: iload #4
    //   25: fload #5
    //   27: fastore
    //   28: aload_0
    //   29: getfield my : [F
    //   32: astore_3
    //   33: aload_0
    //   34: getfield rayNum : I
    //   37: istore #4
    //   39: aload_0
    //   40: getfield start : [Lcom/badlogic/gdx/math/Vector2;
    //   43: iconst_0
    //   44: aaload
    //   45: getfield y : F
    //   48: fstore #6
    //   50: aload_3
    //   51: iload #4
    //   53: fload #6
    //   55: fastore
    //   56: iconst_0
    //   57: istore #4
    //   59: iconst_0
    //   60: istore #7
    //   62: iload #4
    //   64: aload_0
    //   65: getfield rayNum : I
    //   68: if_icmpgt -> 177
    //   71: aload_0
    //   72: getfield mx : [F
    //   75: iload #4
    //   77: faload
    //   78: fstore #8
    //   80: aload_0
    //   81: getfield my : [F
    //   84: iload #4
    //   86: faload
    //   87: fstore #9
    //   89: fload #9
    //   91: fload_2
    //   92: fcmpg
    //   93: ifge -> 103
    //   96: fload #6
    //   98: fload_2
    //   99: fcmpl
    //   100: ifge -> 125
    //   103: iload #7
    //   105: istore #10
    //   107: fload #9
    //   109: fload_2
    //   110: fcmpl
    //   111: iflt -> 159
    //   114: iload #7
    //   116: istore #10
    //   118: fload #6
    //   120: fload_2
    //   121: fcmpg
    //   122: ifge -> 159
    //   125: iload #7
    //   127: istore #10
    //   129: fload_2
    //   130: fload #9
    //   132: fsub
    //   133: fload #6
    //   135: fload #9
    //   137: fsub
    //   138: fdiv
    //   139: fload #5
    //   141: fload #8
    //   143: fsub
    //   144: fmul
    //   145: fload_1
    //   146: fload #8
    //   148: fsub
    //   149: fcmpg
    //   150: ifge -> 159
    //   153: iload #7
    //   155: iconst_1
    //   156: ixor
    //   157: istore #10
    //   159: iinc #4, 1
    //   162: fload #8
    //   164: fstore #5
    //   166: fload #9
    //   168: fstore #6
    //   170: iload #10
    //   172: istore #7
    //   174: goto -> 62
    //   177: iconst_0
    //   178: istore #4
    //   180: iload #7
    //   182: istore #10
    //   184: iload #4
    //   186: aload_0
    //   187: getfield rayNum : I
    //   190: if_icmpge -> 313
    //   193: aload_0
    //   194: getfield start : [Lcom/badlogic/gdx/math/Vector2;
    //   197: iload #4
    //   199: aaload
    //   200: getfield x : F
    //   203: fstore #8
    //   205: aload_0
    //   206: getfield start : [Lcom/badlogic/gdx/math/Vector2;
    //   209: iload #4
    //   211: aaload
    //   212: getfield y : F
    //   215: fstore #9
    //   217: fload #9
    //   219: fload_2
    //   220: fcmpg
    //   221: ifge -> 231
    //   224: fload #6
    //   226: fload_2
    //   227: fcmpl
    //   228: ifge -> 253
    //   231: iload #10
    //   233: istore #7
    //   235: fload #9
    //   237: fload_2
    //   238: fcmpl
    //   239: iflt -> 295
    //   242: iload #10
    //   244: istore #7
    //   246: fload #6
    //   248: fload_2
    //   249: fcmpg
    //   250: ifge -> 295
    //   253: iload #10
    //   255: istore #7
    //   257: fload_2
    //   258: fload #9
    //   260: fsub
    //   261: fload #6
    //   263: fload #9
    //   265: fsub
    //   266: fdiv
    //   267: fload #5
    //   269: fload #8
    //   271: fsub
    //   272: fmul
    //   273: fload_1
    //   274: fload #8
    //   276: fsub
    //   277: fcmpg
    //   278: ifge -> 295
    //   281: iload #10
    //   283: ifne -> 292
    //   286: iconst_1
    //   287: istore #7
    //   289: goto -> 295
    //   292: iconst_0
    //   293: istore #7
    //   295: iinc #4, 1
    //   298: fload #8
    //   300: fstore #5
    //   302: fload #9
    //   304: fstore #6
    //   306: iload #7
    //   308: istore #10
    //   310: goto -> 184
    //   313: iload #10
    //   315: ireturn }
  
  @Deprecated
  public Body getBody() { return null; }
  
  @Deprecated
  public boolean getIgnoreAttachedBody() { return false; }
  
  @Deprecated
  public float getX() { return 0.0F; }
  
  @Deprecated
  public float getY() { return 0.0F; }
  
  void render() {
    RayHandler rayHandler = this.rayHandler;
    rayHandler.lightRenderedLastFrame++;
    this.lightMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum);
    if (this.soft && !this.xray)
      this.softShadowMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum); 
  }
  
  public void setDirection(float paramFloat) {
    this.direction = paramFloat;
    this.sin = MathUtils.sinDeg(paramFloat);
    this.cos = MathUtils.cosDeg(paramFloat);
    if (this.staticLight)
      this.dirty = true; 
  }
  
  @Deprecated
  public void setDistance(float paramFloat) {}
  
  @Deprecated
  public void setIgnoreAttachedBody(boolean paramBoolean) {}
  
  @Deprecated
  public void setPosition(float paramFloat1, float paramFloat2) {}
  
  @Deprecated
  public void setPosition(Vector2 paramVector2) {}
  
  void update() {
    if (this.staticLight && !this.dirty)
      return; 
    this.dirty = false;
    float f1 = this.rayHandler.x2 - this.rayHandler.x1;
    float f2 = this.rayHandler.y2 - this.rayHandler.y1;
    if (f1 <= f2)
      f1 = f2; 
    float f3 = this.cos * f1;
    float f4 = this.sin * f1;
    float f5 = f3;
    f2 = f4;
    if (f3 * f3 < 0.1F) {
      f5 = f3;
      f2 = f4;
      if (f4 * f4 < 0.1F) {
        f5 = 1.0F;
        f2 = 1.0F;
      } 
    } 
    f3 = -this.sin * f1;
    float f6 = f1 * this.cos;
    float f7 = this.rayHandler.x1;
    f4 = this.rayHandler.x2;
    float f8 = this.rayHandler.y1;
    float f9 = this.rayHandler.y2;
    f1 = f3 * 2.0F / (this.rayNum - 1);
    f4 = MathUtils.floor(((f7 + f4) * 0.5F - f3) / f1 * 2.0F);
    f3 = f6 * 2.0F / (this.rayNum - 1);
    f8 = MathUtils.ceil(((f8 + f9) * 0.5F - f6) / f3 * 2.0F);
    byte b1;
    for (b1 = 0; b1 < this.rayNum; b1++) {
      f9 = b1;
      f6 = f9 * f1 + f4 * f1 * 2.0F;
      f9 = f9 * f3 + f8 * f3 * 2.0F;
      this.m_index = b1;
      Vector2[] arrayOfVector2 = this.start;
      (arrayOfVector2[b1]).x = f6 - f5;
      (arrayOfVector2[b1]).y = f9 - f2;
      float[] arrayOfFloat = this.mx;
      Vector2 vector2 = this.end[b1];
      f6 += f5;
      vector2.x = f6;
      arrayOfFloat[b1] = f6;
      arrayOfFloat = this.my;
      vector2 = this.end[b1];
      f9 += f2;
      vector2.y = f9;
      arrayOfFloat[b1] = f9;
      if (this.rayHandler.world != null && !this.xray)
        this.rayHandler.world.rayCast(this.ray, this.start[b1], this.end[b1]); 
    } 
    int i = this.rayNum;
    b1 = 0;
    byte b2;
    for (b2 = 0; b1 < i; b2++) {
      float[] arrayOfFloat = this.segments;
      boolean bool1 = b2 + true;
      arrayOfFloat[b2] = (this.start[b1]).x;
      arrayOfFloat = this.segments;
      boolean bool2 = bool1 + true;
      arrayOfFloat[bool1] = (this.start[b1]).y;
      arrayOfFloat = this.segments;
      b2 = bool2 + true;
      arrayOfFloat[bool2] = this.colorF;
      arrayOfFloat = this.segments;
      bool1 = b2 + true;
      arrayOfFloat[b2] = 1.0F;
      arrayOfFloat = this.segments;
      b2 = bool1 + true;
      arrayOfFloat[bool1] = this.mx[b1];
      arrayOfFloat = this.segments;
      bool1 = b2 + true;
      arrayOfFloat[b2] = this.my[b1];
      arrayOfFloat = this.segments;
      b2 = bool1 + true;
      arrayOfFloat[bool1] = this.colorF;
      this.segments[b2] = 1.0F;
      b1++;
    } 
    this.lightMesh.setVertices(this.segments, 0, b2);
    if (this.soft && !this.xray) {
      b1 = 0;
      for (b2 = 0; b1 < i; b2 = b3 + 1) {
        float[] arrayOfFloat = this.segments;
        byte b4 = b2 + 1;
        arrayOfFloat[b2] = this.mx[b1];
        arrayOfFloat = this.segments;
        byte b3 = b4 + 1;
        arrayOfFloat[b4] = this.my[b1];
        arrayOfFloat = this.segments;
        b2 = b3 + 1;
        arrayOfFloat[b3] = this.colorF;
        arrayOfFloat = this.segments;
        b4 = b2 + 1;
        arrayOfFloat[b2] = 1.0F;
        arrayOfFloat = this.segments;
        b3 = b4 + 1;
        arrayOfFloat[b4] = this.mx[b1] + this.softShadowLength * this.cos;
        arrayOfFloat = this.segments;
        b2 = b3 + 1;
        arrayOfFloat[b3] = this.my[b1] + this.softShadowLength * this.sin;
        arrayOfFloat = this.segments;
        b3 = b2 + 1;
        arrayOfFloat[b2] = zeroColorBits;
        this.segments[b3] = 1.0F;
        b1++;
      } 
      this.softShadowMesh.setVertices(this.segments, 0, b2);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/DirectionalLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */