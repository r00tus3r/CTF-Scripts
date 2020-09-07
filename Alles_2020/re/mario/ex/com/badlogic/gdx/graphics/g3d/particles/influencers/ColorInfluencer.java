package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.values.GradientColorValue;
import com.badlogic.gdx.graphics.g3d.particles.values.ScaledNumericValue;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class ColorInfluencer extends Influencer {
  ParallelArray.FloatChannel colorChannel;
  
  public void allocateChannels() { this.colorChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Color); }
  
  public static class Random extends ColorInfluencer {
    ParallelArray.FloatChannel colorChannel;
    
    public void activateParticles(int param1Int1, int param1Int2) {
      int i = param1Int1 * this.colorChannel.strideSize;
      int j = this.colorChannel.strideSize;
      for (param1Int1 = i; param1Int1 < param1Int2 * j + i; param1Int1 += this.colorChannel.strideSize) {
        this.colorChannel.data[param1Int1 + 0] = MathUtils.random();
        this.colorChannel.data[param1Int1 + 1] = MathUtils.random();
        this.colorChannel.data[param1Int1 + 2] = MathUtils.random();
        this.colorChannel.data[param1Int1 + 3] = MathUtils.random();
      } 
    }
    
    public void allocateChannels() { this.colorChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Color); }
    
    public Random copy() { return new Random(); }
  }
  
  public static class Single extends ColorInfluencer {
    ParallelArray.FloatChannel alphaInterpolationChannel;
    
    public ScaledNumericValue alphaValue = new ScaledNumericValue();
    
    public GradientColorValue colorValue = new GradientColorValue();
    
    ParallelArray.FloatChannel lifeChannel;
    
    public Single() { this.alphaValue.setHigh(1.0F); }
    
    public Single(Single param1Single) {
      this();
      set(param1Single);
    }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      int i = this.colorChannel.strideSize * param1Int1;
      int j = this.alphaInterpolationChannel.strideSize * param1Int1;
      int k = param1Int1 * this.lifeChannel.strideSize + 2;
      int m = this.colorChannel.strideSize;
      param1Int1 = i;
      while (param1Int1 < param1Int2 * m + i) {
        float f1 = this.alphaValue.newLowValue();
        float f2 = this.alphaValue.newHighValue() - f1;
        this.colorValue.getColor(0.0F, this.colorChannel.data, param1Int1);
        this.colorChannel.data[param1Int1 + 3] = this.alphaValue.getScale(this.lifeChannel.data[k]) * f2 + f1;
        this.alphaInterpolationChannel.data[j + 0] = f1;
        this.alphaInterpolationChannel.data[j + 1] = f2;
        param1Int1 += this.colorChannel.strideSize;
        j += this.alphaInterpolationChannel.strideSize;
        k += this.lifeChannel.strideSize;
      } 
    }
    
    public void allocateChannels() {
      super.allocateChannels();
      ParticleChannels.Interpolation.id = this.controller.particleChannels.newId();
      this.alphaInterpolationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Interpolation);
      this.lifeChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Life);
    }
    
    public Single copy() { return new Single(this); }
    
    public void read(Json param1Json, JsonValue param1JsonValue) {
      this.alphaValue = (ScaledNumericValue)param1Json.readValue("alpha", ScaledNumericValue.class, param1JsonValue);
      this.colorValue = (GradientColorValue)param1Json.readValue("color", GradientColorValue.class, param1JsonValue);
    }
    
    public void set(Single param1Single) {
      this.colorValue.load(param1Single.colorValue);
      this.alphaValue.load(param1Single.alphaValue);
    }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.colorChannel.strideSize;
      int k = 0;
      int m = 2;
      int n = 0;
      while (k < i * j + 0) {
        float f = this.lifeChannel.data[m];
        this.colorValue.getColor(f, this.colorChannel.data, k);
        this.colorChannel.data[k + 3] = this.alphaInterpolationChannel.data[n + false] + this.alphaInterpolationChannel.data[n + true] * this.alphaValue.getScale(f);
        k += this.colorChannel.strideSize;
        n += this.alphaInterpolationChannel.strideSize;
        m += this.lifeChannel.strideSize;
      } 
    }
    
    public void write(Json param1Json) {
      param1Json.writeValue("alpha", this.alphaValue);
      param1Json.writeValue("color", this.colorValue);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/ColorInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */