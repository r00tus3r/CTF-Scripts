package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public abstract class Joint {
  protected long addr;
  
  private final Vector2 anchorA = new Vector2();
  
  private final Vector2 anchorB = new Vector2();
  
  protected JointEdge jointEdgeA;
  
  protected JointEdge jointEdgeB;
  
  private final Vector2 reactionForce = new Vector2();
  
  private final float[] tmp = new float[2];
  
  private Object userData;
  
  private final World world;
  
  protected Joint(World paramWorld, long paramLong) {
    this.world = paramWorld;
    this.addr = paramLong;
  }
  
  private native void jniGetAnchorA(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetAnchorB(long paramLong, float[] paramArrayOfFloat);
  
  private native long jniGetBodyA(long paramLong);
  
  private native long jniGetBodyB(long paramLong);
  
  private native boolean jniGetCollideConnected(long paramLong);
  
  private native void jniGetReactionForce(long paramLong, float paramFloat, float[] paramArrayOfFloat);
  
  private native float jniGetReactionTorque(long paramLong, float paramFloat);
  
  private native int jniGetType(long paramLong);
  
  private native boolean jniIsActive(long paramLong);
  
  public Vector2 getAnchorA() {
    jniGetAnchorA(this.addr, this.tmp);
    Vector2 vector2 = this.anchorA;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Vector2 getAnchorB() {
    jniGetAnchorB(this.addr, this.tmp);
    Vector2 vector2 = this.anchorB;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Body getBodyA() { return (Body)this.world.bodies.get(jniGetBodyA(this.addr)); }
  
  public Body getBodyB() { return (Body)this.world.bodies.get(jniGetBodyB(this.addr)); }
  
  public boolean getCollideConnected() { return jniGetCollideConnected(this.addr); }
  
  public Vector2 getReactionForce(float paramFloat) {
    jniGetReactionForce(this.addr, paramFloat, this.tmp);
    Vector2 vector2 = this.reactionForce;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public float getReactionTorque(float paramFloat) { return jniGetReactionTorque(this.addr, paramFloat); }
  
  public JointDef.JointType getType() {
    int i = jniGetType(this.addr);
    return (i > 0 && i < JointDef.JointType.valueTypes.length) ? JointDef.JointType.valueTypes[i] : JointDef.JointType.Unknown;
  }
  
  public Object getUserData() { return this.userData; }
  
  public boolean isActive() { return jniIsActive(this.addr); }
  
  public void setUserData(Object paramObject) { this.userData = paramObject; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Joint.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */