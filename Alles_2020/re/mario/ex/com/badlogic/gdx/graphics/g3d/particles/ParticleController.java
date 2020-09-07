package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.emitters.Emitter;
import com.badlogic.gdx.graphics.g3d.particles.influencers.Influencer;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.util.Iterator;

public class ParticleController implements Json.Serializable, ResourceData.Configurable {
  protected static final float DEFAULT_TIME_STEP = 0.016666668F;
  
  protected BoundingBox boundingBox;
  
  public float deltaTime;
  
  public float deltaTimeSqr;
  
  public Emitter emitter;
  
  public Array<Influencer> influencers = new Array(true, 3, Influencer.class);
  
  public String name;
  
  public ParticleChannels particleChannels;
  
  public ParallelArray particles;
  
  public ParticleControllerRenderer<?, ?> renderer;
  
  public Vector3 scale = new Vector3(1.0F, 1.0F, 1.0F);
  
  public Matrix4 transform = new Matrix4();
  
  public ParticleController() { setTimeStep(0.016666668F); }
  
  public ParticleController(String paramString, Emitter paramEmitter, ParticleControllerRenderer<?, ?> paramParticleControllerRenderer, Influencer... paramVarArgs) {
    this();
    this.name = paramString;
    this.emitter = paramEmitter;
    this.renderer = paramParticleControllerRenderer;
    this.particleChannels = new ParticleChannels();
    this.influencers = new Array(paramVarArgs);
  }
  
  private <K extends Influencer> int findIndex(Class<K> paramClass) {
    for (byte b = 0; b < this.influencers.size; b++) {
      if (ClassReflection.isAssignableFrom(paramClass, ((Influencer)this.influencers.get(b)).getClass()))
        return b; 
    } 
    return -1;
  }
  
  private void setTimeStep(float paramFloat) {
    this.deltaTime = paramFloat;
    paramFloat = this.deltaTime;
    this.deltaTimeSqr = paramFloat * paramFloat;
  }
  
  public void activateParticles(int paramInt1, int paramInt2) {
    this.emitter.activateParticles(paramInt1, paramInt2);
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).activateParticles(paramInt1, paramInt2); 
  }
  
  protected void allocateChannels(int paramInt) {
    this.particles = new ParallelArray(paramInt);
    this.emitter.allocateChannels();
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).allocateChannels(); 
    this.renderer.allocateChannels();
  }
  
  protected void bind() {
    this.emitter.set(this);
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).set(this); 
    this.renderer.set(this);
  }
  
  protected void calculateBoundingBox() {
    this.boundingBox.clr();
    ParallelArray.FloatChannel floatChannel = (ParallelArray.FloatChannel)this.particles.getChannel(ParticleChannels.Position);
    int i = floatChannel.strideSize;
    int j = this.particles.size;
    int k;
    for (k = 0; k < i * j; k += floatChannel.strideSize)
      this.boundingBox.ext(floatChannel.data[k + false], floatChannel.data[k + true], floatChannel.data[k + 2]); 
  }
  
  public ParticleController copy() {
    Emitter emitter1 = (Emitter)this.emitter.copy();
    Influencer[] arrayOfInfluencer = new Influencer[this.influencers.size];
    Iterator iterator = this.influencers.iterator();
    for (byte b = 0; iterator.hasNext(); b++)
      arrayOfInfluencer[b] = (Influencer)((Influencer)iterator.next()).copy(); 
    return new ParticleController(new String(this.name), emitter1, (ParticleControllerRenderer)this.renderer.copy(), arrayOfInfluencer);
  }
  
  public void dispose() {
    this.emitter.dispose();
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).dispose(); 
  }
  
  public void draw() {
    if (this.particles.size > 0)
      this.renderer.update(); 
  }
  
  public void end() {
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).end(); 
    this.emitter.end();
  }
  
  public <K extends Influencer> K findInfluencer(Class<K> paramClass) {
    int i = findIndex(paramClass);
    if (i > -1) {
      Influencer influencer = (Influencer)this.influencers.get(i);
    } else {
      paramClass = null;
    } 
    return (K)paramClass;
  }
  
  public BoundingBox getBoundingBox() {
    if (this.boundingBox == null)
      this.boundingBox = new BoundingBox(); 
    calculateBoundingBox();
    return this.boundingBox;
  }
  
  public void getTransform(Matrix4 paramMatrix4) { paramMatrix4.set(this.transform); }
  
  public void init() {
    bind();
    if (this.particles != null) {
      end();
      this.particleChannels.resetIds();
    } 
    allocateChannels(this.emitter.maxParticleCount);
    this.emitter.init();
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).init(); 
    this.renderer.init();
  }
  
  public boolean isComplete() { return this.emitter.isComplete(); }
  
  public void killParticles(int paramInt1, int paramInt2) {
    this.emitter.killParticles(paramInt1, paramInt2);
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).killParticles(paramInt1, paramInt2); 
  }
  
  public void load(AssetManager paramAssetManager, ResourceData paramResourceData) {
    this.emitter.load(paramAssetManager, paramResourceData);
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).load(paramAssetManager, paramResourceData); 
    this.renderer.load(paramAssetManager, paramResourceData);
  }
  
  public void mul(Matrix4 paramMatrix4) {
    this.transform.mul(paramMatrix4);
    this.transform.getScale(this.scale);
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    this.name = (String)paramJson.readValue("name", String.class, paramJsonValue);
    this.emitter = (Emitter)paramJson.readValue("emitter", Emitter.class, paramJsonValue);
    this.influencers.addAll((Array)paramJson.readValue("influencers", Array.class, Influencer.class, paramJsonValue));
    this.renderer = (ParticleControllerRenderer)paramJson.readValue("renderer", ParticleControllerRenderer.class, paramJsonValue);
  }
  
  public <K extends Influencer> void removeInfluencer(Class<K> paramClass) {
    int i = findIndex(paramClass);
    if (i > -1)
      this.influencers.removeIndex(i); 
  }
  
  public <K extends Influencer> boolean replaceInfluencer(Class<K> paramClass, K paramK) {
    int i = findIndex(paramClass);
    if (i > -1) {
      this.influencers.insert(i, paramK);
      this.influencers.removeIndex(i + 1);
      return true;
    } 
    return false;
  }
  
  public void reset() {
    end();
    start();
  }
  
  public void rotate(Quaternion paramQuaternion) { this.transform.rotate(paramQuaternion); }
  
  public void rotate(Vector3 paramVector3, float paramFloat) { this.transform.rotate(paramVector3, paramFloat); }
  
  public void save(AssetManager paramAssetManager, ResourceData paramResourceData) {
    this.emitter.save(paramAssetManager, paramResourceData);
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).save(paramAssetManager, paramResourceData); 
    this.renderer.save(paramAssetManager, paramResourceData);
  }
  
  public void scale(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.transform.scale(paramFloat1, paramFloat2, paramFloat3);
    this.transform.getScale(this.scale);
  }
  
  public void scale(Vector3 paramVector3) { scale(paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public void setTransform(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) {
    this.transform.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat8, paramFloat8);
    this.scale.set(paramFloat8, paramFloat8, paramFloat8);
  }
  
  public void setTransform(Matrix4 paramMatrix4) {
    this.transform.set(paramMatrix4);
    paramMatrix4.getScale(this.scale);
  }
  
  public void setTranslation(Vector3 paramVector3) { this.transform.setTranslation(paramVector3); }
  
  public void start() {
    this.emitter.start();
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).start(); 
  }
  
  public void translate(Vector3 paramVector3) { this.transform.translate(paramVector3); }
  
  public void update() { update(Gdx.graphics.getDeltaTime()); }
  
  public void update(float paramFloat) {
    setTimeStep(paramFloat);
    this.emitter.update();
    Iterator iterator = this.influencers.iterator();
    while (iterator.hasNext())
      ((Influencer)iterator.next()).update(); 
  }
  
  public void write(Json paramJson) {
    paramJson.writeValue("name", this.name);
    paramJson.writeValue("emitter", this.emitter, Emitter.class);
    paramJson.writeValue("influencers", this.influencers, Array.class, Influencer.class);
    paramJson.writeValue("renderer", this.renderer, ParticleControllerRenderer.class);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */