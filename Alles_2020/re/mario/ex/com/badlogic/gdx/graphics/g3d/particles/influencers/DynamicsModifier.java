package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.values.ScaledNumericValue;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class DynamicsModifier extends Influencer {
  protected static final Quaternion TMP_Q;
  
  protected static final Vector3 TMP_V1 = new Vector3();
  
  protected static final Vector3 TMP_V2 = new Vector3();
  
  protected static final Vector3 TMP_V3 = new Vector3();
  
  public boolean isGlobal = false;
  
  protected ParallelArray.FloatChannel lifeChannel;
  
  static  {
    TMP_Q = new Quaternion();
  }
  
  public DynamicsModifier() {}
  
  public DynamicsModifier(DynamicsModifier paramDynamicsModifier) { this.isGlobal = paramDynamicsModifier.isGlobal; }
  
  public void allocateChannels() { this.lifeChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Life); }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.isGlobal = ((Boolean)paramJson.readValue("isGlobal", boolean.class, paramJsonValue)).booleanValue();
  }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("isGlobal", Boolean.valueOf(this.isGlobal));
  }
  
  public static abstract class Angular extends Strength {
    protected ParallelArray.FloatChannel angularChannel;
    
    public ScaledNumericValue phiValue = new ScaledNumericValue();
    
    public ScaledNumericValue thetaValue = new ScaledNumericValue();
    
    public Angular() {}
    
    public Angular(Angular param1Angular) {
      super(param1Angular);
      this.thetaValue.load(param1Angular.thetaValue);
      this.phiValue.load(param1Angular.phiValue);
    }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      super.activateParticles(param1Int1, param1Int2);
      int i = param1Int1 * this.angularChannel.strideSize;
      int j = this.angularChannel.strideSize;
      for (param1Int1 = i; param1Int1 < param1Int2 * j + i; param1Int1 += this.angularChannel.strideSize) {
        float f1 = this.thetaValue.newLowValue();
        float f2 = this.thetaValue.newHighValue();
        float f3 = f2;
        if (!this.thetaValue.isRelative())
          f3 = f2 - f1; 
        this.angularChannel.data[param1Int1 + 0] = f1;
        this.angularChannel.data[param1Int1 + 1] = f3;
        f1 = this.phiValue.newLowValue();
        f2 = this.phiValue.newHighValue();
        f3 = f2;
        if (!this.phiValue.isRelative())
          f3 = f2 - f1; 
        this.angularChannel.data[param1Int1 + 2] = f1;
        this.angularChannel.data[param1Int1 + 3] = f3;
      } 
    }
    
    public void allocateChannels() {
      super.allocateChannels();
      ParticleChannels.Interpolation4.id = this.controller.particleChannels.newId();
      this.angularChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Interpolation4);
    }
    
    public void read(Json param1Json, JsonValue param1JsonValue) {
      super.read(param1Json, param1JsonValue);
      this.thetaValue = (ScaledNumericValue)param1Json.readValue("thetaValue", ScaledNumericValue.class, param1JsonValue);
      this.phiValue = (ScaledNumericValue)param1Json.readValue("phiValue", ScaledNumericValue.class, param1JsonValue);
    }
    
    public void write(Json param1Json) {
      super.write(param1Json);
      param1Json.writeValue("thetaValue", this.thetaValue);
      param1Json.writeValue("phiValue", this.phiValue);
    }
  }
  
  public static class BrownianAcceleration extends Strength {
    ParallelArray.FloatChannel accelerationChannel;
    
    public BrownianAcceleration() {}
    
    public BrownianAcceleration(BrownianAcceleration param1BrownianAcceleration) { super(param1BrownianAcceleration); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.accelerationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Acceleration);
    }
    
    public BrownianAcceleration copy() { return new BrownianAcceleration(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      byte b = 0;
      int j = 0;
      int k = 2;
      int m = 0;
      while (b < i) {
        float f1 = this.strengthChannel.data[j + false];
        float f2 = this.strengthChannel.data[j + true];
        float f3 = this.strengthValue.getScale(this.lifeChannel.data[k]);
        TMP_V3.set(MathUtils.random(-1.0F, 1.0F), MathUtils.random(-1.0F, 1.0F), MathUtils.random(-1.0F, 1.0F)).nor().scl(f1 + f2 * f3);
        float[] arrayOfFloat = this.accelerationChannel.data;
        byte b1 = m + false;
        arrayOfFloat[b1] = arrayOfFloat[b1] + TMP_V3.x;
        arrayOfFloat = this.accelerationChannel.data;
        b1 = m + true;
        arrayOfFloat[b1] = arrayOfFloat[b1] + TMP_V3.y;
        arrayOfFloat = this.accelerationChannel.data;
        b1 = m + 2;
        arrayOfFloat[b1] = arrayOfFloat[b1] + TMP_V3.z;
        b++;
        j += this.strengthChannel.strideSize;
        m += this.accelerationChannel.strideSize;
        k += this.lifeChannel.strideSize;
      } 
    }
  }
  
  public static class CentripetalAcceleration extends Strength {
    ParallelArray.FloatChannel accelerationChannel;
    
    ParallelArray.FloatChannel positionChannel;
    
    public CentripetalAcceleration() {}
    
    public CentripetalAcceleration(CentripetalAcceleration param1CentripetalAcceleration) { super(param1CentripetalAcceleration); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.accelerationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Acceleration);
      this.positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position);
    }
    
    public CentripetalAcceleration copy() { return new CentripetalAcceleration(this); }
    
    public void update() {
      float f3;
      float f2;
      boolean bool = this.isGlobal;
      float f1 = 0.0F;
      if (!bool) {
        float[] arrayOfFloat = this.controller.transform.val;
        f1 = arrayOfFloat[12];
        f2 = arrayOfFloat[13];
        f3 = arrayOfFloat[14];
      } else {
        f3 = 0.0F;
        f2 = 0.0F;
      } 
      int i = this.controller.particles.size;
      byte b = 0;
      int j = 0;
      int k = 2;
      int m = 0;
      int n = 0;
      while (b < i) {
        float f4 = this.strengthChannel.data[j + false];
        float f5 = this.strengthChannel.data[j + true];
        float f6 = this.strengthValue.getScale(this.lifeChannel.data[k]);
        TMP_V3.set(this.positionChannel.data[m + false] - f1, this.positionChannel.data[m + true] - f2, this.positionChannel.data[m + 2] - f3).nor().scl(f4 + f5 * f6);
        float[] arrayOfFloat = this.accelerationChannel.data;
        byte b1 = n + false;
        arrayOfFloat[b1] = arrayOfFloat[b1] + TMP_V3.x;
        arrayOfFloat = this.accelerationChannel.data;
        b1 = n + true;
        arrayOfFloat[b1] = arrayOfFloat[b1] + TMP_V3.y;
        arrayOfFloat = this.accelerationChannel.data;
        b1 = n + 2;
        arrayOfFloat[b1] = arrayOfFloat[b1] + TMP_V3.z;
        b++;
        m += this.positionChannel.strideSize;
        j += this.strengthChannel.strideSize;
        n += this.accelerationChannel.strideSize;
        k += this.lifeChannel.strideSize;
      } 
    }
  }
  
  public static class FaceDirection extends DynamicsModifier {
    ParallelArray.FloatChannel accellerationChannel;
    
    ParallelArray.FloatChannel rotationChannel;
    
    public FaceDirection() {}
    
    public FaceDirection(FaceDirection param1FaceDirection) { super(param1FaceDirection); }
    
    public void allocateChannels() {
      this.rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Rotation3D);
      this.accellerationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Acceleration);
    }
    
    public ParticleControllerComponent copy() { return new FaceDirection(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.rotationChannel.strideSize;
      int k = 0;
      int m;
      for (m = 0; k < i * j + 0; m += this.accellerationChannel.strideSize) {
        Vector3 vector31 = TMP_V1.set(this.accellerationChannel.data[m + false], this.accellerationChannel.data[m + true], this.accellerationChannel.data[m + 2]).nor();
        Vector3 vector32 = TMP_V2.set(TMP_V1).crs(Vector3.Y).nor().crs(TMP_V1).nor();
        Vector3 vector33 = TMP_V3.set(vector32).crs(vector31).nor();
        TMP_Q.setFromAxes(false, vector33.x, vector32.x, vector31.x, vector33.y, vector32.y, vector31.y, vector33.z, vector32.z, vector31.z);
        this.rotationChannel.data[k + false] = TMP_Q.x;
        this.rotationChannel.data[k + true] = TMP_Q.y;
        this.rotationChannel.data[k + 2] = TMP_Q.z;
        this.rotationChannel.data[k + 3] = TMP_Q.w;
        k += this.rotationChannel.strideSize;
      } 
    }
  }
  
  public static class PolarAcceleration extends Angular {
    ParallelArray.FloatChannel directionalVelocityChannel;
    
    public PolarAcceleration() {}
    
    public PolarAcceleration(PolarAcceleration param1PolarAcceleration) { super(param1PolarAcceleration); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.directionalVelocityChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Acceleration);
    }
    
    public PolarAcceleration copy() { return new PolarAcceleration(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.directionalVelocityChannel.strideSize;
      int k = 0;
      int m = 2;
      int n = 0;
      int i1 = 0;
      while (k < i * j + 0) {
        float f1 = this.lifeChannel.data[m];
        float f2 = this.strengthChannel.data[n + false];
        float f3 = this.strengthChannel.data[n + true];
        float f4 = this.strengthValue.getScale(f1);
        float f5 = this.angularChannel.data[i1 + 2] + this.angularChannel.data[i1 + 3] * this.phiValue.getScale(f1);
        float f6 = this.angularChannel.data[i1 + false] + this.angularChannel.data[i1 + true] * this.thetaValue.getScale(f1);
        f1 = MathUtils.cosDeg(f6);
        f6 = MathUtils.sinDeg(f6);
        float f7 = MathUtils.cosDeg(f5);
        f5 = MathUtils.sinDeg(f5);
        TMP_V3.set(f1 * f5, f7, f6 * f5).nor().scl(f2 + f3 * f4);
        float[] arrayOfFloat = this.directionalVelocityChannel.data;
        byte b = k + false;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.x;
        arrayOfFloat = this.directionalVelocityChannel.data;
        b = k + true;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.y;
        arrayOfFloat = this.directionalVelocityChannel.data;
        b = k + 2;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.z;
        n += this.strengthChannel.strideSize;
        k += this.directionalVelocityChannel.strideSize;
        i1 += this.angularChannel.strideSize;
        m += this.lifeChannel.strideSize;
      } 
    }
  }
  
  public static class Rotational2D extends Strength {
    ParallelArray.FloatChannel rotationalVelocity2dChannel;
    
    public Rotational2D() {}
    
    public Rotational2D(Rotational2D param1Rotational2D) { super(param1Rotational2D); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.rotationalVelocity2dChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.AngularVelocity2D);
    }
    
    public Rotational2D copy() { return new Rotational2D(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.rotationalVelocity2dChannel.strideSize;
      int k = 0;
      int m = 0;
      int n;
      for (n = 2; k < i * j + 0; n += this.lifeChannel.strideSize) {
        float[] arrayOfFloat = this.rotationalVelocity2dChannel.data;
        arrayOfFloat[k] = arrayOfFloat[k] + this.strengthChannel.data[m + false] + this.strengthChannel.data[m + true] * this.strengthValue.getScale(this.lifeChannel.data[n]);
        m += this.strengthChannel.strideSize;
        k += this.rotationalVelocity2dChannel.strideSize;
      } 
    }
  }
  
  public static class Rotational3D extends Angular {
    ParallelArray.FloatChannel rotationChannel;
    
    ParallelArray.FloatChannel rotationalForceChannel;
    
    public Rotational3D() {}
    
    public Rotational3D(Rotational3D param1Rotational3D) { super(param1Rotational3D); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Rotation3D);
      this.rotationalForceChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.AngularVelocity3D);
    }
    
    public Rotational3D copy() { return new Rotational3D(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.rotationalForceChannel.strideSize;
      int k = 2;
      int m = 0;
      int n = 0;
      int i1 = 0;
      while (m < i * j) {
        float f1 = this.lifeChannel.data[k];
        float f2 = this.strengthChannel.data[n + false];
        float f3 = this.strengthChannel.data[n + true];
        float f4 = this.strengthValue.getScale(f1);
        float f5 = this.angularChannel.data[i1 + 2] + this.angularChannel.data[i1 + 3] * this.phiValue.getScale(f1);
        float f6 = this.angularChannel.data[i1 + false] + this.angularChannel.data[i1 + true] * this.thetaValue.getScale(f1);
        f1 = MathUtils.cosDeg(f6);
        float f7 = MathUtils.sinDeg(f6);
        f6 = MathUtils.cosDeg(f5);
        f5 = MathUtils.sinDeg(f5);
        TMP_V3.set(f1 * f5, f6, f7 * f5);
        TMP_V3.scl((f2 + f3 * f4) * 0.017453292F);
        float[] arrayOfFloat = this.rotationalForceChannel.data;
        byte b = m + false;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.x;
        arrayOfFloat = this.rotationalForceChannel.data;
        b = m + true;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.y;
        arrayOfFloat = this.rotationalForceChannel.data;
        b = m + 2;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.z;
        n += this.strengthChannel.strideSize;
        m += this.rotationalForceChannel.strideSize;
        i1 += this.angularChannel.strideSize;
        k += this.lifeChannel.strideSize;
      } 
    }
  }
  
  public static abstract class Strength extends DynamicsModifier {
    protected ParallelArray.FloatChannel strengthChannel;
    
    public ScaledNumericValue strengthValue = new ScaledNumericValue();
    
    public Strength() {}
    
    public Strength(Strength param1Strength) {
      super(param1Strength);
      this.strengthValue.load(param1Strength.strengthValue);
    }
    
    public void activateParticles(int param1Int1, int param1Int2) {
      int i = param1Int1 * this.strengthChannel.strideSize;
      int j = this.strengthChannel.strideSize;
      for (param1Int1 = i; param1Int1 < param1Int2 * j + i; param1Int1 += this.strengthChannel.strideSize) {
        float f1 = this.strengthValue.newLowValue();
        float f2 = this.strengthValue.newHighValue();
        float f3 = f2;
        if (!this.strengthValue.isRelative())
          f3 = f2 - f1; 
        this.strengthChannel.data[param1Int1 + 0] = f1;
        this.strengthChannel.data[param1Int1 + 1] = f3;
      } 
    }
    
    public void allocateChannels() {
      super.allocateChannels();
      ParticleChannels.Interpolation.id = this.controller.particleChannels.newId();
      this.strengthChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Interpolation);
    }
    
    public void read(Json param1Json, JsonValue param1JsonValue) {
      super.read(param1Json, param1JsonValue);
      this.strengthValue = (ScaledNumericValue)param1Json.readValue("strengthValue", ScaledNumericValue.class, param1JsonValue);
    }
    
    public void write(Json param1Json) {
      super.write(param1Json);
      param1Json.writeValue("strengthValue", this.strengthValue);
    }
  }
  
  public static class TangentialAcceleration extends Angular {
    ParallelArray.FloatChannel directionalVelocityChannel;
    
    ParallelArray.FloatChannel positionChannel;
    
    public TangentialAcceleration() {}
    
    public TangentialAcceleration(TangentialAcceleration param1TangentialAcceleration) { super(param1TangentialAcceleration); }
    
    public void allocateChannels() {
      super.allocateChannels();
      this.directionalVelocityChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Acceleration);
      this.positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position);
    }
    
    public TangentialAcceleration copy() { return new TangentialAcceleration(this); }
    
    public void update() {
      int i = this.controller.particles.size;
      int j = this.directionalVelocityChannel.strideSize;
      int k = 0;
      int m = 2;
      int n = 0;
      int i1 = 0;
      int i2;
      for (i2 = 0; k < i * j + 0; i2 += this.positionChannel.strideSize) {
        float f1 = this.lifeChannel.data[m];
        float f2 = this.strengthChannel.data[n + false];
        float f3 = this.strengthChannel.data[n + true];
        float f4 = this.strengthValue.getScale(f1);
        float f5 = this.angularChannel.data[i1 + 2] + this.angularChannel.data[i1 + 3] * this.phiValue.getScale(f1);
        float f6 = this.angularChannel.data[i1 + false] + this.angularChannel.data[i1 + true] * this.thetaValue.getScale(f1);
        f1 = MathUtils.cosDeg(f6);
        f6 = MathUtils.sinDeg(f6);
        float f7 = MathUtils.cosDeg(f5);
        f5 = MathUtils.sinDeg(f5);
        TMP_V3.set(f1 * f5, f7, f6 * f5).crs(this.positionChannel.data[i2 + false], this.positionChannel.data[i2 + true], this.positionChannel.data[i2 + 2]).nor().scl(f2 + f3 * f4);
        float[] arrayOfFloat = this.directionalVelocityChannel.data;
        byte b = k + false;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.x;
        arrayOfFloat = this.directionalVelocityChannel.data;
        b = k + true;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.y;
        arrayOfFloat = this.directionalVelocityChannel.data;
        b = k + 2;
        arrayOfFloat[b] = arrayOfFloat[b] + TMP_V3.z;
        n += this.strengthChannel.strideSize;
        k += this.directionalVelocityChannel.strideSize;
        i1 += this.angularChannel.strideSize;
        m += this.lifeChannel.strideSize;
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */