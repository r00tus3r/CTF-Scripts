package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class Actions {
  public static <T extends Action> T action(Class<T> paramClass) {
    Pool pool = Pools.get(paramClass);
    Action action = (Action)pool.obtain();
    action.setPool(pool);
    return (T)action;
  }
  
  public static AddAction addAction(Action paramAction) {
    AddAction addAction = (AddAction)action(AddAction.class);
    addAction.setAction(paramAction);
    return addAction;
  }
  
  public static AddAction addAction(Action paramAction, Actor paramActor) {
    AddAction addAction = (AddAction)action(AddAction.class);
    addAction.setTarget(paramActor);
    addAction.setAction(paramAction);
    return addAction;
  }
  
  public static AddListenerAction addListener(EventListener paramEventListener, boolean paramBoolean) {
    AddListenerAction addListenerAction = (AddListenerAction)action(AddListenerAction.class);
    addListenerAction.setListener(paramEventListener);
    addListenerAction.setCapture(paramBoolean);
    return addListenerAction;
  }
  
  public static AddListenerAction addListener(EventListener paramEventListener, boolean paramBoolean, Actor paramActor) {
    AddListenerAction addListenerAction = (AddListenerAction)action(AddListenerAction.class);
    addListenerAction.setTarget(paramActor);
    addListenerAction.setListener(paramEventListener);
    addListenerAction.setCapture(paramBoolean);
    return addListenerAction;
  }
  
  public static AfterAction after(Action paramAction) {
    AfterAction afterAction = (AfterAction)action(AfterAction.class);
    afterAction.setAction(paramAction);
    return afterAction;
  }
  
  public static AlphaAction alpha(float paramFloat) { return alpha(paramFloat, 0.0F, null); }
  
  public static AlphaAction alpha(float paramFloat1, float paramFloat2) { return alpha(paramFloat1, paramFloat2, null); }
  
  public static AlphaAction alpha(float paramFloat1, float paramFloat2, Interpolation paramInterpolation) {
    AlphaAction alphaAction = (AlphaAction)action(AlphaAction.class);
    alphaAction.setAlpha(paramFloat1);
    alphaAction.setDuration(paramFloat2);
    alphaAction.setInterpolation(paramInterpolation);
    return alphaAction;
  }
  
  public static ColorAction color(Color paramColor) { return color(paramColor, 0.0F, null); }
  
  public static ColorAction color(Color paramColor, float paramFloat) { return color(paramColor, paramFloat, null); }
  
  public static ColorAction color(Color paramColor, float paramFloat, Interpolation paramInterpolation) {
    ColorAction colorAction = (ColorAction)action(ColorAction.class);
    colorAction.setEndColor(paramColor);
    colorAction.setDuration(paramFloat);
    colorAction.setInterpolation(paramInterpolation);
    return colorAction;
  }
  
  public static DelayAction delay(float paramFloat) {
    DelayAction delayAction = (DelayAction)action(DelayAction.class);
    delayAction.setDuration(paramFloat);
    return delayAction;
  }
  
  public static DelayAction delay(float paramFloat, Action paramAction) {
    DelayAction delayAction = (DelayAction)action(DelayAction.class);
    delayAction.setDuration(paramFloat);
    delayAction.setAction(paramAction);
    return delayAction;
  }
  
  public static AlphaAction fadeIn(float paramFloat) { return alpha(1.0F, paramFloat, null); }
  
  public static AlphaAction fadeIn(float paramFloat, Interpolation paramInterpolation) {
    AlphaAction alphaAction = (AlphaAction)action(AlphaAction.class);
    alphaAction.setAlpha(1.0F);
    alphaAction.setDuration(paramFloat);
    alphaAction.setInterpolation(paramInterpolation);
    return alphaAction;
  }
  
  public static AlphaAction fadeOut(float paramFloat) { return alpha(0.0F, paramFloat, null); }
  
  public static AlphaAction fadeOut(float paramFloat, Interpolation paramInterpolation) {
    AlphaAction alphaAction = (AlphaAction)action(AlphaAction.class);
    alphaAction.setAlpha(0.0F);
    alphaAction.setDuration(paramFloat);
    alphaAction.setInterpolation(paramInterpolation);
    return alphaAction;
  }
  
  public static RepeatAction forever(Action paramAction) {
    RepeatAction repeatAction = (RepeatAction)action(RepeatAction.class);
    repeatAction.setCount(-1);
    repeatAction.setAction(paramAction);
    return repeatAction;
  }
  
  public static VisibleAction hide() { return visible(false); }
  
  public static LayoutAction layout(boolean paramBoolean) {
    LayoutAction layoutAction = (LayoutAction)action(LayoutAction.class);
    layoutAction.setLayoutEnabled(paramBoolean);
    return layoutAction;
  }
  
  public static MoveByAction moveBy(float paramFloat1, float paramFloat2) { return moveBy(paramFloat1, paramFloat2, 0.0F, null); }
  
  public static MoveByAction moveBy(float paramFloat1, float paramFloat2, float paramFloat3) { return moveBy(paramFloat1, paramFloat2, paramFloat3, null); }
  
  public static MoveByAction moveBy(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) {
    MoveByAction moveByAction = (MoveByAction)action(MoveByAction.class);
    moveByAction.setAmount(paramFloat1, paramFloat2);
    moveByAction.setDuration(paramFloat3);
    moveByAction.setInterpolation(paramInterpolation);
    return moveByAction;
  }
  
  public static MoveToAction moveTo(float paramFloat1, float paramFloat2) { return moveTo(paramFloat1, paramFloat2, 0.0F, null); }
  
  public static MoveToAction moveTo(float paramFloat1, float paramFloat2, float paramFloat3) { return moveTo(paramFloat1, paramFloat2, paramFloat3, null); }
  
  public static MoveToAction moveTo(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) {
    MoveToAction moveToAction = (MoveToAction)action(MoveToAction.class);
    moveToAction.setPosition(paramFloat1, paramFloat2);
    moveToAction.setDuration(paramFloat3);
    moveToAction.setInterpolation(paramInterpolation);
    return moveToAction;
  }
  
  public static MoveToAction moveToAligned(float paramFloat1, float paramFloat2, int paramInt) { return moveToAligned(paramFloat1, paramFloat2, paramInt, 0.0F, null); }
  
  public static MoveToAction moveToAligned(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3) { return moveToAligned(paramFloat1, paramFloat2, paramInt, paramFloat3, null); }
  
  public static MoveToAction moveToAligned(float paramFloat1, float paramFloat2, int paramInt, float paramFloat3, Interpolation paramInterpolation) {
    MoveToAction moveToAction = (MoveToAction)action(MoveToAction.class);
    moveToAction.setPosition(paramFloat1, paramFloat2, paramInt);
    moveToAction.setDuration(paramFloat3);
    moveToAction.setInterpolation(paramInterpolation);
    return moveToAction;
  }
  
  public static ParallelAction parallel() { return (ParallelAction)action(ParallelAction.class); }
  
  public static ParallelAction parallel(Action paramAction) {
    ParallelAction parallelAction = (ParallelAction)action(ParallelAction.class);
    parallelAction.addAction(paramAction);
    return parallelAction;
  }
  
  public static ParallelAction parallel(Action paramAction1, Action paramAction2) {
    ParallelAction parallelAction = (ParallelAction)action(ParallelAction.class);
    parallelAction.addAction(paramAction1);
    parallelAction.addAction(paramAction2);
    return parallelAction;
  }
  
  public static ParallelAction parallel(Action paramAction1, Action paramAction2, Action paramAction3) {
    ParallelAction parallelAction = (ParallelAction)action(ParallelAction.class);
    parallelAction.addAction(paramAction1);
    parallelAction.addAction(paramAction2);
    parallelAction.addAction(paramAction3);
    return parallelAction;
  }
  
  public static ParallelAction parallel(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4) {
    ParallelAction parallelAction = (ParallelAction)action(ParallelAction.class);
    parallelAction.addAction(paramAction1);
    parallelAction.addAction(paramAction2);
    parallelAction.addAction(paramAction3);
    parallelAction.addAction(paramAction4);
    return parallelAction;
  }
  
  public static ParallelAction parallel(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4, Action paramAction5) {
    ParallelAction parallelAction = (ParallelAction)action(ParallelAction.class);
    parallelAction.addAction(paramAction1);
    parallelAction.addAction(paramAction2);
    parallelAction.addAction(paramAction3);
    parallelAction.addAction(paramAction4);
    parallelAction.addAction(paramAction5);
    return parallelAction;
  }
  
  public static ParallelAction parallel(Action... paramVarArgs) {
    ParallelAction parallelAction = (ParallelAction)action(ParallelAction.class);
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      parallelAction.addAction(paramVarArgs[b]); 
    return parallelAction;
  }
  
  public static RemoveAction removeAction(Action paramAction) {
    RemoveAction removeAction = (RemoveAction)action(RemoveAction.class);
    removeAction.setAction(paramAction);
    return removeAction;
  }
  
  public static RemoveAction removeAction(Action paramAction, Actor paramActor) {
    RemoveAction removeAction = (RemoveAction)action(RemoveAction.class);
    removeAction.setTarget(paramActor);
    removeAction.setAction(paramAction);
    return removeAction;
  }
  
  public static RemoveActorAction removeActor() { return (RemoveActorAction)action(RemoveActorAction.class); }
  
  public static RemoveActorAction removeActor(Actor paramActor) {
    RemoveActorAction removeActorAction = (RemoveActorAction)action(RemoveActorAction.class);
    removeActorAction.setTarget(paramActor);
    return removeActorAction;
  }
  
  public static RemoveListenerAction removeListener(EventListener paramEventListener, boolean paramBoolean) {
    RemoveListenerAction removeListenerAction = (RemoveListenerAction)action(RemoveListenerAction.class);
    removeListenerAction.setListener(paramEventListener);
    removeListenerAction.setCapture(paramBoolean);
    return removeListenerAction;
  }
  
  public static RemoveListenerAction removeListener(EventListener paramEventListener, boolean paramBoolean, Actor paramActor) {
    RemoveListenerAction removeListenerAction = (RemoveListenerAction)action(RemoveListenerAction.class);
    removeListenerAction.setTarget(paramActor);
    removeListenerAction.setListener(paramEventListener);
    removeListenerAction.setCapture(paramBoolean);
    return removeListenerAction;
  }
  
  public static RepeatAction repeat(int paramInt, Action paramAction) {
    RepeatAction repeatAction = (RepeatAction)action(RepeatAction.class);
    repeatAction.setCount(paramInt);
    repeatAction.setAction(paramAction);
    return repeatAction;
  }
  
  public static RotateByAction rotateBy(float paramFloat) { return rotateBy(paramFloat, 0.0F, null); }
  
  public static RotateByAction rotateBy(float paramFloat1, float paramFloat2) { return rotateBy(paramFloat1, paramFloat2, null); }
  
  public static RotateByAction rotateBy(float paramFloat1, float paramFloat2, Interpolation paramInterpolation) {
    RotateByAction rotateByAction = (RotateByAction)action(RotateByAction.class);
    rotateByAction.setAmount(paramFloat1);
    rotateByAction.setDuration(paramFloat2);
    rotateByAction.setInterpolation(paramInterpolation);
    return rotateByAction;
  }
  
  public static RotateToAction rotateTo(float paramFloat) { return rotateTo(paramFloat, 0.0F, null); }
  
  public static RotateToAction rotateTo(float paramFloat1, float paramFloat2) { return rotateTo(paramFloat1, paramFloat2, null); }
  
  public static RotateToAction rotateTo(float paramFloat1, float paramFloat2, Interpolation paramInterpolation) {
    RotateToAction rotateToAction = (RotateToAction)action(RotateToAction.class);
    rotateToAction.setRotation(paramFloat1);
    rotateToAction.setDuration(paramFloat2);
    rotateToAction.setInterpolation(paramInterpolation);
    return rotateToAction;
  }
  
  public static RunnableAction run(Runnable paramRunnable) {
    RunnableAction runnableAction = (RunnableAction)action(RunnableAction.class);
    runnableAction.setRunnable(paramRunnable);
    return runnableAction;
  }
  
  public static ScaleByAction scaleBy(float paramFloat1, float paramFloat2) { return scaleBy(paramFloat1, paramFloat2, 0.0F, null); }
  
  public static ScaleByAction scaleBy(float paramFloat1, float paramFloat2, float paramFloat3) { return scaleBy(paramFloat1, paramFloat2, paramFloat3, null); }
  
  public static ScaleByAction scaleBy(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) {
    ScaleByAction scaleByAction = (ScaleByAction)action(ScaleByAction.class);
    scaleByAction.setAmount(paramFloat1, paramFloat2);
    scaleByAction.setDuration(paramFloat3);
    scaleByAction.setInterpolation(paramInterpolation);
    return scaleByAction;
  }
  
  public static ScaleToAction scaleTo(float paramFloat1, float paramFloat2) { return scaleTo(paramFloat1, paramFloat2, 0.0F, null); }
  
  public static ScaleToAction scaleTo(float paramFloat1, float paramFloat2, float paramFloat3) { return scaleTo(paramFloat1, paramFloat2, paramFloat3, null); }
  
  public static ScaleToAction scaleTo(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) {
    ScaleToAction scaleToAction = (ScaleToAction)action(ScaleToAction.class);
    scaleToAction.setScale(paramFloat1, paramFloat2);
    scaleToAction.setDuration(paramFloat3);
    scaleToAction.setInterpolation(paramInterpolation);
    return scaleToAction;
  }
  
  public static SequenceAction sequence() { return (SequenceAction)action(SequenceAction.class); }
  
  public static SequenceAction sequence(Action paramAction) {
    SequenceAction sequenceAction = (SequenceAction)action(SequenceAction.class);
    sequenceAction.addAction(paramAction);
    return sequenceAction;
  }
  
  public static SequenceAction sequence(Action paramAction1, Action paramAction2) {
    SequenceAction sequenceAction = (SequenceAction)action(SequenceAction.class);
    sequenceAction.addAction(paramAction1);
    sequenceAction.addAction(paramAction2);
    return sequenceAction;
  }
  
  public static SequenceAction sequence(Action paramAction1, Action paramAction2, Action paramAction3) {
    SequenceAction sequenceAction = (SequenceAction)action(SequenceAction.class);
    sequenceAction.addAction(paramAction1);
    sequenceAction.addAction(paramAction2);
    sequenceAction.addAction(paramAction3);
    return sequenceAction;
  }
  
  public static SequenceAction sequence(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4) {
    SequenceAction sequenceAction = (SequenceAction)action(SequenceAction.class);
    sequenceAction.addAction(paramAction1);
    sequenceAction.addAction(paramAction2);
    sequenceAction.addAction(paramAction3);
    sequenceAction.addAction(paramAction4);
    return sequenceAction;
  }
  
  public static SequenceAction sequence(Action paramAction1, Action paramAction2, Action paramAction3, Action paramAction4, Action paramAction5) {
    SequenceAction sequenceAction = (SequenceAction)action(SequenceAction.class);
    sequenceAction.addAction(paramAction1);
    sequenceAction.addAction(paramAction2);
    sequenceAction.addAction(paramAction3);
    sequenceAction.addAction(paramAction4);
    sequenceAction.addAction(paramAction5);
    return sequenceAction;
  }
  
  public static SequenceAction sequence(Action... paramVarArgs) {
    SequenceAction sequenceAction = (SequenceAction)action(SequenceAction.class);
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      sequenceAction.addAction(paramVarArgs[b]); 
    return sequenceAction;
  }
  
  public static VisibleAction show() { return visible(true); }
  
  public static SizeByAction sizeBy(float paramFloat1, float paramFloat2) { return sizeBy(paramFloat1, paramFloat2, 0.0F, null); }
  
  public static SizeByAction sizeBy(float paramFloat1, float paramFloat2, float paramFloat3) { return sizeBy(paramFloat1, paramFloat2, paramFloat3, null); }
  
  public static SizeByAction sizeBy(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) {
    SizeByAction sizeByAction = (SizeByAction)action(SizeByAction.class);
    sizeByAction.setAmount(paramFloat1, paramFloat2);
    sizeByAction.setDuration(paramFloat3);
    sizeByAction.setInterpolation(paramInterpolation);
    return sizeByAction;
  }
  
  public static SizeToAction sizeTo(float paramFloat1, float paramFloat2) { return sizeTo(paramFloat1, paramFloat2, 0.0F, null); }
  
  public static SizeToAction sizeTo(float paramFloat1, float paramFloat2, float paramFloat3) { return sizeTo(paramFloat1, paramFloat2, paramFloat3, null); }
  
  public static SizeToAction sizeTo(float paramFloat1, float paramFloat2, float paramFloat3, Interpolation paramInterpolation) {
    SizeToAction sizeToAction = (SizeToAction)action(SizeToAction.class);
    sizeToAction.setSize(paramFloat1, paramFloat2);
    sizeToAction.setDuration(paramFloat3);
    sizeToAction.setInterpolation(paramInterpolation);
    return sizeToAction;
  }
  
  public static TimeScaleAction timeScale(float paramFloat, Action paramAction) {
    TimeScaleAction timeScaleAction = (TimeScaleAction)action(TimeScaleAction.class);
    timeScaleAction.setScale(paramFloat);
    timeScaleAction.setAction(paramAction);
    return timeScaleAction;
  }
  
  public static TouchableAction touchable(Touchable paramTouchable) {
    TouchableAction touchableAction = (TouchableAction)action(TouchableAction.class);
    touchableAction.setTouchable(paramTouchable);
    return touchableAction;
  }
  
  public static VisibleAction visible(boolean paramBoolean) {
    VisibleAction visibleAction = (VisibleAction)action(VisibleAction.class);
    visibleAction.setVisible(paramBoolean);
    return visibleAction;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/actions/Actions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */