package com.uwsoft.editor.renderer.script;

import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.DelayedRemovalArray;
import com.uwsoft.editor.renderer.actor.CompositeItem;

public class SimpleButtonScript implements IScript {
  public static final int TEXT_EFFECT_DOWN = 2;
  
  public static final int TEXT_EFFECT_NONE = 0;
  
  public static final int TEXT_EFFECT_PUSH = 1;
  
  protected CompositeItem buttonHolder;
  
  protected boolean isDown = false;
  
  protected boolean isToggled = false;
  
  protected final DelayedRemovalArray<ClickListener> listeners = new DelayedRemovalArray(false);
  
  protected float origTextScaleX;
  
  protected float origTextScaleY;
  
  protected float origTextY;
  
  protected int textEffect = 0;
  
  public static SimpleButtonScript selfInit(CompositeItem paramCompositeItem) {
    SimpleButtonScript simpleButtonScript = new SimpleButtonScript();
    paramCompositeItem.addScript(simpleButtonScript);
    return simpleButtonScript;
  }
  
  public void act(float paramFloat) {
    if (this.isDown) {
      this.buttonHolder.setLayerVisibilty("checked", false);
      this.buttonHolder.setLayerVisibilty("normal", false);
      this.buttonHolder.setLayerVisibilty("pressed", true);
    } else {
      if (this.isToggled && this.buttonHolder.layerExists("checked")) {
        this.buttonHolder.setLayerVisibilty("checked", true);
        this.buttonHolder.setLayerVisibilty("normal", false);
      } else {
        this.buttonHolder.setLayerVisibilty("normal", true);
        this.buttonHolder.setLayerVisibilty("checked", false);
      } 
      this.buttonHolder.setLayerVisibilty("pressed", false);
    } 
    if (this.buttonHolder.getLabelById("text") != null) {
      int i = this.textEffect;
      if (i == 2) {
        if (this.isDown) {
          this.buttonHolder.getLabelById("text").setY(this.origTextY - this.buttonHolder.mulY * 5.0F);
        } else {
          this.buttonHolder.getLabelById("text").setY(this.origTextY);
        } 
      } else if (i == 1) {
        if (this.isDown) {
          this.buttonHolder.getLabelById("text").setScale(0.9F);
        } else {
          this.buttonHolder.getLabelById("text").setScaleX(this.origTextScaleX);
          this.buttonHolder.getLabelById("text").setScaleY(this.origTextScaleY);
        } 
      } 
    } 
  }
  
  public boolean addListener(ClickListener paramClickListener) {
    if (!this.listeners.contains(paramClickListener, true)) {
      this.listeners.add(paramClickListener);
      return true;
    } 
    return false;
  }
  
  public void clearListeners() { this.listeners.clear(); }
  
  public void dispose() { clearListeners(); }
  
  public CompositeItem getItem() { return this.buttonHolder; }
  
  public Array<ClickListener> getListeners() { return this.listeners; }
  
  public int getTextEffect() { return this.textEffect; }
  
  public void init(CompositeItem paramCompositeItem) {
    this.buttonHolder = paramCompositeItem;
    String str = paramCompositeItem.getCustomVariables().getStringVariable("text");
    if (paramCompositeItem.getLabelById("text") != null) {
      if (str != null)
        paramCompositeItem.getLabelById("text").setText(str); 
      paramCompositeItem.getLabelById("text").setAlignment(1);
      this.origTextY = paramCompositeItem.getLabelById("text").getY();
      this.origTextScaleX = paramCompositeItem.getLabelById("text").getScaleX();
      this.origTextScaleY = paramCompositeItem.getLabelById("text").getScaleY();
    } 
    this.buttonHolder.addListener(new ClickListener() {
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            SimpleButtonScript.this.isDown = true;
            for (byte b = 0; b < this.this$0.listeners.size; b++)
              ((ClickListener)SimpleButtonScript.this.listeners.get(b)).touchDown(param1InputEvent, param1Float1, param1Float2, param1Int1, param1Int2); 
            return super.touchDown(param1InputEvent, param1Float1, param1Float2, param1Int1, param1Int2);
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            SimpleButtonScript simpleButtonScript = SimpleButtonScript.this;
            byte b = 0;
            simpleButtonScript.isDown = false;
            simpleButtonScript.isToggled ^= true;
            while (b < this.this$0.listeners.size) {
              ((ClickListener)SimpleButtonScript.this.listeners.get(b)).touchUp(param1InputEvent, param1Float1, param1Float2, param1Int1, param1Int2);
              b++;
            } 
            super.touchUp(param1InputEvent, param1Float1, param1Float2, param1Int1, param1Int2);
          }
        });
  }
  
  public boolean isDown() { return this.isDown; }
  
  public boolean isToggled() { return this.isToggled; }
  
  public boolean removeListener(ClickListener paramClickListener) { return this.listeners.removeValue(paramClickListener, true); }
  
  public void setTextEffect(int paramInt) { this.textEffect = paramInt; }
  
  public void setToggle(boolean paramBoolean) { this.isToggled = paramBoolean; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/script/SimpleButtonScript.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */