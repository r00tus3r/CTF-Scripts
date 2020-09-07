package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Affine2;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.utils.SnapshotArray;

public class Group extends Actor implements Cullable {
  private static final Vector2 tmp = new Vector2();
  
  final SnapshotArray<Actor> children = new SnapshotArray(true, 4, Actor.class);
  
  private final Matrix4 computedTransform = new Matrix4();
  
  private Rectangle cullingArea;
  
  private final Matrix4 oldTransform = new Matrix4();
  
  boolean transform = true;
  
  private final Affine2 worldTransform = new Affine2();
  
  public void act(float paramFloat) {
    super.act(paramFloat);
    Actor[] arrayOfActor = (Actor[])this.children.begin();
    int i = this.children.size;
    for (byte b = 0; b < i; b++)
      arrayOfActor[b].act(paramFloat); 
    this.children.end();
  }
  
  public void addActor(Actor paramActor) {
    if (paramActor.parent != null) {
      if (paramActor.parent == this)
        return; 
      paramActor.parent.removeActor(paramActor, false);
    } 
    this.children.add(paramActor);
    paramActor.setParent(this);
    paramActor.setStage(getStage());
    childrenChanged();
  }
  
  public void addActorAfter(Actor paramActor1, Actor paramActor2) {
    if (paramActor2.parent != null) {
      if (paramActor2.parent == this)
        return; 
      paramActor2.parent.removeActor(paramActor2, false);
    } 
    int i = this.children.indexOf(paramActor1, true);
    if (i == this.children.size) {
      this.children.add(paramActor2);
    } else {
      this.children.insert(i + 1, paramActor2);
    } 
    paramActor2.setParent(this);
    paramActor2.setStage(getStage());
    childrenChanged();
  }
  
  public void addActorAt(int paramInt, Actor paramActor) {
    if (paramActor.parent != null) {
      if (paramActor.parent == this)
        return; 
      paramActor.parent.removeActor(paramActor, false);
    } 
    if (paramInt >= this.children.size) {
      this.children.add(paramActor);
    } else {
      this.children.insert(paramInt, paramActor);
    } 
    paramActor.setParent(this);
    paramActor.setStage(getStage());
    childrenChanged();
  }
  
  public void addActorBefore(Actor paramActor1, Actor paramActor2) {
    if (paramActor2.parent != null) {
      if (paramActor2.parent == this)
        return; 
      paramActor2.parent.removeActor(paramActor2, false);
    } 
    int i = this.children.indexOf(paramActor1, true);
    this.children.insert(i, paramActor2);
    paramActor2.setParent(this);
    paramActor2.setStage(getStage());
    childrenChanged();
  }
  
  protected void applyTransform(Batch paramBatch, Matrix4 paramMatrix4) {
    this.oldTransform.set(paramBatch.getTransformMatrix());
    paramBatch.setTransformMatrix(paramMatrix4);
  }
  
  protected void applyTransform(ShapeRenderer paramShapeRenderer, Matrix4 paramMatrix4) {
    this.oldTransform.set(paramShapeRenderer.getTransformMatrix());
    paramShapeRenderer.setTransformMatrix(paramMatrix4);
    paramShapeRenderer.flush();
  }
  
  protected void childrenChanged() {}
  
  public void clear() {
    super.clear();
    clearChildren();
  }
  
  public void clearChildren() {
    Actor[] arrayOfActor = (Actor[])this.children.begin();
    int i = this.children.size;
    for (byte b = 0; b < i; b++) {
      Actor actor = arrayOfActor[b];
      actor.setStage(null);
      actor.setParent(null);
    } 
    this.children.end();
    this.children.clear();
    childrenChanged();
  }
  
  protected Matrix4 computeTransform() {
    Affine2 affine2 = this.worldTransform;
    float f1 = this.originX;
    float f2 = this.originY;
    affine2.setToTrnRotScl(this.x + f1, this.y + f2, this.rotation, this.scaleX, this.scaleY);
    if (f1 != 0.0F || f2 != 0.0F)
      affine2.translate(-f1, -f2); 
    Group group;
    for (group = this.parent; group != null && !group.transform; group = group.parent);
    if (group != null)
      affine2.preMul(group.worldTransform); 
    this.computedTransform.set(affine2);
    return this.computedTransform;
  }
  
  public Group debugAll() {
    setDebug(true, true);
    return this;
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    if (this.transform)
      applyTransform(paramBatch, computeTransform()); 
    drawChildren(paramBatch, paramFloat);
    if (this.transform)
      resetTransform(paramBatch); 
  }
  
  protected void drawChildren(Batch paramBatch, float paramFloat) {
    float f = this.color.a * paramFloat;
    SnapshotArray snapshotArray = this.children;
    Actor[] arrayOfActor = (Actor[])snapshotArray.begin();
    Rectangle rectangle = this.cullingArea;
    int i = 0;
    int j = 0;
    int k = 0;
    int m = 0;
    if (rectangle != null) {
      float f1 = rectangle.x;
      float f2 = rectangle.width + f1;
      float f3 = rectangle.y;
      paramFloat = rectangle.height + f3;
      if (this.transform) {
        i = snapshotArray.size;
        while (m < i) {
          Actor actor = arrayOfActor[m];
          if (actor.isVisible()) {
            float f4 = actor.x;
            float f5 = actor.y;
            if (f4 <= f2 && f5 <= paramFloat && f4 + actor.width >= f1 && f5 + actor.height >= f3)
              actor.draw(paramBatch, f); 
          } 
          m++;
        } 
      } else {
        float f5 = this.x;
        float f4 = this.y;
        this.x = 0.0F;
        this.y = 0.0F;
        j = snapshotArray.size;
        for (m = i; m < j; m++) {
          Actor actor = arrayOfActor[m];
          if (actor.isVisible()) {
            float f6 = actor.x;
            float f7 = actor.y;
            if (f6 <= f2 && f7 <= paramFloat && actor.width + f6 >= f1 && actor.height + f7 >= f3) {
              actor.x = f6 + f5;
              actor.y = f7 + f4;
              actor.draw(paramBatch, f);
              actor.x = f6;
              actor.y = f7;
            } 
          } 
        } 
        this.x = f5;
        this.y = f4;
      } 
    } else if (this.transform) {
      i = snapshotArray.size;
      for (m = j; m < i; m++) {
        Actor actor = arrayOfActor[m];
        if (actor.isVisible())
          actor.draw(paramBatch, f); 
      } 
    } else {
      paramFloat = this.x;
      float f1 = this.y;
      this.x = 0.0F;
      this.y = 0.0F;
      i = snapshotArray.size;
      for (m = k; m < i; m++) {
        Actor actor = arrayOfActor[m];
        if (actor.isVisible()) {
          float f2 = actor.x;
          float f3 = actor.y;
          actor.x = f2 + paramFloat;
          actor.y = f3 + f1;
          actor.draw(paramBatch, f);
          actor.x = f2;
          actor.y = f3;
        } 
      } 
      this.x = paramFloat;
      this.y = f1;
    } 
    snapshotArray.end();
  }
  
  public void drawDebug(ShapeRenderer paramShapeRenderer) {
    drawDebugBounds(paramShapeRenderer);
    if (this.transform)
      applyTransform(paramShapeRenderer, computeTransform()); 
    drawDebugChildren(paramShapeRenderer);
    if (this.transform)
      resetTransform(paramShapeRenderer); 
  }
  
  protected void drawDebugChildren(ShapeRenderer paramShapeRenderer) {
    SnapshotArray snapshotArray = this.children;
    Actor[] arrayOfActor = (Actor[])snapshotArray.begin();
    boolean bool = this.transform;
    int i = 0;
    int j = 0;
    if (bool) {
      i = snapshotArray.size;
      while (j < i) {
        Actor actor = arrayOfActor[j];
        if (actor.isVisible() && (actor.getDebug() || actor instanceof Group))
          actor.drawDebug(paramShapeRenderer); 
        j++;
      } 
      paramShapeRenderer.flush();
    } else {
      float f1 = this.x;
      float f2 = this.y;
      this.x = 0.0F;
      this.y = 0.0F;
      int k = snapshotArray.size;
      for (j = i; j < k; j++) {
        Actor actor = arrayOfActor[j];
        if (actor.isVisible() && (actor.getDebug() || actor instanceof Group)) {
          float f3 = actor.x;
          float f4 = actor.y;
          actor.x = f3 + f1;
          actor.y = f4 + f2;
          actor.drawDebug(paramShapeRenderer);
          actor.x = f3;
          actor.y = f4;
        } 
      } 
      this.x = f1;
      this.y = f2;
    } 
    snapshotArray.end();
  }
  
  public <T extends Actor> T findActor(String paramString) {
    SnapshotArray snapshotArray = this.children;
    int i = snapshotArray.size;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      if (paramString.equals(((Actor)snapshotArray.get(b2)).getName()))
        return (T)(Actor)snapshotArray.get(b2); 
    } 
    i = snapshotArray.size;
    for (b2 = b1; b2 < i; b2++) {
      Actor actor = (Actor)snapshotArray.get(b2);
      if (actor instanceof Group) {
        actor = ((Group)actor).findActor(paramString);
        if (actor != null)
          return (T)actor; 
      } 
    } 
    return null;
  }
  
  public Actor getChild(int paramInt) { return (Actor)this.children.get(paramInt); }
  
  public SnapshotArray<Actor> getChildren() { return this.children; }
  
  public Rectangle getCullingArea() { return this.cullingArea; }
  
  public boolean hasChildren() {
    boolean bool;
    if (this.children.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    if (paramBoolean && getTouchable() == Touchable.disabled)
      return null; 
    if (!isVisible())
      return null; 
    Vector2 vector2 = tmp;
    Actor[] arrayOfActor = (Actor[])this.children.items;
    for (int i = this.children.size - 1; i >= 0; i--) {
      Actor actor = arrayOfActor[i];
      actor.parentToLocalCoordinates(vector2.set(paramFloat1, paramFloat2));
      actor = actor.hit(vector2.x, vector2.y, paramBoolean);
      if (actor != null)
        return actor; 
    } 
    return super.hit(paramFloat1, paramFloat2, paramBoolean);
  }
  
  public boolean isTransform() { return this.transform; }
  
  public Vector2 localToDescendantCoordinates(Actor paramActor, Vector2 paramVector2) {
    Group group = paramActor.parent;
    if (group != null) {
      if (group != this)
        localToDescendantCoordinates(group, paramVector2); 
      paramActor.parentToLocalCoordinates(paramVector2);
      return paramVector2;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Child is not a descendant: ");
    stringBuilder.append(paramActor);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public boolean removeActor(Actor paramActor) { return removeActor(paramActor, true); }
  
  public boolean removeActor(Actor paramActor, boolean paramBoolean) {
    if (!this.children.removeValue(paramActor, true))
      return false; 
    if (paramBoolean) {
      Stage stage = getStage();
      if (stage != null)
        stage.unfocus(paramActor); 
    } 
    paramActor.setParent(null);
    paramActor.setStage(null);
    childrenChanged();
    return true;
  }
  
  protected void resetTransform(Batch paramBatch) { paramBatch.setTransformMatrix(this.oldTransform); }
  
  protected void resetTransform(ShapeRenderer paramShapeRenderer) { paramShapeRenderer.setTransformMatrix(this.oldTransform); }
  
  public void setCullingArea(Rectangle paramRectangle) { this.cullingArea = paramRectangle; }
  
  public void setDebug(boolean paramBoolean1, boolean paramBoolean2) {
    setDebug(paramBoolean1);
    if (paramBoolean2)
      for (Actor actor : this.children) {
        if (actor instanceof Group) {
          ((Group)actor).setDebug(paramBoolean1, paramBoolean2);
          continue;
        } 
        actor.setDebug(paramBoolean1);
      }  
  }
  
  protected void setStage(Stage paramStage) {
    super.setStage(paramStage);
    Actor[] arrayOfActor = (Actor[])this.children.items;
    int i = this.children.size;
    for (byte b = 0; b < i; b++)
      arrayOfActor[b].setStage(paramStage); 
  }
  
  public void setTransform(boolean paramBoolean) { this.transform = paramBoolean; }
  
  public boolean swapActor(int paramInt1, int paramInt2) {
    int i = this.children.size;
    if (paramInt1 < 0 || paramInt1 >= i || paramInt2 < 0 || paramInt2 >= i)
      return false; 
    this.children.swap(paramInt1, paramInt2);
    return true;
  }
  
  public boolean swapActor(Actor paramActor1, Actor paramActor2) {
    int i = this.children.indexOf(paramActor1, true);
    int j = this.children.indexOf(paramActor2, true);
    if (i == -1 || j == -1)
      return false; 
    this.children.swap(i, j);
    return true;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder('');
    toString(stringBuilder, 1);
    stringBuilder.setLength(stringBuilder.length() - 1);
    return stringBuilder.toString();
  }
  
  void toString(StringBuilder paramStringBuilder, int paramInt) {
    paramStringBuilder.append(super.toString());
    paramStringBuilder.append('\n');
    Actor[] arrayOfActor = (Actor[])this.children.begin();
    int i = this.children.size;
    for (byte b = 0; b < i; b++) {
      for (byte b1 = 0; b1 < paramInt; b1++)
        paramStringBuilder.append("|  "); 
      Actor actor = arrayOfActor[b];
      if (actor instanceof Group) {
        ((Group)actor).toString(paramStringBuilder, paramInt + 1);
      } else {
        paramStringBuilder.append(actor);
        paramStringBuilder.append('\n');
      } 
    } 
    this.children.end();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/Group.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */