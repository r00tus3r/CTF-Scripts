package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;

public class ParticleEffectPool extends Pool<ParticleEffectPool.PooledEffect> {
  private final ParticleEffect effect;
  
  public ParticleEffectPool(ParticleEffect paramParticleEffect, int paramInt1, int paramInt2) {
    super(paramInt1, paramInt2);
    this.effect = paramParticleEffect;
  }
  
  public void free(PooledEffect paramPooledEffect) {
    super.free(paramPooledEffect);
    byte b = 0;
    paramPooledEffect.reset(false);
    if (paramPooledEffect.xSizeScale != this.effect.xSizeScale || paramPooledEffect.ySizeScale != this.effect.ySizeScale || paramPooledEffect.motionScale != this.effect.motionScale) {
      Array array1 = paramPooledEffect.getEmitters();
      Array array2 = this.effect.getEmitters();
      while (b < array1.size) {
        ParticleEmitter particleEmitter1 = (ParticleEmitter)array1.get(b);
        ParticleEmitter particleEmitter2 = (ParticleEmitter)array2.get(b);
        particleEmitter1.matchSize(particleEmitter2);
        particleEmitter1.matchMotion(particleEmitter2);
        b++;
      } 
      paramPooledEffect.xSizeScale = this.effect.xSizeScale;
      paramPooledEffect.ySizeScale = this.effect.ySizeScale;
      paramPooledEffect.motionScale = this.effect.motionScale;
    } 
  }
  
  protected PooledEffect newObject() {
    PooledEffect pooledEffect = new PooledEffect(this.effect);
    pooledEffect.start();
    return pooledEffect;
  }
  
  public class PooledEffect extends ParticleEffect {
    PooledEffect(ParticleEffect param1ParticleEffect) { super(param1ParticleEffect); }
    
    public void free() { ParticleEffectPool.this.free(this); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/ParticleEffectPool.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */