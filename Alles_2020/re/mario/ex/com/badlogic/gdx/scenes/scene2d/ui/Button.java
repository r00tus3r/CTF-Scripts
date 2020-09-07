package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.FocusListener;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.SnapshotArray;

public class Button extends Table implements Disableable {
  ButtonGroup buttonGroup;
  
  private ClickListener clickListener;
  
  boolean focused;
  
  boolean isChecked;
  
  boolean isDisabled;
  
  private boolean programmaticChangeEvents = true;
  
  private ButtonStyle style;
  
  public Button() { initialize(); }
  
  public Button(Actor paramActor, ButtonStyle paramButtonStyle) {
    initialize();
    add(paramActor);
    setStyle(paramButtonStyle);
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public Button(Actor paramActor, Skin paramSkin) { this(paramActor, (ButtonStyle)paramSkin.get(ButtonStyle.class)); }
  
  public Button(Actor paramActor, Skin paramSkin, String paramString) {
    this(paramActor, (ButtonStyle)paramSkin.get(paramString, ButtonStyle.class));
    setSkin(paramSkin);
  }
  
  public Button(ButtonStyle paramButtonStyle) {
    initialize();
    setStyle(paramButtonStyle);
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public Button(Skin paramSkin) {
    super(paramSkin);
    initialize();
    setStyle((ButtonStyle)paramSkin.get(ButtonStyle.class));
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public Button(Skin paramSkin, String paramString) {
    super(paramSkin);
    initialize();
    setStyle((ButtonStyle)paramSkin.get(paramString, ButtonStyle.class));
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  public Button(Drawable paramDrawable) { this(new ButtonStyle(paramDrawable, null, null)); }
  
  public Button(Drawable paramDrawable1, Drawable paramDrawable2) { this(new ButtonStyle(paramDrawable1, paramDrawable2, null)); }
  
  public Button(Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3) { this(new ButtonStyle(paramDrawable1, paramDrawable2, paramDrawable3)); }
  
  private void initialize() {
    setTouchable(Touchable.enabled);
    ClickListener clickListener1 = new ClickListener() {
        public void clicked(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
          if (Button.this.isDisabled())
            return; 
          Button button = Button.this;
          button.setChecked(button.isChecked ^ true, true);
        }
      };
    this.clickListener = clickListener1;
    addListener(clickListener1);
    addListener(new FocusListener() {
          public void keyboardFocusChanged(FocusEvent param1FocusEvent, Actor param1Actor, boolean param1Boolean) { Button.this.focused = param1Boolean; }
        });
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    float f2;
    float f1;
    Drawable drawable;
    validate();
    boolean bool1 = isDisabled();
    boolean bool2 = isPressed();
    boolean bool3 = isChecked();
    boolean bool4 = isOver();
    if (bool1 && this.style.disabled != null) {
      drawable = this.style.disabled;
    } else if (bool2 && this.style.down != null) {
      drawable = this.style.down;
    } else if (bool3 && this.style.checked != null) {
      if (this.style.checkedOver != null && bool4) {
        drawable = this.style.checkedOver;
      } else if (this.style.checkedFocused != null && this.focused) {
        drawable = this.style.checkedFocused;
      } else {
        drawable = this.style.checked;
      } 
    } else if (bool4 && this.style.over != null) {
      drawable = this.style.over;
    } else if (this.focused && this.style.focused != null) {
      drawable = this.style.focused;
    } else if (this.style.up != null) {
      drawable = this.style.up;
    } else {
      drawable = null;
    } 
    setBackground(drawable);
    if (bool2 && !bool1) {
      f1 = this.style.pressedOffsetX;
      f2 = this.style.pressedOffsetY;
    } else if (bool3 && !bool1) {
      f1 = this.style.checkedOffsetX;
      f2 = this.style.checkedOffsetY;
    } else {
      f1 = this.style.unpressedOffsetX;
      f2 = this.style.unpressedOffsetY;
    } 
    SnapshotArray snapshotArray = getChildren();
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < snapshotArray.size; b2++)
      ((Actor)snapshotArray.get(b2)).moveBy(f1, f2); 
    super.draw(paramBatch, paramFloat);
    for (b2 = b1; b2 < snapshotArray.size; b2++)
      ((Actor)snapshotArray.get(b2)).moveBy(-f1, -f2); 
    Stage stage = getStage();
    if (stage != null && stage.getActionsRequestRendering() && bool2 != this.clickListener.isPressed())
      Gdx.graphics.requestRendering(); 
  }
  
  public ButtonGroup getButtonGroup() { return this.buttonGroup; }
  
  public ClickListener getClickListener() { return this.clickListener; }
  
  public float getMinHeight() { return getPrefHeight(); }
  
  public float getMinWidth() { return getPrefWidth(); }
  
  public float getPrefHeight() {
    float f1 = super.getPrefHeight();
    float f2 = f1;
    if (this.style.up != null)
      f2 = Math.max(f1, this.style.up.getMinHeight()); 
    f1 = f2;
    if (this.style.down != null)
      f1 = Math.max(f2, this.style.down.getMinHeight()); 
    f2 = f1;
    if (this.style.checked != null)
      f2 = Math.max(f1, this.style.checked.getMinHeight()); 
    return f2;
  }
  
  public float getPrefWidth() {
    float f1 = super.getPrefWidth();
    float f2 = f1;
    if (this.style.up != null)
      f2 = Math.max(f1, this.style.up.getMinWidth()); 
    f1 = f2;
    if (this.style.down != null)
      f1 = Math.max(f2, this.style.down.getMinWidth()); 
    f2 = f1;
    if (this.style.checked != null)
      f2 = Math.max(f1, this.style.checked.getMinWidth()); 
    return f2;
  }
  
  public ButtonStyle getStyle() { return this.style; }
  
  public boolean isChecked() { return this.isChecked; }
  
  public boolean isDisabled() { return this.isDisabled; }
  
  public boolean isOver() { return this.clickListener.isOver(); }
  
  public boolean isPressed() { return this.clickListener.isVisualPressed(); }
  
  public void setChecked(boolean paramBoolean) { setChecked(paramBoolean, this.programmaticChangeEvents); }
  
  void setChecked(boolean paramBoolean1, boolean paramBoolean2) {
    if (this.isChecked == paramBoolean1)
      return; 
    ButtonGroup buttonGroup1 = this.buttonGroup;
    if (buttonGroup1 != null && !buttonGroup1.canCheck(this, paramBoolean1))
      return; 
    this.isChecked = paramBoolean1;
    if (paramBoolean2) {
      ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent)Pools.obtain(ChangeListener.ChangeEvent.class);
      if (fire(changeEvent))
        this.isChecked = paramBoolean1 ^ true; 
      Pools.free(changeEvent);
    } 
  }
  
  public void setDisabled(boolean paramBoolean) { this.isDisabled = paramBoolean; }
  
  public void setProgrammaticChangeEvents(boolean paramBoolean) { this.programmaticChangeEvents = paramBoolean; }
  
  public void setStyle(ButtonStyle paramButtonStyle) {
    if (paramButtonStyle != null) {
      Drawable drawable;
      this.style = paramButtonStyle;
      if (isPressed() && !isDisabled()) {
        if (paramButtonStyle.down == null) {
          drawable = paramButtonStyle.up;
        } else {
          drawable = drawable.down;
        } 
      } else if (isDisabled() && drawable.disabled != null) {
        drawable = drawable.disabled;
      } else if (this.isChecked && drawable.checked != null) {
        if (isOver() && drawable.checkedOver != null) {
          drawable = drawable.checkedOver;
        } else if (this.focused && drawable.checkedFocused != null) {
          drawable = drawable.checkedFocused;
        } else {
          drawable = drawable.checked;
        } 
      } else if (isOver() && drawable.over != null) {
        drawable = drawable.over;
      } else if (this.focused && drawable.focused != null) {
        drawable = drawable.focused;
      } else {
        drawable = drawable.up;
      } 
      setBackground(drawable);
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public void toggle() { setChecked(this.isChecked ^ true); }
  
  public static class ButtonStyle {
    public Drawable checked;
    
    public Drawable checkedFocused;
    
    public float checkedOffsetX;
    
    public float checkedOffsetY;
    
    public Drawable checkedOver;
    
    public Drawable disabled;
    
    public Drawable down;
    
    public Drawable focused;
    
    public Drawable over;
    
    public float pressedOffsetX;
    
    public float pressedOffsetY;
    
    public float unpressedOffsetX;
    
    public float unpressedOffsetY;
    
    public Drawable up;
    
    public ButtonStyle() {}
    
    public ButtonStyle(ButtonStyle param1ButtonStyle) {
      this.up = param1ButtonStyle.up;
      this.down = param1ButtonStyle.down;
      this.over = param1ButtonStyle.over;
      this.focused = param1ButtonStyle.focused;
      this.checked = param1ButtonStyle.checked;
      this.checkedOver = param1ButtonStyle.checkedOver;
      this.checkedFocused = param1ButtonStyle.checkedFocused;
      this.disabled = param1ButtonStyle.disabled;
      this.pressedOffsetX = param1ButtonStyle.pressedOffsetX;
      this.pressedOffsetY = param1ButtonStyle.pressedOffsetY;
      this.unpressedOffsetX = param1ButtonStyle.unpressedOffsetX;
      this.unpressedOffsetY = param1ButtonStyle.unpressedOffsetY;
      this.checkedOffsetX = param1ButtonStyle.checkedOffsetX;
      this.checkedOffsetY = param1ButtonStyle.checkedOffsetY;
    }
    
    public ButtonStyle(Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3) {
      this.up = param1Drawable1;
      this.down = param1Drawable2;
      this.checked = param1Drawable3;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Button.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */