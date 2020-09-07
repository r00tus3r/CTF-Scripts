package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;

public class ScaleInfluencer extends SimpleInfluencer {
  public ScaleInfluencer() { this.valueChannelDescriptor = ParticleChannels.Scale; }
  
  public ScaleInfluencer(ScaleInfluencer paramScaleInfluencer) { super(paramScaleInfluencer); }
  
  public void activateParticles(int paramInt1, int paramInt2) {
    if (this.value.isRelative()) {
      int i = this.valueChannel.strideSize * paramInt1;
      int j = paramInt1 * this.interpolationChannel.strideSize;
      int k = this.valueChannel.strideSize;
      paramInt1 = i;
      while (paramInt1 < paramInt2 * k + i) {
        float f1 = this.value.newLowValue() * this.controller.scale.x;
        float f2 = this.value.newHighValue() * this.controller.scale.x;
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
        float f2 = this.value.newLowValue() * this.controller.scale.x;
        float f1 = this.value.newHighValue() * this.controller.scale.x - f2;
        this.interpolationChannel.data[j + 0] = f2;
        this.interpolationChannel.data[j + 1] = f1;
        this.valueChannel.data[paramInt1] = f2 + f1 * this.value.getScale(0.0F);
        paramInt1 += this.valueChannel.strideSize;
        j += this.interpolationChannel.strideSize;
      } 
    } 
  }
  
  public ParticleControllerComponent copy() { return new ScaleInfluencer(this); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/ScaleInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */