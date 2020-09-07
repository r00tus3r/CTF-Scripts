package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class Fixture {
  protected long addr;
  
  private Body body;
  
  private final Filter filter = new Filter();
  
  protected Shape shape;
  
  private final short[] tmp = new short[3];
  
  protected Object userData;
  
  protected Fixture(Body paramBody, long paramLong) {
    this.body = paramBody;
    this.addr = paramLong;
  }
  
  private native float jniGetDensity(long paramLong);
  
  private native void jniGetFilterData(long paramLong, short[] paramArrayOfShort);
  
  private native float jniGetFriction(long paramLong);
  
  private native float jniGetRestitution(long paramLong);
  
  private native long jniGetShape(long paramLong);
  
  private native int jniGetType(long paramLong);
  
  private native boolean jniIsSensor(long paramLong);
  
  private native void jniRefilter(long paramLong);
  
  private native void jniSetDensity(long paramLong, float paramFloat);
  
  private native void jniSetFilterData(long paramLong, short paramShort1, short paramShort2, short paramShort3);
  
  private native void jniSetFriction(long paramLong, float paramFloat);
  
  private native void jniSetRestitution(long paramLong, float paramFloat);
  
  private native void jniSetSensor(long paramLong, boolean paramBoolean);
  
  private native boolean jniTestPoint(long paramLong, float paramFloat1, float paramFloat2);
  
  public Body getBody() { return this.body; }
  
  public float getDensity() { return jniGetDensity(this.addr); }
  
  public Filter getFilterData() {
    jniGetFilterData(this.addr, this.tmp);
    Filter filter1 = this.filter;
    short[] arrayOfShort = this.tmp;
    filter1.maskBits = (short)arrayOfShort[0];
    filter1.categoryBits = (short)arrayOfShort[1];
    filter1.groupIndex = (short)arrayOfShort[2];
    return filter1;
  }
  
  public float getFriction() { return jniGetFriction(this.addr); }
  
  public float getRestitution() { return jniGetRestitution(this.addr); }
  
  public Shape getShape() {
    if (this.shape == null) {
      long l = jniGetShape(this.addr);
      if (l != 0L) {
        int i = Shape.jniGetType(l);
        if (i != 0) {
          if (i != 1) {
            if (i != 2) {
              if (i == 3) {
                this.shape = new ChainShape(l);
              } else {
                throw new GdxRuntimeException("Unknown shape type!");
              } 
            } else {
              this.shape = new PolygonShape(l);
            } 
          } else {
            this.shape = new EdgeShape(l);
          } 
        } else {
          this.shape = new CircleShape(l);
        } 
      } else {
        throw new GdxRuntimeException("Null shape address!");
      } 
    } 
    return this.shape;
  }
  
  public Shape.Type getType() {
    int i = jniGetType(this.addr);
    if (i != 0) {
      if (i != 1) {
        if (i != 2) {
          if (i == 3)
            return Shape.Type.Chain; 
          throw new GdxRuntimeException("Unknown shape type!");
        } 
        return Shape.Type.Polygon;
      } 
      return Shape.Type.Edge;
    } 
    return Shape.Type.Circle;
  }
  
  public Object getUserData() { return this.userData; }
  
  public boolean isSensor() { return jniIsSensor(this.addr); }
  
  public void refilter() { jniRefilter(this.addr); }
  
  protected void reset(Body paramBody, long paramLong) {
    this.body = paramBody;
    this.addr = paramLong;
    this.shape = null;
    this.userData = null;
  }
  
  public void setDensity(float paramFloat) { jniSetDensity(this.addr, paramFloat); }
  
  public void setFilterData(Filter paramFilter) { jniSetFilterData(this.addr, paramFilter.categoryBits, paramFilter.maskBits, paramFilter.groupIndex); }
  
  public void setFriction(float paramFloat) { jniSetFriction(this.addr, paramFloat); }
  
  public void setRestitution(float paramFloat) { jniSetRestitution(this.addr, paramFloat); }
  
  public void setSensor(boolean paramBoolean) { jniSetSensor(this.addr, paramBoolean); }
  
  public void setUserData(Object paramObject) { this.userData = paramObject; }
  
  public boolean testPoint(float paramFloat1, float paramFloat2) { return jniTestPoint(this.addr, paramFloat1, paramFloat2); }
  
  public boolean testPoint(Vector2 paramVector2) { return jniTestPoint(this.addr, paramVector2.x, paramVector2.y); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Fixture.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */