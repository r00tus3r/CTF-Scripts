package com.uwsoft.editor.renderer.physics;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.FixtureDef;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import com.badlogic.gdx.physics.box2d.World;
import com.uwsoft.editor.renderer.data.MeshVO;
import com.uwsoft.editor.renderer.data.PhysicsBodyDataVO;

public class PhysicsBodyLoader {
  public static float SCALE = 10.0F / Gdx.graphics.getWidth();
  
  private final World world;
  
  public PhysicsBodyLoader(World paramWorld) { this.world = paramWorld; }
  
  public static Body createBody(World paramWorld, PhysicsBodyDataVO paramPhysicsBodyDataVO, MeshVO paramMeshVO, Vector2 paramVector2) {
    FixtureDef fixtureDef = new FixtureDef();
    if (paramPhysicsBodyDataVO != null) {
      fixtureDef.density = paramPhysicsBodyDataVO.density;
      fixtureDef.friction = paramPhysicsBodyDataVO.friction;
      fixtureDef.restitution = paramPhysicsBodyDataVO.restitution;
    } 
    BodyDef bodyDef = new BodyDef();
    bodyDef.position.set(0.0F, 0.0F);
    if (paramPhysicsBodyDataVO.bodyType == 0) {
      bodyDef.type = BodyDef.BodyType.StaticBody;
    } else if (paramPhysicsBodyDataVO.bodyType == 1) {
      bodyDef.type = BodyDef.BodyType.KinematicBody;
    } else {
      bodyDef.type = BodyDef.BodyType.DynamicBody;
    } 
    Body body = paramWorld.createBody(bodyDef);
    PolygonShape polygonShape = new PolygonShape();
    for (byte b = 0; b < paramMeshVO.minPolygonData.length; b++) {
      float[] arrayOfFloat = new float[paramMeshVO.minPolygonData[b].length * 2];
      for (boolean bool = false; bool < arrayOfFloat.length; bool += true) {
        Vector2[] arrayOfVector2 = paramMeshVO.minPolygonData[b];
        byte b1 = bool / 2;
        arrayOfFloat[bool] = (arrayOfVector2[b1]).x * paramVector2.x * SCALE;
        arrayOfFloat[bool + true] = (paramMeshVO.minPolygonData[b][b1]).y * paramVector2.y * SCALE;
      } 
      polygonShape.set(arrayOfFloat);
      fixtureDef.shape = polygonShape;
      body.createFixture(fixtureDef);
    } 
    return body;
  }
  
  public Body createBody(PhysicsBodyDataVO paramPhysicsBodyDataVO, MeshVO paramMeshVO, Vector2 paramVector2) { return createBody(this.world, paramPhysicsBodyDataVO, paramMeshVO, paramVector2); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/physics/PhysicsBodyLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */