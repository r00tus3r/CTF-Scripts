package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.RayCastCallback;
import com.badlogic.gdx.utils.Disposable;

public abstract class Light implements Disposable {
  static final Color DefaultColor;
  
  static final int MIN_RAYS = 3;
  
  private static Filter globalFilterA;
  
  static final float zeroColorBits = (DefaultColor = new Color(0.75F, 0.75F, 0.5F, 0.75F)).toFloatBits(0.0F, 0.0F, 0.0F, 0.0F);
  
  protected boolean active = true;
  
  protected final Color color = new Color();
  
  protected float colorF;
  
  protected boolean culled = false;
  
  protected float direction;
  
  protected boolean dirty = true;
  
  protected float distance;
  
  protected float[] f;
  
  private Filter filterA = null;
  
  protected boolean ignoreBody = false;
  
  protected Mesh lightMesh;
  
  protected int m_index = 0;
  
  protected float[] mx;
  
  protected float[] my;
  
  final RayCastCallback ray = new RayCastCallback() {
      public final float reportRayFixture(Fixture param1Fixture, Vector2 param1Vector21, Vector2 param1Vector22, float param1Float) {
        if (globalFilterA != null && !Light.this.globalContactFilter(param1Fixture))
          return -1.0F; 
        if (Light.this.filterA != null && !Light.this.contactFilter(param1Fixture))
          return -1.0F; 
        if (Light.this.ignoreBody && param1Fixture.getBody() == Light.this.getBody())
          return -1.0F; 
        Light.this.mx[Light.this.m_index] = param1Vector21.x;
        Light.this.my[Light.this.m_index] = param1Vector21.y;
        Light.this.f[Light.this.m_index] = param1Float;
        return param1Float;
      }
    };
  
  protected RayHandler rayHandler;
  
  protected int rayNum;
  
  protected float[] segments;
  
  protected boolean soft = true;
  
  protected float softShadowLength = 2.5F;
  
  protected Mesh softShadowMesh;
  
  protected boolean staticLight = false;
  
  protected final Vector2 tmpPosition = new Vector2();
  
  protected int vertexNum;
  
  protected boolean xray = false;
  
  static  {
    globalFilterA = null;
  }
  
  public Light(RayHandler paramRayHandler, int paramInt, Color paramColor, float paramFloat1, float paramFloat2) {
    paramRayHandler.lightList.add(this);
    this.rayHandler = paramRayHandler;
    setRayNum(paramInt);
    setColor(paramColor);
    setDistance(paramFloat1);
    setDirection(paramFloat2);
  }
  
  public static void setGlobalContactFilter(Filter paramFilter) { globalFilterA = paramFilter; }
  
  public static void setGlobalContactFilter(short paramShort1, short paramShort2, short paramShort3) {
    globalFilterA = new Filter();
    Filter filter = globalFilterA;
    filter.categoryBits = (short)paramShort1;
    filter.groupIndex = (short)paramShort2;
    filter.maskBits = (short)paramShort3;
  }
  
  public void add(RayHandler paramRayHandler) {
    this.rayHandler = paramRayHandler;
    if (this.active) {
      paramRayHandler.lightList.add(this);
    } else {
      paramRayHandler.disabledLights.add(this);
    } 
  }
  
  public abstract void attachToBody(Body paramBody);
  
  boolean contactFilter(Fixture paramFixture) {
    Filter filter = paramFixture.getFilterData();
    short s = this.filterA.groupIndex;
    boolean bool = true;
    null = true;
    if (s != 0 && this.filterA.groupIndex == filter.groupIndex) {
      if (this.filterA.groupIndex <= 0)
        null = false; 
      return null;
    } 
    if ((this.filterA.maskBits & filter.categoryBits) != 0) {
      s = this.filterA.categoryBits;
      if ((filter.maskBits & s) != 0)
        return bool; 
    } 
    return false;
  }
  
  public boolean contains(float paramFloat1, float paramFloat2) { return false; }
  
  public void dispose() {
    this.lightMesh.dispose();
    this.softShadowMesh.dispose();
  }
  
  public abstract Body getBody();
  
  public Color getColor() { return this.color; }
  
  public float getDistance() { return this.distance / RayHandler.gammaCorrectionParameter; }
  
  public boolean getIgnoreAttachedBody() { return this.ignoreBody; }
  
  public Vector2 getPosition() { return this.tmpPosition; }
  
  public int getRayNum() { return this.rayNum; }
  
  public float getSoftShadowLength() { return this.softShadowLength; }
  
  public abstract float getX();
  
  public abstract float getY();
  
  boolean globalContactFilter(Fixture paramFixture) {
    Filter filter = paramFixture.getFilterData();
    short s = globalFilterA.groupIndex;
    boolean bool = true;
    null = true;
    if (s != 0 && globalFilterA.groupIndex == filter.groupIndex) {
      if (globalFilterA.groupIndex <= 0)
        null = false; 
      return null;
    } 
    if ((globalFilterA.maskBits & filter.categoryBits) != 0) {
      s = globalFilterA.categoryBits;
      if ((filter.maskBits & s) != 0)
        return bool; 
    } 
    return false;
  }
  
  public boolean isActive() { return this.active; }
  
  public boolean isSoft() { return this.soft; }
  
  public boolean isStaticLight() { return this.staticLight; }
  
  public boolean isXray() { return this.xray; }
  
  public void remove() { remove(true); }
  
  public void remove(boolean paramBoolean) {
    if (this.active) {
      this.rayHandler.lightList.removeValue(this, false);
    } else {
      this.rayHandler.disabledLights.removeValue(this, false);
    } 
    this.rayHandler = null;
    if (paramBoolean)
      dispose(); 
  }
  
  abstract void render();
  
  public void setActive(boolean paramBoolean) {
    if (paramBoolean == this.active)
      return; 
    this.active = paramBoolean;
    RayHandler rayHandler1 = this.rayHandler;
    if (rayHandler1 == null)
      return; 
    if (paramBoolean) {
      rayHandler1.lightList.add(this);
      this.rayHandler.disabledLights.removeValue(this, true);
    } else {
      rayHandler1.disabledLights.add(this);
      this.rayHandler.lightList.removeValue(this, true);
    } 
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.colorF = this.color.toFloatBits();
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public void setColor(Color paramColor) {
    if (paramColor != null) {
      this.color.set(paramColor);
    } else {
      this.color.set(DefaultColor);
    } 
    this.colorF = this.color.toFloatBits();
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public void setContactFilter(Filter paramFilter) { this.filterA = paramFilter; }
  
  public void setContactFilter(short paramShort1, short paramShort2, short paramShort3) {
    this.filterA = new Filter();
    Filter filter = this.filterA;
    filter.categoryBits = (short)paramShort1;
    filter.groupIndex = (short)paramShort2;
    filter.maskBits = (short)paramShort3;
  }
  
  public abstract void setDirection(float paramFloat);
  
  public abstract void setDistance(float paramFloat);
  
  public void setIgnoreAttachedBody(boolean paramBoolean) { this.ignoreBody = paramBoolean; }
  
  public abstract void setPosition(float paramFloat1, float paramFloat2);
  
  public abstract void setPosition(Vector2 paramVector2);
  
  void setRayNum(int paramInt) {
    int i = paramInt;
    if (paramInt < 3)
      i = 3; 
    this.rayNum = i;
    this.vertexNum = i + 1;
    paramInt = this.vertexNum;
    this.segments = new float[paramInt * 8];
    this.mx = new float[paramInt];
    this.my = new float[paramInt];
    this.f = new float[paramInt];
  }
  
  public void setSoft(boolean paramBoolean) {
    this.soft = paramBoolean;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public void setSoftnessLength(float paramFloat) {
    this.softShadowLength = paramFloat;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  public void setStaticLight(boolean paramBoolean) {
    this.staticLight = paramBoolean;
    if (paramBoolean)
      this.dirty = true; 
  }
  
  public void setXray(boolean paramBoolean) {
    this.xray = paramBoolean;
    if (this.staticLight)
      this.dirty = true; 
  }
  
  abstract void update();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/Light.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */