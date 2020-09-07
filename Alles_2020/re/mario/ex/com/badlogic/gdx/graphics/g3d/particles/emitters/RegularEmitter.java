package com.badlogic.gdx.graphics.g3d.particles.emitters;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.values.RangedNumericValue;
import com.badlogic.gdx.graphics.g3d.particles.values.ScaledNumericValue;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class RegularEmitter extends Emitter implements Json.Serializable {
  private boolean continuous;
  
  protected float delay;
  
  protected float delayTimer;
  
  public RangedNumericValue delayValue = new RangedNumericValue();
  
  protected float duration;
  
  protected float durationTimer;
  
  public RangedNumericValue durationValue = new RangedNumericValue();
  
  protected int emission;
  
  protected int emissionDelta;
  
  protected int emissionDiff;
  
  private EmissionMode emissionMode;
  
  public ScaledNumericValue emissionValue = new ScaledNumericValue();
  
  protected int life;
  
  private ParallelArray.FloatChannel lifeChannel;
  
  protected int lifeDiff;
  
  protected int lifeOffset;
  
  protected int lifeOffsetDiff;
  
  public ScaledNumericValue lifeOffsetValue = new ScaledNumericValue();
  
  public ScaledNumericValue lifeValue = new ScaledNumericValue();
  
  public RegularEmitter() {
    this.durationValue.setActive(true);
    this.emissionValue.setActive(true);
    this.lifeValue.setActive(true);
    this.continuous = true;
    this.emissionMode = EmissionMode.Enabled;
  }
  
  public RegularEmitter(RegularEmitter paramRegularEmitter) {
    this();
    set(paramRegularEmitter);
  }
  
  private void addParticles(int paramInt) {
    paramInt = Math.min(paramInt, this.maxParticleCount - this.controller.particles.size);
    if (paramInt <= 0)
      return; 
    this.controller.activateParticles(this.controller.particles.size, paramInt);
    ParallelArray parallelArray = this.controller.particles;
    parallelArray.size += paramInt;
  }
  
  public void activateParticles(int paramInt1, int paramInt2) {
    int i = this.life + (int)(this.lifeDiff * this.lifeValue.getScale(this.percent));
    int j = (int)(this.lifeOffset + this.lifeOffsetDiff * this.lifeOffsetValue.getScale(this.percent));
    if (j > 0) {
      k = j;
      if (j >= i)
        k = i - 1; 
      k = i - k;
    } else {
      k = i;
    } 
    float f1 = k;
    float f2 = i;
    float f3 = f1 / f2;
    int k = paramInt1 * this.lifeChannel.strideSize;
    i = this.lifeChannel.strideSize;
    for (paramInt1 = k; paramInt1 < paramInt2 * i + k; paramInt1 += this.lifeChannel.strideSize) {
      this.lifeChannel.data[paramInt1 + 0] = f1;
      this.lifeChannel.data[paramInt1 + 1] = f2;
      this.lifeChannel.data[paramInt1 + 2] = 1.0F - f3;
    } 
  }
  
  public void allocateChannels() { this.lifeChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Life); }
  
  public ParticleControllerComponent copy() { return new RegularEmitter(this); }
  
  public RangedNumericValue getDelay() { return this.delayValue; }
  
  public RangedNumericValue getDuration() { return this.durationValue; }
  
  public ScaledNumericValue getEmission() { return this.emissionValue; }
  
  public EmissionMode getEmissionMode() { return this.emissionMode; }
  
  public ScaledNumericValue getLife() { return this.lifeValue; }
  
  public ScaledNumericValue getLifeOffset() { return this.lifeOffsetValue; }
  
  public float getPercentComplete() { return (this.delayTimer < this.delay) ? 0.0F : Math.min(1.0F, this.durationTimer / this.duration); }
  
  public void init() {
    super.init();
    this.emissionDelta = 0;
    this.durationTimer = this.duration;
  }
  
  public boolean isComplete() {
    float f1 = this.delayTimer;
    float f2 = this.delay;
    byte b = 0;
    if (f1 < f2)
      return false; 
    int i = b;
    if (this.durationTimer >= this.duration) {
      i = b;
      if (this.controller.particles.size == 0)
        i = 1; 
    } 
    return i;
  }
  
  public boolean isContinuous() { return this.continuous; }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.continuous = ((Boolean)paramJson.readValue("continous", boolean.class, paramJsonValue)).booleanValue();
    this.emissionValue = (ScaledNumericValue)paramJson.readValue("emission", ScaledNumericValue.class, paramJsonValue);
    this.delayValue = (RangedNumericValue)paramJson.readValue("delay", RangedNumericValue.class, paramJsonValue);
    this.durationValue = (RangedNumericValue)paramJson.readValue("duration", RangedNumericValue.class, paramJsonValue);
    this.lifeValue = (ScaledNumericValue)paramJson.readValue("life", ScaledNumericValue.class, paramJsonValue);
    this.lifeOffsetValue = (ScaledNumericValue)paramJson.readValue("lifeOffset", ScaledNumericValue.class, paramJsonValue);
  }
  
  public void set(RegularEmitter paramRegularEmitter) {
    set(paramRegularEmitter);
    this.delayValue.load(paramRegularEmitter.delayValue);
    this.durationValue.load(paramRegularEmitter.durationValue);
    this.lifeOffsetValue.load(paramRegularEmitter.lifeOffsetValue);
    this.lifeValue.load(paramRegularEmitter.lifeValue);
    this.emissionValue.load(paramRegularEmitter.emissionValue);
    this.emission = paramRegularEmitter.emission;
    this.emissionDiff = paramRegularEmitter.emissionDiff;
    this.emissionDelta = paramRegularEmitter.emissionDelta;
    this.lifeOffset = paramRegularEmitter.lifeOffset;
    this.lifeOffsetDiff = paramRegularEmitter.lifeOffsetDiff;
    this.life = paramRegularEmitter.life;
    this.lifeDiff = paramRegularEmitter.lifeDiff;
    this.duration = paramRegularEmitter.duration;
    this.delay = paramRegularEmitter.delay;
    this.durationTimer = paramRegularEmitter.durationTimer;
    this.delayTimer = paramRegularEmitter.delayTimer;
    this.continuous = paramRegularEmitter.continuous;
  }
  
  public void setContinuous(boolean paramBoolean) { this.continuous = paramBoolean; }
  
  public void setEmissionMode(EmissionMode paramEmissionMode) { this.emissionMode = paramEmissionMode; }
  
  public void start() {
    boolean bool;
    float f;
    if (this.delayValue.active) {
      f = this.delayValue.newLowValue();
    } else {
      f = 0.0F;
    } 
    this.delay = f;
    this.delayTimer = 0.0F;
    this.durationTimer = 0.0F;
    this.duration = this.durationValue.newLowValue();
    this.percent = this.durationTimer / this.duration;
    this.emission = (int)this.emissionValue.newLowValue();
    this.emissionDiff = (int)this.emissionValue.newHighValue();
    if (!this.emissionValue.isRelative())
      this.emissionDiff -= this.emission; 
    this.life = (int)this.lifeValue.newLowValue();
    this.lifeDiff = (int)this.lifeValue.newHighValue();
    if (!this.lifeValue.isRelative())
      this.lifeDiff -= this.life; 
    if (this.lifeOffsetValue.active) {
      bool = (int)this.lifeOffsetValue.newLowValue();
    } else {
      bool = false;
    } 
    this.lifeOffset = bool;
    this.lifeOffsetDiff = (int)this.lifeOffsetValue.newHighValue();
    if (!this.lifeOffsetValue.isRelative())
      this.lifeOffsetDiff -= this.lifeOffset; 
  }
  
  public void update() {
    float f1 = this.controller.deltaTime * 1000.0F;
    float f2 = this.delayTimer;
    float f3 = this.delay;
    int i = 0;
    if (f2 < f3) {
      this.delayTimer = f2 + f1;
    } else {
      int k;
      if (this.emissionMode != EmissionMode.Disabled) {
        k = 1;
      } else {
        k = 0;
      } 
      f2 = this.durationTimer;
      f3 = this.duration;
      if (f2 < f3) {
        this.durationTimer = f2 + f1;
        this.percent = this.durationTimer / f3;
      } else if (this.continuous && k && this.emissionMode == EmissionMode.Enabled) {
        this.controller.start();
      } else {
        k = 0;
      } 
      if (k) {
        this.emissionDelta = (int)(this.emissionDelta + f1);
        f2 = this.emission + this.emissionDiff * this.emissionValue.getScale(this.percent);
        if (f2 > 0.0F) {
          f2 = 1000.0F / f2;
          k = this.emissionDelta;
          if (k >= f2) {
            k = Math.min((int)(k / f2), this.maxParticleCount - this.controller.particles.size);
            this.emissionDelta = (int)(this.emissionDelta - k * f2);
            this.emissionDelta = (int)(this.emissionDelta % f2);
            addParticles(k);
          } 
        } 
        if (this.controller.particles.size < this.minParticleCount)
          addParticles(this.minParticleCount - this.controller.particles.size); 
      } 
    } 
    int j = this.controller.particles.size;
    byte b2 = 0;
    byte b1 = i;
    for (i = b2; b1 < this.controller.particles.size; i += this.lifeChannel.strideSize) {
      float[] arrayOfFloat = this.lifeChannel.data;
      b2 = i + 0;
      f2 = arrayOfFloat[b2] - f1;
      arrayOfFloat[b2] = f2;
      if (f2 <= 0.0F) {
        this.controller.particles.removeElement(b1);
        continue;
      } 
      this.lifeChannel.data[i + 2] = 1.0F - this.lifeChannel.data[b2] / this.lifeChannel.data[i + 1];
      b1++;
    } 
    if (this.controller.particles.size < j)
      this.controller.killParticles(this.controller.particles.size, j - this.controller.particles.size); 
  }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("continous", Boolean.valueOf(this.continuous));
    paramJson.writeValue("emission", this.emissionValue);
    paramJson.writeValue("delay", this.delayValue);
    paramJson.writeValue("duration", this.durationValue);
    paramJson.writeValue("life", this.lifeValue);
    paramJson.writeValue("lifeOffset", this.lifeOffsetValue);
  }
  
  public enum EmissionMode {
    Disabled, Enabled, EnabledUntilCycleEnd;
    
    static  {
      Disabled = new EmissionMode("Disabled", 2);
      $VALUES = new EmissionMode[] { Enabled, EnabledUntilCycleEnd, Disabled };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */