package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class SplitPane extends WidgetGroup {
  boolean cursorOverHandle;
  
  private Actor firstWidget;
  
  private Rectangle firstWidgetBounds = new Rectangle();
  
  Rectangle handleBounds = new Rectangle();
  
  Vector2 handlePosition = new Vector2();
  
  Vector2 lastPoint = new Vector2();
  
  float maxAmount = 1.0F;
  
  float minAmount;
  
  private Actor secondWidget;
  
  private Rectangle secondWidgetBounds = new Rectangle();
  
  float splitAmount = 0.5F;
  
  SplitPaneStyle style;
  
  private Rectangle tempScissors = new Rectangle();
  
  boolean vertical;
  
  public SplitPane(Actor paramActor1, Actor paramActor2, boolean paramBoolean, Skin paramSkin) { this(paramActor1, paramActor2, paramBoolean, paramSkin, stringBuilder.toString()); }
  
  public SplitPane(Actor paramActor1, Actor paramActor2, boolean paramBoolean, Skin paramSkin, String paramString) { this(paramActor1, paramActor2, paramBoolean, (SplitPaneStyle)paramSkin.get(paramString, SplitPaneStyle.class)); }
  
  public SplitPane(Actor paramActor1, Actor paramActor2, boolean paramBoolean, SplitPaneStyle paramSplitPaneStyle) {
    this.vertical = paramBoolean;
    setStyle(paramSplitPaneStyle);
    setFirstWidget(paramActor1);
    setSecondWidget(paramActor2);
    setSize(getPrefWidth(), getPrefHeight());
    initialize();
  }
  
  private void calculateHorizBoundsAndPositions() {
    Drawable drawable = this.style.handle;
    float f1 = getHeight();
    float f2 = getWidth() - drawable.getMinWidth();
    float f3 = (int)(this.splitAmount * f2);
    float f4 = drawable.getMinWidth();
    this.firstWidgetBounds.set(0.0F, 0.0F, f3, f1);
    this.secondWidgetBounds.set(f3 + f4, 0.0F, f2 - f3, f1);
    this.handleBounds.set(f3, 0.0F, f4, f1);
  }
  
  private void calculateVertBoundsAndPositions() {
    Drawable drawable = this.style.handle;
    float f1 = getWidth();
    float f2 = getHeight();
    float f3 = f2 - drawable.getMinHeight();
    float f4 = (int)(this.splitAmount * f3);
    f3 -= f4;
    float f5 = drawable.getMinHeight();
    this.firstWidgetBounds.set(0.0F, f2 - f4, f1, f4);
    this.secondWidgetBounds.set(0.0F, 0.0F, f1, f3);
    this.handleBounds.set(0.0F, f3, f1, f5);
  }
  
  private void initialize() { addListener(new InputListener() {
          int draggingPointer = -1;
          
          public boolean mouseMoved(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
            SplitPane splitPane = SplitPane.this;
            splitPane.cursorOverHandle = splitPane.handleBounds.contains(param1Float1, param1Float2);
            return false;
          }
          
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            if (this.draggingPointer != -1)
              return false; 
            if (param1Int1 == 0 && param1Int2 != 0)
              return false; 
            if (SplitPane.this.handleBounds.contains(param1Float1, param1Float2)) {
              this.draggingPointer = param1Int1;
              SplitPane.this.lastPoint.set(param1Float1, param1Float2);
              SplitPane.this.handlePosition.set(this.this$0.handleBounds.x, this.this$0.handleBounds.y);
              return true;
            } 
            return false;
          }
          
          public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
            if (param1Int != this.draggingPointer)
              return; 
            SplitPane splitPane = this.this$0.style.handle;
            if (!SplitPane.this.vertical) {
              float f1 = this.this$0.lastPoint.x;
              float f2 = SplitPane.this.getWidth() - splitPane.getMinWidth();
              f1 = this.this$0.handlePosition.x + param1Float1 - f1;
              this.this$0.handlePosition.x = f1;
              f1 = Math.min(f2, Math.max(0.0F, f1));
              splitPane = SplitPane.this;
              splitPane.splitAmount = f1 / f2;
              splitPane.lastPoint.set(param1Float1, param1Float2);
            } else {
              float f1 = this.this$0.lastPoint.y;
              float f2 = SplitPane.this.getHeight() - splitPane.getMinHeight();
              f1 = this.this$0.handlePosition.y + param1Float2 - f1;
              this.this$0.handlePosition.y = f1;
              f1 = Math.min(f2, Math.max(0.0F, f1));
              splitPane = SplitPane.this;
              splitPane.splitAmount = 1.0F - f1 / f2;
              splitPane.lastPoint.set(param1Float1, param1Float2);
            } 
            SplitPane.this.invalidate();
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            if (param1Int1 == this.draggingPointer)
              this.draggingPointer = -1; 
          }
        }); }
  
  public void addActor(Actor paramActor) { throw new UnsupportedOperationException("Use SplitPane#setWidget."); }
  
  public void addActorAt(int paramInt, Actor paramActor) { throw new UnsupportedOperationException("Use SplitPane#setWidget."); }
  
  public void addActorBefore(Actor paramActor1, Actor paramActor2) { throw new UnsupportedOperationException("Use SplitPane#setWidget."); }
  
  protected void clampSplitAmount() {
    float f3;
    float f1 = this.minAmount;
    float f2 = this.maxAmount;
    if (this.vertical) {
      float f4 = getHeight() - this.style.handle.getMinHeight();
      Actor actor = this.firstWidget;
      float f5 = f1;
      if (actor instanceof Layout)
        f5 = Math.max(f1, Math.min(((Layout)actor).getMinHeight() / f4, 1.0F)); 
      actor = this.secondWidget;
      f3 = f5;
      f1 = f2;
      if (actor instanceof Layout) {
        f1 = Math.min(f2, 1.0F - Math.min(((Layout)actor).getMinHeight() / f4, 1.0F));
        f3 = f5;
      } 
    } else {
      float f4 = getWidth() - this.style.handle.getMinWidth();
      Actor actor = this.firstWidget;
      float f5 = f1;
      if (actor instanceof Layout)
        f5 = Math.max(f1, Math.min(((Layout)actor).getMinWidth() / f4, 1.0F)); 
      actor = this.secondWidget;
      f3 = f5;
      f1 = f2;
      if (actor instanceof Layout) {
        f1 = Math.min(f2, 1.0F - Math.min(((Layout)actor).getMinWidth() / f4, 1.0F));
        f3 = f5;
      } 
    } 
    if (f3 > f1) {
      this.splitAmount = (f3 + f1) * 0.5F;
    } else {
      this.splitAmount = Math.max(Math.min(this.splitAmount, f1), f3);
    } 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    Stage stage = getStage();
    if (stage == null)
      return; 
    validate();
    Color color = getColor();
    paramFloat = color.a * paramFloat;
    applyTransform(paramBatch, computeTransform());
    Actor actor = this.firstWidget;
    if (actor != null && actor.isVisible()) {
      paramBatch.flush();
      stage.calculateScissors(this.firstWidgetBounds, this.tempScissors);
      if (ScissorStack.pushScissors(this.tempScissors)) {
        this.firstWidget.draw(paramBatch, paramFloat);
        paramBatch.flush();
        ScissorStack.popScissors();
      } 
    } 
    actor = this.secondWidget;
    if (actor != null && actor.isVisible()) {
      paramBatch.flush();
      stage.calculateScissors(this.secondWidgetBounds, this.tempScissors);
      if (ScissorStack.pushScissors(this.tempScissors)) {
        this.secondWidget.draw(paramBatch, paramFloat);
        paramBatch.flush();
        ScissorStack.popScissors();
      } 
    } 
    paramBatch.setColor(color.r, color.g, color.b, paramFloat);
    this.style.handle.draw(paramBatch, this.handleBounds.x, this.handleBounds.y, this.handleBounds.width, this.handleBounds.height);
    resetTransform(paramBatch);
  }
  
  public float getMaxSplitAmount() { return this.maxAmount; }
  
  public float getMinHeight() {
    float f2;
    Actor actor = this.firstWidget;
    boolean bool = actor instanceof Layout;
    float f1 = 0.0F;
    if (bool) {
      f2 = ((Layout)actor).getMinHeight();
    } else {
      f2 = 0.0F;
    } 
    actor = this.secondWidget;
    if (actor instanceof Layout)
      f1 = ((Layout)actor).getMinHeight(); 
    return !this.vertical ? Math.max(f2, f1) : (f2 + this.style.handle.getMinHeight() + f1);
  }
  
  public float getMinSplitAmount() { return this.minAmount; }
  
  public float getMinWidth() {
    float f2;
    Actor actor = this.firstWidget;
    boolean bool = actor instanceof Layout;
    float f1 = 0.0F;
    if (bool) {
      f2 = ((Layout)actor).getMinWidth();
    } else {
      f2 = 0.0F;
    } 
    actor = this.secondWidget;
    if (actor instanceof Layout)
      f1 = ((Layout)actor).getMinWidth(); 
    return this.vertical ? Math.max(f2, f1) : (f2 + this.style.handle.getMinWidth() + f1);
  }
  
  public float getPrefHeight() {
    float f2;
    Actor actor = this.firstWidget;
    float f1 = 0.0F;
    if (actor == null) {
      f2 = 0.0F;
    } else if (actor instanceof Layout) {
      f2 = ((Layout)actor).getPrefHeight();
    } else {
      f2 = actor.getHeight();
    } 
    actor = this.secondWidget;
    if (actor != null)
      if (actor instanceof Layout) {
        f1 = ((Layout)actor).getPrefHeight();
      } else {
        f1 = actor.getHeight();
      }  
    return !this.vertical ? Math.max(f2, f1) : (f2 + this.style.handle.getMinHeight() + f1);
  }
  
  public float getPrefWidth() {
    float f2;
    Actor actor = this.firstWidget;
    float f1 = 0.0F;
    if (actor == null) {
      f2 = 0.0F;
    } else if (actor instanceof Layout) {
      f2 = ((Layout)actor).getPrefWidth();
    } else {
      f2 = actor.getWidth();
    } 
    actor = this.secondWidget;
    if (actor != null)
      if (actor instanceof Layout) {
        f1 = ((Layout)actor).getPrefWidth();
      } else {
        f1 = actor.getWidth();
      }  
    return this.vertical ? Math.max(f2, f1) : (f2 + this.style.handle.getMinWidth() + f1);
  }
  
  public float getSplitAmount() { return this.splitAmount; }
  
  public SplitPaneStyle getStyle() { return this.style; }
  
  public boolean isCursorOverHandle() { return this.cursorOverHandle; }
  
  public boolean isVertical() { return this.vertical; }
  
  public void layout() {
    clampSplitAmount();
    if (!this.vertical) {
      calculateHorizBoundsAndPositions();
    } else {
      calculateVertBoundsAndPositions();
    } 
    Actor actor = this.firstWidget;
    if (actor != null) {
      Rectangle rectangle = this.firstWidgetBounds;
      actor.setBounds(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
      if (actor instanceof Layout)
        ((Layout)actor).validate(); 
    } 
    actor = this.secondWidget;
    if (actor != null) {
      Rectangle rectangle = this.secondWidgetBounds;
      actor.setBounds(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
      if (actor instanceof Layout)
        ((Layout)actor).validate(); 
    } 
  }
  
  public boolean removeActor(Actor paramActor) {
    if (paramActor != null) {
      if (paramActor == this.firstWidget) {
        setFirstWidget(null);
        return true;
      } 
      if (paramActor == this.secondWidget)
        setSecondWidget(null); 
      return true;
    } 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public boolean removeActor(Actor paramActor, boolean paramBoolean) {
    if (paramActor != null) {
      if (paramActor == this.firstWidget) {
        super.removeActor(paramActor, paramBoolean);
        this.firstWidget = null;
        invalidate();
        return true;
      } 
      if (paramActor == this.secondWidget) {
        super.removeActor(paramActor, paramBoolean);
        this.secondWidget = null;
        invalidate();
        return true;
      } 
      return false;
    } 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public void setFirstWidget(Actor paramActor) {
    Actor actor = this.firstWidget;
    if (actor != null)
      super.removeActor(actor); 
    this.firstWidget = paramActor;
    if (paramActor != null)
      super.addActor(paramActor); 
    invalidate();
  }
  
  public void setMaxSplitAmount(float paramFloat) {
    if (paramFloat >= 0.0F && paramFloat <= 1.0F) {
      this.maxAmount = paramFloat;
      return;
    } 
    throw new GdxRuntimeException("maxAmount has to be >= 0 and <= 1");
  }
  
  public void setMinSplitAmount(float paramFloat) {
    if (paramFloat >= 0.0F && paramFloat <= 1.0F) {
      this.minAmount = paramFloat;
      return;
    } 
    throw new GdxRuntimeException("minAmount has to be >= 0 and <= 1");
  }
  
  public void setSecondWidget(Actor paramActor) {
    Actor actor = this.secondWidget;
    if (actor != null)
      super.removeActor(actor); 
    this.secondWidget = paramActor;
    if (paramActor != null)
      super.addActor(paramActor); 
    invalidate();
  }
  
  public void setSplitAmount(float paramFloat) {
    this.splitAmount = paramFloat;
    invalidate();
  }
  
  public void setStyle(SplitPaneStyle paramSplitPaneStyle) {
    this.style = paramSplitPaneStyle;
    invalidateHierarchy();
  }
  
  public void setVertical(boolean paramBoolean) {
    if (this.vertical == paramBoolean)
      return; 
    this.vertical = paramBoolean;
    invalidateHierarchy();
  }
  
  public static class SplitPaneStyle {
    public Drawable handle;
    
    public SplitPaneStyle() {}
    
    public SplitPaneStyle(SplitPaneStyle param1SplitPaneStyle) { this.handle = param1SplitPaneStyle.handle; }
    
    public SplitPaneStyle(Drawable param1Drawable) { this.handle = param1Drawable; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/SplitPane.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */