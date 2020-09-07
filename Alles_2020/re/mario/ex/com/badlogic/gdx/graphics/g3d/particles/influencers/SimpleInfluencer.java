package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.values.ScaledNumericValue;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class SimpleInfluencer extends Influencer {
  ParallelArray.FloatChannel interpolationChannel;
  
  ParallelArray.FloatChannel lifeChannel;
  
  public ScaledNumericValue value = new ScaledNumericValue();
  
  ParallelArray.FloatChannel valueChannel;
  
  ParallelArray.ChannelDescriptor valueChannelDescriptor;
  
  public SimpleInfluencer() { this.value.setHigh(1.0F); }
  
  public SimpleInfluencer(SimpleInfluencer paramSimpleInfluencer) {
    this();
    set(paramSimpleInfluencer);
  }
  
  private void set(SimpleInfluencer paramSimpleInfluencer) {
    this.value.load(paramSimpleInfluencer.value);
    this.valueChannelDescriptor = paramSimpleInfluencer.valueChannelDescriptor;
  }
  
  public void activateParticles(int paramInt1, int paramInt2) {
    if (!this.value.isRelative()) {
      int i = this.valueChannel.strideSize * paramInt1;
      int j = paramInt1 * this.interpolationChannel.strideSize;
      int k = this.valueChannel.strideSize;
      paramInt1 = i;
      while (paramInt1 < paramInt2 * k + i) {
        float f1 = this.value.newLowValue();
        float f2 = this.value.newHighValue() - f1;
        this.interpolationChannel.data[j + 0] = f1;
        this.interpolationChannel.data[j + 1] = f2;
        this.valueChannel.data[paramInt1] = f1 + f2 * this.value.getScale(0.0F);
        paramInt1 += this.valueChannel.strideSize;
        j += this.interpolationChannel.strideSize;
      } 
    } else {
      int i = this.valueChannel.strideSize * paramInt1;
      int j = paramInt1 * this.interpolationChannel.strideSize;
      int k = this.valueChannel.strideSize;
      paramInt1 = i;
      while (paramInt1 < paramInt2 * k + i) {
        float f1 = this.value.newLowValue();
        float f2 = this.value.newHighValue();
        this.interpolationChannel.data[j + 0] = f1;
        this.interpolationChannel.data[j + 1] = f2;
        this.valueChannel.data[paramInt1] = f1 + f2 * this.value.getScale(0.0F);
        paramInt1 += this.valueChannel.strideSize;
        j += this.interpolationChannel.strideSize;
      } 
    } 
  }
  
  public void allocateChannels() {
    this.valueChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(this.valueChannelDescriptor);
    ParticleChannels.Interpolation.id = this.controller.particleChannels.newId();
    this.interpolationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Interpolation);
    this.lifeChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Life);
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) { this.value = (ScaledNumericValue)paramJson.readValue("value", ScaledNumericValue.class, paramJsonValue); }
  
  public void update() {
    int i = this.controller.particles.size;
    int j = this.valueChannel.strideSize;
    int k = 0;
    int m = 0;
    int n;
    for (n = 2; k < i * j + 0; n += this.lifeChannel.strideSize) {
      this.valueChannel.data[k] = this.interpolationChannel.data[m + false] + this.interpolationChannel.data[m + true] * this.value.getScale(this.lifeChannel.data[n]);
      k += this.valueChannel.strideSize;
      m += this.interpolationChannel.strideSize;
    } 
  }
  
  public void write(Json paramJson) { paramJson.writeValue("value", this.value); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/SimpleInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */