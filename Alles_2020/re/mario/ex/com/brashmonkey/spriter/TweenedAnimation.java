package com.brashmonkey.spriter;

public class TweenedAnimation extends Animation {
  private Animation anim1;
  
  private Animation anim2;
  
  Mainline.Key.BoneRef base = null;
  
  public Animation baseAnimation;
  
  public final Curve curve;
  
  public final Entity entity;
  
  public float spriteThreshold = 0.5F;
  
  public boolean tweenSprites = false;
  
  public float weight = 0.5F;
  
  public TweenedAnimation(Entity paramEntity) {
    super(new Mainline(false), -1, "__interpolatedAnimation__", 0, true, paramEntity.getAnimationWithMostTimelines().timelines());
    this.entity = paramEntity;
    this.curve = new Curve();
    setUpTimelines();
  }
  
  private void setUpTimelines() {
    Animation animation = this.entity.getAnimationWithMostTimelines();
    int i = animation.timelines();
    for (byte b = 0; b < i; b++)
      addTimeline(new Timeline(b, (animation.getTimeline(b)).name, (animation.getTimeline(b)).objectInfo, true)); 
    prepare();
  }
  
  private void tweenBone(Timeline.Key.Bone paramBone1, Timeline.Key.Bone paramBone2, Timeline.Key.Bone paramBone3, float paramFloat, Curve paramCurve) {
    paramBone3.angle = paramCurve.tweenAngle(paramBone1.angle, paramBone2.angle, paramFloat);
    paramCurve.tweenPoint(paramBone1.position, paramBone2.position, paramFloat, paramBone3.position);
    paramCurve.tweenPoint(paramBone1.scale, paramBone2.scale, paramFloat, paramBone3.scale);
    paramCurve.tweenPoint(paramBone1.pivot, paramBone2.pivot, paramFloat, paramBone3.pivot);
  }
  
  private void tweenBoneRefs(Mainline.Key.BoneRef paramBoneRef, Timeline.Key.Bone paramBone) {
    int i;
    if (paramBoneRef == null) {
      i = -1;
    } else {
      i = paramBoneRef.id - 1;
    } 
    int j = this.currentKey.boneRefs.length;
    while (++i < j) {
      Mainline.Key.BoneRef boneRef = this.currentKey.boneRefs[i];
      if (paramBoneRef == boneRef || boneRef.parent == paramBoneRef)
        update(boneRef, paramBone, 0); 
      if (paramBoneRef == boneRef.parent)
        tweenBoneRefs(boneRef, paramBone); 
    } 
  }
  
  private void tweenObject(Timeline.Key.Object paramObject1, Timeline.Key.Object paramObject2, Timeline.Key.Object paramObject3, float paramFloat, Curve paramCurve) {
    tweenBone(paramObject1, paramObject2, paramObject3, paramFloat, paramCurve);
    paramObject3.alpha = paramCurve.tweenAngle(paramObject1.alpha, paramObject2.alpha, paramFloat);
    paramObject3.ref.set(paramObject1.ref);
  }
  
  public Mainline.Key getCurrentKey() { return this.currentKey; }
  
  public Animation getFirstAnimation() { return this.anim1; }
  
  public Animation getSecondAnimation() { return this.anim2; }
  
  public boolean onFirstMainLine() {
    boolean bool;
    if (this.weight < this.spriteThreshold) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void setAnimations(Animation paramAnimation1, Animation paramAnimation2) {
    boolean bool;
    if (paramAnimation1 instanceof TweenedAnimation || paramAnimation2 instanceof TweenedAnimation) {
      bool = true;
    } else {
      bool = false;
    } 
    if (paramAnimation1 == this.anim1 && paramAnimation2 == this.anim2)
      return; 
    if ((this.entity.containsAnimation(paramAnimation1) && this.entity.containsAnimation(paramAnimation2)) || bool) {
      this.anim1 = paramAnimation1;
      this.anim2 = paramAnimation2;
      return;
    } 
    throw new SpriterException("Both animations have to be part of the same entity!");
  }
  
  public void update(int paramInt, Timeline.Key.Bone paramBone) {
    Animation animation;
    if (onFirstMainLine()) {
      animation = this.anim1;
    } else {
      animation = this.anim2;
    } 
    this.currentKey = animation.currentKey;
    Timeline.Key[] arrayOfKey = this.unmappedTweenedKeys;
    int i = arrayOfKey.length;
    for (paramInt = 0; paramInt < i; paramInt++)
      (arrayOfKey[paramInt]).active = false; 
    if (this.base != null) {
      Animation animation2;
      if (onFirstMainLine()) {
        animation2 = this.anim1;
      } else {
        animation2 = this.anim2;
      } 
      Animation animation3 = this.baseAnimation;
      Animation animation1 = animation3;
      if (animation3 == null)
        if (onFirstMainLine()) {
          animation1 = this.anim1;
        } else {
          animation1 = this.anim2;
        }  
      Mainline.Key.BoneRef[] arrayOfBoneRef = this.currentKey.boneRefs;
      i = arrayOfBoneRef.length;
      for (paramInt = 0; paramInt < i; paramInt++) {
        Mainline.Key.BoneRef boneRef = arrayOfBoneRef[paramInt];
        Timeline timeline = animation1.getSimilarTimeline(animation2.getTimeline(boneRef.timeline));
        if (timeline != null) {
          Timeline.Key.Bone bone = animation1.tweenedKeys[timeline.id];
          Timeline.Key key = animation1.unmappedTweenedKeys[timeline.id];
          (this.tweenedKeys[boneRef.timeline]).active = bone.active;
          this.tweenedKeys[boneRef.timeline].object().set(bone.object());
          (this.unmappedTweenedKeys[boneRef.timeline]).active = key.active;
          int j = boneRef.timeline;
          if (boneRef.parent != null) {
            Timeline.Key.Object object = this.unmappedTweenedKeys[boneRef.parent.timeline].object();
          } else {
            bone = paramBone;
          } 
          unmapTimelineObject(j, false, bone);
        } 
      } 
    } 
    tweenBoneRefs(this.base, paramBone);
    Mainline.Key.ObjectRef[] arrayOfObjectRef = this.currentKey.objectRefs;
    i = arrayOfObjectRef.length;
    for (paramInt = 0; paramInt < i; paramInt++)
      update(arrayOfObjectRef[paramInt], paramBone, 0); 
  }
  
  protected void update(Mainline.Key.BoneRef paramBoneRef, Timeline.Key.Bone paramBone, int paramInt) {
    Timeline timeline4;
    Timeline timeline2;
    Timeline timeline1;
    boolean bool = paramBoneRef instanceof Mainline.Key.ObjectRef;
    if (onFirstMainLine()) {
      timeline1 = this.anim1.getTimeline(paramBoneRef.timeline);
    } else {
      timeline1 = this.anim1.getSimilarTimeline(this.anim2.getTimeline(paramBoneRef.timeline));
    } 
    if (onFirstMainLine()) {
      timeline2 = this.anim2.getSimilarTimeline(timeline1);
    } else {
      timeline2 = this.anim2.getTimeline(paramBoneRef.timeline);
    } 
    if (onFirstMainLine()) {
      paramInt = timeline1.id;
    } else {
      paramInt = timeline2.id;
    } 
    Timeline timeline3 = getTimeline(paramInt);
    Timeline.Key.Object object = null;
    if (timeline1 != null) {
      Timeline.Key.Object object1 = this.anim1.tweenedKeys[timeline1.id].object();
    } else {
      timeline1 = null;
    } 
    if (timeline2 != null) {
      timeline4 = this.anim2.tweenedKeys[timeline2.id].object();
    } else {
      timeline4 = null;
    } 
    if (timeline3 != null)
      object = this.tweenedKeys[timeline3.id].object(); 
    if (bool && (timeline2 == null || !this.tweenSprites)) {
      if (!onFirstMainLine())
        timeline1 = timeline4; 
      timeline4 = timeline1;
    } 
    if (timeline4 != null && object != null && timeline1 != null) {
      if (bool) {
        tweenObject((Timeline.Key.Object)timeline1, (Timeline.Key.Object)timeline4, (Timeline.Key.Object)object, this.weight, this.curve);
      } else {
        tweenBone(timeline1, timeline4, object, this.weight, this.curve);
      } 
      (this.unmappedTweenedKeys[timeline3.id]).active = true;
    } 
    if ((this.unmappedTweenedKeys[paramBoneRef.timeline]).active) {
      Timeline.Key.Bone bone;
      paramInt = timeline3.id;
      if (paramBoneRef.parent != null) {
        bone = this.unmappedTweenedKeys[paramBoneRef.parent.timeline].object();
      } else {
        bone = paramBone;
      } 
      unmapTimelineObject(paramInt, bool, bone);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/TweenedAnimation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */