package com.brashmonkey.spriter;

public class CCDResolver extends IKResolver {
  public CCDResolver(Player paramPlayer) { super(paramPlayer); }
  
  public void resolve(float paramFloat1, float paramFloat2, int paramInt, Mainline.Key.BoneRef paramBoneRef) {
    Mainline.Key.BoneRef boneRef1 = this.player.animation.getTimeline(paramBoneRef.timeline);
    Timeline.Key key1 = this.player.tweenedKeys[paramBoneRef.timeline];
    Timeline.Key key2 = this.player.unmappedTweenedKeys[paramBoneRef.timeline];
    Timeline.Key.Object object2 = key1.object();
    Timeline.Key.Object object1 = key2.object();
    if (boneRef1.objectInfo != null) {
      f1 = boneRef1.objectInfo.size.width;
    } else {
      f1 = 200.0F;
    } 
    float f2 = f1 * object1.scale.x;
    float f3 = object1.position.x + (float)Math.cos(Math.toRadians(object1.angle)) * f2;
    float f1 = object1.position.y + (float)Math.sin(Math.toRadians(object1.angle)) * f2;
    if (Calculator.distanceBetween(f3, f1, paramFloat1, paramFloat2) <= this.tolerance)
      return; 
    object2.angle = Calculator.angleBetween(object1.position.x, object1.position.y, paramFloat1, paramFloat2);
    if (Math.signum(this.player.root.scale.x) == -1.0F)
      object2.angle += 180.0F; 
    Mainline.Key.BoneRef boneRef2 = paramBoneRef.parent;
    if (boneRef2 != null) {
      Timeline.Key.Object object3 = this.player.tweenedKeys[boneRef2.timeline].object();
      Timeline.Key.Object object4 = this.player.unmappedTweenedKeys[boneRef2.timeline].object();
      object2.angle -= object4.angle;
    } else {
      paramBoneRef = null;
      boneRef1 = paramBoneRef;
    } 
    this.player.unmapObjects(null);
    byte b = 0;
    while (b < paramInt && boneRef2 != null) {
      if (Calculator.distanceBetween(f3, f1, paramFloat1, paramFloat2) <= this.tolerance)
        return; 
      paramBoneRef.angle += Calculator.angleDifference(Calculator.angleBetween(boneRef1.position.x, boneRef1.position.y, paramFloat1, paramFloat2), Calculator.angleBetween(boneRef1.position.x, boneRef1.position.y, f3, f1));
      boneRef2 = boneRef2.parent;
      if (boneRef2 != null && b < paramInt - 1) {
        Timeline.Key.Object object3 = this.player.tweenedKeys[boneRef2.timeline].object();
        Timeline.Key.Object object4 = this.player.unmappedTweenedKeys[boneRef2.timeline].object();
        object3.angle -= object4.angle;
      } else {
        paramBoneRef = null;
      } 
      this.player.unmapObjects(null);
      f3 = object1.position.x + (float)Math.cos(Math.toRadians(object1.angle)) * f2;
      float f = object1.position.y;
      f1 = (float)Math.sin(Math.toRadians(object1.angle));
      b++;
      f1 = f + f1 * f2;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/CCDResolver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */