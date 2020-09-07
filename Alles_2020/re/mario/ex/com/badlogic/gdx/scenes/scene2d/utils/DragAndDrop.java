package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ObjectMap;

public class DragAndDrop {
  static final Vector2 tmpVector = new Vector2();
  
  int activePointer = -1;
  
  private int button;
  
  boolean cancelTouchFocus = true;
  
  Actor dragActor;
  
  float dragActorX = 0.0F;
  
  float dragActorY = 0.0F;
  
  Source dragSource;
  
  int dragTime = 250;
  
  long dragValidTime;
  
  boolean isValidTarget;
  
  boolean keepWithinStage = true;
  
  Payload payload;
  
  final ObjectMap<Source, DragListener> sourceListeners = new ObjectMap();
  
  private float tapSquareSize = 8.0F;
  
  Target target;
  
  final Array<Target> targets = new Array();
  
  float touchOffsetX;
  
  float touchOffsetY;
  
  public void addSource(final Source source) {
    DragListener dragListener = new DragListener() {
        public void drag(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) { // Byte code:
          //   0: aload_0
          //   1: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   4: getfield payload : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;
          //   7: ifnonnull -> 11
          //   10: return
          //   11: iload #4
          //   13: aload_0
          //   14: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   17: getfield activePointer : I
          //   20: if_icmpeq -> 24
          //   23: return
          //   24: aload_0
          //   25: getfield val$source : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Source;
          //   28: aload_1
          //   29: fload_2
          //   30: fload_3
          //   31: iload #4
          //   33: invokevirtual drag : (Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
          //   36: aload_1
          //   37: invokevirtual getStage : ()Lcom/badlogic/gdx/scenes/scene2d/Stage;
          //   40: astore #5
          //   42: aload_0
          //   43: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   46: getfield dragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   49: astore #6
          //   51: aconst_null
          //   52: astore #7
          //   54: aload #6
          //   56: ifnull -> 78
          //   59: aload_0
          //   60: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   63: getfield dragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   66: invokevirtual remove : ()Z
          //   69: pop
          //   70: aload_0
          //   71: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   74: aconst_null
          //   75: putfield dragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   78: aload_0
          //   79: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   82: astore #6
          //   84: iconst_0
          //   85: istore #8
          //   87: aload #6
          //   89: iconst_0
          //   90: putfield isValidTarget : Z
          //   93: aload_1
          //   94: invokevirtual getStageX : ()F
          //   97: aload_0
          //   98: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   101: getfield touchOffsetX : F
          //   104: fadd
          //   105: fstore_3
          //   106: aload_1
          //   107: invokevirtual getStageY : ()F
          //   110: aload_0
          //   111: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   114: getfield touchOffsetY : F
          //   117: fadd
          //   118: fstore_2
          //   119: aload_1
          //   120: invokevirtual getStage : ()Lcom/badlogic/gdx/scenes/scene2d/Stage;
          //   123: fload_3
          //   124: fload_2
          //   125: iconst_1
          //   126: invokevirtual hit : (FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   129: astore #9
          //   131: aload #9
          //   133: astore #6
          //   135: aload #9
          //   137: ifnonnull -> 152
          //   140: aload_1
          //   141: invokevirtual getStage : ()Lcom/badlogic/gdx/scenes/scene2d/Stage;
          //   144: fload_3
          //   145: fload_2
          //   146: iconst_0
          //   147: invokevirtual hit : (FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   150: astore #6
          //   152: aload #6
          //   154: ifnull -> 236
          //   157: aload_0
          //   158: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   161: getfield targets : Lcom/badlogic/gdx/utils/Array;
          //   164: getfield size : I
          //   167: istore #10
          //   169: iload #8
          //   171: iload #10
          //   173: if_icmpge -> 236
          //   176: aload_0
          //   177: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   180: getfield targets : Lcom/badlogic/gdx/utils/Array;
          //   183: iload #8
          //   185: invokevirtual get : (I)Ljava/lang/Object;
          //   188: checkcast com/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Target
          //   191: astore #9
          //   193: aload #9
          //   195: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   198: aload #6
          //   200: invokevirtual isAscendantOf : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z
          //   203: ifne -> 212
          //   206: iinc #8, 1
          //   209: goto -> 169
          //   212: aload #9
          //   214: getfield actor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   217: getstatic com/badlogic/gdx/scenes/scene2d/utils/DragAndDrop.tmpVector : Lcom/badlogic/gdx/math/Vector2;
          //   220: fload_3
          //   221: fload_2
          //   222: invokevirtual set : (FF)Lcom/badlogic/gdx/math/Vector2;
          //   225: invokevirtual stageToLocalCoordinates : (Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
          //   228: pop
          //   229: aload #9
          //   231: astore #6
          //   233: goto -> 239
          //   236: aconst_null
          //   237: astore #6
          //   239: aload #6
          //   241: aload_0
          //   242: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   245: getfield target : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Target;
          //   248: if_acmpeq -> 291
          //   251: aload_0
          //   252: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   255: getfield target : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Target;
          //   258: ifnull -> 282
          //   261: aload_0
          //   262: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   265: getfield target : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Target;
          //   268: aload_0
          //   269: getfield val$source : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Source;
          //   272: aload_0
          //   273: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   276: getfield payload : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;
          //   279: invokevirtual reset : (Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Source;Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;)V
          //   282: aload_0
          //   283: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   286: aload #6
          //   288: putfield target : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Target;
          //   291: aload #6
          //   293: ifnull -> 335
          //   296: aload_0
          //   297: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   300: astore #9
          //   302: aload #9
          //   304: aload #6
          //   306: aload_0
          //   307: getfield val$source : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Source;
          //   310: aload #9
          //   312: getfield payload : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;
          //   315: getstatic com/badlogic/gdx/scenes/scene2d/utils/DragAndDrop.tmpVector : Lcom/badlogic/gdx/math/Vector2;
          //   318: getfield x : F
          //   321: getstatic com/badlogic/gdx/scenes/scene2d/utils/DragAndDrop.tmpVector : Lcom/badlogic/gdx/math/Vector2;
          //   324: getfield y : F
          //   327: iload #4
          //   329: invokevirtual drag : (Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Source;Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;FFI)Z
          //   332: putfield isValidTarget : Z
          //   335: aload #7
          //   337: astore #6
          //   339: aload_0
          //   340: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   343: getfield target : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Target;
          //   346: ifnull -> 386
          //   349: aload_0
          //   350: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   353: getfield isValidTarget : Z
          //   356: ifeq -> 374
          //   359: aload_0
          //   360: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   363: getfield payload : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;
          //   366: getfield validDragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   369: astore #6
          //   371: goto -> 386
          //   374: aload_0
          //   375: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   378: getfield payload : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;
          //   381: getfield invalidDragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   384: astore #6
          //   386: aload #6
          //   388: astore #7
          //   390: aload #6
          //   392: ifnonnull -> 407
          //   395: aload_0
          //   396: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   399: getfield payload : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop$Payload;
          //   402: getfield dragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   405: astore #7
          //   407: aload_0
          //   408: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   411: aload #7
          //   413: putfield dragActor : Lcom/badlogic/gdx/scenes/scene2d/Actor;
          //   416: aload #7
          //   418: ifnonnull -> 422
          //   421: return
          //   422: aload #5
          //   424: aload #7
          //   426: invokevirtual addActor : (Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
          //   429: aload_1
          //   430: invokevirtual getStageX : ()F
          //   433: aload #7
          //   435: invokevirtual getWidth : ()F
          //   438: fsub
          //   439: aload_0
          //   440: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   443: getfield dragActorX : F
          //   446: fadd
          //   447: fstore_2
          //   448: aload_1
          //   449: invokevirtual getStageY : ()F
          //   452: aload_0
          //   453: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   456: getfield dragActorY : F
          //   459: fadd
          //   460: fstore #11
          //   462: fload_2
          //   463: fstore #12
          //   465: fload #11
          //   467: fstore_3
          //   468: aload_0
          //   469: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/utils/DragAndDrop;
          //   472: getfield keepWithinStage : Z
          //   475: ifeq -> 570
          //   478: fload_2
          //   479: fstore_3
          //   480: fload_2
          //   481: fconst_0
          //   482: fcmpg
          //   483: ifge -> 488
          //   486: fconst_0
          //   487: fstore_3
          //   488: fload #11
          //   490: fstore_2
          //   491: fload #11
          //   493: fconst_0
          //   494: fcmpg
          //   495: ifge -> 500
          //   498: fconst_0
          //   499: fstore_2
          //   500: fload_3
          //   501: fstore #11
          //   503: aload #7
          //   505: invokevirtual getWidth : ()F
          //   508: fload_3
          //   509: fadd
          //   510: aload #5
          //   512: invokevirtual getWidth : ()F
          //   515: fcmpl
          //   516: ifle -> 532
          //   519: aload #5
          //   521: invokevirtual getWidth : ()F
          //   524: aload #7
          //   526: invokevirtual getWidth : ()F
          //   529: fsub
          //   530: fstore #11
          //   532: fload #11
          //   534: fstore #12
          //   536: fload_2
          //   537: fstore_3
          //   538: aload #7
          //   540: invokevirtual getHeight : ()F
          //   543: fload_2
          //   544: fadd
          //   545: aload #5
          //   547: invokevirtual getHeight : ()F
          //   550: fcmpl
          //   551: ifle -> 570
          //   554: aload #5
          //   556: invokevirtual getHeight : ()F
          //   559: aload #7
          //   561: invokevirtual getHeight : ()F
          //   564: fsub
          //   565: fstore_3
          //   566: fload #11
          //   568: fstore #12
          //   570: aload #7
          //   572: fload #12
          //   574: fload_3
          //   575: invokevirtual setPosition : (FF)V
          //   578: return }
        
        public void dragStart(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
          if (DragAndDrop.this.activePointer != -1) {
            param1InputEvent.stop();
            return;
          } 
          DragAndDrop dragAndDrop1 = DragAndDrop.this;
          dragAndDrop1.activePointer = param1Int;
          dragAndDrop1.dragValidTime = System.currentTimeMillis() + DragAndDrop.this.dragTime;
          DragAndDrop dragAndDrop2 = DragAndDrop.this;
          DragAndDrop.Source source = source;
          dragAndDrop2.dragSource = source;
          dragAndDrop2.payload = source.dragStart(param1InputEvent, getTouchDownX(), getTouchDownY(), param1Int);
          param1InputEvent.stop();
          if (DragAndDrop.this.cancelTouchFocus && DragAndDrop.this.payload != null) {
            Stage stage = source.getActor().getStage();
            if (stage != null)
              stage.cancelTouchFocusExcept(this, source.getActor()); 
          } 
        }
        
        public void dragStop(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
          if (param1Int != DragAndDrop.this.activePointer)
            return; 
          DragAndDrop dragAndDrop2 = DragAndDrop.this;
          dragAndDrop2.activePointer = -1;
          if (dragAndDrop2.payload == null)
            return; 
          if (System.currentTimeMillis() < DragAndDrop.this.dragValidTime)
            DragAndDrop.this.isValidTarget = false; 
          if (DragAndDrop.this.dragActor != null)
            DragAndDrop.this.dragActor.remove(); 
          if (DragAndDrop.this.isValidTarget) {
            float f1 = param1InputEvent.getStageX();
            float f2 = DragAndDrop.this.touchOffsetX;
            float f3 = param1InputEvent.getStageY();
            float f4 = DragAndDrop.this.touchOffsetY;
            this.this$0.target.actor.stageToLocalCoordinates(DragAndDrop.tmpVector.set(f1 + f2, f3 + f4));
            DragAndDrop.this.target.drop(source, DragAndDrop.this.payload, DragAndDrop.tmpVector.x, DragAndDrop.tmpVector.y, param1Int);
          } 
          DragAndDrop.Source source = source;
          DragAndDrop.Payload payload = DragAndDrop.this.payload;
          if (DragAndDrop.this.isValidTarget) {
            DragAndDrop.Target target = DragAndDrop.this.target;
          } else {
            dragAndDrop2 = null;
          } 
          source.dragStop(param1InputEvent, param1Float1, param1Float2, param1Int, payload, dragAndDrop2);
          if (DragAndDrop.this.target != null)
            DragAndDrop.this.target.reset(source, DragAndDrop.this.payload); 
          DragAndDrop dragAndDrop1 = DragAndDrop.this;
          dragAndDrop1.dragSource = null;
          dragAndDrop1.payload = null;
          dragAndDrop1.target = null;
          dragAndDrop1.isValidTarget = false;
          dragAndDrop1.dragActor = null;
        }
      };
    dragListener.setTapSquareSize(this.tapSquareSize);
    dragListener.setButton(this.button);
    paramSource.actor.addCaptureListener(dragListener);
    this.sourceListeners.put(paramSource, dragListener);
  }
  
  public void addTarget(Target paramTarget) { this.targets.add(paramTarget); }
  
  public void cancelTouchFocusExcept(Source paramSource) {
    DragListener dragListener = (DragListener)this.sourceListeners.get(paramSource);
    if (dragListener == null)
      return; 
    Stage stage = paramSource.getActor().getStage();
    if (stage != null)
      stage.cancelTouchFocusExcept(dragListener, paramSource.getActor()); 
  }
  
  public void clear() {
    this.targets.clear();
    ObjectMap.Entries entries = this.sourceListeners.entries().iterator();
    while (entries.hasNext()) {
      ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
      ((Source)entry.key).actor.removeCaptureListener((EventListener)entry.value);
    } 
    this.sourceListeners.clear();
  }
  
  public Actor getDragActor() { return this.dragActor; }
  
  public Payload getDragPayload() { return this.payload; }
  
  public Source getDragSource() { return this.dragSource; }
  
  public int getDragTime() { return this.dragTime; }
  
  public boolean isDragValid() {
    boolean bool;
    if (this.payload != null && System.currentTimeMillis() >= this.dragValidTime) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isDragging() {
    boolean bool;
    if (this.payload != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void removeSource(Source paramSource) {
    DragListener dragListener = (DragListener)this.sourceListeners.remove(paramSource);
    paramSource.actor.removeCaptureListener(dragListener);
  }
  
  public void removeTarget(Target paramTarget) { this.targets.removeValue(paramTarget, true); }
  
  public void setButton(int paramInt) { this.button = paramInt; }
  
  public void setCancelTouchFocus(boolean paramBoolean) { this.cancelTouchFocus = paramBoolean; }
  
  public void setDragActorPosition(float paramFloat1, float paramFloat2) {
    this.dragActorX = paramFloat1;
    this.dragActorY = paramFloat2;
  }
  
  public void setDragTime(int paramInt) { this.dragTime = paramInt; }
  
  public void setKeepWithinStage(boolean paramBoolean) { this.keepWithinStage = paramBoolean; }
  
  public void setTapSquareSize(float paramFloat) { this.tapSquareSize = paramFloat; }
  
  public void setTouchOffset(float paramFloat1, float paramFloat2) {
    this.touchOffsetX = paramFloat1;
    this.touchOffsetY = paramFloat2;
  }
  
  public static class Payload {
    Actor dragActor;
    
    Actor invalidDragActor;
    
    Object object;
    
    Actor validDragActor;
    
    public Actor getDragActor() { return this.dragActor; }
    
    public Actor getInvalidDragActor() { return this.invalidDragActor; }
    
    public Object getObject() { return this.object; }
    
    public Actor getValidDragActor() { return this.validDragActor; }
    
    public void setDragActor(Actor param1Actor) { this.dragActor = param1Actor; }
    
    public void setInvalidDragActor(Actor param1Actor) { this.invalidDragActor = param1Actor; }
    
    public void setObject(Object param1Object) { this.object = param1Object; }
    
    public void setValidDragActor(Actor param1Actor) { this.validDragActor = param1Actor; }
  }
  
  public static abstract class Source {
    final Actor actor;
    
    public Source(Actor param1Actor) {
      if (param1Actor != null) {
        this.actor = param1Actor;
        return;
      } 
      throw new IllegalArgumentException("actor cannot be null.");
    }
    
    public void drag(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {}
    
    public abstract DragAndDrop.Payload dragStart(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int);
    
    public void dragStop(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, DragAndDrop.Payload param1Payload, DragAndDrop.Target param1Target) {}
    
    public Actor getActor() { return this.actor; }
  }
  
  public static abstract class Target {
    final Actor actor;
    
    public Target(Actor param1Actor) {
      if (param1Actor != null) {
        this.actor = param1Actor;
        Stage stage = param1Actor.getStage();
        if (stage == null || param1Actor != stage.getRoot())
          return; 
        throw new IllegalArgumentException("The stage root cannot be a drag and drop target.");
      } 
      throw new IllegalArgumentException("actor cannot be null.");
    }
    
    public abstract boolean drag(DragAndDrop.Source param1Source, DragAndDrop.Payload param1Payload, float param1Float1, float param1Float2, int param1Int);
    
    public abstract void drop(DragAndDrop.Source param1Source, DragAndDrop.Payload param1Payload, float param1Float1, float param1Float2, int param1Int);
    
    public Actor getActor() { return this.actor; }
    
    public void reset(DragAndDrop.Source param1Source, DragAndDrop.Payload param1Payload) {}
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/DragAndDrop.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */