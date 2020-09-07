package com.badlogic.gdx.graphics.g3d.particles;

import java.util.Arrays;

public class ParticleChannels {
  public static final ParallelArray.ChannelDescriptor Acceleration;
  
  public static final int AlphaOffset = 3;
  
  public static final ParallelArray.ChannelDescriptor AngularVelocity2D;
  
  public static final ParallelArray.ChannelDescriptor AngularVelocity3D;
  
  public static final int BlueOffset = 2;
  
  public static final ParallelArray.ChannelDescriptor Color;
  
  public static final int CosineOffset = 0;
  
  public static final int CurrentLifeOffset = 0;
  
  public static final int GreenOffset = 1;
  
  public static final int HalfHeightOffset = 5;
  
  public static final int HalfWidthOffset = 4;
  
  public static final ParallelArray.ChannelDescriptor Interpolation;
  
  public static final ParallelArray.ChannelDescriptor Interpolation4;
  
  public static final ParallelArray.ChannelDescriptor Interpolation6;
  
  public static final int InterpolationDiffOffset = 1;
  
  public static final int InterpolationStartOffset = 0;
  
  public static final ParallelArray.ChannelDescriptor Life = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 3);
  
  public static final int LifePercentOffset = 2;
  
  public static final ParallelArray.ChannelDescriptor ModelInstance;
  
  public static final ParallelArray.ChannelDescriptor ParticleController;
  
  public static final ParallelArray.ChannelDescriptor Position = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 3);
  
  public static final ParallelArray.ChannelDescriptor PreviousPosition = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 3);
  
  public static final int RedOffset = 0;
  
  public static final ParallelArray.ChannelDescriptor Rotation2D;
  
  public static final ParallelArray.ChannelDescriptor Rotation3D;
  
  public static final ParallelArray.ChannelDescriptor Scale;
  
  public static final int SineOffset = 1;
  
  public static final ParallelArray.ChannelDescriptor TextureRegion;
  
  public static final int TotalLifeOffset = 1;
  
  public static final int U2Offset = 2;
  
  public static final int UOffset = 0;
  
  public static final int V2Offset = 3;
  
  public static final int VOffset = 1;
  
  public static final int VelocityPhiDiffOffset = 3;
  
  public static final int VelocityPhiStartOffset = 2;
  
  public static final int VelocityStrengthDiffOffset = 1;
  
  public static final int VelocityStrengthStartOffset = 0;
  
  public static final int VelocityThetaDiffOffset = 1;
  
  public static final int VelocityThetaStartOffset = 0;
  
  public static final int WOffset = 3;
  
  public static final int XOffset = 0;
  
  public static final int YOffset = 1;
  
  public static final int ZOffset = 2;
  
  private static int currentGlobalId;
  
  private int currentId;
  
  static  {
    Color = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 4);
    TextureRegion = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 6);
    Rotation2D = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 2);
    Rotation3D = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 4);
    Scale = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, true);
    ModelInstance = new ParallelArray.ChannelDescriptor(newGlobalId(), com.badlogic.gdx.graphics.g3d.ModelInstance.class, true);
    ParticleController = new ParallelArray.ChannelDescriptor(newGlobalId(), ParticleController.class, true);
    Acceleration = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 3);
    AngularVelocity2D = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, true);
    AngularVelocity3D = new ParallelArray.ChannelDescriptor(newGlobalId(), float.class, 3);
    Interpolation = new ParallelArray.ChannelDescriptor(-1, float.class, 2);
    Interpolation4 = new ParallelArray.ChannelDescriptor(-1, float.class, 4);
    Interpolation6 = new ParallelArray.ChannelDescriptor(-1, float.class, 6);
  }
  
  public ParticleChannels() { resetIds(); }
  
  public static int newGlobalId() {
    int i = currentGlobalId;
    currentGlobalId = i + 1;
    return i;
  }
  
  public int newId() {
    int i = this.currentId;
    this.currentId = i + 1;
    return i;
  }
  
  protected void resetIds() { this.currentId = currentGlobalId; }
  
  public static class ColorInitializer extends Object implements ParallelArray.ChannelInitializer<ParallelArray.FloatChannel> {
    private static ColorInitializer instance;
    
    public static ColorInitializer get() {
      if (instance == null)
        instance = new ColorInitializer(); 
      return instance;
    }
    
    public void init(ParallelArray.FloatChannel param1FloatChannel) { Arrays.fill(param1FloatChannel.data, 0, param1FloatChannel.data.length, 1.0F); }
  }
  
  public static class Rotation2dInitializer extends Object implements ParallelArray.ChannelInitializer<ParallelArray.FloatChannel> {
    private static Rotation2dInitializer instance;
    
    public static Rotation2dInitializer get() {
      if (instance == null)
        instance = new Rotation2dInitializer(); 
      return instance;
    }
    
    public void init(ParallelArray.FloatChannel param1FloatChannel) {
      int i = param1FloatChannel.data.length;
      for (int j = 0; j < i; j += param1FloatChannel.strideSize) {
        param1FloatChannel.data[j + false] = 1.0F;
        param1FloatChannel.data[j + true] = 0.0F;
      } 
    }
  }
  
  public static class Rotation3dInitializer extends Object implements ParallelArray.ChannelInitializer<ParallelArray.FloatChannel> {
    private static Rotation3dInitializer instance;
    
    public static Rotation3dInitializer get() {
      if (instance == null)
        instance = new Rotation3dInitializer(); 
      return instance;
    }
    
    public void init(ParallelArray.FloatChannel param1FloatChannel) {
      int i = param1FloatChannel.data.length;
      for (int j = 0; j < i; j += param1FloatChannel.strideSize) {
        float[] arrayOfFloat1 = param1FloatChannel.data;
        float[] arrayOfFloat2 = param1FloatChannel.data;
        param1FloatChannel.data[j + 2] = 0.0F;
        arrayOfFloat2[j + true] = 0.0F;
        arrayOfFloat1[j + false] = 0.0F;
        param1FloatChannel.data[j + 3] = 1.0F;
      } 
    }
  }
  
  public static class ScaleInitializer extends Object implements ParallelArray.ChannelInitializer<ParallelArray.FloatChannel> {
    private static ScaleInitializer instance;
    
    public static ScaleInitializer get() {
      if (instance == null)
        instance = new ScaleInitializer(); 
      return instance;
    }
    
    public void init(ParallelArray.FloatChannel param1FloatChannel) { Arrays.fill(param1FloatChannel.data, 0, param1FloatChannel.data.length, 1.0F); }
  }
  
  public static class TextureRegionInitializer extends Object implements ParallelArray.ChannelInitializer<ParallelArray.FloatChannel> {
    private static TextureRegionInitializer instance;
    
    public static TextureRegionInitializer get() {
      if (instance == null)
        instance = new TextureRegionInitializer(); 
      return instance;
    }
    
    public void init(ParallelArray.FloatChannel param1FloatChannel) {
      int i = param1FloatChannel.data.length;
      for (int j = 0; j < i; j += param1FloatChannel.strideSize) {
        param1FloatChannel.data[j + false] = 0.0F;
        param1FloatChannel.data[j + true] = 0.0F;
        param1FloatChannel.data[j + 2] = 1.0F;
        param1FloatChannel.data[j + 3] = 1.0F;
        param1FloatChannel.data[j + 4] = 0.5F;
        param1FloatChannel.data[j + 5] = 0.5F;
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleChannels.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */