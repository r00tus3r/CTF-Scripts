package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Array;

public class Body {
  protected long addr;
  
  private Array<Fixture> fixtures = new Array(2);
  
  protected Array<JointEdge> joints = new Array(2);
  
  public final Vector2 linVelLoc = new Vector2();
  
  public final Vector2 linVelWorld = new Vector2();
  
  private final Vector2 linearVelocity = new Vector2();
  
  private final Vector2 localCenter = new Vector2();
  
  private final Vector2 localPoint = new Vector2();
  
  public final Vector2 localPoint2 = new Vector2();
  
  public final Vector2 localVector = new Vector2();
  
  private final MassData massData = new MassData();
  
  private final Vector2 position = new Vector2();
  
  private final float[] tmp = new float[4];
  
  private final Transform transform = new Transform();
  
  private Object userData;
  
  private final World world;
  
  private final Vector2 worldCenter = new Vector2();
  
  private final Vector2 worldVector = new Vector2();
  
  protected Body(World paramWorld, long paramLong) {
    this.world = paramWorld;
    this.addr = paramLong;
  }
  
  private native void jniApplyAngularImpulse(long paramLong, float paramFloat, boolean paramBoolean);
  
  private native void jniApplyForce(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, boolean paramBoolean);
  
  private native void jniApplyForceToCenter(long paramLong, float paramFloat1, float paramFloat2, boolean paramBoolean);
  
  private native void jniApplyLinearImpulse(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, boolean paramBoolean);
  
  private native void jniApplyTorque(long paramLong, float paramFloat, boolean paramBoolean);
  
  private native long jniCreateFixture(long paramLong1, long paramLong2, float paramFloat);
  
  private native long jniCreateFixture(long paramLong1, long paramLong2, float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, short paramShort1, short paramShort2, short paramShort3);
  
  private native float jniGetAngle(long paramLong);
  
  private native float jniGetAngularDamping(long paramLong);
  
  private native float jniGetAngularVelocity(long paramLong);
  
  private native float jniGetGravityScale(long paramLong);
  
  private native float jniGetInertia(long paramLong);
  
  private native float jniGetLinearDamping(long paramLong);
  
  private native void jniGetLinearVelocity(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLinearVelocityFromLocalPoint(long paramLong, float paramFloat1, float paramFloat2, float[] paramArrayOfFloat);
  
  private native void jniGetLinearVelocityFromWorldPoint(long paramLong, float paramFloat1, float paramFloat2, float[] paramArrayOfFloat);
  
  private native void jniGetLocalCenter(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetLocalPoint(long paramLong, float paramFloat1, float paramFloat2, float[] paramArrayOfFloat);
  
  private native void jniGetLocalVector(long paramLong, float paramFloat1, float paramFloat2, float[] paramArrayOfFloat);
  
  private native float jniGetMass(long paramLong);
  
  private native void jniGetMassData(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetPosition(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetTransform(long paramLong, float[] paramArrayOfFloat);
  
  private native int jniGetType(long paramLong);
  
  private native void jniGetWorldCenter(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniGetWorldPoint(long paramLong, float paramFloat1, float paramFloat2, float[] paramArrayOfFloat);
  
  private native void jniGetWorldVector(long paramLong, float paramFloat1, float paramFloat2, float[] paramArrayOfFloat);
  
  private native boolean jniIsActive(long paramLong);
  
  private native boolean jniIsAwake(long paramLong);
  
  private native boolean jniIsBullet(long paramLong);
  
  private native boolean jniIsFixedRotation(long paramLong);
  
  private native boolean jniIsSleepingAllowed(long paramLong);
  
  private native void jniResetMassData(long paramLong);
  
  private native void jniSetActive(long paramLong, boolean paramBoolean);
  
  private native void jniSetAngularDamping(long paramLong, float paramFloat);
  
  private native void jniSetAngularVelocity(long paramLong, float paramFloat);
  
  private native void jniSetAwake(long paramLong, boolean paramBoolean);
  
  private native void jniSetBullet(long paramLong, boolean paramBoolean);
  
  private native void jniSetFixedRotation(long paramLong, boolean paramBoolean);
  
  private native void jniSetGravityScale(long paramLong, float paramFloat);
  
  private native void jniSetLinearDamping(long paramLong, float paramFloat);
  
  private native void jniSetLinearVelocity(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetMassData(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  private native void jniSetSleepingAllowed(long paramLong, boolean paramBoolean);
  
  private native void jniSetTransform(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3);
  
  private native void jniSetType(long paramLong, int paramInt);
  
  public void applyAngularImpulse(float paramFloat, boolean paramBoolean) { jniApplyAngularImpulse(this.addr, paramFloat, paramBoolean); }
  
  public void applyForce(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, boolean paramBoolean) { jniApplyForce(this.addr, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramBoolean); }
  
  public void applyForce(Vector2 paramVector21, Vector2 paramVector22, boolean paramBoolean) { jniApplyForce(this.addr, paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y, paramBoolean); }
  
  public void applyForceToCenter(float paramFloat1, float paramFloat2, boolean paramBoolean) { jniApplyForceToCenter(this.addr, paramFloat1, paramFloat2, paramBoolean); }
  
  public void applyForceToCenter(Vector2 paramVector2, boolean paramBoolean) { jniApplyForceToCenter(this.addr, paramVector2.x, paramVector2.y, paramBoolean); }
  
  public void applyLinearImpulse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, boolean paramBoolean) { jniApplyLinearImpulse(this.addr, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramBoolean); }
  
  public void applyLinearImpulse(Vector2 paramVector21, Vector2 paramVector22, boolean paramBoolean) { jniApplyLinearImpulse(this.addr, paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y, paramBoolean); }
  
  public void applyTorque(float paramFloat, boolean paramBoolean) { jniApplyTorque(this.addr, paramFloat, paramBoolean); }
  
  public Fixture createFixture(FixtureDef paramFixtureDef) {
    long l = jniCreateFixture(this.addr, paramFixtureDef.shape.addr, paramFixtureDef.friction, paramFixtureDef.restitution, paramFixtureDef.density, paramFixtureDef.isSensor, paramFixtureDef.filter.categoryBits, paramFixtureDef.filter.maskBits, paramFixtureDef.filter.groupIndex);
    Fixture fixture = (Fixture)this.world.freeFixtures.obtain();
    fixture.reset(this, l);
    this.world.fixtures.put(fixture.addr, fixture);
    this.fixtures.add(fixture);
    return fixture;
  }
  
  public Fixture createFixture(Shape paramShape, float paramFloat) {
    long l = jniCreateFixture(this.addr, paramShape.addr, paramFloat);
    Fixture fixture = (Fixture)this.world.freeFixtures.obtain();
    fixture.reset(this, l);
    this.world.fixtures.put(fixture.addr, fixture);
    this.fixtures.add(fixture);
    return fixture;
  }
  
  public void destroyFixture(Fixture paramFixture) {
    this.world.destroyFixture(this, paramFixture);
    paramFixture.setUserData(null);
    this.world.fixtures.remove(paramFixture.addr);
    this.fixtures.removeValue(paramFixture, true);
    this.world.freeFixtures.free(paramFixture);
  }
  
  public float getAngle() { return jniGetAngle(this.addr); }
  
  public float getAngularDamping() { return jniGetAngularDamping(this.addr); }
  
  public float getAngularVelocity() { return jniGetAngularVelocity(this.addr); }
  
  public Array<Fixture> getFixtureList() { return this.fixtures; }
  
  public float getGravityScale() { return jniGetGravityScale(this.addr); }
  
  public float getInertia() { return jniGetInertia(this.addr); }
  
  public Array<JointEdge> getJointList() { return this.joints; }
  
  public float getLinearDamping() { return jniGetLinearDamping(this.addr); }
  
  public Vector2 getLinearVelocity() {
    jniGetLinearVelocity(this.addr, this.tmp);
    Vector2 vector2 = this.linearVelocity;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Vector2 getLinearVelocityFromLocalPoint(Vector2 paramVector2) {
    jniGetLinearVelocityFromLocalPoint(this.addr, paramVector2.x, paramVector2.y, this.tmp);
    Vector2 vector2 = this.linVelLoc;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Vector2 getLinearVelocityFromWorldPoint(Vector2 paramVector2) {
    jniGetLinearVelocityFromWorldPoint(this.addr, paramVector2.x, paramVector2.y, this.tmp);
    paramVector2 = this.linVelWorld;
    float[] arrayOfFloat = this.tmp;
    paramVector2.x = arrayOfFloat[0];
    paramVector2.y = arrayOfFloat[1];
    return paramVector2;
  }
  
  public Vector2 getLocalCenter() {
    jniGetLocalCenter(this.addr, this.tmp);
    Vector2 vector2 = this.localCenter;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Vector2 getLocalPoint(Vector2 paramVector2) {
    jniGetLocalPoint(this.addr, paramVector2.x, paramVector2.y, this.tmp);
    paramVector2 = this.localPoint2;
    float[] arrayOfFloat = this.tmp;
    paramVector2.x = arrayOfFloat[0];
    paramVector2.y = arrayOfFloat[1];
    return paramVector2;
  }
  
  public Vector2 getLocalVector(Vector2 paramVector2) {
    jniGetLocalVector(this.addr, paramVector2.x, paramVector2.y, this.tmp);
    paramVector2 = this.localVector;
    float[] arrayOfFloat = this.tmp;
    paramVector2.x = arrayOfFloat[0];
    paramVector2.y = arrayOfFloat[1];
    return paramVector2;
  }
  
  public float getMass() { return jniGetMass(this.addr); }
  
  public MassData getMassData() {
    jniGetMassData(this.addr, this.tmp);
    MassData massData1 = this.massData;
    massData1.mass = this.tmp[0];
    massData1.center.x = this.tmp[1];
    Vector2 vector2 = this.massData.center;
    float[] arrayOfFloat = this.tmp;
    vector2.y = arrayOfFloat[2];
    MassData massData2 = this.massData;
    massData2.I = arrayOfFloat[3];
    return massData2;
  }
  
  public Vector2 getPosition() {
    jniGetPosition(this.addr, this.tmp);
    Vector2 vector2 = this.position;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Transform getTransform() {
    jniGetTransform(this.addr, this.transform.vals);
    return this.transform;
  }
  
  public BodyDef.BodyType getType() {
    int i = jniGetType(this.addr);
    return (i == 0) ? BodyDef.BodyType.StaticBody : ((i == 1) ? BodyDef.BodyType.KinematicBody : ((i == 2) ? BodyDef.BodyType.DynamicBody : BodyDef.BodyType.StaticBody));
  }
  
  public Object getUserData() { return this.userData; }
  
  public World getWorld() { return this.world; }
  
  public Vector2 getWorldCenter() {
    jniGetWorldCenter(this.addr, this.tmp);
    Vector2 vector2 = this.worldCenter;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Vector2 getWorldPoint(Vector2 paramVector2) {
    jniGetWorldPoint(this.addr, paramVector2.x, paramVector2.y, this.tmp);
    Vector2 vector2 = this.localPoint;
    float[] arrayOfFloat = this.tmp;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public Vector2 getWorldVector(Vector2 paramVector2) {
    jniGetWorldVector(this.addr, paramVector2.x, paramVector2.y, this.tmp);
    paramVector2 = this.worldVector;
    float[] arrayOfFloat = this.tmp;
    paramVector2.x = arrayOfFloat[0];
    paramVector2.y = arrayOfFloat[1];
    return paramVector2;
  }
  
  public boolean isActive() { return jniIsActive(this.addr); }
  
  public boolean isAwake() { return jniIsAwake(this.addr); }
  
  public boolean isBullet() { return jniIsBullet(this.addr); }
  
  public boolean isFixedRotation() { return jniIsFixedRotation(this.addr); }
  
  public boolean isSleepingAllowed() { return jniIsSleepingAllowed(this.addr); }
  
  protected void reset(long paramLong) {
    this.addr = paramLong;
    this.userData = null;
    for (byte b = 0; b < this.fixtures.size; b++)
      this.world.freeFixtures.free(this.fixtures.get(b)); 
    this.fixtures.clear();
    this.joints.clear();
  }
  
  public void resetMassData() { jniResetMassData(this.addr); }
  
  public void setActive(boolean paramBoolean) {
    if (paramBoolean) {
      jniSetActive(this.addr, paramBoolean);
    } else {
      this.world.deactivateBody(this);
    } 
  }
  
  public void setAngularDamping(float paramFloat) { jniSetAngularDamping(this.addr, paramFloat); }
  
  public void setAngularVelocity(float paramFloat) { jniSetAngularVelocity(this.addr, paramFloat); }
  
  public void setAwake(boolean paramBoolean) { jniSetAwake(this.addr, paramBoolean); }
  
  public void setBullet(boolean paramBoolean) { jniSetBullet(this.addr, paramBoolean); }
  
  public void setFixedRotation(boolean paramBoolean) { jniSetFixedRotation(this.addr, paramBoolean); }
  
  public void setGravityScale(float paramFloat) { jniSetGravityScale(this.addr, paramFloat); }
  
  public void setLinearDamping(float paramFloat) { jniSetLinearDamping(this.addr, paramFloat); }
  
  public void setLinearVelocity(float paramFloat1, float paramFloat2) { jniSetLinearVelocity(this.addr, paramFloat1, paramFloat2); }
  
  public void setLinearVelocity(Vector2 paramVector2) { jniSetLinearVelocity(this.addr, paramVector2.x, paramVector2.y); }
  
  public void setMassData(MassData paramMassData) { jniSetMassData(this.addr, paramMassData.mass, paramMassData.center.x, paramMassData.center.y, paramMassData.I); }
  
  public void setSleepingAllowed(boolean paramBoolean) { jniSetSleepingAllowed(this.addr, paramBoolean); }
  
  public void setTransform(float paramFloat1, float paramFloat2, float paramFloat3) { jniSetTransform(this.addr, paramFloat1, paramFloat2, paramFloat3); }
  
  public void setTransform(Vector2 paramVector2, float paramFloat) { jniSetTransform(this.addr, paramVector2.x, paramVector2.y, paramFloat); }
  
  public void setType(BodyDef.BodyType paramBodyType) { jniSetType(this.addr, paramBodyType.getValue()); }
  
  public void setUserData(Object paramObject) { this.userData = paramObject; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Body.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */