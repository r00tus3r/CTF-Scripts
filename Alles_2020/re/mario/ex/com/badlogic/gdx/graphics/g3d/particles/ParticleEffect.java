package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public class ParticleEffect implements Disposable, ResourceData.Configurable {
  private BoundingBox bounds;
  
  private Array<ParticleController> controllers = new Array(true, 3, ParticleController.class);
  
  public ParticleEffect() {}
  
  public ParticleEffect(ParticleEffect paramParticleEffect) {
    int i = paramParticleEffect.controllers.size;
    for (byte b = 0; b < i; b++)
      this.controllers.add(((ParticleController)paramParticleEffect.controllers.get(b)).copy()); 
  }
  
  public ParticleEffect(ParticleController... paramVarArgs) {}
  
  public ParticleEffect copy() { return new ParticleEffect(this); }
  
  public void dispose() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).dispose(); 
  }
  
  public void draw() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).draw(); 
  }
  
  public void end() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).end(); 
  }
  
  public ParticleController findController(String paramString) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++) {
      ParticleController particleController = (ParticleController)this.controllers.get(b);
      if (particleController.name.equals(paramString))
        return particleController; 
    } 
    return null;
  }
  
  public BoundingBox getBoundingBox() {
    if (this.bounds == null)
      this.bounds = new BoundingBox(); 
    BoundingBox boundingBox = this.bounds;
    boundingBox.inf();
    Iterator iterator = this.controllers.iterator();
    while (iterator.hasNext())
      boundingBox.ext(((ParticleController)iterator.next()).getBoundingBox()); 
    return boundingBox;
  }
  
  public Array<ParticleController> getControllers() { return this.controllers; }
  
  public void init() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).init(); 
  }
  
  public boolean isComplete() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++) {
      if (!((ParticleController)this.controllers.get(b)).isComplete())
        return false; 
    } 
    return true;
  }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    Iterator iterator = this.controllers.iterator();
    while (iterator.hasNext())
      ((ParticleController)iterator.next()).load(paramAssetManager, paramResourceData); 
  }
  
  public void reset() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).reset(); 
  }
  
  public void rotate(Quaternion paramQuaternion) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).rotate(paramQuaternion); 
  }
  
  public void rotate(Vector3 paramVector3, float paramFloat) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).rotate(paramVector3, paramFloat); 
  }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {
    Iterator iterator = this.controllers.iterator();
    while (iterator.hasNext())
      ((ParticleController)iterator.next()).save(paramAssetManager, paramResourceData); 
  }
  
  public void scale(float paramFloat1, float paramFloat2, float paramFloat3) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).scale(paramFloat1, paramFloat2, paramFloat3); 
  }
  
  public void scale(Vector3 paramVector3) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).scale(paramVector3.x, paramVector3.y, paramVector3.z); 
  }
  
  public void setBatch(Array<ParticleBatch<?>> paramArray) {
    for (ParticleController particleController : this.controllers) {
      for (ParticleBatch particleBatch : paramArray) {
        if (particleController.renderer.setBatch(particleBatch))
          break; 
      } 
    } 
  }
  
  public void setTransform(Matrix4 paramMatrix4) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).setTransform(paramMatrix4); 
  }
  
  public void start() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).start(); 
  }
  
  public void translate(Vector3 paramVector3) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).translate(paramVector3); 
  }
  
  public void update() {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).update(); 
  }
  
  public void update(float paramFloat) {
    int i = this.controllers.size;
    for (byte b = 0; b < i; b++)
      ((ParticleController)this.controllers.get(b)).update(paramFloat); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleEffect.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */