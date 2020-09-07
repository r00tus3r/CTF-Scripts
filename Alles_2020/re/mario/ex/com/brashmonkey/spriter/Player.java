package com.brashmonkey.spriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class Player {
  private float angle;
  
  Animation animation;
  
  public final List<Attachment> attachments = new ArrayList();
  
  private BoneIterator boneIterator = new BoneIterator();
  
  public Entity.CharacterMap[] characterMaps;
  
  public boolean copyObjects = true;
  
  private Mainline.Key currentKey;
  
  private boolean dirty = true;
  
  protected Entity entity;
  
  private List<PlayerListener> listeners = new ArrayList();
  
  private final HashMap<Timeline.Key.Object, Timeline.Key> objToTimeline = new HashMap();
  
  private ObjectIterator objectIterator = new ObjectIterator();
  
  private final Point pivot = new Point(0.0F, 0.0F);
  
  private final Point position = new Point(0.0F, 0.0F);
  
  public final Box prevBBox = new Box();
  
  private Mainline.Key prevKey;
  
  private Rectangle rect = new Rectangle(0.0F, 0.0F, 0.0F, 0.0F);
  
  Timeline.Key.Bone root = new Timeline.Key.Bone(new Point(0.0F, 0.0F));
  
  public int speed = 15;
  
  private Timeline.Key[] tempTweenedKeys;
  
  private Timeline.Key[] tempUnmappedTweenedKeys;
  
  int time;
  
  Timeline.Key[] tweenedKeys;
  
  Timeline.Key[] unmappedTweenedKeys;
  
  public Player(Entity paramEntity) { setEntity(paramEntity); }
  
  private void calcBoundingRectangle(Mainline.Key.BoneRef paramBoneRef) {
    Mainline.Key.BoneRef[] arrayOfBoneRef = (getCurrentKey()).boneRefs;
    int i = arrayOfBoneRef.length;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      Mainline.Key.BoneRef boneRef = arrayOfBoneRef[b2];
      if (boneRef.parent == paramBoneRef || paramBoneRef == null) {
        Timeline.Key.Object object = this.unmappedTweenedKeys[boneRef.timeline].object();
        this.prevBBox.calcFor(object, (this.animation.getTimeline(boneRef.timeline)).objectInfo);
        Rectangle.setBiggerRectangle(this.rect, this.prevBBox.getBoundingRect(), this.rect);
        calcBoundingRectangle(boneRef);
      } 
    } 
    Mainline.Key.ObjectRef[] arrayOfObjectRef = (getCurrentKey()).objectRefs;
    i = arrayOfObjectRef.length;
    for (b2 = b1; b2 < i; b2++) {
      Mainline.Key.ObjectRef objectRef = arrayOfObjectRef[b2];
      if (objectRef.parent == paramBoneRef) {
        Timeline.Key.Object object = this.unmappedTweenedKeys[objectRef.timeline].object();
        this.prevBBox.calcFor(object, (this.animation.getTimeline(objectRef.timeline)).objectInfo);
        Rectangle.setBiggerRectangle(this.rect, this.prevBBox.getBoundingRect(), this.rect);
      } 
    } 
  }
  
  private void copyObjects() {
    for (byte b = 0; b < this.animation.tweenedKeys.length; b++) {
      (this.tweenedKeys[b]).active = (this.animation.tweenedKeys[b]).active;
      (this.unmappedTweenedKeys[b]).active = (this.animation.unmappedTweenedKeys[b]).active;
      this.tweenedKeys[b].object().set(this.animation.tweenedKeys[b].object());
      this.unmappedTweenedKeys[b].object().set(this.animation.unmappedTweenedKeys[b].object());
    } 
  }
  
  private void increaseTime() {
    this.time += this.speed;
    if (this.time > this.animation.length) {
      this.time -= this.animation.length;
      Iterator iterator = this.listeners.iterator();
      while (iterator.hasNext())
        ((PlayerListener)iterator.next()).animationFinished(this.animation); 
    } 
    if (this.time < 0) {
      Iterator iterator = this.listeners.iterator();
      while (iterator.hasNext())
        ((PlayerListener)iterator.next()).animationFinished(this.animation); 
      this.time += this.animation.length;
    } 
  }
  
  private void updateRoot() {
    Timeline.Key.Bone bone = this.root;
    bone.angle = this.angle;
    bone.position.set(this.pivot);
    this.root.position.rotate(this.angle);
    this.root.position.translate(this.position);
    this.dirty = false;
  }
  
  public void addListener(PlayerListener paramPlayerListener) { this.listeners.add(paramPlayerListener); }
  
  public Iterator<Timeline.Key.Bone> boneIterator() { return boneIterator((getCurrentKey()).boneRefs[0]); }
  
  public Iterator<Timeline.Key.Bone> boneIterator(Mainline.Key.BoneRef paramBoneRef) {
    this.boneIterator.index = paramBoneRef.id;
    return this.boneIterator;
  }
  
  public boolean collidesFor(Timeline.Key.Bone paramBone, float paramFloat1, float paramFloat2) {
    Entity.ObjectInfo objectInfo = getObjectInfoFor(paramBone);
    this.prevBBox.calcFor(paramBone, objectInfo);
    return this.prevBBox.collides(paramBone, objectInfo, paramFloat1, paramFloat2);
  }
  
  public boolean collidesFor(Timeline.Key.Bone paramBone, Point paramPoint) { return collidesFor(paramBone, paramPoint.x, paramPoint.y); }
  
  public boolean collidesFor(Timeline.Key.Bone paramBone, Rectangle paramRectangle) {
    Entity.ObjectInfo objectInfo = getObjectInfoFor(paramBone);
    this.prevBBox.calcFor(paramBone, objectInfo);
    return this.prevBBox.isInside(paramRectangle);
  }
  
  public Player flip(boolean paramBoolean1, boolean paramBoolean2) {
    if (paramBoolean1)
      flipX(); 
    if (paramBoolean2)
      flipY(); 
    return this;
  }
  
  public Player flipX() {
    Point point = this.root.scale;
    point.x *= -1.0F;
    return this;
  }
  
  public Player flipY() {
    Point point = this.root.scale;
    point.y *= -1.0F;
    return this;
  }
  
  public int flippedX() { return (int)Math.signum(this.root.scale.x); }
  
  public int flippedY() { return (int)Math.signum(this.root.scale.y); }
  
  public float getAngle() { return this.angle; }
  
  public Animation getAnimation() { return this.animation; }
  
  public Timeline.Key.Bone getBone(int paramInt) { return this.unmappedTweenedKeys[(getCurrentKey().getBoneRef(paramInt)).timeline].object(); }
  
  public Timeline.Key.Bone getBone(String paramString) { return this.unmappedTweenedKeys[(this.animation.getTimeline(paramString)).id].object(); }
  
  public int getBoneIndex(String paramString) {
    for (Mainline.Key.BoneRef boneRef : (getCurrentKey()).boneRefs) {
      if ((this.animation.getTimeline(boneRef.timeline)).name.equals(paramString))
        return boneRef.id; 
    } 
    return -1;
  }
  
  public Mainline.Key.BoneRef getBoneRef(Timeline.Key.Bone paramBone) { return getCurrentKey().getBoneRefTimeline(((Timeline.Key)this.objToTimeline.get(paramBone)).id); }
  
  public Rectangle getBoudingRectangle(Timeline.Key.Bone paramBone) {
    Mainline.Key.BoneRef boneRef;
    if (paramBone == null) {
      paramBone = null;
    } else {
      boneRef = getBoneRef(paramBone);
    } 
    return getBoundingRectangle(boneRef);
  }
  
  public Rectangle getBoundingRectangle(Mainline.Key.BoneRef paramBoneRef) {
    Timeline.Key.Object object;
    if (paramBoneRef == null) {
      object = this.root;
    } else {
      object = this.unmappedTweenedKeys[paramBoneRef.timeline].object();
    } 
    this.rect.set(object.position.x, object.position.y, object.position.x, object.position.y);
    calcBoundingRectangle(paramBoneRef);
    this.rect.calculateSize();
    return this.rect;
  }
  
  public Box getBox(Timeline.Key.Bone paramBone) {
    Entity.ObjectInfo objectInfo = getObjectInfoFor(paramBone);
    this.prevBBox.calcFor(paramBone, objectInfo);
    return this.prevBBox;
  }
  
  public Mainline.Key getCurrentKey() { return this.currentKey; }
  
  public Entity getEntity() { return this.entity; }
  
  public Timeline.Key getKeyFor(Timeline.Key.Bone paramBone) { return (Timeline.Key)this.objToTimeline.get(paramBone); }
  
  public String getNameFor(Timeline.Key.Bone paramBone) { return (this.animation.getTimeline(((Timeline.Key)this.objToTimeline.get(paramBone)).id)).name; }
  
  public Timeline.Key.Object getObject(int paramInt) { return this.unmappedTweenedKeys[(getCurrentKey().getObjectRef(paramInt)).timeline].object(); }
  
  public Timeline.Key.Object getObject(String paramString) { return this.unmappedTweenedKeys[(this.animation.getTimeline(paramString)).id].object(); }
  
  public int getObjectIndex(String paramString) {
    for (Mainline.Key.ObjectRef objectRef : (getCurrentKey()).objectRefs) {
      if ((this.animation.getTimeline(objectRef.timeline)).name.equals(paramString))
        return objectRef.id; 
    } 
    return -1;
  }
  
  public Entity.ObjectInfo getObjectInfoFor(Timeline.Key.Bone paramBone) { return (this.animation.getTimeline(((Timeline.Key)this.objToTimeline.get(paramBone)).id)).objectInfo; }
  
  public Mainline.Key.ObjectRef getObjectRef(Timeline.Key.Object paramObject) { return getCurrentKey().getObjectRefTimeline(((Timeline.Key)this.objToTimeline.get(paramObject)).id); }
  
  public float getPivotX() { return this.pivot.x; }
  
  public float getPivotY() { return this.pivot.y; }
  
  public float getScale() { return this.root.scale.x; }
  
  public int getTime() { return this.time; }
  
  public float getX() { return this.position.x; }
  
  public float getY() { return this.position.y; }
  
  public Iterator<Timeline.Key.Object> objectIterator() { return objectIterator((getCurrentKey()).objectRefs[0]); }
  
  public Iterator<Timeline.Key.Object> objectIterator(Mainline.Key.ObjectRef paramObjectRef) {
    this.objectIterator.index = paramObjectRef.id;
    return this.objectIterator;
  }
  
  public void removeListener(PlayerListener paramPlayerListener) { this.listeners.remove(paramPlayerListener); }
  
  public Player rotate(float paramFloat) { return setAngle(paramFloat + this.angle); }
  
  public Player scale(float paramFloat) {
    this.root.scale.scale(paramFloat, paramFloat);
    return this;
  }
  
  public Player setAngle(float paramFloat) {
    this.dirty = true;
    this.angle = paramFloat;
    return this;
  }
  
  public void setAnimation(int paramInt) { setAnimation(this.entity.getAnimation(paramInt)); }
  
  public void setAnimation(Animation paramAnimation) {
    Animation animation1 = this.animation;
    if (paramAnimation == animation1)
      return; 
    if (paramAnimation != null) {
      if (this.entity.containsAnimation(paramAnimation) || paramAnimation.id == -1) {
        if (paramAnimation != this.animation)
          this.time = 0; 
        this.animation = paramAnimation;
        int i = this.time;
        this.time = 0;
        update();
        this.time = i;
        Iterator iterator = this.listeners.iterator();
        while (iterator.hasNext())
          ((PlayerListener)iterator.next()).animationChanged(animation1, paramAnimation); 
        return;
      } 
      throw new SpriterException("animation has to be in the same entity as the current set one!");
    } 
    SpriterException spriterException = new SpriterException("animation can not be null!");
    throw spriterException;
  }
  
  public void setAnimation(String paramString) { setAnimation(this.entity.getAnimation(paramString)); }
  
  public void setBone(String paramString, float paramFloat) {
    Timeline.Key.Bone bone = getBone(paramString);
    setBone(paramString, bone.position.x, bone.position.y, paramFloat);
  }
  
  public void setBone(String paramString, float paramFloat1, float paramFloat2) { setBone(paramString, paramFloat1, paramFloat2, (getBone(paramString)).angle); }
  
  public void setBone(String paramString, float paramFloat1, float paramFloat2, float paramFloat3) {
    Timeline.Key.Bone bone = getBone(paramString);
    setBone(paramString, paramFloat1, paramFloat2, paramFloat3, bone.scale.x, bone.scale.y);
  }
  
  public void setBone(String paramString, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    Mainline.Key.BoneRef boneRef;
    int i = getBoneIndex(paramString);
    if (i != -1) {
      boneRef = getCurrentKey().getBoneRef(i);
      getBone(i).set(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, 0.0F, 0.0F);
      unmapObjects(boneRef);
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("No bone found of name \"");
    stringBuilder.append(boneRef);
    stringBuilder.append("\"");
    throw new SpriterException(stringBuilder.toString());
  }
  
  public void setBone(String paramString, Point paramPoint) { setBone(paramString, paramPoint.x, paramPoint.y); }
  
  public void setBone(String paramString, Point paramPoint, float paramFloat) {
    Timeline.Key.Bone bone = getBone(paramString);
    setBone(paramString, paramPoint.x, paramPoint.y, paramFloat, bone.scale.x, bone.scale.y);
  }
  
  public void setBone(String paramString, Point paramPoint1, float paramFloat, Point paramPoint2) { setBone(paramString, paramPoint1.x, paramPoint1.y, paramFloat, paramPoint2.x, paramPoint2.y); }
  
  public void setBone(String paramString, Timeline.Key.Bone paramBone) { setBone(paramString, paramBone.position, paramBone.angle, paramBone.scale); }
  
  public void setEntity(Entity paramEntity) {
    if (paramEntity != null) {
      this.entity = paramEntity;
      int i = paramEntity.getAnimationWithMostTimelines().timelines();
      this.tweenedKeys = new Timeline.Key[i];
      this.unmappedTweenedKeys = new Timeline.Key[i];
      for (byte b = 0; b < i; b++) {
        Timeline.Key key1 = new Timeline.Key(b);
        Timeline.Key key2 = new Timeline.Key(b);
        key1.setObject(new Timeline.Key.Object(new Point(0.0F, 0.0F)));
        key2.setObject(new Timeline.Key.Object(new Point(0.0F, 0.0F)));
        this.tweenedKeys[b] = key1;
        this.unmappedTweenedKeys[b] = key2;
        this.objToTimeline.put(key2.object(), key2);
      } 
      this.tempTweenedKeys = this.tweenedKeys;
      this.tempUnmappedTweenedKeys = this.unmappedTweenedKeys;
      setAnimation(paramEntity.getAnimation(0));
      return;
    } 
    SpriterException spriterException = new SpriterException("entity can not be null!");
    throw spriterException;
  }
  
  public void setObject(String paramString, float paramFloat) {
    Timeline.Key.Object object = getObject(paramString);
    setObject(paramString, object.position.x, object.position.y, paramFloat);
  }
  
  public void setObject(String paramString, float paramFloat1, float paramFloat2) { setObject(paramString, paramFloat1, paramFloat2, (getObject(paramString)).angle); }
  
  public void setObject(String paramString, float paramFloat1, float paramFloat2, float paramFloat3) {
    Timeline.Key.Object object = getObject(paramString);
    setObject(paramString, paramFloat1, paramFloat2, paramFloat3, object.scale.x, object.scale.y);
  }
  
  public void setObject(String paramString, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    Timeline.Key.Object object = getObject(paramString);
    setObject(paramString, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, object.pivot.x, object.pivot.y, object.alpha, object.ref.folder, object.ref.file);
  }
  
  public void setObject(String paramString, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, int paramInt1, int paramInt2) {
    Mainline.Key.ObjectRef objectRef;
    int i = getObjectIndex(paramString);
    if (i != -1) {
      objectRef = getCurrentKey().getObjectRef(i);
      getObject(i).set(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramInt1, paramInt2);
      unmapObjects(objectRef);
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("No object found for name \"");
    stringBuilder.append(objectRef);
    stringBuilder.append("\"");
    throw new SpriterException(stringBuilder.toString());
  }
  
  public void setObject(String paramString, float paramFloat, int paramInt1, int paramInt2) {
    Timeline.Key.Object object = getObject(paramString);
    setObject(paramString, object.position.x, object.position.y, object.angle, object.scale.x, object.scale.y, object.pivot.x, object.pivot.y, paramFloat, paramInt1, paramInt2);
  }
  
  public void setObject(String paramString, Point paramPoint) { setObject(paramString, paramPoint.x, paramPoint.y); }
  
  public void setObject(String paramString, Point paramPoint, float paramFloat) {
    Timeline.Key.Object object = getObject(paramString);
    setObject(paramString, paramPoint.x, paramPoint.y, paramFloat, object.scale.x, object.scale.y);
  }
  
  public void setObject(String paramString, Point paramPoint1, float paramFloat1, Point paramPoint2, Point paramPoint3, float paramFloat2, FileReference paramFileReference) { setObject(paramString, paramPoint1.x, paramPoint1.y, paramFloat1, paramPoint2.x, paramPoint2.y, paramPoint3.x, paramPoint3.y, paramFloat2, paramFileReference.folder, paramFileReference.file); }
  
  public void setObject(String paramString, Timeline.Key.Object paramObject) { setObject(paramString, paramObject.position, paramObject.angle, paramObject.scale, paramObject.pivot, paramObject.alpha, paramObject.ref); }
  
  public Player setPivot(float paramFloat1, float paramFloat2) {
    this.dirty = true;
    this.pivot.set(paramFloat1, paramFloat2);
    return this;
  }
  
  public Player setPivot(Point paramPoint) { return setPivot(paramPoint.x, paramPoint.y); }
  
  public Player setPosition(float paramFloat1, float paramFloat2) {
    this.dirty = true;
    this.position.set(paramFloat1, paramFloat2);
    return this;
  }
  
  public Player setPosition(Point paramPoint) { return setPosition(paramPoint.x, paramPoint.y); }
  
  public Player setScale(float paramFloat) {
    this.root.scale.set(flippedX() * paramFloat, paramFloat * flippedY());
    return this;
  }
  
  public Player setTime(int paramInt) {
    this.time = paramInt;
    paramInt = this.speed;
    this.speed = 0;
    increaseTime();
    this.speed = paramInt;
    return this;
  }
  
  public Player translate(Point paramPoint) { return translatePosition(paramPoint.x, paramPoint.y); }
  
  public Player translatePivot(float paramFloat1, float paramFloat2) { return setPivot(this.pivot.x + paramFloat1, this.pivot.y + paramFloat2); }
  
  public Player translatePivot(Point paramPoint) { return translatePivot(paramPoint.x, paramPoint.y); }
  
  public Player translatePosition(float paramFloat1, float paramFloat2) { return setPosition(this.position.x + paramFloat1, this.position.y + paramFloat2); }
  
  public void unmapObjects(Mainline.Key.BoneRef paramBoneRef) {
    if (paramBoneRef == null) {
      null = -1;
    } else {
      null = paramBoneRef.id - 1;
    } 
    while (++null < (getCurrentKey()).boneRefs.length) {
      Timeline.Key.Object object;
      Mainline.Key.BoneRef boneRef = getCurrentKey().getBoneRef(null);
      if (boneRef.parent != paramBoneRef && paramBoneRef != null)
        continue; 
      if (boneRef.parent == null) {
        object = this.root;
      } else {
        object = this.unmappedTweenedKeys[boneRef.parent.timeline].object();
      } 
      this.unmappedTweenedKeys[boneRef.timeline].object().set(this.tweenedKeys[boneRef.timeline].object());
      this.unmappedTweenedKeys[boneRef.timeline].object().unmap(object);
      unmapObjects(boneRef);
    } 
    for (Mainline.Key.ObjectRef objectRef : (getCurrentKey()).objectRefs) {
      if (objectRef.parent == paramBoneRef || paramBoneRef == null) {
        Timeline.Key.Object object;
        if (objectRef.parent == null) {
          object = this.root;
        } else {
          object = this.unmappedTweenedKeys[objectRef.parent.timeline].object();
        } 
        this.unmappedTweenedKeys[objectRef.timeline].object().set(this.tweenedKeys[objectRef.timeline].object());
        this.unmappedTweenedKeys[objectRef.timeline].object().unmap(object);
      } 
    } 
  }
  
  public void update() {
    Iterator iterator = this.listeners.iterator();
    while (iterator.hasNext())
      ((PlayerListener)iterator.next()).preProcess(this); 
    if (this.dirty)
      updateRoot(); 
    this.animation.update(this.time, this.root);
    this.currentKey = this.animation.currentKey;
    if (this.prevKey != this.currentKey) {
      iterator = this.listeners.iterator();
      while (iterator.hasNext())
        ((PlayerListener)iterator.next()).mainlineKeyChanged(this.prevKey, this.currentKey); 
      this.prevKey = this.currentKey;
    } 
    if (this.copyObjects) {
      this.tweenedKeys = this.tempTweenedKeys;
      this.unmappedTweenedKeys = this.tempUnmappedTweenedKeys;
      copyObjects();
    } else {
      this.tweenedKeys = this.animation.tweenedKeys;
      this.unmappedTweenedKeys = this.animation.unmappedTweenedKeys;
    } 
    iterator = this.attachments.iterator();
    while (iterator.hasNext())
      ((Attachment)iterator.next()).update(); 
    iterator = this.listeners.iterator();
    while (iterator.hasNext())
      ((PlayerListener)iterator.next()).postProcess(this); 
    increaseTime();
  }
  
  public static abstract class Attachment extends Timeline.Key.Bone {
    private float angleTemp;
    
    private Timeline.Key.Bone parent;
    
    private final Point positionTemp = new Point();
    
    private final Point scaleTemp = new Point();
    
    public Attachment(Timeline.Key.Bone param1Bone) { setParent(param1Bone); }
    
    public Timeline.Key.Bone getParent() { return this.parent; }
    
    protected abstract void setAngle(float param1Float);
    
    public void setParent(Timeline.Key.Bone param1Bone) {
      if (param1Bone != null) {
        this.parent = param1Bone;
        return;
      } 
      throw new SpriterException("The parent cannot be null!");
    }
    
    protected abstract void setPosition(float param1Float1, float param1Float2);
    
    protected abstract void setScale(float param1Float1, float param1Float2);
    
    final void update() {
      this.positionTemp.set(this.position);
      this.scaleTemp.set(this.scale);
      this.angleTemp = this.angle;
      unmap(this.parent);
      setPosition(this.position.x, this.position.y);
      setScale(this.scale.x, this.scale.y);
      setAngle(this.angle);
      this.position.set(this.positionTemp);
      this.scale.set(this.scaleTemp);
      this.angle = this.angleTemp;
    }
  }
  
  class BoneIterator extends Object implements Iterator<Timeline.Key.Bone> {
    int index = 0;
    
    public boolean hasNext() {
      boolean bool;
      if (this.index < (this.this$0.getCurrentKey()).boneRefs.length) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public Timeline.Key.Bone next() {
      Timeline.Key[] arrayOfKey = Player.this.unmappedTweenedKeys;
      Mainline.Key.BoneRef[] arrayOfBoneRef = (this.this$0.getCurrentKey()).boneRefs;
      int i = this.index;
      this.index = i + 1;
      return arrayOfKey[(arrayOfBoneRef[i]).timeline].object();
    }
    
    public void remove() { throw new SpriterException("remove() is not supported by this iterator!"); }
  }
  
  class ObjectIterator extends Object implements Iterator<Timeline.Key.Object> {
    int index = 0;
    
    public boolean hasNext() {
      boolean bool;
      if (this.index < (this.this$0.getCurrentKey()).objectRefs.length) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public Timeline.Key.Object next() {
      Timeline.Key[] arrayOfKey = Player.this.unmappedTweenedKeys;
      Mainline.Key.ObjectRef[] arrayOfObjectRef = (this.this$0.getCurrentKey()).objectRefs;
      int i = this.index;
      this.index = i + 1;
      return arrayOfKey[(arrayOfObjectRef[i]).timeline].object();
    }
    
    public void remove() { throw new SpriterException("remove() is not supported by this iterator!"); }
  }
  
  public static interface PlayerListener {
    void animationChanged(Animation param1Animation1, Animation param1Animation2);
    
    void animationFinished(Animation param1Animation);
    
    void mainlineKeyChanged(Mainline.Key param1Key1, Mainline.Key param1Key2);
    
    void postProcess(Player param1Player);
    
    void preProcess(Player param1Player);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Player.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */