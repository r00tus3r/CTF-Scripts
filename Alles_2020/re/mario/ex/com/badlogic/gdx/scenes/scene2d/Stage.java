package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputAdapter;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.badlogic.gdx.scenes.scene2d.utils.FocusListener;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.Scaling;
import com.badlogic.gdx.utils.SnapshotArray;
import com.badlogic.gdx.utils.viewport.ScalingViewport;
import com.badlogic.gdx.utils.viewport.Viewport;

public class Stage extends InputAdapter implements Disposable {
  static boolean debug;
  
  private boolean actionsRequestRendering = true;
  
  private final Batch batch;
  
  private boolean debugAll;
  
  private final Color debugColor = new Color(0.0F, 1.0F, 0.0F, 0.85F);
  
  private boolean debugInvisible;
  
  private boolean debugParentUnderMouse;
  
  private ShapeRenderer debugShapes;
  
  private Table.Debug debugTableUnderMouse = Table.Debug.none;
  
  private boolean debugUnderMouse;
  
  private Actor keyboardFocus;
  
  private Actor mouseOverActor;
  
  private int mouseScreenX;
  
  private int mouseScreenY;
  
  private boolean ownsBatch;
  
  private final Actor[] pointerOverActors = new Actor[20];
  
  private final int[] pointerScreenX = new int[20];
  
  private final int[] pointerScreenY = new int[20];
  
  private final boolean[] pointerTouched = new boolean[20];
  
  private Group root;
  
  private Actor scrollFocus;
  
  private final Vector2 tempCoords = new Vector2();
  
  final SnapshotArray<TouchFocus> touchFocuses = new SnapshotArray(true, 4, TouchFocus.class);
  
  private Viewport viewport;
  
  public Stage() {
    this(new ScalingViewport(Scaling.stretch, Gdx.graphics.getWidth(), Gdx.graphics.getHeight(), new OrthographicCamera()), new SpriteBatch());
    this.ownsBatch = true;
  }
  
  public Stage(Viewport paramViewport) {
    this(paramViewport, new SpriteBatch());
    this.ownsBatch = true;
  }
  
  public Stage(Viewport paramViewport, Batch paramBatch) {
    if (paramViewport != null) {
      if (paramBatch != null) {
        this.viewport = paramViewport;
        this.batch = paramBatch;
        this.root = new Group();
        this.root.setStage(this);
        paramViewport.update(Gdx.graphics.getWidth(), Gdx.graphics.getHeight(), true);
        return;
      } 
      throw new IllegalArgumentException("batch cannot be null.");
    } 
    throw new IllegalArgumentException("viewport cannot be null.");
  }
  
  private void disableDebug(Actor paramActor1, Actor paramActor2) {
    if (paramActor1 == paramActor2)
      return; 
    byte b = 0;
    paramActor1.setDebug(false);
    if (paramActor1 instanceof Group) {
      SnapshotArray snapshotArray = ((Group)paramActor1).children;
      int i = snapshotArray.size;
      while (b < i) {
        disableDebug((Actor)snapshotArray.get(b), paramActor2);
        b++;
      } 
    } 
  }
  
  private void drawDebug() {
    if (this.debugShapes == null) {
      this.debugShapes = new ShapeRenderer();
      this.debugShapes.setAutoShapeType(true);
    } 
    if (this.debugUnderMouse || this.debugParentUnderMouse || this.debugTableUnderMouse != Table.Debug.none) {
      screenToStageCoordinates(this.tempCoords.set(Gdx.input.getX(), Gdx.input.getY()));
      Actor actor1 = hit(this.tempCoords.x, this.tempCoords.y, true);
      if (actor1 == null)
        return; 
      Actor actor2 = actor1;
      if (this.debugParentUnderMouse) {
        actor2 = actor1;
        if (actor1.parent != null)
          actor2 = actor1.parent; 
      } 
      actor1 = actor2;
      if (this.debugTableUnderMouse == Table.Debug.none) {
        actor2.setDebug(true);
      } else {
        while (actor1 != null && !(actor1 instanceof Table))
          actor1 = actor1.parent; 
        if (actor1 == null)
          return; 
        ((Table)actor1).debug(this.debugTableUnderMouse);
        actor2 = actor1;
      } 
      if (this.debugAll && actor2 instanceof Group)
        ((Group)actor2).debugAll(); 
      disableDebug(this.root, actor2);
    } else if (this.debugAll) {
      this.root.debugAll();
    } 
    Gdx.gl.glEnable(3042);
    this.debugShapes.setProjectionMatrix((this.viewport.getCamera()).combined);
    this.debugShapes.begin();
    this.root.drawDebug(this.debugShapes);
    this.debugShapes.end();
    Gdx.gl.glDisable(3042);
  }
  
  private Actor fireEnterAndExit(Actor paramActor, int paramInt1, int paramInt2, int paramInt3) {
    screenToStageCoordinates(this.tempCoords.set(paramInt1, paramInt2));
    Actor actor = hit(this.tempCoords.x, this.tempCoords.y, true);
    if (actor == paramActor)
      return paramActor; 
    if (paramActor != null) {
      InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
      inputEvent.setStage(this);
      inputEvent.setStageX(this.tempCoords.x);
      inputEvent.setStageY(this.tempCoords.y);
      inputEvent.setPointer(paramInt3);
      inputEvent.setType(InputEvent.Type.exit);
      inputEvent.setRelatedActor(actor);
      paramActor.fire(inputEvent);
      Pools.free(inputEvent);
    } 
    if (actor != null) {
      InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
      inputEvent.setStage(this);
      inputEvent.setStageX(this.tempCoords.x);
      inputEvent.setStageY(this.tempCoords.y);
      inputEvent.setPointer(paramInt3);
      inputEvent.setType(InputEvent.Type.enter);
      inputEvent.setRelatedActor(paramActor);
      actor.fire(inputEvent);
      Pools.free(inputEvent);
    } 
    return actor;
  }
  
  public void act() { act(Math.min(Gdx.graphics.getDeltaTime(), 0.033333335F)); }
  
  public void act(float paramFloat) { // Byte code:
    //   0: aload_0
    //   1: getfield pointerOverActors : [Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   4: arraylength
    //   5: istore_2
    //   6: iconst_0
    //   7: istore_3
    //   8: iload_3
    //   9: iload_2
    //   10: if_icmpge -> 177
    //   13: aload_0
    //   14: getfield pointerOverActors : [Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   17: astore #4
    //   19: aload #4
    //   21: iload_3
    //   22: aaload
    //   23: astore #5
    //   25: aload_0
    //   26: getfield pointerTouched : [Z
    //   29: iload_3
    //   30: baload
    //   31: ifne -> 148
    //   34: aload #5
    //   36: ifnull -> 171
    //   39: aload #4
    //   41: iload_3
    //   42: aconst_null
    //   43: aastore
    //   44: aload_0
    //   45: aload_0
    //   46: getfield tempCoords : Lcom/badlogic/gdx/math/Vector2;
    //   49: aload_0
    //   50: getfield pointerScreenX : [I
    //   53: iload_3
    //   54: iaload
    //   55: i2f
    //   56: aload_0
    //   57: getfield pointerScreenY : [I
    //   60: iload_3
    //   61: iaload
    //   62: i2f
    //   63: invokevirtual set : (FF)Lcom/badlogic/gdx/math/Vector2;
    //   66: invokevirtual screenToStageCoordinates : (Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    //   69: pop
    //   70: ldc_w com/badlogic/gdx/scenes/scene2d/InputEvent
    //   73: invokestatic obtain : (Ljava/lang/Class;)Ljava/lang/Object;
    //   76: checkcast com/badlogic/gdx/scenes/scene2d/InputEvent
    //   79: astore #4
    //   81: aload #4
    //   83: getstatic com/badlogic/gdx/scenes/scene2d/InputEvent$Type.exit : Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;
    //   86: invokevirtual setType : (Lcom/badlogic/gdx/scenes/scene2d/InputEvent$Type;)V
    //   89: aload #4
    //   91: aload_0
    //   92: invokevirtual setStage : (Lcom/badlogic/gdx/scenes/scene2d/Stage;)V
    //   95: aload #4
    //   97: aload_0
    //   98: getfield tempCoords : Lcom/badlogic/gdx/math/Vector2;
    //   101: getfield x : F
    //   104: invokevirtual setStageX : (F)V
    //   107: aload #4
    //   109: aload_0
    //   110: getfield tempCoords : Lcom/badlogic/gdx/math/Vector2;
    //   113: getfield y : F
    //   116: invokevirtual setStageY : (F)V
    //   119: aload #4
    //   121: aload #5
    //   123: invokevirtual setRelatedActor : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    //   126: aload #4
    //   128: iload_3
    //   129: invokevirtual setPointer : (I)V
    //   132: aload #5
    //   134: aload #4
    //   136: invokevirtual fire : (Lcom/badlogic/gdx/scenes/scene2d/Event;)Z
    //   139: pop
    //   140: aload #4
    //   142: invokestatic free : (Ljava/lang/Object;)V
    //   145: goto -> 171
    //   148: aload #4
    //   150: iload_3
    //   151: aload_0
    //   152: aload #5
    //   154: aload_0
    //   155: getfield pointerScreenX : [I
    //   158: iload_3
    //   159: iaload
    //   160: aload_0
    //   161: getfield pointerScreenY : [I
    //   164: iload_3
    //   165: iaload
    //   166: iload_3
    //   167: invokespecial fireEnterAndExit : (Lcom/badlogic/gdx/scenes/scene2d/Actor;III)Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   170: aastore
    //   171: iinc #3, 1
    //   174: goto -> 8
    //   177: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   180: invokeinterface getType : ()Lcom/badlogic/gdx/Application$ApplicationType;
    //   185: astore #5
    //   187: aload #5
    //   189: getstatic com/badlogic/gdx/Application$ApplicationType.Desktop : Lcom/badlogic/gdx/Application$ApplicationType;
    //   192: if_acmpeq -> 211
    //   195: aload #5
    //   197: getstatic com/badlogic/gdx/Application$ApplicationType.Applet : Lcom/badlogic/gdx/Application$ApplicationType;
    //   200: if_acmpeq -> 211
    //   203: aload #5
    //   205: getstatic com/badlogic/gdx/Application$ApplicationType.WebGL : Lcom/badlogic/gdx/Application$ApplicationType;
    //   208: if_acmpne -> 232
    //   211: aload_0
    //   212: aload_0
    //   213: aload_0
    //   214: getfield mouseOverActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   217: aload_0
    //   218: getfield mouseScreenX : I
    //   221: aload_0
    //   222: getfield mouseScreenY : I
    //   225: iconst_m1
    //   226: invokespecial fireEnterAndExit : (Lcom/badlogic/gdx/scenes/scene2d/Actor;III)Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   229: putfield mouseOverActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
    //   232: aload_0
    //   233: getfield root : Lcom/badlogic/gdx/scenes/scene2d/Group;
    //   236: fload_1
    //   237: invokevirtual act : (F)V
    //   240: return }
  
  public void addAction(Action paramAction) { this.root.addAction(paramAction); }
  
  public void addActor(Actor paramActor) { this.root.addActor(paramActor); }
  
  public boolean addCaptureListener(EventListener paramEventListener) { return this.root.addCaptureListener(paramEventListener); }
  
  public boolean addListener(EventListener paramEventListener) { return this.root.addListener(paramEventListener); }
  
  public void addTouchFocus(EventListener paramEventListener, Actor paramActor1, Actor paramActor2, int paramInt1, int paramInt2) {
    TouchFocus touchFocus = (TouchFocus)Pools.obtain(TouchFocus.class);
    touchFocus.listenerActor = paramActor1;
    touchFocus.target = paramActor2;
    touchFocus.listener = paramEventListener;
    touchFocus.pointer = paramInt1;
    touchFocus.button = paramInt2;
    this.touchFocuses.add(touchFocus);
  }
  
  public void calculateScissors(Rectangle paramRectangle1, Rectangle paramRectangle2) {
    Matrix4 matrix4 = this.debugShapes;
    if (matrix4 != null && matrix4.isDrawing()) {
      Matrix4 matrix41 = this.debugShapes.getTransformMatrix();
    } else {
      matrix4 = this.batch.getTransformMatrix();
    } 
    this.viewport.calculateScissors(matrix4, paramRectangle1, paramRectangle2);
  }
  
  public void cancelTouchFocus() { cancelTouchFocusExcept(null, null); }
  
  public void cancelTouchFocus(Actor paramActor) {
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.touchUp);
    inputEvent.setStageX(-2.14748365E9F);
    inputEvent.setStageY(-2.14748365E9F);
    SnapshotArray snapshotArray = this.touchFocuses;
    TouchFocus[] arrayOfTouchFocus = (TouchFocus[])snapshotArray.begin();
    int i = snapshotArray.size;
    for (byte b = 0; b < i; b++) {
      TouchFocus touchFocus = arrayOfTouchFocus[b];
      if (touchFocus.listenerActor == paramActor && snapshotArray.removeValue(touchFocus, true)) {
        inputEvent.setTarget(touchFocus.target);
        inputEvent.setListenerActor(touchFocus.listenerActor);
        inputEvent.setPointer(touchFocus.pointer);
        inputEvent.setButton(touchFocus.button);
        touchFocus.listener.handle(inputEvent);
      } 
    } 
    snapshotArray.end();
    Pools.free(inputEvent);
  }
  
  public void cancelTouchFocusExcept(EventListener paramEventListener, Actor paramActor) {
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.touchUp);
    inputEvent.setStageX(-2.14748365E9F);
    inputEvent.setStageY(-2.14748365E9F);
    SnapshotArray snapshotArray = this.touchFocuses;
    TouchFocus[] arrayOfTouchFocus = (TouchFocus[])snapshotArray.begin();
    int i = snapshotArray.size;
    for (byte b = 0; b < i; b++) {
      TouchFocus touchFocus = arrayOfTouchFocus[b];
      if ((touchFocus.listener != paramEventListener || touchFocus.listenerActor != paramActor) && snapshotArray.removeValue(touchFocus, true)) {
        inputEvent.setTarget(touchFocus.target);
        inputEvent.setListenerActor(touchFocus.listenerActor);
        inputEvent.setPointer(touchFocus.pointer);
        inputEvent.setButton(touchFocus.button);
        touchFocus.listener.handle(inputEvent);
      } 
    } 
    snapshotArray.end();
    Pools.free(inputEvent);
  }
  
  public void clear() {
    unfocusAll();
    this.root.clear();
  }
  
  public void dispose() {
    clear();
    if (this.ownsBatch)
      this.batch.dispose(); 
  }
  
  public void draw() {
    Camera camera = this.viewport.getCamera();
    camera.update();
    if (!this.root.isVisible())
      return; 
    Batch batch1 = this.batch;
    batch1.setProjectionMatrix(camera.combined);
    batch1.begin();
    this.root.draw(batch1, 1.0F);
    batch1.end();
    if (debug)
      drawDebug(); 
  }
  
  public boolean getActionsRequestRendering() { return this.actionsRequestRendering; }
  
  public Array<Actor> getActors() { return this.root.children; }
  
  public Batch getBatch() { return this.batch; }
  
  public Camera getCamera() { return this.viewport.getCamera(); }
  
  public Color getDebugColor() { return this.debugColor; }
  
  public float getHeight() { return this.viewport.getWorldHeight(); }
  
  public Actor getKeyboardFocus() { return this.keyboardFocus; }
  
  public Group getRoot() { return this.root; }
  
  public Actor getScrollFocus() { return this.scrollFocus; }
  
  public Viewport getViewport() { return this.viewport; }
  
  public float getWidth() { return this.viewport.getWorldWidth(); }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    this.root.parentToLocalCoordinates(this.tempCoords.set(paramFloat1, paramFloat2));
    return this.root.hit(this.tempCoords.x, this.tempCoords.y, paramBoolean);
  }
  
  public boolean isDebugAll() { return this.debugAll; }
  
  protected boolean isInsideViewport(int paramInt1, int paramInt2) {
    int i = this.viewport.getScreenX();
    int j = this.viewport.getScreenWidth();
    int k = this.viewport.getScreenY();
    int m = this.viewport.getScreenHeight();
    int n = Gdx.graphics.getHeight();
    boolean bool = true;
    paramInt2 = n - 1 - paramInt2;
    if (paramInt1 < i || paramInt1 >= j + i || paramInt2 < k || paramInt2 >= m + k)
      bool = false; 
    return bool;
  }
  
  public boolean keyDown(int paramInt) {
    Actor actor1 = this.keyboardFocus;
    Actor actor2 = actor1;
    if (actor1 == null)
      actor2 = this.root; 
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.keyDown);
    inputEvent.setKeyCode(paramInt);
    actor2.fire(inputEvent);
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public boolean keyTyped(char paramChar) {
    Actor actor1 = this.keyboardFocus;
    Actor actor2 = actor1;
    if (actor1 == null)
      actor2 = this.root; 
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.keyTyped);
    inputEvent.setCharacter(paramChar);
    actor2.fire(inputEvent);
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public boolean keyUp(int paramInt) {
    Actor actor1 = this.keyboardFocus;
    Actor actor2 = actor1;
    if (actor1 == null)
      actor2 = this.root; 
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.keyUp);
    inputEvent.setKeyCode(paramInt);
    actor2.fire(inputEvent);
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public boolean mouseMoved(int paramInt1, int paramInt2) {
    this.mouseScreenX = paramInt1;
    this.mouseScreenY = paramInt2;
    if (!isInsideViewport(paramInt1, paramInt2))
      return false; 
    screenToStageCoordinates(this.tempCoords.set(paramInt1, paramInt2));
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.mouseMoved);
    inputEvent.setStageX(this.tempCoords.x);
    inputEvent.setStageY(this.tempCoords.y);
    Actor actor1 = hit(this.tempCoords.x, this.tempCoords.y, true);
    Actor actor2 = actor1;
    if (actor1 == null)
      actor2 = this.root; 
    actor2.fire(inputEvent);
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public boolean removeCaptureListener(EventListener paramEventListener) { return this.root.removeCaptureListener(paramEventListener); }
  
  public boolean removeListener(EventListener paramEventListener) { return this.root.removeListener(paramEventListener); }
  
  public void removeTouchFocus(EventListener paramEventListener, Actor paramActor1, Actor paramActor2, int paramInt1, int paramInt2) {
    SnapshotArray snapshotArray = this.touchFocuses;
    for (int i = snapshotArray.size - 1; i >= 0; i--) {
      TouchFocus touchFocus = (TouchFocus)snapshotArray.get(i);
      if (touchFocus.listener == paramEventListener && touchFocus.listenerActor == paramActor1 && touchFocus.target == paramActor2 && touchFocus.pointer == paramInt1 && touchFocus.button == paramInt2) {
        snapshotArray.removeIndex(i);
        Pools.free(touchFocus);
      } 
    } 
  }
  
  public Vector2 screenToStageCoordinates(Vector2 paramVector2) {
    this.viewport.unproject(paramVector2);
    return paramVector2;
  }
  
  public boolean scrolled(int paramInt) {
    Actor actor1 = this.scrollFocus;
    Actor actor2 = actor1;
    if (actor1 == null)
      actor2 = this.root; 
    screenToStageCoordinates(this.tempCoords.set(this.mouseScreenX, this.mouseScreenY));
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setStage(this);
    inputEvent.setType(InputEvent.Type.scrolled);
    inputEvent.setScrollAmount(paramInt);
    inputEvent.setStageX(this.tempCoords.x);
    inputEvent.setStageY(this.tempCoords.y);
    actor2.fire(inputEvent);
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public void setActionsRequestRendering(boolean paramBoolean) { this.actionsRequestRendering = paramBoolean; }
  
  public void setDebugAll(boolean paramBoolean) {
    if (this.debugAll == paramBoolean)
      return; 
    this.debugAll = paramBoolean;
    if (paramBoolean) {
      debug = true;
    } else {
      this.root.setDebug(false, true);
    } 
  }
  
  public void setDebugInvisible(boolean paramBoolean) { this.debugInvisible = paramBoolean; }
  
  public void setDebugParentUnderMouse(boolean paramBoolean) {
    if (this.debugParentUnderMouse == paramBoolean)
      return; 
    this.debugParentUnderMouse = paramBoolean;
    if (paramBoolean) {
      debug = true;
    } else {
      this.root.setDebug(false, true);
    } 
  }
  
  public void setDebugTableUnderMouse(Table.Debug paramDebug) {
    Table.Debug debug1 = paramDebug;
    if (paramDebug == null)
      debug1 = Table.Debug.none; 
    if (this.debugTableUnderMouse == debug1)
      return; 
    this.debugTableUnderMouse = debug1;
    if (debug1 != Table.Debug.none) {
      debug = true;
    } else {
      this.root.setDebug(false, true);
    } 
  }
  
  public void setDebugTableUnderMouse(boolean paramBoolean) {
    Table.Debug debug1;
    if (paramBoolean) {
      debug1 = Table.Debug.all;
    } else {
      debug1 = Table.Debug.none;
    } 
    setDebugTableUnderMouse(debug1);
  }
  
  public void setDebugUnderMouse(boolean paramBoolean) {
    if (this.debugUnderMouse == paramBoolean)
      return; 
    this.debugUnderMouse = paramBoolean;
    if (paramBoolean) {
      debug = true;
    } else {
      this.root.setDebug(false, true);
    } 
  }
  
  public boolean setKeyboardFocus(Actor paramActor) {
    if (this.keyboardFocus == paramActor)
      return true; 
    FocusListener.FocusEvent focusEvent = (FocusListener.FocusEvent)Pools.obtain(FocusListener.FocusEvent.class);
    focusEvent.setStage(this);
    focusEvent.setType(FocusListener.FocusEvent.Type.keyboard);
    Actor actor = this.keyboardFocus;
    if (actor != null) {
      focusEvent.setFocused(false);
      focusEvent.setRelatedActor(paramActor);
      actor.fire(focusEvent);
    } 
    boolean bool1 = focusEvent.isCancelled() ^ true;
    boolean bool2 = bool1;
    if (bool1) {
      this.keyboardFocus = paramActor;
      bool2 = bool1;
      if (paramActor != null) {
        focusEvent.setFocused(true);
        focusEvent.setRelatedActor(actor);
        paramActor.fire(focusEvent);
        bool1 = focusEvent.isCancelled() ^ true;
        bool2 = bool1;
        if (!bool1) {
          this.keyboardFocus = actor;
          bool2 = bool1;
        } 
      } 
    } 
    Pools.free(focusEvent);
    return bool2;
  }
  
  public void setRoot(Group paramGroup) {
    if (paramGroup.parent != null)
      paramGroup.parent.removeActor(paramGroup, false); 
    this.root = paramGroup;
    paramGroup.setParent(null);
    paramGroup.setStage(this);
  }
  
  public boolean setScrollFocus(Actor paramActor) {
    if (this.scrollFocus == paramActor)
      return true; 
    FocusListener.FocusEvent focusEvent = (FocusListener.FocusEvent)Pools.obtain(FocusListener.FocusEvent.class);
    focusEvent.setStage(this);
    focusEvent.setType(FocusListener.FocusEvent.Type.scroll);
    Actor actor = this.scrollFocus;
    if (actor != null) {
      focusEvent.setFocused(false);
      focusEvent.setRelatedActor(paramActor);
      actor.fire(focusEvent);
    } 
    boolean bool1 = focusEvent.isCancelled() ^ true;
    boolean bool2 = bool1;
    if (bool1) {
      this.scrollFocus = paramActor;
      bool2 = bool1;
      if (paramActor != null) {
        focusEvent.setFocused(true);
        focusEvent.setRelatedActor(actor);
        paramActor.fire(focusEvent);
        bool1 = focusEvent.isCancelled() ^ true;
        bool2 = bool1;
        if (!bool1) {
          this.scrollFocus = actor;
          bool2 = bool1;
        } 
      } 
    } 
    Pools.free(focusEvent);
    return bool2;
  }
  
  public void setViewport(Viewport paramViewport) { this.viewport = paramViewport; }
  
  public Vector2 stageToScreenCoordinates(Vector2 paramVector2) {
    this.viewport.project(paramVector2);
    paramVector2.y = this.viewport.getScreenHeight() - paramVector2.y;
    return paramVector2;
  }
  
  public Vector2 toScreenCoordinates(Vector2 paramVector2, Matrix4 paramMatrix4) { return this.viewport.toScreenCoordinates(paramVector2, paramMatrix4); }
  
  public boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (!isInsideViewport(paramInt1, paramInt2))
      return false; 
    this.pointerTouched[paramInt3] = true;
    this.pointerScreenX[paramInt3] = paramInt1;
    this.pointerScreenY[paramInt3] = paramInt2;
    screenToStageCoordinates(this.tempCoords.set(paramInt1, paramInt2));
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setType(InputEvent.Type.touchDown);
    inputEvent.setStage(this);
    inputEvent.setStageX(this.tempCoords.x);
    inputEvent.setStageY(this.tempCoords.y);
    inputEvent.setPointer(paramInt3);
    inputEvent.setButton(paramInt4);
    Actor actor = hit(this.tempCoords.x, this.tempCoords.y, true);
    if (actor == null) {
      if (this.root.getTouchable() == Touchable.enabled)
        this.root.fire(inputEvent); 
    } else {
      actor.fire(inputEvent);
    } 
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) {
    this.pointerScreenX[paramInt3] = paramInt1;
    this.pointerScreenY[paramInt3] = paramInt2;
    this.mouseScreenX = paramInt1;
    this.mouseScreenY = paramInt2;
    int i = this.touchFocuses.size;
    int j = 0;
    if (i == 0)
      return false; 
    screenToStageCoordinates(this.tempCoords.set(paramInt1, paramInt2));
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setType(InputEvent.Type.touchDragged);
    inputEvent.setStage(this);
    inputEvent.setStageX(this.tempCoords.x);
    inputEvent.setStageY(this.tempCoords.y);
    inputEvent.setPointer(paramInt3);
    SnapshotArray snapshotArray = this.touchFocuses;
    TouchFocus[] arrayOfTouchFocus = (TouchFocus[])snapshotArray.begin();
    paramInt2 = snapshotArray.size;
    for (paramInt1 = j; paramInt1 < paramInt2; paramInt1++) {
      TouchFocus touchFocus = arrayOfTouchFocus[paramInt1];
      if (touchFocus.pointer == paramInt3 && snapshotArray.contains(touchFocus, true)) {
        inputEvent.setTarget(touchFocus.target);
        inputEvent.setListenerActor(touchFocus.listenerActor);
        if (touchFocus.listener.handle(inputEvent))
          inputEvent.handle(); 
      } 
    } 
    snapshotArray.end();
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    boolean[] arrayOfBoolean = this.pointerTouched;
    int i = 0;
    arrayOfBoolean[paramInt3] = false;
    this.pointerScreenX[paramInt3] = paramInt1;
    this.pointerScreenY[paramInt3] = paramInt2;
    if (this.touchFocuses.size == 0)
      return false; 
    screenToStageCoordinates(this.tempCoords.set(paramInt1, paramInt2));
    InputEvent inputEvent = (InputEvent)Pools.obtain(InputEvent.class);
    inputEvent.setType(InputEvent.Type.touchUp);
    inputEvent.setStage(this);
    inputEvent.setStageX(this.tempCoords.x);
    inputEvent.setStageY(this.tempCoords.y);
    inputEvent.setPointer(paramInt3);
    inputEvent.setButton(paramInt4);
    SnapshotArray snapshotArray = this.touchFocuses;
    TouchFocus[] arrayOfTouchFocus = (TouchFocus[])snapshotArray.begin();
    paramInt2 = snapshotArray.size;
    for (paramInt1 = i; paramInt1 < paramInt2; paramInt1++) {
      TouchFocus touchFocus = arrayOfTouchFocus[paramInt1];
      if (touchFocus.pointer == paramInt3 && touchFocus.button == paramInt4 && snapshotArray.removeValue(touchFocus, true)) {
        inputEvent.setTarget(touchFocus.target);
        inputEvent.setListenerActor(touchFocus.listenerActor);
        if (touchFocus.listener.handle(inputEvent))
          inputEvent.handle(); 
        Pools.free(touchFocus);
      } 
    } 
    snapshotArray.end();
    boolean bool = inputEvent.isHandled();
    Pools.free(inputEvent);
    return bool;
  }
  
  public void unfocus(Actor paramActor) {
    cancelTouchFocus(paramActor);
    Actor actor = this.scrollFocus;
    if (actor != null && actor.isDescendantOf(paramActor))
      setScrollFocus(null); 
    actor = this.keyboardFocus;
    if (actor != null && actor.isDescendantOf(paramActor))
      setKeyboardFocus(null); 
  }
  
  public void unfocusAll() {
    setScrollFocus(null);
    setKeyboardFocus(null);
    cancelTouchFocus();
  }
  
  public static final class TouchFocus implements Pool.Poolable {
    int button;
    
    EventListener listener;
    
    Actor listenerActor;
    
    int pointer;
    
    Actor target;
    
    public void reset() {
      this.listenerActor = null;
      this.listener = null;
      this.target = null;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/Stage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */