package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.DelayedRemovalArray;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.SnapshotArray;
import com.badlogic.gdx.utils.reflect.ClassReflection;

public class Actor {
  private final Array<Action> actions = new Array(false);
  
  private final DelayedRemovalArray<EventListener> captureListeners = new DelayedRemovalArray(false);
  
  final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private boolean debug;
  
  float height;
  
  private final DelayedRemovalArray<EventListener> listeners = new DelayedRemovalArray(false);
  
  private String name;
  
  float originX;
  
  float originY;
  
  Group parent;
  
  float rotation;
  
  float scaleX = 1.0F;
  
  float scaleY = 1.0F;
  
  private Stage stage;
  
  private Touchable touchable = Touchable.enabled;
  
  private Object userObject;
  
  private boolean visible = true;
  
  float width;
  
  float x;
  
  float y;
  
  public void act(float paramFloat) {
    array = this.actions;
    if (array.size == 0)
      return; 
    Stage stage1 = this.stage;
    if (stage1 != null && stage1.getActionsRequestRendering())
      Gdx.graphics.requestRendering(); 
    byte b = 0;
    try {
      while (b < array.size) {
        Action action = (Action)array.get(b);
        byte b1 = b;
        if (action.act(paramFloat)) {
          b1 = b;
          if (b < array.size) {
            int i;
            if ((Action)array.get(b) == action) {
              i = b;
            } else {
              i = array.indexOf(action, true);
            } 
            b1 = b;
            if (i != -1) {
              array.removeIndex(i);
              action.setActor(null);
              b1 = b - 1;
            } 
          } 
        } 
        b = b1 + 1;
      } 
      return;
    } catch (RuntimeException array) {
      String str = toString();
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Actor: ");
      stringBuilder.append(str.substring(0, Math.min(str.length(), 128)));
      RuntimeException runtimeException = new RuntimeException(stringBuilder.toString(), array);
      throw runtimeException;
    } 
  }
  
  public void addAction(Action paramAction) {
    paramAction.setActor(this);
    this.actions.add(paramAction);
    Stage stage1 = this.stage;
    if (stage1 != null && stage1.getActionsRequestRendering())
      Gdx.graphics.requestRendering(); 
  }
  
  public boolean addCaptureListener(EventListener paramEventListener) {
    if (paramEventListener != null) {
      if (!this.captureListeners.contains(paramEventListener, true))
        this.captureListeners.add(paramEventListener); 
      return true;
    } 
    throw new IllegalArgumentException("listener cannot be null.");
  }
  
  public boolean addListener(EventListener paramEventListener) {
    if (paramEventListener != null) {
      if (!this.listeners.contains(paramEventListener, true)) {
        this.listeners.add(paramEventListener);
        return true;
      } 
      return false;
    } 
    throw new IllegalArgumentException("listener cannot be null.");
  }
  
  public boolean ancestorsVisible() {
    Group group;
    Actor actor = this;
    do {
      if (!actor.isVisible())
        return false; 
      group = actor.parent;
      actor = group;
    } while (group != null);
    return true;
  }
  
  public void clear() {
    clearActions();
    clearListeners();
  }
  
  public void clearActions() {
    for (int i = this.actions.size - 1; i >= 0; i--)
      ((Action)this.actions.get(i)).setActor(null); 
    this.actions.clear();
  }
  
  public void clearListeners() {
    this.listeners.clear();
    this.captureListeners.clear();
  }
  
  public boolean clipBegin() { return clipBegin(this.x, this.y, this.width, this.height); }
  
  public boolean clipBegin(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat3 > 0.0F && paramFloat4 > 0.0F) {
      Stage stage1 = this.stage;
      if (stage1 == null)
        return false; 
      Rectangle rectangle1 = Rectangle.tmp;
      rectangle1.x = paramFloat1;
      rectangle1.y = paramFloat2;
      rectangle1.width = paramFloat3;
      rectangle1.height = paramFloat4;
      Rectangle rectangle2 = (Rectangle)Pools.obtain(Rectangle.class);
      stage1.calculateScissors(rectangle1, rectangle2);
      if (ScissorStack.pushScissors(rectangle2))
        return true; 
      Pools.free(rectangle2);
    } 
    return false;
  }
  
  public void clipEnd() { Pools.free(ScissorStack.popScissors()); }
  
  public Actor debug() {
    setDebug(true);
    return this;
  }
  
  public void draw(Batch paramBatch, float paramFloat) {}
  
  public void drawDebug(ShapeRenderer paramShapeRenderer) { drawDebugBounds(paramShapeRenderer); }
  
  protected void drawDebugBounds(ShapeRenderer paramShapeRenderer) {
    if (!this.debug)
      return; 
    paramShapeRenderer.set(ShapeRenderer.ShapeType.Line);
    Stage stage1 = this.stage;
    if (stage1 != null)
      paramShapeRenderer.setColor(stage1.getDebugColor()); 
    paramShapeRenderer.rect(this.x, this.y, this.originX, this.originY, this.width, this.height, this.scaleX, this.scaleY, this.rotation);
  }
  
  public boolean fire(Event paramEvent) { // Byte code:
    //   0: aload_1
    //   1: invokevirtual getStage : ()Lcom/badlogic/gdx/scenes/scene2d/Stage;
    //   4: ifnonnull -> 15
    //   7: aload_1
    //   8: aload_0
    //   9: invokevirtual getStage : ()Lcom/badlogic/gdx/scenes/scene2d/Stage;
    //   12: invokevirtual setStage : (Lcom/badlogic/gdx/scenes/scene2d/Stage;)V
    //   15: aload_1
    //   16: aload_0
    //   17: invokevirtual setTarget : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    //   20: ldc com/badlogic/gdx/utils/Array
    //   22: invokestatic obtain : (Ljava/lang/Class;)Ljava/lang/Object;
    //   25: checkcast com/badlogic/gdx/utils/Array
    //   28: astore_2
    //   29: aload_0
    //   30: getfield parent : Lcom/badlogic/gdx/scenes/scene2d/Group;
    //   33: astore_3
    //   34: aload_3
    //   35: ifnull -> 51
    //   38: aload_2
    //   39: aload_3
    //   40: invokevirtual add : (Ljava/lang/Object;)V
    //   43: aload_3
    //   44: getfield parent : Lcom/badlogic/gdx/scenes/scene2d/Group;
    //   47: astore_3
    //   48: goto -> 34
    //   51: aload_2
    //   52: getfield items : [Ljava/lang/Object;
    //   55: astore_3
    //   56: aload_2
    //   57: getfield size : I
    //   60: iconst_1
    //   61: isub
    //   62: istore #4
    //   64: iload #4
    //   66: iflt -> 112
    //   69: aload_3
    //   70: iload #4
    //   72: aaload
    //   73: checkcast com/badlogic/gdx/scenes/scene2d/Group
    //   76: aload_1
    //   77: iconst_1
    //   78: invokevirtual notify : (Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z
    //   81: pop
    //   82: aload_1
    //   83: invokevirtual isStopped : ()Z
    //   86: ifeq -> 106
    //   89: aload_1
    //   90: invokevirtual isCancelled : ()Z
    //   93: istore #5
    //   95: aload_2
    //   96: invokevirtual clear : ()V
    //   99: aload_2
    //   100: invokestatic free : (Ljava/lang/Object;)V
    //   103: iload #5
    //   105: ireturn
    //   106: iinc #4, -1
    //   109: goto -> 64
    //   112: aload_0
    //   113: aload_1
    //   114: iconst_1
    //   115: invokevirtual notify : (Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z
    //   118: pop
    //   119: aload_1
    //   120: invokevirtual isStopped : ()Z
    //   123: ifeq -> 135
    //   126: aload_1
    //   127: invokevirtual isCancelled : ()Z
    //   130: istore #5
    //   132: goto -> 95
    //   135: aload_0
    //   136: aload_1
    //   137: iconst_0
    //   138: invokevirtual notify : (Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z
    //   141: pop
    //   142: aload_1
    //   143: invokevirtual getBubbles : ()Z
    //   146: ifne -> 158
    //   149: aload_1
    //   150: invokevirtual isCancelled : ()Z
    //   153: istore #5
    //   155: goto -> 95
    //   158: aload_1
    //   159: invokevirtual isStopped : ()Z
    //   162: ifeq -> 174
    //   165: aload_1
    //   166: invokevirtual isCancelled : ()Z
    //   169: istore #5
    //   171: goto -> 95
    //   174: aload_2
    //   175: getfield size : I
    //   178: istore #6
    //   180: iconst_0
    //   181: istore #4
    //   183: iload #4
    //   185: iload #6
    //   187: if_icmpge -> 225
    //   190: aload_3
    //   191: iload #4
    //   193: aaload
    //   194: checkcast com/badlogic/gdx/scenes/scene2d/Group
    //   197: aload_1
    //   198: iconst_0
    //   199: invokevirtual notify : (Lcom/badlogic/gdx/scenes/scene2d/Event;Z)Z
    //   202: pop
    //   203: aload_1
    //   204: invokevirtual isStopped : ()Z
    //   207: ifeq -> 219
    //   210: aload_1
    //   211: invokevirtual isCancelled : ()Z
    //   214: istore #5
    //   216: goto -> 95
    //   219: iinc #4, 1
    //   222: goto -> 183
    //   225: aload_1
    //   226: invokevirtual isCancelled : ()Z
    //   229: istore #5
    //   231: goto -> 95
    //   234: astore_1
    //   235: aload_2
    //   236: invokevirtual clear : ()V
    //   239: aload_2
    //   240: invokestatic free : (Ljava/lang/Object;)V
    //   243: goto -> 248
    //   246: aload_1
    //   247: athrow
    //   248: goto -> 246
    // Exception table:
    //   from	to	target	type
    //   51	64	234	finally
    //   69	95	234	finally
    //   112	132	234	finally
    //   135	155	234	finally
    //   158	171	234	finally
    //   174	180	234	finally
    //   190	216	234	finally
    //   225	231	234	finally }
  
  public <T extends Actor> T firstAscendant(Class<T> paramClass) {
    if (paramClass != null) {
      Group group;
      Actor actor = this;
      do {
        if (ClassReflection.isInstance(paramClass, actor))
          return (T)actor; 
        group = actor.parent;
        actor = group;
      } while (group != null);
      return null;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("actor cannot be null.");
    throw illegalArgumentException;
  }
  
  public Array<Action> getActions() { return this.actions; }
  
  public DelayedRemovalArray<EventListener> getCaptureListeners() { return this.captureListeners; }
  
  public Color getColor() { return this.color; }
  
  public boolean getDebug() { return this.debug; }
  
  public float getHeight() { return this.height; }
  
  public DelayedRemovalArray<EventListener> getListeners() { return this.listeners; }
  
  public String getName() { return this.name; }
  
  public float getOriginX() { return this.originX; }
  
  public float getOriginY() { return this.originY; }
  
  public Group getParent() { return this.parent; }
  
  public float getRight() { return this.x + this.width; }
  
  public float getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scaleX; }
  
  public float getScaleY() { return this.scaleY; }
  
  public Stage getStage() { return this.stage; }
  
  public float getTop() { return this.y + this.height; }
  
  public Touchable getTouchable() { return this.touchable; }
  
  public Object getUserObject() { return this.userObject; }
  
  public float getWidth() { return this.width; }
  
  public float getX() { return this.x; }
  
  public float getX(int paramInt) {
    float f = this.x;
    if ((paramInt & 0x10) != 0) {
      null = this.width;
    } else {
      null = f;
      if ((paramInt & 0x8) == 0) {
        null = this.width / 2.0F;
      } else {
        return null;
      } 
    } 
    return f + null;
  }
  
  public float getY() { return this.y; }
  
  public float getY(int paramInt) {
    float f = this.y;
    if ((paramInt & 0x2) != 0) {
      null = this.height;
    } else {
      null = f;
      if ((paramInt & 0x4) == 0) {
        null = this.height / 2.0F;
      } else {
        return null;
      } 
    } 
    return f + null;
  }
  
  public int getZIndex() {
    Group group = this.parent;
    return (group == null) ? -1 : group.children.indexOf(this, true);
  }
  
  public boolean hasActions() {
    boolean bool;
    if (this.actions.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasKeyboardFocus() {
    boolean bool;
    Stage stage1 = getStage();
    if (stage1 != null && stage1.getKeyboardFocus() == this) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasParent() {
    boolean bool;
    if (this.parent != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasScrollFocus() {
    boolean bool;
    Stage stage1 = getStage();
    if (stage1 != null && stage1.getScrollFocus() == this) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    Object object = null;
    if (paramBoolean && this.touchable != Touchable.enabled)
      return null; 
    if (!isVisible())
      return null; 
    Actor actor = object;
    if (paramFloat1 >= 0.0F) {
      actor = object;
      if (paramFloat1 < this.width) {
        actor = object;
        if (paramFloat2 >= 0.0F) {
          actor = object;
          if (paramFloat2 < this.height)
            actor = this; 
        } 
      } 
    } 
    return actor;
  }
  
  public boolean isAscendantOf(Actor paramActor) {
    if (paramActor != null) {
      Group group;
      do {
        if (paramActor == this)
          return true; 
        group = paramActor.parent;
        paramActor = group;
      } while (group != null);
      return false;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("actor cannot be null.");
    throw illegalArgumentException;
  }
  
  public boolean isDescendantOf(Actor paramActor) {
    if (paramActor != null) {
      Group group;
      Actor actor = this;
      do {
        if (actor == paramActor)
          return true; 
        group = actor.parent;
        actor = group;
      } while (group != null);
      return false;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("actor cannot be null.");
    throw illegalArgumentException;
  }
  
  public boolean isTouchFocusListener() {
    Stage stage1 = getStage();
    if (stage1 == null)
      return false; 
    int i = stage1.touchFocuses.size;
    for (byte b = 0; b < i; b++) {
      if (((Stage.TouchFocus)stage1.touchFocuses.get(b)).listenerActor == this)
        return true; 
    } 
    return false;
  }
  
  public boolean isTouchFocusTarget() {
    Stage stage1 = getStage();
    if (stage1 == null)
      return false; 
    int i = stage1.touchFocuses.size;
    for (byte b = 0; b < i; b++) {
      if (((Stage.TouchFocus)stage1.touchFocuses.get(b)).target == this)
        return true; 
    } 
    return false;
  }
  
  public boolean isTouchable() {
    boolean bool;
    if (this.touchable == Touchable.enabled) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isVisible() { return this.visible; }
  
  public Vector2 localToActorCoordinates(Actor paramActor, Vector2 paramVector2) {
    localToStageCoordinates(paramVector2);
    return paramActor.stageToLocalCoordinates(paramVector2);
  }
  
  public Vector2 localToAscendantCoordinates(Actor paramActor, Vector2 paramVector2) {
    Group group;
    Actor actor = this;
    do {
      actor.localToParentCoordinates(paramVector2);
      group = actor.parent;
      if (group == paramActor)
        break; 
      actor = group;
    } while (group != null);
    return paramVector2;
  }
  
  public Vector2 localToParentCoordinates(Vector2 paramVector2) {
    float f1 = -this.rotation;
    float f2 = this.scaleX;
    float f3 = this.scaleY;
    float f4 = this.x;
    float f5 = this.y;
    if (f1 == 0.0F) {
      if (f2 == 1.0F && f3 == 1.0F) {
        paramVector2.x += f4;
        paramVector2.y += f5;
      } else {
        float f = this.originX;
        f1 = this.originY;
        paramVector2.x = (paramVector2.x - f) * f2 + f + f4;
        paramVector2.y = (paramVector2.y - f1) * f3 + f1 + f5;
      } 
    } else {
      double d = (f1 * 0.017453292F);
      float f7 = (float)Math.cos(d);
      float f8 = (float)Math.sin(d);
      float f6 = this.originX;
      f1 = this.originY;
      f2 = (paramVector2.x - f6) * f2;
      f3 = (paramVector2.y - f1) * f3;
      paramVector2.x = f2 * f7 + f3 * f8 + f6 + f4;
      paramVector2.y = f2 * -f8 + f3 * f7 + f1 + f5;
    } 
    return paramVector2;
  }
  
  public Vector2 localToScreenCoordinates(Vector2 paramVector2) {
    Stage stage1 = this.stage;
    return (stage1 == null) ? paramVector2 : stage1.stageToScreenCoordinates(localToAscendantCoordinates(null, paramVector2));
  }
  
  public Vector2 localToStageCoordinates(Vector2 paramVector2) { return localToAscendantCoordinates(null, paramVector2); }
  
  public void moveBy(float paramFloat1, float paramFloat2) {
    if (paramFloat1 != 0.0F || paramFloat2 != 0.0F) {
      this.x += paramFloat1;
      this.y += paramFloat2;
      positionChanged();
    } 
  }
  
  public boolean notify(Event paramEvent, boolean paramBoolean) {
    if (paramEvent.getTarget() != null) {
      DelayedRemovalArray delayedRemovalArray;
      if (paramBoolean) {
        delayedRemovalArray = this.captureListeners;
      } else {
        delayedRemovalArray = this.listeners;
      } 
      if (delayedRemovalArray.size == 0)
        return paramEvent.isCancelled(); 
      paramEvent.setListenerActor(this);
      paramEvent.setCapture(paramBoolean);
      if (paramEvent.getStage() == null)
        paramEvent.setStage(this.stage); 
      try {
        delayedRemovalArray.begin();
        int i = delayedRemovalArray.size;
        for (byte b = 0; b < i; b++) {
          EventListener eventListener = (EventListener)delayedRemovalArray.get(b);
          if (eventListener.handle(paramEvent)) {
            paramEvent.handle();
            if (paramEvent instanceof InputEvent) {
              InputEvent inputEvent = (InputEvent)paramEvent;
              if (inputEvent.getType() == InputEvent.Type.touchDown)
                paramEvent.getStage().addTouchFocus(eventListener, this, inputEvent.getTarget(), inputEvent.getPointer(), inputEvent.getButton()); 
            } 
          } 
        } 
        delayedRemovalArray.end();
        return paramEvent.isCancelled();
      } catch (RuntimeException paramEvent) {
        String str = toString();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Actor: ");
        stringBuilder.append(str.substring(0, Math.min(str.length(), 128)));
        throw new RuntimeException(stringBuilder.toString(), paramEvent);
      } 
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("The event target cannot be null.");
    throw illegalArgumentException;
  }
  
  public Vector2 parentToLocalCoordinates(Vector2 paramVector2) {
    float f1 = this.rotation;
    float f2 = this.scaleX;
    float f3 = this.scaleY;
    float f4 = this.x;
    float f5 = this.y;
    if (f1 == 0.0F) {
      if (f2 == 1.0F && f3 == 1.0F) {
        paramVector2.x -= f4;
        paramVector2.y -= f5;
      } else {
        float f = this.originX;
        f1 = this.originY;
        paramVector2.x = (paramVector2.x - f4 - f) / f2 + f;
        paramVector2.y = (paramVector2.y - f5 - f1) / f3 + f1;
      } 
    } else {
      double d = (f1 * 0.017453292F);
      float f6 = (float)Math.cos(d);
      f1 = (float)Math.sin(d);
      float f7 = this.originX;
      float f8 = this.originY;
      f4 = paramVector2.x - f4 - f7;
      f5 = paramVector2.y - f5 - f8;
      paramVector2.x = (f4 * f6 + f5 * f1) / f2 + f7;
      paramVector2.y = (f4 * -f1 + f5 * f6) / f3 + f8;
    } 
    return paramVector2;
  }
  
  protected void positionChanged() {}
  
  public boolean remove() {
    Group group = this.parent;
    return (group != null) ? group.removeActor(this, true) : 0;
  }
  
  public void removeAction(Action paramAction) {
    if (this.actions.removeValue(paramAction, true))
      paramAction.setActor(null); 
  }
  
  public boolean removeCaptureListener(EventListener paramEventListener) {
    if (paramEventListener != null)
      return this.captureListeners.removeValue(paramEventListener, true); 
    throw new IllegalArgumentException("listener cannot be null.");
  }
  
  public boolean removeListener(EventListener paramEventListener) {
    if (paramEventListener != null)
      return this.listeners.removeValue(paramEventListener, true); 
    throw new IllegalArgumentException("listener cannot be null.");
  }
  
  public void rotateBy(float paramFloat) {
    if (paramFloat != 0.0F) {
      this.rotation = (this.rotation + paramFloat) % 360.0F;
      rotationChanged();
    } 
  }
  
  protected void rotationChanged() {}
  
  public void scaleBy(float paramFloat) {
    this.scaleX += paramFloat;
    this.scaleY += paramFloat;
  }
  
  public void scaleBy(float paramFloat1, float paramFloat2) {
    this.scaleX += paramFloat1;
    this.scaleY += paramFloat2;
  }
  
  public Vector2 screenToLocalCoordinates(Vector2 paramVector2) {
    Stage stage1 = this.stage;
    return (stage1 == null) ? paramVector2 : stageToLocalCoordinates(stage1.screenToStageCoordinates(paramVector2));
  }
  
  public void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (this.x != paramFloat1 || this.y != paramFloat2) {
      this.x = paramFloat1;
      this.y = paramFloat2;
      positionChanged();
    } 
    if (this.width != paramFloat3 || this.height != paramFloat4) {
      this.width = paramFloat3;
      this.height = paramFloat4;
      sizeChanged();
    } 
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setColor(Color paramColor) { this.color.set(paramColor); }
  
  public void setDebug(boolean paramBoolean) {
    this.debug = paramBoolean;
    if (paramBoolean)
      Stage.debug = true; 
  }
  
  public void setHeight(float paramFloat) {
    if (this.height != paramFloat) {
      this.height = paramFloat;
      sizeChanged();
    } 
  }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public void setOrigin(float paramFloat1, float paramFloat2) {
    this.originX = paramFloat1;
    this.originY = paramFloat2;
  }
  
  public void setOrigin(int paramInt) {
    if ((paramInt & 0x8) != 0) {
      this.originX = 0.0F;
    } else if ((paramInt & 0x10) != 0) {
      this.originX = this.width;
    } else {
      this.originX = this.width / 2.0F;
    } 
    if ((paramInt & 0x4) != 0) {
      this.originY = 0.0F;
    } else if ((paramInt & 0x2) != 0) {
      this.originY = this.height;
    } else {
      this.originY = this.height / 2.0F;
    } 
  }
  
  public void setOriginX(float paramFloat) { this.originX = paramFloat; }
  
  public void setOriginY(float paramFloat) { this.originY = paramFloat; }
  
  protected void setParent(Group paramGroup) { this.parent = paramGroup; }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    if (this.x != paramFloat1 || this.y != paramFloat2) {
      this.x = paramFloat1;
      this.y = paramFloat2;
      positionChanged();
    } 
  }
  
  public void setPosition(float paramFloat1, float paramFloat2, int paramInt) { // Byte code:
    //   0: iload_3
    //   1: bipush #16
    //   3: iand
    //   4: ifeq -> 22
    //   7: aload_0
    //   8: getfield width : F
    //   11: fstore #4
    //   13: fload_1
    //   14: fload #4
    //   16: fsub
    //   17: fstore #4
    //   19: goto -> 43
    //   22: fload_1
    //   23: fstore #4
    //   25: iload_3
    //   26: bipush #8
    //   28: iand
    //   29: ifne -> 43
    //   32: aload_0
    //   33: getfield width : F
    //   36: fconst_2
    //   37: fdiv
    //   38: fstore #4
    //   40: goto -> 13
    //   43: iload_3
    //   44: iconst_2
    //   45: iand
    //   46: ifeq -> 61
    //   49: aload_0
    //   50: getfield height : F
    //   53: fstore_1
    //   54: fload_2
    //   55: fload_1
    //   56: fsub
    //   57: fstore_1
    //   58: goto -> 79
    //   61: fload_2
    //   62: fstore_1
    //   63: iload_3
    //   64: iconst_4
    //   65: iand
    //   66: ifne -> 79
    //   69: aload_0
    //   70: getfield height : F
    //   73: fconst_2
    //   74: fdiv
    //   75: fstore_1
    //   76: goto -> 54
    //   79: aload_0
    //   80: getfield x : F
    //   83: fload #4
    //   85: fcmpl
    //   86: ifne -> 98
    //   89: aload_0
    //   90: getfield y : F
    //   93: fload_1
    //   94: fcmpl
    //   95: ifeq -> 113
    //   98: aload_0
    //   99: fload #4
    //   101: putfield x : F
    //   104: aload_0
    //   105: fload_1
    //   106: putfield y : F
    //   109: aload_0
    //   110: invokevirtual positionChanged : ()V
    //   113: return }
  
  public void setRotation(float paramFloat) {
    if (this.rotation != paramFloat) {
      this.rotation = paramFloat;
      rotationChanged();
    } 
  }
  
  public void setScale(float paramFloat) {
    this.scaleX = paramFloat;
    this.scaleY = paramFloat;
  }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    this.scaleX = paramFloat1;
    this.scaleY = paramFloat2;
  }
  
  public void setScaleX(float paramFloat) { this.scaleX = paramFloat; }
  
  public void setScaleY(float paramFloat) { this.scaleY = paramFloat; }
  
  public void setSize(float paramFloat1, float paramFloat2) {
    if (this.width != paramFloat1 || this.height != paramFloat2) {
      this.width = paramFloat1;
      this.height = paramFloat2;
      sizeChanged();
    } 
  }
  
  protected void setStage(Stage paramStage) { this.stage = paramStage; }
  
  public void setTouchable(Touchable paramTouchable) { this.touchable = paramTouchable; }
  
  public void setUserObject(Object paramObject) { this.userObject = paramObject; }
  
  public void setVisible(boolean paramBoolean) { this.visible = paramBoolean; }
  
  public void setWidth(float paramFloat) {
    if (this.width != paramFloat) {
      this.width = paramFloat;
      sizeChanged();
    } 
  }
  
  public void setX(float paramFloat) {
    if (this.x != paramFloat) {
      this.x = paramFloat;
      positionChanged();
    } 
  }
  
  public void setX(float paramFloat, int paramInt) { // Byte code:
    //   0: iload_2
    //   1: bipush #16
    //   3: iand
    //   4: ifeq -> 19
    //   7: aload_0
    //   8: getfield width : F
    //   11: fstore_3
    //   12: fload_1
    //   13: fload_3
    //   14: fsub
    //   15: fstore_3
    //   16: goto -> 38
    //   19: fload_1
    //   20: fstore_3
    //   21: iload_2
    //   22: bipush #8
    //   24: iand
    //   25: ifne -> 38
    //   28: aload_0
    //   29: getfield width : F
    //   32: fconst_2
    //   33: fdiv
    //   34: fstore_3
    //   35: goto -> 12
    //   38: aload_0
    //   39: getfield x : F
    //   42: fload_3
    //   43: fcmpl
    //   44: ifeq -> 56
    //   47: aload_0
    //   48: fload_3
    //   49: putfield x : F
    //   52: aload_0
    //   53: invokevirtual positionChanged : ()V
    //   56: return }
  
  public void setY(float paramFloat) {
    if (this.y != paramFloat) {
      this.y = paramFloat;
      positionChanged();
    } 
  }
  
  public void setY(float paramFloat, int paramInt) { // Byte code:
    //   0: iload_2
    //   1: iconst_2
    //   2: iand
    //   3: ifeq -> 18
    //   6: aload_0
    //   7: getfield height : F
    //   10: fstore_3
    //   11: fload_1
    //   12: fload_3
    //   13: fsub
    //   14: fstore_3
    //   15: goto -> 36
    //   18: fload_1
    //   19: fstore_3
    //   20: iload_2
    //   21: iconst_4
    //   22: iand
    //   23: ifne -> 36
    //   26: aload_0
    //   27: getfield height : F
    //   30: fconst_2
    //   31: fdiv
    //   32: fstore_3
    //   33: goto -> 11
    //   36: aload_0
    //   37: getfield y : F
    //   40: fload_3
    //   41: fcmpl
    //   42: ifeq -> 54
    //   45: aload_0
    //   46: fload_3
    //   47: putfield y : F
    //   50: aload_0
    //   51: invokevirtual positionChanged : ()V
    //   54: return }
  
  public boolean setZIndex(int paramInt) {
    if (paramInt >= 0) {
      Group group = this.parent;
      if (group == null)
        return false; 
      SnapshotArray snapshotArray = group.children;
      if (snapshotArray.size == 1)
        return false; 
      paramInt = Math.min(paramInt, snapshotArray.size - 1);
      if (snapshotArray.get(paramInt) == this)
        return false; 
      if (!snapshotArray.removeValue(this, true))
        return false; 
      snapshotArray.insert(paramInt, this);
      return true;
    } 
    throw new IllegalArgumentException("ZIndex cannot be < 0.");
  }
  
  public void sizeBy(float paramFloat) {
    if (paramFloat != 0.0F) {
      this.width += paramFloat;
      this.height += paramFloat;
      sizeChanged();
    } 
  }
  
  public void sizeBy(float paramFloat1, float paramFloat2) {
    if (paramFloat1 != 0.0F || paramFloat2 != 0.0F) {
      this.width += paramFloat1;
      this.height += paramFloat2;
      sizeChanged();
    } 
  }
  
  protected void sizeChanged() {}
  
  public Vector2 stageToLocalCoordinates(Vector2 paramVector2) {
    Group group = this.parent;
    if (group != null)
      group.stageToLocalCoordinates(paramVector2); 
    parentToLocalCoordinates(paramVector2);
    return paramVector2;
  }
  
  public void toBack() { setZIndex(0); }
  
  public void toFront() { setZIndex(2147483647); }
  
  public String toString() {
    String str1 = this.name;
    String str2 = str1;
    if (str1 == null) {
      str1 = getClass().getName();
      int i = str1.lastIndexOf('.');
      str2 = str1;
      if (i != -1)
        str2 = str1.substring(i + 1); 
    } 
    return str2;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/Actor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */