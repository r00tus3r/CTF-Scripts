package com.brashmonkey.spriter;

import java.util.Iterator;

public abstract class Drawer<R> extends Object {
  protected Loader<R> loader;
  
  public float pointRadius = 5.0F;
  
  public Drawer(Loader<R> paramLoader) { this.loader = paramLoader; }
  
  public abstract void circle(float paramFloat1, float paramFloat2, float paramFloat3);
  
  public void draw(Player paramPlayer) { draw(paramPlayer, paramPlayer.characterMaps); }
  
  public void draw(Player paramPlayer, Entity.CharacterMap[] paramArrayOfCharacterMap) { draw(paramPlayer.objectIterator(), paramArrayOfCharacterMap); }
  
  public abstract void draw(Timeline.Key.Object paramObject);
  
  public void draw(Iterator<Timeline.Key.Object> paramIterator, Entity.CharacterMap[] paramArrayOfCharacterMap) {
    while (paramIterator.hasNext()) {
      Timeline.Key.Object object = (Timeline.Key.Object)paramIterator.next();
      if (object.ref.hasFile()) {
        if (paramArrayOfCharacterMap != null) {
          int i = paramArrayOfCharacterMap.length;
          for (byte b = 0; b < i; b++) {
            Entity.CharacterMap characterMap = paramArrayOfCharacterMap[b];
            if (characterMap != null)
              object.ref.set(characterMap.get(object.ref)); 
          } 
        } 
        draw(object);
      } 
    } 
  }
  
  public void drawBone(Timeline.Key.Bone paramBone, Dimension paramDimension) {
    float f1 = paramDimension.height / 2.0F;
    float f2 = paramBone.position.x + (float)Math.cos(Math.toRadians(paramBone.angle)) * paramDimension.height;
    float f3 = paramBone.position.y + (float)Math.sin(Math.toRadians(paramBone.angle)) * paramDimension.height;
    float f4 = (float)Math.cos(Math.toRadians((paramBone.angle + 90.0F))) * f1 * paramBone.scale.y;
    float f5 = (float)Math.sin(Math.toRadians((paramBone.angle + 90.0F))) * f1 * paramBone.scale.y;
    float f6 = paramBone.position.x + (float)Math.cos(Math.toRadians(paramBone.angle)) * paramDimension.width * paramBone.scale.x;
    f1 = paramBone.position.y + (float)Math.sin(Math.toRadians(paramBone.angle)) * paramDimension.width * paramBone.scale.x;
    float f7 = f2 + f4;
    float f8 = f3 + f5;
    line(paramBone.position.x, paramBone.position.y, f7, f8);
    line(f7, f8, f6, f1);
    f2 -= f4;
    f3 -= f5;
    line(paramBone.position.x, paramBone.position.y, f2, f3);
    line(f2, f3, f6, f1);
    line(paramBone.position.x, paramBone.position.y, f6, f1);
  }
  
  public void drawBoneBoxes(Player paramPlayer) { drawBoneBoxes(paramPlayer, paramPlayer.boneIterator()); }
  
  public void drawBoneBoxes(Player paramPlayer, Iterator<Timeline.Key.Bone> paramIterator) {
    while (paramIterator.hasNext())
      drawBox(paramPlayer.getBox((Timeline.Key.Bone)paramIterator.next())); 
  }
  
  public void drawBones(Player paramPlayer) {
    setColor(1.0F, 0.0F, 0.0F, 1.0F);
    Iterator iterator = paramPlayer.boneIterator();
    while (iterator.hasNext()) {
      Timeline.Key.Bone bone = (Timeline.Key.Bone)iterator.next();
      if (!(paramPlayer.getKeyFor(bone)).active)
        continue; 
      drawBone(bone, (paramPlayer.getObjectInfoFor(bone)).size);
    } 
  }
  
  public void drawBox(Box paramBox) {
    line((paramBox.points[0]).x, (paramBox.points[0]).y, (paramBox.points[1]).x, (paramBox.points[1]).y);
    line((paramBox.points[1]).x, (paramBox.points[1]).y, (paramBox.points[3]).x, (paramBox.points[3]).y);
    line((paramBox.points[3]).x, (paramBox.points[3]).y, (paramBox.points[2]).x, (paramBox.points[2]).y);
    line((paramBox.points[2]).x, (paramBox.points[2]).y, (paramBox.points[0]).x, (paramBox.points[0]).y);
  }
  
  public void drawBoxes(Player paramPlayer) {
    setColor(0.0F, 1.0F, 0.0F, 1.0F);
    drawBoneBoxes(paramPlayer);
    drawObjectBoxes(paramPlayer);
    drawPoints(paramPlayer);
  }
  
  public void drawObjectBoxes(Player paramPlayer) { drawObjectBoxes(paramPlayer, paramPlayer.objectIterator()); }
  
  public void drawObjectBoxes(Player paramPlayer, Iterator<Timeline.Key.Object> paramIterator) {
    while (paramIterator.hasNext())
      drawBox(paramPlayer.getBox((Timeline.Key.Object)paramIterator.next())); 
  }
  
  public void drawPoints(Player paramPlayer) { drawPoints(paramPlayer, paramPlayer.objectIterator()); }
  
  public void drawPoints(Player paramPlayer, Iterator<Timeline.Key.Object> paramIterator) {
    while (paramIterator.hasNext()) {
      Timeline.Key.Object object = (Timeline.Key.Object)paramIterator.next();
      if ((paramPlayer.getObjectInfoFor(object)).type == Entity.ObjectType.Point) {
        float f1 = object.position.x;
        double d1 = Math.cos(Math.toRadians(object.angle));
        double d2 = this.pointRadius;
        Double.isNaN(d2);
        float f2 = (float)(d1 * d2);
        float f3 = object.position.y;
        d1 = Math.sin(Math.toRadians(object.angle));
        d2 = this.pointRadius;
        Double.isNaN(d2);
        float f4 = (float)(d1 * d2);
        circle(object.position.x, object.position.y, this.pointRadius);
        line(object.position.x, object.position.y, f1 + f2, f3 + f4);
      } 
    } 
  }
  
  public void drawRectangle(Rectangle paramRectangle) { rectangle(paramRectangle.left, paramRectangle.bottom, paramRectangle.size.width, paramRectangle.size.height); }
  
  public abstract void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public abstract void rectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public abstract void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public void setLoader(Loader<R> paramLoader) {
    if (paramLoader != null) {
      this.loader = paramLoader;
      return;
    } 
    throw new SpriterException("The loader instance can not be null!");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Drawer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */