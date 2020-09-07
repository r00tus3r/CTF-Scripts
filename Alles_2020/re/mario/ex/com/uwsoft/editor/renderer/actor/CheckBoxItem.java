package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.CheckBox;
import com.uwsoft.editor.renderer.data.CheckBoxVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import com.uwsoft.editor.renderer.utils.MySkin;

public class CheckBoxItem extends CheckBox implements IBaseItem {
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public CheckBoxVO dataVO;
  
  public Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  public CheckBoxItem(CheckBoxVO paramCheckBoxVO, Essentials paramEssentials) {
    super(str1, mySkin, str2);
    this.dataVO = paramCheckBoxVO;
    this.essentials = paramEssentials;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    this.customVariables.loadFromString(this.dataVO.customVars);
    setRotation(this.dataVO.rotation);
    if (this.dataVO.zIndex < 0)
      this.dataVO.zIndex = 0; 
    if (this.dataVO.tint == null) {
      setTint(new Color(1.0F, 1.0F, 1.0F, 1.0F));
    } else {
      setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    } 
  }
  
  public CheckBoxItem(CheckBoxVO paramCheckBoxVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramCheckBoxVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    setScaleX(this.dataVO.scaleX * paramFloat1);
    setScaleY(this.dataVO.scaleY * paramFloat2);
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    updateDataVO();
  }
  
  public void dispose() {
    if (this.essentials.world != null && this.body != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public Body getBody() { return this.body; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public CheckBoxVO getDataVO() { return this.dataVO; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void renew() {
    setText(this.dataVO.text);
    pack();
    layout();
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScaleX(this.dataVO.scaleX * this.mulX);
    setScaleY(this.dataVO.scaleY * this.mulY);
    setRotation(this.dataVO.rotation);
    setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
    this.customVariables.loadFromString(this.dataVO.customVars);
  }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setStyle(CheckBox.CheckBoxStyle paramCheckBoxStyle, String paramString) {
    setStyle(paramCheckBoxStyle);
    this.dataVO.style = paramString;
  }
  
  public void setTint(Color paramColor) {
    float f1 = paramColor.r;
    float f2 = paramColor.g;
    float f3 = paramColor.b;
    float f4 = paramColor.a;
    (getDataVO()).tint = new float[] { f1, f2, f3, f4 };
    setColor(paramColor);
  }
  
  public void updateDataVO() {
    this.dataVO.x = getX() / this.mulX;
    this.dataVO.y = getY() / this.mulY;
    this.dataVO.rotation = getRotation();
    if (getZIndex() >= 0)
      this.dataVO.zIndex = getZIndex(); 
    if (this.dataVO.layerName == null || this.dataVO.layerName.equals(""))
      this.dataVO.layerName = "Default"; 
    this.dataVO.customVars = this.customVariables.saveAsString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/CheckBoxItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */