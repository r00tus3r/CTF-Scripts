package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;
import java.util.Arrays;

public class DynamicsInfluencer extends Influencer {
  private ParallelArray.FloatChannel accellerationChannel;
  
  private ParallelArray.FloatChannel angularVelocityChannel;
  
  boolean has2dAngularVelocity;
  
  boolean has3dAngularVelocity;
  
  boolean hasAcceleration;
  
  private ParallelArray.FloatChannel positionChannel;
  
  private ParallelArray.FloatChannel previousPositionChannel;
  
  private ParallelArray.FloatChannel rotationChannel;
  
  public Array<DynamicsModifier> velocities = new Array(true, 3, DynamicsModifier.class);
  
  public DynamicsInfluencer() {}
  
  public DynamicsInfluencer(DynamicsInfluencer paramDynamicsInfluencer) { this((DynamicsModifier[])paramDynamicsInfluencer.velocities.toArray(DynamicsModifier.class)); }
  
  public DynamicsInfluencer(DynamicsModifier... paramVarArgs) {
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++) {
      DynamicsModifier dynamicsModifier = paramVarArgs[b];
      this.velocities.add((DynamicsModifier)dynamicsModifier.copy());
    } 
  }
  
  public void activateParticles(int paramInt1, int paramInt2) {
    if (this.hasAcceleration) {
      int i = this.positionChannel.strideSize * paramInt1;
      int j = this.positionChannel.strideSize;
      int k;
      for (k = i; k < j * paramInt2 + i; k += this.positionChannel.strideSize) {
        float[] arrayOfFloat = this.previousPositionChannel.data;
        int m = k + 0;
        arrayOfFloat[m] = this.positionChannel.data[m];
        arrayOfFloat = this.previousPositionChannel.data;
        m = k + 1;
        arrayOfFloat[m] = this.positionChannel.data[m];
        arrayOfFloat = this.previousPositionChannel.data;
        m = k + 2;
        arrayOfFloat[m] = this.positionChannel.data[m];
      } 
    } 
    if (this.has2dAngularVelocity) {
      int i = this.rotationChannel.strideSize * paramInt1;
      int j = this.rotationChannel.strideSize;
      int k;
      for (k = i; k < j * paramInt2 + i; k += this.rotationChannel.strideSize) {
        this.rotationChannel.data[k + 0] = 1.0F;
        this.rotationChannel.data[k + 1] = 0.0F;
      } 
    } else if (this.has3dAngularVelocity) {
      int i = this.rotationChannel.strideSize * paramInt1;
      int j = this.rotationChannel.strideSize;
      int k;
      for (k = i; k < j * paramInt2 + i; k += this.rotationChannel.strideSize) {
        this.rotationChannel.data[k + 0] = 0.0F;
        this.rotationChannel.data[k + 1] = 0.0F;
        this.rotationChannel.data[k + 2] = 0.0F;
        this.rotationChannel.data[k + 3] = 1.0F;
      } 
    } 
    for (byte b = 0; b < this.velocities.size; b++)
      (DynamicsModifier[])this.velocities.items[b].activateParticles(paramInt1, paramInt2); 
  }
  
  public void allocateChannels() {
    byte b3;
    byte b1 = 0;
    for (byte b2 = 0; b2 < this.velocities.size; b2++)
      (DynamicsModifier[])this.velocities.items[b2].allocateChannels(); 
    this.accellerationChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.Acceleration);
    if (this.accellerationChannel != null) {
      b3 = 1;
    } else {
      b3 = 0;
    } 
    this.hasAcceleration = b3;
    if (this.hasAcceleration) {
      this.positionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Position);
      this.previousPositionChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.PreviousPosition);
    } 
    this.angularVelocityChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.AngularVelocity2D);
    if (this.angularVelocityChannel != null) {
      b3 = 1;
    } else {
      b3 = 0;
    } 
    this.has2dAngularVelocity = b3;
    if (this.has2dAngularVelocity) {
      this.rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Rotation2D);
      this.has3dAngularVelocity = false;
    } else {
      this.angularVelocityChannel = (ParallelArray.FloatChannel)this.controller.particles.getChannel(ParticleChannels.AngularVelocity3D);
      b3 = b1;
      if (this.angularVelocityChannel != null)
        b3 = 1; 
      this.has3dAngularVelocity = b3;
      if (this.has3dAngularVelocity)
        this.rotationChannel = (ParallelArray.FloatChannel)this.controller.particles.addChannel(ParticleChannels.Rotation3D); 
    } 
  }
  
  public DynamicsInfluencer copy() { return new DynamicsInfluencer(this); }
  
  public void init() {
    for (byte b = 0; b < this.velocities.size; b++)
      (DynamicsModifier[])this.velocities.items[b].init(); 
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) { this.velocities.addAll((Array)paramJson.readValue("velocities", Array.class, DynamicsModifier.class, paramJsonValue)); }
  
  public void set(ParticleController paramParticleController) {
    super.set(paramParticleController);
    for (byte b = 0; b < this.velocities.size; b++)
      (DynamicsModifier[])this.velocities.items[b].set(paramParticleController); 
  }
  
  public void update() {
    boolean bool = this.hasAcceleration;
    byte b = 0;
    int i = 0;
    if (bool)
      Arrays.fill(this.accellerationChannel.data, 0, this.controller.particles.size * this.accellerationChannel.strideSize, 0.0F); 
    if (this.has2dAngularVelocity || this.has3dAngularVelocity)
      Arrays.fill(this.angularVelocityChannel.data, 0, this.controller.particles.size * this.angularVelocityChannel.strideSize, 0.0F); 
    int j;
    for (j = 0; j < this.velocities.size; j++)
      (DynamicsModifier[])this.velocities.items[j].update(); 
    if (this.hasAcceleration) {
      byte b1 = 0;
      for (j = 0; b1 < this.controller.particles.size; j += this.positionChannel.strideSize) {
        float[] arrayOfFloat = this.positionChannel.data;
        byte b2 = j + 0;
        float f1 = arrayOfFloat[b2];
        arrayOfFloat = this.positionChannel.data;
        byte b3 = j + 1;
        float f2 = arrayOfFloat[b3];
        arrayOfFloat = this.positionChannel.data;
        byte b4 = j + 2;
        float f3 = arrayOfFloat[b4];
        this.positionChannel.data[b2] = f1 * 2.0F - this.previousPositionChannel.data[b2] + this.accellerationChannel.data[b2] * this.controller.deltaTimeSqr;
        this.positionChannel.data[b3] = f2 * 2.0F - this.previousPositionChannel.data[b3] + this.accellerationChannel.data[b3] * this.controller.deltaTimeSqr;
        this.positionChannel.data[b4] = 2.0F * f3 - this.previousPositionChannel.data[b4] + this.accellerationChannel.data[b4] * this.controller.deltaTimeSqr;
        this.previousPositionChannel.data[b2] = f1;
        this.previousPositionChannel.data[b3] = f2;
        this.previousPositionChannel.data[b4] = f3;
        b1++;
      } 
    } 
    if (this.has2dAngularVelocity) {
      int k = 0;
      j = i;
      while (j < this.controller.particles.size) {
        float f = this.angularVelocityChannel.data[j] * this.controller.deltaTime;
        if (f != 0.0F) {
          float f1 = MathUtils.cosDeg(f);
          f = MathUtils.sinDeg(f);
          float[] arrayOfFloat = this.rotationChannel.data;
          i = k + false;
          float f3 = arrayOfFloat[i];
          arrayOfFloat = this.rotationChannel.data;
          b = k + true;
          float f2 = arrayOfFloat[b];
          this.rotationChannel.data[i] = f3 * f1 - f2 * f;
          this.rotationChannel.data[b] = f2 * f1 + f3 * f;
        } 
        j++;
        k += this.rotationChannel.strideSize;
      } 
    } else if (this.has3dAngularVelocity) {
      int k = 0;
      j = 0;
      while (b < this.controller.particles.size) {
        float f3 = this.angularVelocityChannel.data[k + false];
        float f4 = this.angularVelocityChannel.data[k + true];
        float f5 = this.angularVelocityChannel.data[k + 2];
        float[] arrayOfFloat = this.rotationChannel.data;
        int m = j + 0;
        float f1 = arrayOfFloat[m];
        arrayOfFloat = this.rotationChannel.data;
        int n = j + 1;
        float f6 = arrayOfFloat[n];
        arrayOfFloat = this.rotationChannel.data;
        int i1 = j + 2;
        float f7 = arrayOfFloat[i1];
        arrayOfFloat = this.rotationChannel.data;
        i = j + 3;
        float f2 = arrayOfFloat[i];
        TMP_Q.set(f3, f4, f5, 0.0F).mul(f1, f6, f7, f2).mul(this.controller.deltaTime * 0.5F).add(f1, f6, f7, f2).nor();
        this.rotationChannel.data[m] = TMP_Q.x;
        this.rotationChannel.data[n] = TMP_Q.y;
        this.rotationChannel.data[i1] = TMP_Q.z;
        this.rotationChannel.data[i] = TMP_Q.w;
        b++;
        j += this.rotationChannel.strideSize;
        k += this.angularVelocityChannel.strideSize;
      } 
    } 
  }
  
  public void write(Json paramJson) { paramJson.writeValue("velocities", this.velocities, Array.class, DynamicsModifier.class); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */