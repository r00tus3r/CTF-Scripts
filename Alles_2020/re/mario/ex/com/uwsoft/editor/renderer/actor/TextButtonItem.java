package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.uwsoft.editor.renderer.data.ButtonVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class TextButtonItem extends TextButton implements IBaseItem {
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public ButtonVO dataVO;
  
  public Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  public TextButtonItem(ButtonVO paramButtonVO, Essentials paramEssentials) {
    super(paramButtonVO.text, paramEssentials.rm.getSkin());
    this.dataVO = paramButtonVO;
    this.essentials = paramEssentials;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    this.customVariables.loadFromString(this.dataVO.customVars);
    getLabel().setFontScale(this.dataVO.scaleX, this.dataVO.scaleY);
    setRotation(this.dataVO.rotation);
    if (this.dataVO.zIndex < 0)
      this.dataVO.zIndex = 0; 
    if (this.dataVO.tint == null) {
      setTint(new Color(1.0F, 1.0F, 1.0F, 1.0F));
    } else {
      setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    } 
    pack();
    layout();
  }
  
  public TextButtonItem(ButtonVO paramButtonVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramButtonVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    getLabel().setFontScale(this.dataVO.scaleX * this.mulX, this.dataVO.scaleY * this.mulY);
    updateDataVO();
    pack();
    layout();
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public Body getBody() { return this.body; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public ButtonVO getDataVO() { return this.dataVO; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void renew() {
    setText(this.dataVO.text);
    this.customVariables.loadFromString(this.dataVO.customVars);
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    getLabel().setFontScale(this.dataVO.scaleX * this.mulX, this.dataVO.scaleY * this.mulY);
    setRotation(this.dataVO.rotation);
    pack();
    layout();
  }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setTint(Color paramColor) {
    float f1 = paramColor.r;
    float f2 = paramColor.g;
    float f3 = paramColor.b;
    float f4 = paramColor.a;
    (getDataVO()).tint = new float[] { f1, f2, f3, f4 };
    setColor(paramColor);
  }
  
  public void updateDataVO() {
    this.dataVO.x = getX();
    this.dataVO.y = getY();
    this.dataVO.customVars = this.customVariables.saveAsString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/TextButtonItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */