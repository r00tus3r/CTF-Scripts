package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.FocusListener;
import com.badlogic.gdx.utils.ObjectMap;

public class Dialog extends Window {
  Table buttonTable;
  
  boolean cancelHide;
  
  Table contentTable;
  
  FocusListener focusListener;
  
  protected InputListener ignoreTouchDown = new InputListener() {
      public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
        param1InputEvent.cancel();
        return false;
      }
    };
  
  Actor previousKeyboardFocus;
  
  Actor previousScrollFocus;
  
  private Skin skin;
  
  ObjectMap<Actor, Object> values = new ObjectMap();
  
  public Dialog(String paramString, Skin paramSkin) {
    super(paramString, (Window.WindowStyle)paramSkin.get(Window.WindowStyle.class));
    setSkin(paramSkin);
    this.skin = paramSkin;
    initialize();
  }
  
  public Dialog(String paramString1, Skin paramSkin, String paramString2) {
    super(paramString1, (Window.WindowStyle)paramSkin.get(paramString2, Window.WindowStyle.class));
    setSkin(paramSkin);
    this.skin = paramSkin;
    initialize();
  }
  
  public Dialog(String paramString, Window.WindowStyle paramWindowStyle) {
    super(paramString, paramWindowStyle);
    initialize();
  }
  
  private void initialize() {
    setModal(true);
    defaults().space(6.0F);
    Table table = new Table(this.skin);
    this.contentTable = table;
    add(table).expand().fill();
    row();
    table = new Table(this.skin);
    this.buttonTable = table;
    add(table).fillX();
    this.contentTable.defaults().space(6.0F);
    this.buttonTable.defaults().space(6.0F);
    this.buttonTable.addListener(new ChangeListener() {
          public void changed(ChangeEvent param1ChangeEvent, Actor param1Actor) {
            Group group = param1Actor;
            if (!Dialog.this.values.containsKey(param1Actor))
              return; 
            while (group.getParent() != Dialog.this.buttonTable)
              group = group.getParent(); 
            Dialog dialog = Dialog.this;
            dialog.result(dialog.values.get(group));
            if (!Dialog.this.cancelHide)
              Dialog.this.hide(); 
            Dialog.this.cancelHide = false;
          }
        });
    this.focusListener = new FocusListener() {
        private void focusChanged(FocusEvent param1FocusEvent) {
          Stage stage = Dialog.this.getStage();
          if (Dialog.this.isModal && stage != null && (stage.getRoot().getChildren()).size > 0 && stage.getRoot().getChildren().peek() == Dialog.this) {
            Actor actor = param1FocusEvent.getRelatedActor();
            if (actor != null && !actor.isDescendantOf(Dialog.this) && !actor.equals(Dialog.this.previousKeyboardFocus) && !actor.equals(Dialog.this.previousScrollFocus))
              param1FocusEvent.cancel(); 
          } 
        }
        
        public void keyboardFocusChanged(FocusEvent param1FocusEvent, Actor param1Actor, boolean param1Boolean) {
          if (!param1Boolean)
            focusChanged(param1FocusEvent); 
        }
        
        public void scrollFocusChanged(FocusEvent param1FocusEvent, Actor param1Actor, boolean param1Boolean) {
          if (!param1Boolean)
            focusChanged(param1FocusEvent); 
        }
      };
  }
  
  public Dialog button(Button paramButton) { return button(paramButton, null); }
  
  public Dialog button(Button paramButton, Object paramObject) {
    this.buttonTable.add(paramButton);
    setObject(paramButton, paramObject);
    return this;
  }
  
  public Dialog button(String paramString) { return button(paramString, null); }
  
  public Dialog button(String paramString, Object paramObject) {
    Skin skin1 = this.skin;
    if (skin1 != null)
      return button(paramString, paramObject, (TextButton.TextButtonStyle)skin1.get(TextButton.TextButtonStyle.class)); 
    throw new IllegalStateException("This method may only be used if the dialog was constructed with a Skin.");
  }
  
  public Dialog button(String paramString, Object paramObject, TextButton.TextButtonStyle paramTextButtonStyle) { return button(new TextButton(paramString, paramTextButtonStyle), paramObject); }
  
  public void cancel() { this.cancelHide = true; }
  
  public Table getButtonTable() { return this.buttonTable; }
  
  public Table getContentTable() { return this.contentTable; }
  
  public void hide() { hide(Actions.fadeOut(0.4F, Interpolation.fade)); }
  
  public void hide(Action paramAction) {
    Stage stage = getStage();
    if (stage != null) {
      removeListener(this.focusListener);
      Actor actor = this.previousKeyboardFocus;
      if (actor != null && actor.getStage() == null)
        this.previousKeyboardFocus = null; 
      actor = stage.getKeyboardFocus();
      if (actor == null || actor.isDescendantOf(this))
        stage.setKeyboardFocus(this.previousKeyboardFocus); 
      actor = this.previousScrollFocus;
      if (actor != null && actor.getStage() == null)
        this.previousScrollFocus = null; 
      actor = stage.getScrollFocus();
      if (actor == null || actor.isDescendantOf(this))
        stage.setScrollFocus(this.previousScrollFocus); 
    } 
    if (paramAction != null) {
      addCaptureListener(this.ignoreTouchDown);
      addAction(Actions.sequence(paramAction, Actions.removeListener(this.ignoreTouchDown, true), Actions.removeActor()));
    } else {
      remove();
    } 
  }
  
  public Dialog key(final int keycode, final Object object) {
    addListener(new InputListener() {
          public boolean keyDown(InputEvent param1InputEvent, int param1Int) {
            if (keycode == param1Int)
              Gdx.app.postRunnable(new Runnable() {
                    public void run() {
                      Dialog.null.this.this$0.result(object);
                      if (!Dialog.this.cancelHide)
                        Dialog.null.this.this$0.hide(); 
                      Dialog.this.cancelHide = false;
                    }
                  }); 
            return false;
          }
        });
    return this;
  }
  
  protected void result(Object paramObject) {}
  
  public void setObject(Actor paramActor, Object paramObject) { this.values.put(paramActor, paramObject); }
  
  protected void setStage(Stage paramStage) {
    if (paramStage == null) {
      addListener(this.focusListener);
    } else {
      removeListener(this.focusListener);
    } 
    super.setStage(paramStage);
  }
  
  public Dialog show(Stage paramStage) {
    show(paramStage, Actions.sequence(Actions.alpha(0.0F), Actions.fadeIn(0.4F, Interpolation.fade)));
    setPosition(Math.round((paramStage.getWidth() - getWidth()) / 2.0F), Math.round((paramStage.getHeight() - getHeight()) / 2.0F));
    return this;
  }
  
  public Dialog show(Stage paramStage, Action paramAction) {
    clearActions();
    removeCaptureListener(this.ignoreTouchDown);
    this.previousKeyboardFocus = null;
    Actor actor = paramStage.getKeyboardFocus();
    if (actor != null && !actor.isDescendantOf(this))
      this.previousKeyboardFocus = actor; 
    this.previousScrollFocus = null;
    actor = paramStage.getScrollFocus();
    if (actor != null && !actor.isDescendantOf(this))
      this.previousScrollFocus = actor; 
    paramStage.addActor(this);
    pack();
    paramStage.cancelTouchFocus();
    paramStage.setKeyboardFocus(this);
    paramStage.setScrollFocus(this);
    if (paramAction != null)
      addAction(paramAction); 
    return this;
  }
  
  public Dialog text(Label paramLabel) {
    this.contentTable.add(paramLabel);
    return this;
  }
  
  public Dialog text(String paramString) {
    Skin skin1 = this.skin;
    if (skin1 != null)
      return text(paramString, (Label.LabelStyle)skin1.get(Label.LabelStyle.class)); 
    throw new IllegalStateException("This method may only be used if the dialog was constructed with a Skin.");
  }
  
  public Dialog text(String paramString, Label.LabelStyle paramLabelStyle) { return text(new Label(paramString, paramLabelStyle)); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Dialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */