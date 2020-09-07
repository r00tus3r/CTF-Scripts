package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.joints.PulleyJoint;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public class Box2DDebugRenderer implements Disposable {
  private static Vector2 axis;
  
  private static final Array<Body> bodies;
  
  private static final Array<Joint> joints;
  
  private static final Vector2 lower;
  
  private static Vector2 t;
  
  private static final Vector2 upper;
  
  private static final Vector2[] vertices = new Vector2[1000];
  
  public final Color AABB_COLOR = new Color(1.0F, 0.0F, 1.0F, 1.0F);
  
  public final Color JOINT_COLOR = new Color(0.5F, 0.8F, 0.8F, 1.0F);
  
  public final Color SHAPE_AWAKE = new Color(0.9F, 0.7F, 0.7F, 1.0F);
  
  public final Color SHAPE_KINEMATIC = new Color(0.5F, 0.5F, 0.9F, 1.0F);
  
  public final Color SHAPE_NOT_ACTIVE = new Color(0.5F, 0.5F, 0.3F, 1.0F);
  
  public final Color SHAPE_NOT_AWAKE = new Color(0.6F, 0.6F, 0.6F, 1.0F);
  
  public final Color SHAPE_STATIC = new Color(0.5F, 0.9F, 0.5F, 1.0F);
  
  public final Color VELOCITY_COLOR = new Color(1.0F, 0.0F, 0.0F, 1.0F);
  
  private boolean drawAABBs;
  
  private boolean drawBodies;
  
  private boolean drawContacts;
  
  private boolean drawInactiveBodies;
  
  private boolean drawJoints;
  
  private boolean drawVelocities;
  
  private final Vector2 f = new Vector2();
  
  private final Vector2 lv = new Vector2();
  
  protected ShapeRenderer renderer = new ShapeRenderer();
  
  private final Vector2 v = new Vector2();
  
  static  {
    lower = new Vector2();
    upper = new Vector2();
    bodies = new Array();
    joints = new Array();
    t = new Vector2();
    axis = new Vector2();
  }
  
  public Box2DDebugRenderer() { this(true, true, false, true, false, true); }
  
  public Box2DDebugRenderer(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6) {
    byte b = 0;
    while (true) {
      Vector2[] arrayOfVector2 = vertices;
      if (b < arrayOfVector2.length) {
        arrayOfVector2[b] = new Vector2();
        b++;
        continue;
      } 
      break;
    } 
    this.drawBodies = paramBoolean1;
    this.drawJoints = paramBoolean2;
    this.drawAABBs = paramBoolean3;
    this.drawInactiveBodies = paramBoolean4;
    this.drawVelocities = paramBoolean5;
    this.drawContacts = paramBoolean6;
  }
  
  private void drawAABB(Fixture paramFixture, Transform paramTransform) {
    CircleShape circleShape;
    if (paramFixture.getType() == Shape.Type.Circle) {
      circleShape = (CircleShape)paramFixture.getShape();
      float f1 = circleShape.getRadius();
      vertices[0].set(circleShape.getPosition());
      paramTransform.mul(vertices[0]);
      lower.set((vertices[0]).x - f1, (vertices[0]).y - f1);
      upper.set((vertices[0]).x + f1, (vertices[0]).y + f1);
      vertices[0].set(lower.x, lower.y);
      vertices[1].set(upper.x, lower.y);
      vertices[2].set(upper.x, upper.y);
      vertices[3].set(lower.x, upper.y);
      drawSolidPolygon(vertices, 4, this.AABB_COLOR, true);
    } else if (circleShape.getType() == Shape.Type.Polygon) {
      PolygonShape polygonShape = (PolygonShape)circleShape.getShape();
      int i = polygonShape.getVertexCount();
      polygonShape.getVertex(0, vertices[0]);
      lower.set(paramTransform.mul(vertices[0]));
      upper.set(lower);
      for (byte b = 1; b < i; b++) {
        polygonShape.getVertex(b, vertices[b]);
        paramTransform.mul(vertices[b]);
        Vector2 vector2 = lower;
        vector2.x = Math.min(vector2.x, (vertices[b]).x);
        vector2 = lower;
        vector2.y = Math.min(vector2.y, (vertices[b]).y);
        vector2 = upper;
        vector2.x = Math.max(vector2.x, (vertices[b]).x);
        vector2 = upper;
        vector2.y = Math.max(vector2.y, (vertices[b]).y);
      } 
      vertices[0].set(lower.x, lower.y);
      vertices[1].set(upper.x, lower.y);
      vertices[2].set(upper.x, upper.y);
      vertices[3].set(lower.x, upper.y);
      drawSolidPolygon(vertices, 4, this.AABB_COLOR, true);
    } 
  }
  
  private void drawContact(Contact paramContact) {
    WorldManifold worldManifold = paramContact.getWorldManifold();
    if (worldManifold.getNumberOfContactPoints() == 0)
      return; 
    Vector2 vector2 = worldManifold.getPoints()[0];
    this.renderer.setColor(getColorByBody(paramContact.getFixtureA().getBody()));
    this.renderer.point(vector2.x, vector2.y, 0.0F);
  }
  
  private void drawJoint(Joint paramJoint) {
    Body body1 = paramJoint.getBodyA();
    Body body2 = paramJoint.getBodyB();
    Transform transform1 = body1.getTransform();
    Transform transform2 = body2.getTransform();
    Vector2 vector23 = transform1.getPosition();
    Vector2 vector24 = transform2.getPosition();
    Vector2 vector22 = paramJoint.getAnchorA();
    Vector2 vector21 = paramJoint.getAnchorB();
    if (paramJoint.getType() == JointDef.JointType.DistanceJoint) {
      drawSegment(vector22, vector21, this.JOINT_COLOR);
    } else {
      Vector2 vector26;
      Vector2 vector25;
      if (paramJoint.getType() == JointDef.JointType.PulleyJoint) {
        PulleyJoint pulleyJoint = (PulleyJoint)paramJoint;
        vector25 = pulleyJoint.getGroundAnchorA();
        vector26 = pulleyJoint.getGroundAnchorB();
        drawSegment(vector25, vector22, this.JOINT_COLOR);
        drawSegment(vector26, vector21, this.JOINT_COLOR);
        drawSegment(vector25, vector26, this.JOINT_COLOR);
      } else if (vector25.getType() == JointDef.JointType.MouseJoint) {
        drawSegment(vector25.getAnchorA(), vector25.getAnchorB(), this.JOINT_COLOR);
      } else {
        drawSegment(vector26, vector22, this.JOINT_COLOR);
        drawSegment(vector22, vector21, this.JOINT_COLOR);
        drawSegment(vector24, vector21, this.JOINT_COLOR);
      } 
    } 
  }
  
  private void drawSegment(Vector2 paramVector21, Vector2 paramVector22, Color paramColor) {
    this.renderer.setColor(paramColor);
    this.renderer.line(paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y);
  }
  
  private void drawShape(Fixture paramFixture, Transform paramTransform, Color paramColor) {
    PolygonShape polygonShape;
    if (paramFixture.getType() == Shape.Type.Circle) {
      polygonShape = (CircleShape)paramFixture.getShape();
      t.set(polygonShape.getPosition());
      paramTransform.mul(t);
      drawSolidCircle(t, polygonShape.getRadius(), axis.set(paramTransform.vals[2], paramTransform.vals[3]), paramColor);
      return;
    } 
    Shape.Type type1 = polygonShape.getType();
    Shape.Type type2 = Shape.Type.Edge;
    byte b = 0;
    if (type1 == type2) {
      polygonShape = (EdgeShape)polygonShape.getShape();
      polygonShape.getVertex1(vertices[0]);
      polygonShape.getVertex2(vertices[1]);
      paramTransform.mul(vertices[0]);
      paramTransform.mul(vertices[1]);
      drawSolidPolygon(vertices, 2, paramColor, true);
      return;
    } 
    if (polygonShape.getType() == Shape.Type.Polygon) {
      polygonShape = (PolygonShape)polygonShape.getShape();
      int i = polygonShape.getVertexCount();
      while (b < i) {
        polygonShape.getVertex(b, vertices[b]);
        paramTransform.mul(vertices[b]);
        b++;
      } 
      drawSolidPolygon(vertices, i, paramColor, true);
      return;
    } 
    if (polygonShape.getType() == Shape.Type.Chain) {
      ChainShape chainShape = (ChainShape)polygonShape.getShape();
      int i = chainShape.getVertexCount();
      for (b = 0; b < i; b++) {
        chainShape.getVertex(b, vertices[b]);
        paramTransform.mul(vertices[b]);
      } 
      drawSolidPolygon(vertices, i, paramColor, false);
    } 
  }
  
  private void drawSolidCircle(Vector2 paramVector21, float paramFloat, Vector2 paramVector22, Color paramColor) {
    this.renderer.setColor(paramColor.r, paramColor.g, paramColor.b, paramColor.a);
    float f1 = 0.0F;
    byte b = 0;
    while (b < 20) {
      Vector2 vector2 = this.v;
      double d = f1;
      vector2.set((float)Math.cos(d) * paramFloat + paramVector21.x, (float)Math.sin(d) * paramFloat + paramVector21.y);
      if (!b) {
        this.lv.set(this.v);
        this.f.set(this.v);
      } else {
        this.renderer.line(this.lv.x, this.lv.y, this.v.x, this.v.y);
        this.lv.set(this.v);
      } 
      b++;
      f1 += 0.31415927F;
    } 
    this.renderer.line(this.f.x, this.f.y, this.lv.x, this.lv.y);
    this.renderer.line(paramVector21.x, paramVector21.y, 0.0F, paramVector21.x + paramVector22.x * paramFloat, paramVector21.y + paramVector22.y * paramFloat, 0.0F);
  }
  
  private void drawSolidPolygon(Vector2[] paramArrayOfVector2, int paramInt, Color paramColor, boolean paramBoolean) {
    this.renderer.setColor(paramColor.r, paramColor.g, paramColor.b, paramColor.a);
    this.lv.set(paramArrayOfVector2[0]);
    this.f.set(paramArrayOfVector2[0]);
    for (byte b = 1; b < paramInt; b++) {
      Vector2 vector2 = paramArrayOfVector2[b];
      this.renderer.line(this.lv.x, this.lv.y, vector2.x, vector2.y);
      this.lv.set(vector2);
    } 
    if (paramBoolean)
      this.renderer.line(this.f.x, this.f.y, this.lv.x, this.lv.y); 
  }
  
  public static Vector2 getAxis() { return axis; }
  
  private Color getColorByBody(Body paramBody) { return !paramBody.isActive() ? this.SHAPE_NOT_ACTIVE : ((paramBody.getType() == BodyDef.BodyType.StaticBody) ? this.SHAPE_STATIC : ((paramBody.getType() == BodyDef.BodyType.KinematicBody) ? this.SHAPE_KINEMATIC : (!paramBody.isAwake() ? this.SHAPE_NOT_AWAKE : this.SHAPE_AWAKE))); }
  
  private void renderBodies(World paramWorld) {
    this.renderer.begin(ShapeRenderer.ShapeType.Line);
    if (this.drawBodies || this.drawAABBs) {
      paramWorld.getBodies(bodies);
      for (Body body : bodies) {
        if (body.isActive() || this.drawInactiveBodies)
          renderBody(body); 
      } 
    } 
    if (this.drawJoints) {
      paramWorld.getJoints(joints);
      Iterator iterator = joints.iterator();
      while (iterator.hasNext())
        drawJoint((Joint)iterator.next()); 
    } 
    this.renderer.end();
    if (this.drawContacts) {
      this.renderer.begin(ShapeRenderer.ShapeType.Point);
      Iterator iterator = paramWorld.getContactList().iterator();
      while (iterator.hasNext())
        drawContact((Contact)iterator.next()); 
      this.renderer.end();
    } 
  }
  
  public static void setAxis(Vector2 paramVector2) { axis = paramVector2; }
  
  public void dispose() { this.renderer.dispose(); }
  
  public boolean isDrawAABBs() { return this.drawAABBs; }
  
  public boolean isDrawBodies() { return this.drawBodies; }
  
  public boolean isDrawContacts() { return this.drawContacts; }
  
  public boolean isDrawInactiveBodies() { return this.drawInactiveBodies; }
  
  public boolean isDrawJoints() { return this.drawJoints; }
  
  public boolean isDrawVelocities() { return this.drawVelocities; }
  
  public void render(World paramWorld, Matrix4 paramMatrix4) {
    this.renderer.setProjectionMatrix(paramMatrix4);
    renderBodies(paramWorld);
  }
  
  protected void renderBody(Body paramBody) {
    Transform transform = paramBody.getTransform();
    for (Fixture fixture : paramBody.getFixtureList()) {
      if (this.drawBodies) {
        drawShape(fixture, transform, getColorByBody(paramBody));
        if (this.drawVelocities) {
          Vector2 vector2 = paramBody.getPosition();
          drawSegment(vector2, paramBody.getLinearVelocity().add(vector2), this.VELOCITY_COLOR);
        } 
      } 
      if (this.drawAABBs)
        drawAABB(fixture, transform); 
    } 
  }
  
  public void setDrawAABBs(boolean paramBoolean) { this.drawAABBs = paramBoolean; }
  
  public void setDrawBodies(boolean paramBoolean) { this.drawBodies = paramBoolean; }
  
  public void setDrawContacts(boolean paramBoolean) { this.drawContacts = paramBoolean; }
  
  public void setDrawInactiveBodies(boolean paramBoolean) { this.drawInactiveBodies = paramBoolean; }
  
  public void setDrawJoints(boolean paramBoolean) { this.drawJoints = paramBoolean; }
  
  public void setDrawVelocities(boolean paramBoolean) { this.drawVelocities = paramBoolean; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/Box2DDebugRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */