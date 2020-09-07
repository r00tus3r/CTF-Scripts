package com.brashmonkey.spriter;

import java.util.HashMap;
import java.util.Map;

public abstract class IKResolver {
  protected HashMap<IKObject, Mainline.Key.BoneRef> ikMap = new HashMap();
  
  protected Player player;
  
  protected float tolerance = 5.0F;
  
  public IKResolver(Player paramPlayer) { setPlayer(paramPlayer); }
  
  public Player getPlayer() { return this.player; }
  
  public float getTolerance() { return this.tolerance; }
  
  public void mapIKObject(IKObject paramIKObject, Mainline.Key.BoneRef paramBoneRef) { this.ikMap.put(paramIKObject, paramBoneRef); }
  
  public void mapIKObject(IKObject paramIKObject, Timeline.Key.Bone paramBone) { this.ikMap.put(paramIKObject, this.player.getBoneRef(paramBone)); }
  
  public void resolve() {
    for (Map.Entry entry : this.ikMap.entrySet()) {
      for (byte b = 0; b < ((IKObject)entry.getKey()).iterations; b++)
        resolve(((IKObject)entry.getKey()).x, ((IKObject)entry.getKey()).y, ((IKObject)entry.getKey()).chainLength, (Mainline.Key.BoneRef)entry.getValue()); 
    } 
  }
  
  protected abstract void resolve(float paramFloat1, float paramFloat2, int paramInt, Mainline.Key.BoneRef paramBoneRef);
  
  public void setPlayer(Player paramPlayer) {
    if (paramPlayer != null) {
      this.player = paramPlayer;
      return;
    } 
    throw new SpriterException("player cannot be null!");
  }
  
  public void setTolerance(float paramFloat) { this.tolerance = paramFloat; }
  
  public void unmapIKObject(IKObject paramIKObject) { this.ikMap.remove(paramIKObject); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/IKResolver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */