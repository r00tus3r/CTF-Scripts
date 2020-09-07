package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ArrayReflection;

public class Animation<T> extends Object {
  private float animationDuration;
  
  private float frameDuration;
  
  T[] keyFrames;
  
  private int lastFrameNumber;
  
  private float lastStateTime;
  
  private PlayMode playMode = PlayMode.NORMAL;
  
  public Animation(float paramFloat, Array<? extends T> paramArray) {
    this.frameDuration = paramFloat;
    Object[] arrayOfObject = (Object[])ArrayReflection.newInstance(paramArray.items.getClass().getComponentType(), paramArray.size);
    int i = paramArray.size;
    for (byte b = 0; b < i; b++)
      arrayOfObject[b] = paramArray.get(b); 
    setKeyFrames(arrayOfObject);
  }
  
  public Animation(float paramFloat, Array<? extends T> paramArray, PlayMode paramPlayMode) {
    this(paramFloat, paramArray);
    setPlayMode(paramPlayMode);
  }
  
  public Animation(float paramFloat, T... paramVarArgs) {
    this.frameDuration = paramFloat;
    setKeyFrames(paramVarArgs);
  }
  
  public float getAnimationDuration() { return this.animationDuration; }
  
  public float getFrameDuration() { return this.frameDuration; }
  
  public T getKeyFrame(float paramFloat) {
    int i = getKeyFrameIndex(paramFloat);
    return (T)this.keyFrames[i];
  }
  
  public T getKeyFrame(float paramFloat, boolean paramBoolean) {
    PlayMode playMode1 = this.playMode;
    if (paramBoolean && (playMode1 == PlayMode.NORMAL || this.playMode == PlayMode.REVERSED)) {
      if (this.playMode == PlayMode.NORMAL) {
        this.playMode = PlayMode.LOOP;
      } else {
        this.playMode = PlayMode.LOOP_REVERSED;
      } 
    } else if (!paramBoolean && this.playMode != PlayMode.NORMAL && this.playMode != PlayMode.REVERSED) {
      if (this.playMode == PlayMode.LOOP_REVERSED) {
        this.playMode = PlayMode.REVERSED;
      } else {
        this.playMode = PlayMode.LOOP;
      } 
    } 
    Object object = getKeyFrame(paramFloat);
    this.playMode = playMode1;
    return (T)object;
  }
  
  public int getKeyFrameIndex(float paramFloat) {
    int j;
    Object[] arrayOfObject;
    if (this.keyFrames.length == 1)
      return 0; 
    int i = (int)(paramFloat / this.frameDuration);
    switch (this.playMode) {
      default:
        this.lastFrameNumber = i;
        this.lastStateTime = paramFloat;
        return i;
      case LOOP_REVERSED:
        arrayOfObject = this.keyFrames;
        j = arrayOfObject.length;
        i = arrayOfObject.length - i % j - 1;
      case REVERSED:
        i = Math.max(this.keyFrames.length - i - 1, 0);
      case LOOP_RANDOM:
        if ((int)(this.lastStateTime / this.frameDuration) != i) {
          i = MathUtils.random(this.keyFrames.length - 1);
        } else {
          i = this.lastFrameNumber;
        } 
      case LOOP_PINGPONG:
        arrayOfObject = this.keyFrames;
        j = i % (arrayOfObject.length * 2 - 2);
        i = j;
        if (j >= arrayOfObject.length)
          i = arrayOfObject.length - 2 - j - arrayOfObject.length; 
      case LOOP:
        i %= this.keyFrames.length;
      case NORMAL:
        break;
    } 
    i = Math.min(this.keyFrames.length - 1, i);
  }
  
  public T[] getKeyFrames() { return (T[])this.keyFrames; }
  
  public PlayMode getPlayMode() { return this.playMode; }
  
  public boolean isAnimationFinished(float paramFloat) {
    int i = (int)(paramFloat / this.frameDuration);
    int j = this.keyFrames.length;
    boolean bool = true;
    if (j - 1 >= i)
      bool = false; 
    return bool;
  }
  
  public void setFrameDuration(float paramFloat) {
    this.frameDuration = paramFloat;
    this.animationDuration = this.keyFrames.length * paramFloat;
  }
  
  protected void setKeyFrames(T... paramVarArgs) {
    this.keyFrames = paramVarArgs;
    this.animationDuration = paramVarArgs.length * this.frameDuration;
  }
  
  public void setPlayMode(PlayMode paramPlayMode) { this.playMode = paramPlayMode; }
  
  public enum PlayMode {
    LOOP, LOOP_PINGPONG, LOOP_RANDOM, LOOP_REVERSED, NORMAL, REVERSED;
    
    static  {
      LOOP = new PlayMode("LOOP", 2);
      LOOP_REVERSED = new PlayMode("LOOP_REVERSED", 3);
      LOOP_PINGPONG = new PlayMode("LOOP_PINGPONG", 4);
      LOOP_RANDOM = new PlayMode("LOOP_RANDOM", 5);
      $VALUES = new PlayMode[] { NORMAL, REVERSED, LOOP, LOOP_REVERSED, LOOP_PINGPONG, LOOP_RANDOM };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/Animation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */