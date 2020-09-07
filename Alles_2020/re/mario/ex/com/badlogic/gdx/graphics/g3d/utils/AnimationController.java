package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.Pool;

public class AnimationController extends BaseAnimationController {
  public boolean allowSameAnimation;
  
  protected final Pool<AnimationDesc> animationPool = new Pool<AnimationDesc>() {
      protected AnimationController.AnimationDesc newObject() { return new AnimationController.AnimationDesc(); }
    };
  
  public AnimationDesc current;
  
  public boolean inAction;
  
  private boolean justChangedAnimation = false;
  
  public boolean paused;
  
  public AnimationDesc previous;
  
  public AnimationDesc queued;
  
  public float queuedTransitionTime;
  
  public float transitionCurrentTime;
  
  public float transitionTargetTime;
  
  public AnimationController(ModelInstance paramModelInstance) { super(paramModelInstance); }
  
  private AnimationDesc obtain(Animation paramAnimation, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener) {
    if (paramAnimation == null)
      return null; 
    AnimationDesc animationDesc = (AnimationDesc)this.animationPool.obtain();
    animationDesc.animation = paramAnimation;
    animationDesc.listener = paramAnimationListener;
    animationDesc.loopCount = paramInt;
    animationDesc.speed = paramFloat3;
    animationDesc.offset = paramFloat1;
    float f1 = 0.0F;
    float f2 = paramFloat2;
    if (paramFloat2 < 0.0F)
      f2 = paramAnimation.duration - paramFloat1; 
    animationDesc.duration = f2;
    paramFloat1 = f1;
    if (paramFloat3 < 0.0F)
      paramFloat1 = animationDesc.duration; 
    animationDesc.time = paramFloat1;
    return animationDesc;
  }
  
  private AnimationDesc obtain(AnimationDesc paramAnimationDesc) { return obtain(paramAnimationDesc.animation, paramAnimationDesc.offset, paramAnimationDesc.duration, paramAnimationDesc.loopCount, paramAnimationDesc.speed, paramAnimationDesc.listener); }
  
  private AnimationDesc obtain(String paramString, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener) {
    if (paramString == null)
      return null; 
    Animation animation = this.target.getAnimation(paramString);
    if (animation != null)
      return obtain(animation, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener); 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Unknown animation: ");
    stringBuilder.append(paramString);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  protected AnimationDesc action(Animation paramAnimation, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener, float paramFloat4) { return action(obtain(paramAnimation, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener), paramFloat4); }
  
  protected AnimationDesc action(AnimationDesc paramAnimationDesc, float paramFloat) {
    if (paramAnimationDesc.loopCount >= 0) {
      AnimationDesc animationDesc = this.current;
      if (animationDesc == null || animationDesc.loopCount == 0) {
        animate(paramAnimationDesc, paramFloat);
        return paramAnimationDesc;
      } 
      if (this.inAction) {
        animationDesc = null;
      } else {
        animationDesc = obtain(this.current);
      } 
      this.inAction = false;
      animate(paramAnimationDesc, paramFloat);
      this.inAction = true;
      if (animationDesc != null)
        queue(animationDesc, paramFloat); 
      return paramAnimationDesc;
    } 
    throw new GdxRuntimeException("An action cannot be continuous");
  }
  
  public AnimationDesc action(String paramString, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener, float paramFloat4) { return action(obtain(paramString, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener), paramFloat4); }
  
  public AnimationDesc action(String paramString, int paramInt, float paramFloat1, AnimationListener paramAnimationListener, float paramFloat2) { return action(paramString, 0.0F, -1.0F, paramInt, paramFloat1, paramAnimationListener, paramFloat2); }
  
  protected AnimationDesc animate(Animation paramAnimation, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener, float paramFloat4) { return animate(obtain(paramAnimation, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener), paramFloat4); }
  
  protected AnimationDesc animate(AnimationDesc paramAnimationDesc, float paramFloat) {
    AnimationDesc animationDesc = this.current;
    if (animationDesc == null) {
      this.current = paramAnimationDesc;
    } else if (this.inAction) {
      queue(paramAnimationDesc, paramFloat);
    } else if (!this.allowSameAnimation && paramAnimationDesc != null && animationDesc.animation == paramAnimationDesc.animation) {
      paramAnimationDesc.time = this.current.time;
      this.animationPool.free(this.current);
      this.current = paramAnimationDesc;
    } else {
      animationDesc = this.previous;
      if (animationDesc != null) {
        removeAnimation(animationDesc.animation);
        this.animationPool.free(this.previous);
      } 
      this.previous = this.current;
      this.current = paramAnimationDesc;
      this.transitionCurrentTime = 0.0F;
      this.transitionTargetTime = paramFloat;
    } 
    return paramAnimationDesc;
  }
  
  public AnimationDesc animate(String paramString, float paramFloat) { return animate(paramString, 1, 1.0F, null, paramFloat); }
  
  public AnimationDesc animate(String paramString, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener, float paramFloat4) { return animate(obtain(paramString, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener), paramFloat4); }
  
  public AnimationDesc animate(String paramString, int paramInt, float paramFloat1, AnimationListener paramAnimationListener, float paramFloat2) { return animate(paramString, 0.0F, -1.0F, paramInt, paramFloat1, paramAnimationListener, paramFloat2); }
  
  public AnimationDesc animate(String paramString, int paramInt, AnimationListener paramAnimationListener, float paramFloat) { return animate(paramString, paramInt, 1.0F, paramAnimationListener, paramFloat); }
  
  public AnimationDesc animate(String paramString, AnimationListener paramAnimationListener, float paramFloat) { return animate(paramString, 1, 1.0F, paramAnimationListener, paramFloat); }
  
  protected AnimationDesc queue(Animation paramAnimation, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener, float paramFloat4) { return queue(obtain(paramAnimation, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener), paramFloat4); }
  
  protected AnimationDesc queue(AnimationDesc paramAnimationDesc, float paramFloat) {
    AnimationDesc animationDesc = this.current;
    if (animationDesc == null || animationDesc.loopCount == 0) {
      animate(paramAnimationDesc, paramFloat);
      return paramAnimationDesc;
    } 
    animationDesc = this.queued;
    if (animationDesc != null)
      this.animationPool.free(animationDesc); 
    this.queued = paramAnimationDesc;
    this.queuedTransitionTime = paramFloat;
    if (this.current.loopCount < 0)
      this.current.loopCount = 1; 
    return paramAnimationDesc;
  }
  
  public AnimationDesc queue(String paramString, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener, float paramFloat4) { return queue(obtain(paramString, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener), paramFloat4); }
  
  public AnimationDesc queue(String paramString, int paramInt, float paramFloat1, AnimationListener paramAnimationListener, float paramFloat2) { return queue(paramString, 0.0F, -1.0F, paramInt, paramFloat1, paramAnimationListener, paramFloat2); }
  
  protected AnimationDesc setAnimation(Animation paramAnimation, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener) { return setAnimation(obtain(paramAnimation, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener)); }
  
  protected AnimationDesc setAnimation(AnimationDesc paramAnimationDesc) {
    AnimationDesc animationDesc = this.current;
    if (animationDesc == null) {
      this.current = paramAnimationDesc;
    } else {
      if (!this.allowSameAnimation && paramAnimationDesc != null && animationDesc.animation == paramAnimationDesc.animation) {
        paramAnimationDesc.time = this.current.time;
      } else {
        removeAnimation(this.current.animation);
      } 
      this.animationPool.free(this.current);
      this.current = paramAnimationDesc;
    } 
    this.justChangedAnimation = true;
    return paramAnimationDesc;
  }
  
  public AnimationDesc setAnimation(String paramString) { return setAnimation(paramString, 1, 1.0F, null); }
  
  public AnimationDesc setAnimation(String paramString, float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, AnimationListener paramAnimationListener) { return setAnimation(obtain(paramString, paramFloat1, paramFloat2, paramInt, paramFloat3, paramAnimationListener)); }
  
  public AnimationDesc setAnimation(String paramString, int paramInt) { return setAnimation(paramString, paramInt, 1.0F, null); }
  
  public AnimationDesc setAnimation(String paramString, int paramInt, float paramFloat, AnimationListener paramAnimationListener) { return setAnimation(paramString, 0.0F, -1.0F, paramInt, paramFloat, paramAnimationListener); }
  
  public AnimationDesc setAnimation(String paramString, int paramInt, AnimationListener paramAnimationListener) { return setAnimation(paramString, paramInt, 1.0F, paramAnimationListener); }
  
  public AnimationDesc setAnimation(String paramString, AnimationListener paramAnimationListener) { return setAnimation(paramString, 1, 1.0F, paramAnimationListener); }
  
  public void update(float paramFloat) {
    if (this.paused)
      return; 
    AnimationDesc animationDesc = this.previous;
    if (animationDesc != null) {
      float f = this.transitionCurrentTime + paramFloat;
      this.transitionCurrentTime = f;
      if (f >= this.transitionTargetTime) {
        removeAnimation(animationDesc.animation);
        this.justChangedAnimation = true;
        this.animationPool.free(this.previous);
        this.previous = null;
      } 
    } 
    if (this.justChangedAnimation) {
      this.target.calculateTransforms();
      this.justChangedAnimation = false;
    } 
    animationDesc = this.current;
    if (animationDesc != null && animationDesc.loopCount != 0 && this.current.animation != null) {
      paramFloat = this.current.update(paramFloat);
      if (paramFloat != 0.0F) {
        animationDesc = this.queued;
        if (animationDesc != null) {
          this.inAction = false;
          animate(animationDesc, this.queuedTransitionTime);
          this.queued = null;
          update(paramFloat);
          return;
        } 
      } 
      animationDesc = this.previous;
      if (animationDesc != null) {
        applyAnimations(animationDesc.animation, this.previous.offset + this.previous.time, this.current.animation, this.current.offset + this.current.time, this.transitionCurrentTime / this.transitionTargetTime);
      } else {
        applyAnimation(this.current.animation, this.current.offset + this.current.time);
      } 
    } 
  }
  
  public static class AnimationDesc {
    public Animation animation;
    
    public float duration;
    
    public AnimationController.AnimationListener listener;
    
    public int loopCount;
    
    public float offset;
    
    public float speed;
    
    public float time;
    
    protected float update(float param1Float) {
      if (this.loopCount != 0 && this.animation != null) {
        boolean bool1;
        float f1 = this.speed * param1Float;
        boolean bool = MathUtils.isZero(this.duration);
        float f2 = 0.0F;
        if (!bool) {
          this.time += f1;
          int i = (int)Math.abs(this.time / this.duration);
          bool1 = i;
          if (this.time < 0.0F) {
            i++;
            while (true) {
              param1Float = this.time;
              bool1 = i;
              if (param1Float < 0.0F) {
                this.time = param1Float + this.duration;
                continue;
              } 
              break;
            } 
          } 
          this.time = Math.abs(this.time % this.duration);
        } else {
          bool1 = true;
        } 
        for (byte b = 0; b < bool1; b++) {
          int i = this.loopCount;
          if (i > 0)
            this.loopCount = i - 1; 
          if (this.loopCount != 0) {
            AnimationController.AnimationListener animationListener = this.listener;
            if (animationListener != null)
              animationListener.onLoop(this); 
          } 
          if (this.loopCount == 0) {
            float f3 = (bool1 - true - b);
            float f4 = this.duration;
            if (f1 < 0.0F) {
              param1Float = f4 - this.time;
            } else {
              param1Float = this.time;
            } 
            if (f1 >= 0.0F)
              f2 = this.duration; 
            this.time = f2;
            AnimationController.AnimationListener animationListener = this.listener;
            if (animationListener != null)
              animationListener.onEnd(this); 
            return f3 * f4 + param1Float;
          } 
        } 
        return 0.0F;
      } 
      return param1Float;
    }
  }
  
  public static interface AnimationListener {
    void onEnd(AnimationController.AnimationDesc param1AnimationDesc);
    
    void onLoop(AnimationController.AnimationDesc param1AnimationDesc);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/AnimationController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */