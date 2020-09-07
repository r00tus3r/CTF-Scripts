package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.joints.DistanceJoint;
import com.badlogic.gdx.physics.box2d.joints.DistanceJointDef;
import com.badlogic.gdx.physics.box2d.joints.FrictionJoint;
import com.badlogic.gdx.physics.box2d.joints.FrictionJointDef;
import com.badlogic.gdx.physics.box2d.joints.GearJoint;
import com.badlogic.gdx.physics.box2d.joints.GearJointDef;
import com.badlogic.gdx.physics.box2d.joints.MotorJoint;
import com.badlogic.gdx.physics.box2d.joints.MotorJointDef;
import com.badlogic.gdx.physics.box2d.joints.MouseJoint;
import com.badlogic.gdx.physics.box2d.joints.MouseJointDef;
import com.badlogic.gdx.physics.box2d.joints.PrismaticJoint;
import com.badlogic.gdx.physics.box2d.joints.PrismaticJointDef;
import com.badlogic.gdx.physics.box2d.joints.PulleyJoint;
import com.badlogic.gdx.physics.box2d.joints.PulleyJointDef;
import com.badlogic.gdx.physics.box2d.joints.RevoluteJoint;
import com.badlogic.gdx.physics.box2d.joints.RevoluteJointDef;
import com.badlogic.gdx.physics.box2d.joints.RopeJoint;
import com.badlogic.gdx.physics.box2d.joints.RopeJointDef;
import com.badlogic.gdx.physics.box2d.joints.WeldJoint;
import com.badlogic.gdx.physics.box2d.joints.WeldJointDef;
import com.badlogic.gdx.physics.box2d.joints.WheelJoint;
import com.badlogic.gdx.physics.box2d.joints.WheelJointDef;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.LongMap;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.SharedLibraryLoader;

public final class World implements Disposable {
  protected final long addr;
  
  protected final LongMap<Body> bodies = new LongMap(100);
  
  private final Contact contact = new Contact(this, 0L);
  
  private long[] contactAddrs = new long[200];
  
  protected ContactFilter contactFilter = null;
  
  protected ContactListener contactListener = null;
  
  private final Array<Contact> contacts = new Array();
  
  protected final LongMap<Fixture> fixtures = new LongMap(100);
  
  protected final Pool<Body> freeBodies = new Pool<Body>(100, 'È') {
      protected Body newObject() { return new Body(World.this, 0L); }
    };
  
  private final Array<Contact> freeContacts = new Array();
  
  protected final Pool<Fixture> freeFixtures = new Pool<Fixture>(100, 'È') {
      protected Fixture newObject() { return new Fixture(null, 0L); }
    };
  
  final Vector2 gravity = new Vector2();
  
  private final ContactImpulse impulse = new ContactImpulse(this, 0L);
  
  protected final LongMap<Joint> joints = new LongMap(100);
  
  private final Manifold manifold = new Manifold(0L);
  
  private QueryCallback queryCallback = null;
  
  private RayCastCallback rayCastCallback = null;
  
  private Vector2 rayNormal = new Vector2();
  
  private Vector2 rayPoint = new Vector2();
  
  final float[] tmpGravity = new float[2];
  
  static  {
    (new SharedLibraryLoader()).load("gdx-box2d");
  }
  
  public World(Vector2 paramVector2, boolean paramBoolean) {
    this.addr = newWorld(paramVector2.x, paramVector2.y, paramBoolean);
    this.contacts.ensureCapacity(this.contactAddrs.length);
    this.freeContacts.ensureCapacity(this.contactAddrs.length);
    for (byte b = 0; b < this.contactAddrs.length; b++)
      this.freeContacts.add(new Contact(this, 0L)); 
  }
  
  private void beginContact(long paramLong) {
    Contact contact1 = this.contact;
    contact1.addr = paramLong;
    ContactListener contactListener1 = this.contactListener;
    if (contactListener1 != null)
      contactListener1.beginContact(contact1); 
  }
  
  private boolean contactFilter(long paramLong1, long paramLong2) {
    ContactFilter contactFilter1 = this.contactFilter;
    if (contactFilter1 != null)
      return contactFilter1.shouldCollide((Fixture)this.fixtures.get(paramLong1), (Fixture)this.fixtures.get(paramLong2)); 
    Filter filter2 = ((Fixture)this.fixtures.get(paramLong1)).getFilterData();
    Filter filter1 = ((Fixture)this.fixtures.get(paramLong2)).getFilterData();
    short s1 = filter2.groupIndex;
    short s2 = filter1.groupIndex;
    boolean bool = true;
    boolean bool1 = true;
    if (s1 == s2 && filter2.groupIndex != 0) {
      if (filter2.groupIndex <= 0)
        bool1 = false; 
      return bool1;
    } 
    if ((filter2.maskBits & filter1.categoryBits) != 0 && (filter2.categoryBits & filter1.maskBits) != 0) {
      bool1 = bool;
    } else {
      bool1 = false;
    } 
    return bool1;
  }
  
  private long createProperJoint(JointDef paramJointDef) {
    WeldJointDef weldJointDef;
    if (paramJointDef.type == JointDef.JointType.DistanceJoint) {
      weldJointDef = (DistanceJointDef)paramJointDef;
      return jniCreateDistanceJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.length, weldJointDef.frequencyHz, weldJointDef.dampingRatio);
    } 
    if (weldJointDef.type == JointDef.JointType.FrictionJoint) {
      weldJointDef = (FrictionJointDef)weldJointDef;
      return jniCreateFrictionJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.maxForce, weldJointDef.maxTorque);
    } 
    if (weldJointDef.type == JointDef.JointType.GearJoint) {
      weldJointDef = (GearJointDef)weldJointDef;
      return jniCreateGearJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.joint1.addr, weldJointDef.joint2.addr, weldJointDef.ratio);
    } 
    if (weldJointDef.type == JointDef.JointType.MotorJoint) {
      weldJointDef = (MotorJointDef)weldJointDef;
      return jniCreateMotorJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.linearOffset.x, weldJointDef.linearOffset.y, weldJointDef.angularOffset, weldJointDef.maxForce, weldJointDef.maxTorque, weldJointDef.correctionFactor);
    } 
    if (weldJointDef.type == JointDef.JointType.MouseJoint) {
      weldJointDef = (MouseJointDef)weldJointDef;
      return jniCreateMouseJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.target.x, weldJointDef.target.y, weldJointDef.maxForce, weldJointDef.frequencyHz, weldJointDef.dampingRatio);
    } 
    if (weldJointDef.type == JointDef.JointType.PrismaticJoint) {
      weldJointDef = (PrismaticJointDef)weldJointDef;
      return jniCreatePrismaticJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.localAxisA.x, weldJointDef.localAxisA.y, weldJointDef.referenceAngle, weldJointDef.enableLimit, weldJointDef.lowerTranslation, weldJointDef.upperTranslation, weldJointDef.enableMotor, weldJointDef.maxMotorForce, weldJointDef.motorSpeed);
    } 
    if (weldJointDef.type == JointDef.JointType.PulleyJoint) {
      weldJointDef = (PulleyJointDef)weldJointDef;
      return jniCreatePulleyJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.groundAnchorA.x, weldJointDef.groundAnchorA.y, weldJointDef.groundAnchorB.x, weldJointDef.groundAnchorB.y, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.lengthA, weldJointDef.lengthB, weldJointDef.ratio);
    } 
    if (weldJointDef.type == JointDef.JointType.RevoluteJoint) {
      weldJointDef = (RevoluteJointDef)weldJointDef;
      return jniCreateRevoluteJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.referenceAngle, weldJointDef.enableLimit, weldJointDef.lowerAngle, weldJointDef.upperAngle, weldJointDef.enableMotor, weldJointDef.motorSpeed, weldJointDef.maxMotorTorque);
    } 
    if (weldJointDef.type == JointDef.JointType.RopeJoint) {
      weldJointDef = (RopeJointDef)weldJointDef;
      return jniCreateRopeJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.maxLength);
    } 
    if (weldJointDef.type == JointDef.JointType.WeldJoint) {
      weldJointDef = (WeldJointDef)weldJointDef;
      return jniCreateWeldJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.referenceAngle, weldJointDef.frequencyHz, weldJointDef.dampingRatio);
    } 
    if (weldJointDef.type == JointDef.JointType.WheelJoint) {
      WheelJointDef wheelJointDef = (WheelJointDef)weldJointDef;
      return jniCreateWheelJoint(this.addr, wheelJointDef.bodyA.addr, wheelJointDef.bodyB.addr, wheelJointDef.collideConnected, wheelJointDef.localAnchorA.x, wheelJointDef.localAnchorA.y, wheelJointDef.localAnchorB.x, wheelJointDef.localAnchorB.y, wheelJointDef.localAxisA.x, wheelJointDef.localAxisA.y, wheelJointDef.enableMotor, wheelJointDef.maxMotorTorque, wheelJointDef.motorSpeed, wheelJointDef.frequencyHz, wheelJointDef.dampingRatio);
    } 
    return 0L;
  }
  
  private void endContact(long paramLong) {
    Contact contact1 = this.contact;
    contact1.addr = paramLong;
    ContactListener contactListener1 = this.contactListener;
    if (contactListener1 != null)
      contactListener1.endContact(contact1); 
  }
  
  public static native float getVelocityThreshold();
  
  private native void jniClearForces(long paramLong);
  
  private native long jniCreateBody(long paramLong, int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, float paramFloat9);
  
  private native long jniCreateDistanceJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7);
  
  private native long jniCreateFrictionJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6);
  
  private native long jniCreateGearJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, long paramLong4, long paramLong5, float paramFloat);
  
  private native long jniCreateMotorJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6);
  
  private native long jniCreateMouseJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5);
  
  private native long jniCreatePrismaticJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean1, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, boolean paramBoolean2, float paramFloat8, float paramFloat9, boolean paramBoolean3, float paramFloat10, float paramFloat11);
  
  private native long jniCreatePulleyJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11);
  
  private native long jniCreateRevoluteJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean1, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, boolean paramBoolean2, float paramFloat6, float paramFloat7, boolean paramBoolean3, float paramFloat8, float paramFloat9);
  
  private native long jniCreateRopeJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5);
  
  private native long jniCreateWeldJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7);
  
  private native long jniCreateWheelJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean1, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, boolean paramBoolean2, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10);
  
  private native void jniDeactivateBody(long paramLong1, long paramLong2);
  
  private native void jniDestroyBody(long paramLong1, long paramLong2);
  
  private native void jniDestroyFixture(long paramLong1, long paramLong2, long paramLong3);
  
  private native void jniDestroyJoint(long paramLong1, long paramLong2);
  
  private native void jniDispose(long paramLong);
  
  private native boolean jniGetAutoClearForces(long paramLong);
  
  private native int jniGetBodyCount(long paramLong);
  
  private native int jniGetContactCount(long paramLong);
  
  private native void jniGetContactList(long paramLong, long[] paramArrayOfLong);
  
  private native void jniGetGravity(long paramLong, float[] paramArrayOfFloat);
  
  private native int jniGetJointcount(long paramLong);
  
  private native int jniGetProxyCount(long paramLong);
  
  private native boolean jniIsLocked(long paramLong);
  
  private native void jniQueryAABB(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  private native void jniRayCast(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  private native void jniSetAutoClearForces(long paramLong, boolean paramBoolean);
  
  private native void jniSetContiousPhysics(long paramLong, boolean paramBoolean);
  
  private native void jniSetGravity(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetWarmStarting(long paramLong, boolean paramBoolean);
  
  private native void jniStep(long paramLong, float paramFloat, int paramInt1, int paramInt2);
  
  private native long newWorld(float paramFloat1, float paramFloat2, boolean paramBoolean);
  
  private void postSolve(long paramLong1, long paramLong2) {
    Contact contact1 = this.contact;
    contact1.addr = paramLong1;
    ContactImpulse contactImpulse = this.impulse;
    contactImpulse.addr = paramLong2;
    ContactListener contactListener1 = this.contactListener;
    if (contactListener1 != null)
      contactListener1.postSolve(contact1, contactImpulse); 
  }
  
  private void preSolve(long paramLong1, long paramLong2) {
    Contact contact1 = this.contact;
    contact1.addr = paramLong1;
    Manifold manifold1 = this.manifold;
    manifold1.addr = paramLong2;
    ContactListener contactListener1 = this.contactListener;
    if (contactListener1 != null)
      contactListener1.preSolve(contact1, manifold1); 
  }
  
  private boolean reportFixture(long paramLong) {
    QueryCallback queryCallback1 = this.queryCallback;
    return (queryCallback1 != null) ? queryCallback1.reportFixture((Fixture)this.fixtures.get(paramLong)) : 0;
  }
  
  private float reportRayFixture(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    RayCastCallback rayCastCallback1 = this.rayCastCallback;
    if (rayCastCallback1 != null) {
      Vector2 vector2 = this.rayPoint;
      vector2.x = paramFloat1;
      vector2.y = paramFloat2;
      vector2 = this.rayNormal;
      vector2.x = paramFloat3;
      vector2.y = paramFloat4;
      return rayCastCallback1.reportRayFixture((Fixture)this.fixtures.get(paramLong), this.rayPoint, this.rayNormal, paramFloat5);
    } 
    return 0.0F;
  }
  
  private native void setUseDefaultContactFilter(boolean paramBoolean);
  
  public static native void setVelocityThreshold(float paramFloat);
  
  public void QueryAABB(QueryCallback paramQueryCallback, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.queryCallback = paramQueryCallback;
    jniQueryAABB(this.addr, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void clearForces() { jniClearForces(this.addr); }
  
  public Body createBody(BodyDef paramBodyDef) {
    long l = jniCreateBody(this.addr, paramBodyDef.type.getValue(), paramBodyDef.position.x, paramBodyDef.position.y, paramBodyDef.angle, paramBodyDef.linearVelocity.x, paramBodyDef.linearVelocity.y, paramBodyDef.angularVelocity, paramBodyDef.linearDamping, paramBodyDef.angularDamping, paramBodyDef.allowSleep, paramBodyDef.awake, paramBodyDef.fixedRotation, paramBodyDef.bullet, paramBodyDef.active, paramBodyDef.gravityScale);
    Body body = (Body)this.freeBodies.obtain();
    body.reset(l);
    this.bodies.put(body.addr, body);
    return body;
  }
  
  public Joint createJoint(JointDef paramJointDef) {
    WheelJoint wheelJoint;
    long l = createProperJoint(paramJointDef);
    if (paramJointDef.type == JointDef.JointType.DistanceJoint) {
      wheelJoint = new DistanceJoint(this, l);
    } else {
      wheelJoint = null;
    } 
    if (paramJointDef.type == JointDef.JointType.FrictionJoint)
      wheelJoint = new FrictionJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.GearJoint) {
      GearJointDef gearJointDef = (GearJointDef)paramJointDef;
      wheelJoint = new GearJoint(this, l, gearJointDef.joint1, gearJointDef.joint2);
    } 
    if (paramJointDef.type == JointDef.JointType.MotorJoint)
      wheelJoint = new MotorJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.MouseJoint)
      wheelJoint = new MouseJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.PrismaticJoint)
      wheelJoint = new PrismaticJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.PulleyJoint)
      wheelJoint = new PulleyJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.RevoluteJoint)
      wheelJoint = new RevoluteJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.RopeJoint)
      wheelJoint = new RopeJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.WeldJoint)
      wheelJoint = new WeldJoint(this, l); 
    if (paramJointDef.type == JointDef.JointType.WheelJoint)
      wheelJoint = new WheelJoint(this, l); 
    if (wheelJoint != null)
      this.joints.put(wheelJoint.addr, wheelJoint); 
    JointEdge jointEdge1 = new JointEdge(paramJointDef.bodyB, wheelJoint);
    JointEdge jointEdge2 = new JointEdge(paramJointDef.bodyA, wheelJoint);
    wheelJoint.jointEdgeA = jointEdge1;
    wheelJoint.jointEdgeB = jointEdge2;
    paramJointDef.bodyA.joints.add(jointEdge1);
    paramJointDef.bodyB.joints.add(jointEdge2);
    return wheelJoint;
  }
  
  void deactivateBody(Body paramBody) { jniDeactivateBody(this.addr, paramBody.addr); }
  
  public void destroyBody(Body paramBody) {
    Array array = paramBody.getJointList();
    while (array.size > 0)
      destroyJoint(((JointEdge)paramBody.getJointList().get(0)).joint); 
    jniDestroyBody(this.addr, paramBody.addr);
    paramBody.setUserData(null);
    this.bodies.remove(paramBody.addr);
    array = paramBody.getFixtureList();
    while (array.size > 0) {
      Fixture fixture = (Fixture)array.removeIndex(0);
      ((Fixture)this.fixtures.remove(fixture.addr)).setUserData(null);
      this.freeFixtures.free(fixture);
    } 
    this.freeBodies.free(paramBody);
  }
  
  void destroyFixture(Body paramBody, Fixture paramFixture) { jniDestroyFixture(this.addr, paramBody.addr, paramFixture.addr); }
  
  public void destroyJoint(Joint paramJoint) {
    paramJoint.setUserData(null);
    this.joints.remove(paramJoint.addr);
    paramJoint.jointEdgeA.other.joints.removeValue(paramJoint.jointEdgeB, true);
    paramJoint.jointEdgeB.other.joints.removeValue(paramJoint.jointEdgeA, true);
    jniDestroyJoint(this.addr, paramJoint.addr);
  }
  
  public void dispose() { jniDispose(this.addr); }
  
  public boolean getAutoClearForces() { return jniGetAutoClearForces(this.addr); }
  
  public void getBodies(Array<Body> paramArray) {
    paramArray.clear();
    paramArray.ensureCapacity(this.bodies.size);
    LongMap.Values values = this.bodies.values();
    while (values.hasNext())
      paramArray.add(values.next()); 
  }
  
  public int getBodyCount() { return jniGetBodyCount(this.addr); }
  
  public int getContactCount() { return jniGetContactCount(this.addr); }
  
  public Array<Contact> getContactList() {
    int i = getContactCount();
    if (i > this.contactAddrs.length) {
      int m = i * 2;
      this.contactAddrs = new long[m];
      this.contacts.ensureCapacity(m);
      this.freeContacts.ensureCapacity(m);
    } 
    int j = this.freeContacts.size;
    int k = 0;
    if (i > j) {
      int m = this.freeContacts.size;
      for (j = 0; j < i - m; j++)
        this.freeContacts.add(new Contact(this, 0L)); 
    } 
    jniGetContactList(this.addr, this.contactAddrs);
    this.contacts.clear();
    for (j = k; j < i; j++) {
      Contact contact1 = (Contact)this.freeContacts.get(j);
      contact1.addr = this.contactAddrs[j];
      this.contacts.add(contact1);
    } 
    return this.contacts;
  }
  
  public int getFixtureCount() { return this.fixtures.size; }
  
  public void getFixtures(Array<Fixture> paramArray) {
    paramArray.clear();
    paramArray.ensureCapacity(this.fixtures.size);
    LongMap.Values values = this.fixtures.values();
    while (values.hasNext())
      paramArray.add(values.next()); 
  }
  
  public Vector2 getGravity() {
    jniGetGravity(this.addr, this.tmpGravity);
    Vector2 vector2 = this.gravity;
    float[] arrayOfFloat = this.tmpGravity;
    vector2.x = arrayOfFloat[0];
    vector2.y = arrayOfFloat[1];
    return vector2;
  }
  
  public int getJointCount() { return jniGetJointcount(this.addr); }
  
  public void getJoints(Array<Joint> paramArray) {
    paramArray.clear();
    paramArray.ensureCapacity(this.joints.size);
    LongMap.Values values = this.joints.values();
    while (values.hasNext())
      paramArray.add(values.next()); 
  }
  
  public int getProxyCount() { return jniGetProxyCount(this.addr); }
  
  public boolean isLocked() { return jniIsLocked(this.addr); }
  
  public void rayCast(RayCastCallback paramRayCastCallback, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.rayCastCallback = paramRayCastCallback;
    jniRayCast(this.addr, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void rayCast(RayCastCallback paramRayCastCallback, Vector2 paramVector21, Vector2 paramVector22) { rayCast(paramRayCastCallback, paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y); }
  
  public void setAutoClearForces(boolean paramBoolean) { jniSetAutoClearForces(this.addr, paramBoolean); }
  
  public void setContactFilter(ContactFilter paramContactFilter) {
    boolean bool;
    this.contactFilter = paramContactFilter;
    if (paramContactFilter == null) {
      bool = true;
    } else {
      bool = false;
    } 
    setUseDefaultContactFilter(bool);
  }
  
  public void setContactListener(ContactListener paramContactListener) { this.contactListener = paramContactListener; }
  
  public void setContinuousPhysics(boolean paramBoolean) { jniSetContiousPhysics(this.addr, paramBoolean); }
  
  public void setDestructionListener(DestructionListener paramDestructionListener) {}
  
  public void setGravity(Vector2 paramVector2) { jniSetGravity(this.addr, paramVector2.x, paramVector2.y); }
  
  public void setWarmStarting(boolean paramBoolean) { jniSetWarmStarting(this.addr, paramBoolean); }
  
  public void step(float paramFloat, int paramInt1, int paramInt2) { jniStep(this.addr, paramFloat, paramInt1, paramInt2); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/World.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */