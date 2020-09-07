package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;

public abstract class PositionalLight extends Light {
  protected Body body;
  
  protected float bodyAngleOffset;
  
  protected float bodyOffsetX;
  
  protected float bodyOffsetY;
  
  protected float[] cos;
  
  protected float[] endX;
  
  protected float[] endY;
  
  protected float[] sin;
  
  protected final Vector2 start = new Vector2();
  
  protected final Vector2 tmpEnd = new Vector2();
  
  public PositionalLight(RayHandler paramRayHandler, int paramInt, Color paramColor, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    super(paramRayHandler, paramInt, paramColor, paramFloat1, paramFloat4);
    Vector2 vector2 = this.start;
    vector2.x = paramFloat2;
    vector2.y = paramFloat3;
    this.lightMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum, false, new VertexAttribute[] { new VertexAttribute(true, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, true, "s") });
    this.softShadowMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum * 2, false, new VertexAttribute[] { new VertexAttribute(true, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, true, "s") });
    setMesh();
  }
  
  public void attachToBody(Body paramBody) { attachToBody(paramBody, 0.0F, 0.0F, 0.0F); }
  
  public void attachToBody(Body paramBody, float paramFloat1, float paramFloat2) { attachToBody(paramBody, paramFloat1, paramFloat2, 0.0F); }
  
  public void attachToBody(Body paramBody, float paramFloat1, float paramFloat2, float paramFloat3) {
    this.body = paramBody;
    this.bodyOffsetX = paramFloat1;
    this.bodyOffsetY = paramFloat2;
    this.bodyAngleOffset = paramFloat3;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public boolean contains(float paramFloat1, float paramFloat2) { // Byte code:
    //   0: aload_0
    //   1: getfield start : Lcom/badlogic/gdx/math/Vector2;
    //   4: getfield x : F
    //   7: fload_1
    //   8: fsub
    //   9: fstore_3
    //   10: aload_0
    //   11: getfield start : Lcom/badlogic/gdx/math/Vector2;
    //   14: getfield y : F
    //   17: fload_2
    //   18: fsub
    //   19: fstore #4
    //   21: aload_0
    //   22: getfield distance : F
    //   25: fstore #5
    //   27: aload_0
    //   28: getfield distance : F
    //   31: fstore #6
    //   33: iconst_0
    //   34: istore #7
    //   36: fload #5
    //   38: fload #6
    //   40: fmul
    //   41: fload_3
    //   42: fload_3
    //   43: fmul
    //   44: fload #4
    //   46: fload #4
    //   48: fmul
    //   49: fadd
    //   50: fcmpg
    //   51: ifgt -> 56
    //   54: iconst_0
    //   55: ireturn
    //   56: aload_0
    //   57: getfield mx : [F
    //   60: astore #8
    //   62: aload_0
    //   63: getfield rayNum : I
    //   66: istore #9
    //   68: aload_0
    //   69: getfield start : Lcom/badlogic/gdx/math/Vector2;
    //   72: getfield x : F
    //   75: fstore #4
    //   77: aload #8
    //   79: iload #9
    //   81: fload #4
    //   83: fastore
    //   84: aload_0
    //   85: getfield my : [F
    //   88: astore #8
    //   90: aload_0
    //   91: getfield rayNum : I
    //   94: istore #9
    //   96: aload_0
    //   97: getfield start : Lcom/badlogic/gdx/math/Vector2;
    //   100: getfield y : F
    //   103: fstore_3
    //   104: aload #8
    //   106: iload #9
    //   108: fload_3
    //   109: fastore
    //   110: iconst_0
    //   111: istore #10
    //   113: iload #7
    //   115: aload_0
    //   116: getfield rayNum : I
    //   119: if_icmpgt -> 224
    //   122: aload_0
    //   123: getfield mx : [F
    //   126: iload #7
    //   128: faload
    //   129: fstore #5
    //   131: aload_0
    //   132: getfield my : [F
    //   135: iload #7
    //   137: faload
    //   138: fstore #6
    //   140: fload #6
    //   142: fload_2
    //   143: fcmpg
    //   144: ifge -> 153
    //   147: fload_3
    //   148: fload_2
    //   149: fcmpl
    //   150: ifge -> 174
    //   153: iload #10
    //   155: istore #11
    //   157: fload #6
    //   159: fload_2
    //   160: fcmpl
    //   161: iflt -> 207
    //   164: iload #10
    //   166: istore #11
    //   168: fload_3
    //   169: fload_2
    //   170: fcmpg
    //   171: ifge -> 207
    //   174: iload #10
    //   176: istore #11
    //   178: fload_2
    //   179: fload #6
    //   181: fsub
    //   182: fload_3
    //   183: fload #6
    //   185: fsub
    //   186: fdiv
    //   187: fload #4
    //   189: fload #5
    //   191: fsub
    //   192: fmul
    //   193: fload_1
    //   194: fload #5
    //   196: fsub
    //   197: fcmpg
    //   198: ifge -> 207
    //   201: iload #10
    //   203: iconst_1
    //   204: ixor
    //   205: istore #11
    //   207: iinc #7, 1
    //   210: fload #5
    //   212: fstore #4
    //   214: fload #6
    //   216: fstore_3
    //   217: iload #11
    //   219: istore #10
    //   221: goto -> 113
    //   224: iload #10
    //   226: ireturn }
  
  protected boolean cull() {
    boolean bool;
    if (this.rayHandler.culling && !this.rayHandler.intersect(this.start.x, this.start.y, this.distance + this.softShadowLength)) {
      bool = true;
    } else {
      bool = false;
    } 
    this.culled = bool;
    return this.culled;
  }
  
  public Body getBody() { return this.body; }
  
  public Vector2 getPosition() {
    this.tmpPosition.x = this.start.x;
    this.tmpPosition.y = this.start.y;
    return this.tmpPosition;
  }
  
  public float getX() { return this.start.x; }
  
  public float getY() { return this.start.y; }
  
  void render() {
    if (this.rayHandler.culling && this.culled)
      return; 
    RayHandler rayHandler = this.rayHandler;
    rayHandler.lightRenderedLastFrame++;
    this.lightMesh.render(this.rayHandler.lightShader, 6, 0, this.vertexNum);
    if (this.soft && !this.xray)
      this.softShadowMesh.render(this.rayHandler.lightShader, 5, 0, (this.vertexNum - 1) * 2); 
  }
  
  protected void setMesh() {
    this.segments[0] = this.start.x;
    this.segments[1] = this.start.y;
    this.segments[2] = this.colorF;
    this.segments[3] = 1.0F;
    byte b1 = 0;
    byte b2;
    for (b2 = 4; b1 < this.rayNum; b2 = b + 1) {
      float[] arrayOfFloat = this.segments;
      byte b = b2 + 1;
      arrayOfFloat[b2] = this.mx[b1];
      arrayOfFloat = this.segments;
      b2 = b + 1;
      arrayOfFloat[b] = this.my[b1];
      arrayOfFloat = this.segments;
      b = b2 + 1;
      arrayOfFloat[b2] = this.colorF;
      this.segments[b] = 1.0F - this.f[b1];
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
        arrayOfFloat = this.segments;
        b = b2 + 1;
        arrayOfFloat[b2] = this.mx[b1] + this.softShadowLength * f * this.cos[b1];
        arrayOfFloat = this.segments;
        b2 = b + 1;
        arrayOfFloat[b] = this.my[b1] + f * this.softShadowLength * this.sin[b1];
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
    Vector2 vector2 = this.start;
    vector2.x = paramFloat1;
    vector2.y = paramFloat2;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public void setPosition(Vector2 paramVector2) {
    this.start.x = paramVector2.x;
    this.start.y = paramVector2.y;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  protected void setRayNum(int paramInt) {
    super.setRayNum(paramInt);
    this.sin = new float[paramInt];
    this.cos = new float[paramInt];
    this.endX = new float[paramInt];
    this.endY = new float[paramInt];
  }
  
  void update() {
    updateBody();
    if (cull())
      return; 
    if (this.staticLight && !this.dirty)
      return; 
    this.dirty = false;
    updateMesh();
  }
  
  protected void updateBody() {
    if (this.body != null && !this.staticLight) {
      Vector2 vector2 = this.body.getPosition();
      float f1 = this.body.getAngle();
      float f2 = MathUtils.cos(f1);
      float f3 = MathUtils.sin(f1);
      float f4 = this.bodyOffsetX;
      float f5 = this.bodyOffsetY;
      vector2.x += f4 * f2 - f5 * f3;
      vector2.y += f4 * f3 + f5 * f2;
      setDirection(this.bodyAngleOffset + f1 * 57.295776F);
    } 
  }
  
  protected void updateMesh() {
    for (byte b = 0; b < this.rayNum; b++) {
      this.m_index = b;
      this.f[b] = 1.0F;
      this.tmpEnd.x = this.endX[b] + this.start.x;
      this.mx[b] = this.tmpEnd.x;
      this.tmpEnd.y = this.endY[b] + this.start.y;
      this.my[b] = this.tmpEnd.y;
      if (this.rayHandler.world != null && !this.xray)
        this.rayHandler.world.rayCast(this.ray, this.start, this.tmpEnd); 
    } 
    setMesh();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/PositionalLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */