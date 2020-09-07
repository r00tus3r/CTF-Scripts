package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Writer;
import java.util.Iterator;

public class ParticleEffect implements Disposable {
  private BoundingBox bounds;
  
  private final Array<ParticleEmitter> emitters = new Array(8);
  
  protected float motionScale = 1.0F;
  
  private boolean ownsTexture;
  
  protected float xSizeScale = 1.0F;
  
  protected float ySizeScale = 1.0F;
  
  public ParticleEffect() {}
  
  public ParticleEffect(ParticleEffect paramParticleEffect) {
    int i = paramParticleEffect.emitters.size;
    for (byte b = 0; b < i; b++)
      this.emitters.add(newEmitter((ParticleEmitter)paramParticleEffect.emitters.get(b))); 
  }
  
  public void allowCompletion() {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).allowCompletion(); 
  }
  
  public void dispose() {
    if (!this.ownsTexture)
      return; 
    byte b = 0;
    int i = this.emitters.size;
    while (b < i) {
      Iterator iterator = ((ParticleEmitter)this.emitters.get(b)).getSprites().iterator();
      while (iterator.hasNext())
        ((Sprite)iterator.next()).getTexture().dispose(); 
      b++;
    } 
  }
  
  public void draw(Batch paramBatch) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).draw(paramBatch); 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).draw(paramBatch, paramFloat); 
  }
  
  public ParticleEmitter findEmitter(String paramString) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++) {
      ParticleEmitter particleEmitter = (ParticleEmitter)this.emitters.get(b);
      if (particleEmitter.getName().equals(paramString))
        return particleEmitter; 
    } 
    return null;
  }
  
  public void flipY() {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).flipY(); 
  }
  
  public BoundingBox getBoundingBox() {
    if (this.bounds == null)
      this.bounds = new BoundingBox(); 
    BoundingBox boundingBox = this.bounds;
    boundingBox.inf();
    Iterator iterator = this.emitters.iterator();
    while (iterator.hasNext())
      boundingBox.ext(((ParticleEmitter)iterator.next()).getBoundingBox()); 
    return boundingBox;
  }
  
  public Array<ParticleEmitter> getEmitters() { return this.emitters; }
  
  public boolean isComplete() {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++) {
      if (!((ParticleEmitter)this.emitters.get(b)).isComplete())
        return false; 
    } 
    return true;
  }
  
  public void load(FileHandle paramFileHandle1, FileHandle paramFileHandle2) {
    loadEmitters(paramFileHandle1);
    loadEmitterImages(paramFileHandle2);
  }
  
  public void load(FileHandle paramFileHandle, TextureAtlas paramTextureAtlas) { load(paramFileHandle, paramTextureAtlas, null); }
  
  public void load(FileHandle paramFileHandle, TextureAtlas paramTextureAtlas, String paramString) {
    loadEmitters(paramFileHandle);
    loadEmitterImages(paramTextureAtlas, paramString);
  }
  
  public void loadEmitterImages(FileHandle paramFileHandle) {
    this.ownsTexture = true;
    ObjectMap objectMap = new ObjectMap(this.emitters.size);
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++) {
      ParticleEmitter particleEmitter = (ParticleEmitter)this.emitters.get(b);
      if ((particleEmitter.getImagePaths()).size != 0) {
        Array array = new Array();
        Iterator iterator = particleEmitter.getImagePaths().iterator();
        while (iterator.hasNext()) {
          String str = (new File(((String)iterator.next()).replace('\\', '/'))).getName();
          Sprite sprite1 = (Sprite)objectMap.get(str);
          Sprite sprite2 = sprite1;
          if (sprite1 == null) {
            sprite2 = new Sprite(loadTexture(paramFileHandle.child(str)));
            objectMap.put(str, sprite2);
          } 
          array.add(sprite2);
        } 
        particleEmitter.setSprites(array);
      } 
    } 
  }
  
  public void loadEmitterImages(TextureAtlas paramTextureAtlas) { loadEmitterImages(paramTextureAtlas, null); }
  
  public void loadEmitterImages(TextureAtlas paramTextureAtlas, String paramString) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++) {
      ParticleEmitter particleEmitter = (ParticleEmitter)this.emitters.get(b);
      if ((particleEmitter.getImagePaths()).size != 0) {
        Array array = new Array();
        Iterator iterator = particleEmitter.getImagePaths().iterator();
        while (iterator.hasNext()) {
          String str1 = (new File(((String)iterator.next()).replace('\\', '/'))).getName();
          int j = str1.lastIndexOf('.');
          String str2 = str1;
          if (j != -1)
            str2 = str1.substring(0, j); 
          str1 = str2;
          if (paramString != null) {
            StringBuilder stringBuilder1 = new StringBuilder();
            stringBuilder1.append(paramString);
            stringBuilder1.append(str2);
            str1 = stringBuilder1.toString();
          } 
          Sprite sprite = paramTextureAtlas.createSprite(str1);
          if (sprite != null) {
            array.add(sprite);
            continue;
          } 
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("SpriteSheet missing image: ");
          stringBuilder.append(str1);
          throw new IllegalArgumentException(stringBuilder.toString());
        } 
        particleEmitter.setSprites(array);
      } 
    } 
  }
  
  public void loadEmitters(FileHandle paramFileHandle) {
    InputStream inputStream = paramFileHandle.read();
    this.emitters.clear();
    GdxRuntimeException gdxRuntimeException = null;
    throwable = null;
    ParticleEmitter particleEmitter1 = throwable;
    try {
      particleEmitter2 = new BufferedReader();
      particleEmitter1 = throwable;
      InputStreamReader inputStreamReader = new InputStreamReader();
      particleEmitter1 = throwable;
      this(inputStream);
      particleEmitter1 = throwable;
      this(inputStreamReader, 512);
      try {
        String str;
        do {
          particleEmitter1 = newEmitter(particleEmitter2);
          this.emitters.add(particleEmitter1);
          str = particleEmitter2.readLine();
        } while (str != null);
        return;
      } catch (IOException throwable) {
      
      } finally {
        BufferedReader bufferedReader;
        paramFileHandle = null;
      } 
    } catch (IOException throwable) {
      particleEmitter2 = gdxRuntimeException;
    } finally {}
    particleEmitter1 = particleEmitter2;
    gdxRuntimeException = new GdxRuntimeException();
    particleEmitter1 = particleEmitter2;
    StringBuilder stringBuilder = new StringBuilder();
    particleEmitter1 = particleEmitter2;
    this();
    particleEmitter1 = particleEmitter2;
    stringBuilder.append("Error loading effect: ");
    particleEmitter1 = particleEmitter2;
    stringBuilder.append(paramFileHandle);
    particleEmitter1 = particleEmitter2;
    this(stringBuilder.toString(), throwable);
    particleEmitter1 = particleEmitter2;
    throw gdxRuntimeException;
  }
  
  protected Texture loadTexture(FileHandle paramFileHandle) { return new Texture(paramFileHandle, false); }
  
  protected ParticleEmitter newEmitter(ParticleEmitter paramParticleEmitter) { return new ParticleEmitter(paramParticleEmitter); }
  
  protected ParticleEmitter newEmitter(BufferedReader paramBufferedReader) throws IOException { return new ParticleEmitter(paramBufferedReader); }
  
  public void reset() { reset(true); }
  
  public void reset(boolean paramBoolean) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).reset(); 
    if (paramBoolean && (this.xSizeScale != 1.0F || this.ySizeScale != 1.0F || this.motionScale != 1.0F)) {
      scaleEffect(1.0F / this.xSizeScale, 1.0F / this.ySizeScale, 1.0F / this.motionScale);
      this.motionScale = 1.0F;
      this.ySizeScale = 1.0F;
      this.xSizeScale = 1.0F;
    } 
  }
  
  public void save(Writer paramWriter) throws IOException {
    int i = this.emitters.size;
    byte b1 = 0;
    for (byte b2 = 0; b1 < i; b2++) {
      ParticleEmitter particleEmitter = (ParticleEmitter)this.emitters.get(b1);
      if (b2)
        paramWriter.write("\n"); 
      particleEmitter.save(paramWriter);
      b1++;
    } 
  }
  
  public void scaleEffect(float paramFloat) { scaleEffect(paramFloat, paramFloat, paramFloat); }
  
  public void scaleEffect(float paramFloat1, float paramFloat2) { scaleEffect(paramFloat1, paramFloat1, paramFloat2); }
  
  public void scaleEffect(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.xSizeScale *= paramFloat1;
    this.ySizeScale *= paramFloat2;
    this.motionScale *= paramFloat3;
    for (ParticleEmitter particleEmitter : this.emitters) {
      particleEmitter.scaleSize(paramFloat1, paramFloat2);
      particleEmitter.scaleMotion(paramFloat3);
    } 
  }
  
  public void setDuration(int paramInt) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++) {
      ParticleEmitter particleEmitter = (ParticleEmitter)this.emitters.get(b);
      particleEmitter.setContinuous(false);
      particleEmitter.duration = paramInt;
      particleEmitter.durationTimer = 0.0F;
    } 
  }
  
  public void setEmittersCleanUpBlendFunction(boolean paramBoolean) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).setCleansUpBlendFunction(paramBoolean); 
  }
  
  public void setFlip(boolean paramBoolean1, boolean paramBoolean2) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).setFlip(paramBoolean1, paramBoolean2); 
  }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).setPosition(paramFloat1, paramFloat2); 
  }
  
  public void start() {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).start(); 
  }
  
  public void update(float paramFloat) {
    int i = this.emitters.size;
    for (byte b = 0; b < i; b++)
      ((ParticleEmitter)this.emitters.get(b)).update(paramFloat); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/ParticleEffect.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */