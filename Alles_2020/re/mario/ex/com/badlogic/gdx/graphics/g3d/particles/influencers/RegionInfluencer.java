package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class RegionInfluencer extends Influencer {
  ParallelArray.FloatChannel regionChannel;
  
  public Array<AspectTextureRegion> regions;
  
  public RegionInfluencer() {
    this(1);
    AspectTextureRegion aspectTextureRegion = new AspectTextureRegion();
    aspectTextureRegion.v = 0.0F;
    aspectTextureRegion.u = 0.0F;
    aspectTextureRegion.v2 = 1.0F;
    aspectTextureRegion.u2 = 1.0F;
    aspectTextureRegion.halfInvAspectRatio = 0.5F;
    this.regions.add(aspectTextureRegion);
  }
  
  public RegionInfluencer(int paramInt) { this.regions = new Array(false, paramInt, AspectTextureRegion.class); }
  
  public RegionInfluencer(Texture paramTexture) { this(new TextureRegion[] { new TextureRegion(paramTexture) }); }
  
  public RegionInfluencer(RegionInfluencer paramRegionInfluencer) {
    this(paramRegionInfluencer.regions.size);
    this.regions.ensureCapacity(paramRegionInfluencer.regions.size);
    for (byte b = 0; b < paramRegionInfluencer.regions.size; b++)
      this.regions.add(new AspectTextureRegion((AspectTextureRegion)paramRegionInfluencer.regions.get(b))); 
  }
  
  public RegionInfluencer(TextureRegion... paramVarArgs) {
    this.regions = new Array(false, paramVarArgs.length, AspectTextureRegion.class);
    add(paramVarArgs);
  }
  
  public void add(TextureRegion... paramVarArgs) {
    this.regions.ensureCapacity(paramVarArgs.length);
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++) {
      TextureRegion textureRegion = paramVarArgs[b];
      this.regions.add(new AspectTextureRegion(textureRegion));
    } 
  }
  
  public void allocateChannels() { this.regionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.TextureRegion); }
  
  public void clear() { this.regions.clear(); }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    this.regions.clear();
    this.regions.addAll((Array)paramJson.readValue("regions", Array.class, AspectTextureRegion.class, paramJsonValue));
  }
  
  public void write(Json paramJson) { paramJson.writeValue("regions", this.regions, Array.class, AspectTextureRegion.class); }
  
  public static class Animated extends RegionInfluencer {
    ParallelArray.FloatChannel lifeChannel;
    
    public Animated() {}
    
    public Animated(Texture param1Texture) { super(param1Texture); }
    
    public Animated(TextureRegion param1TextureRegion) { super(new TextureRegion[] { param1TextureRegion }); }
    
    public Animated(Animated param1Animated) { super(param1Animated); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.lifeChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Life);
    }
    
    public Animated copy() { return new Animated(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.regionChannel.strideSize;
      int k = 2;
      int m = 0;
      while (m < i * j) {
        RegionInfluencer.AspectTextureRegion aspectTextureRegion = (RegionInfluencer.AspectTextureRegion)this.regions.get((int)(this.lifeChannel.data[k] * (this.regions.size - 1)));
        this.regionChannel.data[m + false] = aspectTextureRegion.u;
        this.regionChannel.data[m + true] = aspectTextureRegion.v;
        this.regionChannel.data[m + 2] = aspectTextureRegion.u2;
        this.regionChannel.data[m + 3] = aspectTextureRegion.v2;
        this.regionChannel.data[m + 4] = 0.5F;
        this.regionChannel.data[m + 5] = aspectTextureRegion.halfInvAspectRatio;
        m += this.regionChannel.strideSize;
        k += this.lifeChannel.strideSize;
      } 
    }
  }
  
  public static class AspectTextureRegion {
    public float halfInvAspectRatio;
    
    public float u;
    
    public float u2;
    
    public float v;
    
    public float v2;
    
    public AspectTextureRegion() {}
    
    public AspectTextureRegion(TextureRegion param1TextureRegion) { set(param1TextureRegion); }
    
    public AspectTextureRegion(AspectTextureRegion param1AspectTextureRegion) { set(param1AspectTextureRegion); }
    
    public void set(TextureRegion param1TextureRegion) {
      this.u = param1TextureRegion.getU();
      this.v = param1TextureRegion.getV();
      this.u2 = param1TextureRegion.getU2();
      this.v2 = param1TextureRegion.getV2();
      this.halfInvAspectRatio = param1TextureRegion.getRegionHeight() / param1TextureRegion.getRegionWidth() * 0.5F;
    }
    
    public void set(AspectTextureRegion param1AspectTextureRegion) {
      this.u = param1AspectTextureRegion.u;
      this.v = param1AspectTextureRegion.v;
      this.u2 = param1AspectTextureRegion.u2;
      this.v2 = param1AspectTextureRegion.v2;
      this.halfInvAspectRatio = param1AspectTextureRegion.halfInvAspectRatio;
    }
  }
  
  public static class Random extends RegionInfluencer {
    public Random() {}
    
    public Random(Texture param1Texture) { super(param1Texture); }
    
    public Random(TextureRegion param1TextureRegion) { super(new TextureRegion[] { param1TextureRegion }); }
    
    public Random(Random param1Random) { super(param1Random); }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      int i = param1Int1 * this.regionChannel.strideSize;
      int j = this.regionChannel.strideSize;
      for (param1Int1 = i; param1Int1 < param1Int2 * j + i; param1Int1 += this.regionChannel.strideSize) {
        RegionInfluencer.AspectTextureRegion aspectTextureRegion = (RegionInfluencer.AspectTextureRegion)this.regions.random();
        this.regionChannel.data[param1Int1 + 0] = aspectTextureRegion.u;
        this.regionChannel.data[param1Int1 + 1] = aspectTextureRegion.v;
        this.regionChannel.data[param1Int1 + 2] = aspectTextureRegion.u2;
        this.regionChannel.data[param1Int1 + 3] = aspectTextureRegion.v2;
        this.regionChannel.data[param1Int1 + 4] = 0.5F;
        this.regionChannel.data[param1Int1 + 5] = aspectTextureRegion.halfInvAspectRatio;
      } 
    }
    
    public Random copy() { return new Random(this); }
  }
  
  public static class Single extends RegionInfluencer {
    public Single() {}
    
    public Single(Texture param1Texture) { super(param1Texture); }
    
    public Single(TextureRegion param1TextureRegion) { super(new TextureRegion[] { param1TextureRegion }); }
    
    public Single(Single param1Single) { super(param1Single); }
    
    public Single copy() { return new Single(this); }
    
    public void init() {
      AspectTextureRegion[] arrayOfAspectTextureRegion = (AspectTextureRegion[])this.regions.items;
      int i = 0;
      AspectTextureRegion aspectTextureRegion = arrayOfAspectTextureRegion[0];
      int j = this.controller.emitter.maxParticleCount;
      int k = this.regionChannel.strideSize;
      while (i < j * k) {
        this.regionChannel.data[i + false] = aspectTextureRegion.u;
        this.regionChannel.data[i + true] = aspectTextureRegion.v;
        this.regionChannel.data[i + 2] = aspectTextureRegion.u2;
        this.regionChannel.data[i + 3] = aspectTextureRegion.v2;
        this.regionChannel.data[i + 4] = 0.5F;
        this.regionChannel.data[i + 5] = aspectTextureRegion.halfInvAspectRatio;
        i += this.regionChannel.strideSize;
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */