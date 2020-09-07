package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.LabelVO;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class LabelItem extends Label implements IBaseItem {
  private static BitmapFont font;
  
  private static int labelDefaultSize = 12;
  
  private static Label.LabelStyle style;
  
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public LabelVO dataVO;
  
  public Essentials essentials;
  
  private String fontName;
  
  private int fontSize;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  static  {
  
  }
  
  public LabelItem(LabelVO paramLabelVO, Essentials paramEssentials) {
    super(paramLabelVO.text, generateStyle(paramEssentials.rm, paramLabelVO.style, paramLabelVO.size));
    this.dataVO = paramLabelVO;
    this.essentials = paramEssentials;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    setRotation(this.dataVO.rotation);
    if (this.dataVO.zIndex < 0)
      this.dataVO.zIndex = 0; 
    if (this.dataVO.tint == null) {
      setTint(new Color(1.0F, 1.0F, 1.0F, 1.0F));
    } else {
      setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    } 
    if (this.dataVO.align == 0) {
      setAlignment(1);
    } else {
      setAlignment(this.dataVO.align);
    } 
    if (this.dataVO.width == 0.0F)
      this.dataVO.width = getWidth() / this.mulX; 
    if (this.dataVO.height == 0.0F)
      this.dataVO.height = getHeight() / this.mulY; 
    renew();
  }
  
  public LabelItem(LabelVO paramLabelVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramLabelVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  private static Label.LabelStyle generateStyle(IResourceRetriever paramIResourceRetriever, String paramString, int paramInt) {
    int i = paramInt;
    if (paramInt == 0)
      i = labelDefaultSize; 
    style = new Label.LabelStyle(paramIResourceRetriever.getBitmapFont(paramString, i), null);
    return style;
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScale(this.dataVO.scaleX, this.dataVO.scaleY);
    setWidth(this.dataVO.width * paramFloat1);
    setHeight(this.dataVO.height * paramFloat2);
    updateDataVO();
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public Body getBody() { return this.body; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public LabelVO getDataVO() { return this.dataVO; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public float getScaleX() { return getFontScaleX(); }
  
  public float getScaleY() { return getFontScaleY(); }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void renew() {
    String str = this.fontName;
    if (str == null || !str.equals(this.dataVO.style) || this.fontSize != this.dataVO.size) {
      if (this.dataVO.size == 0)
        this.dataVO.size = labelDefaultSize; 
      font = this.essentials.rm.getBitmapFont(this.dataVO.style, this.dataVO.size);
      style = new Label.LabelStyle(font, null);
      setStyle(style);
      this.fontName = this.dataVO.style;
      this.fontSize = this.dataVO.size;
      if (this.dataVO.width == 0.0F)
        this.dataVO.width = getWidth() / this.mulX; 
      if (this.dataVO.height == 0.0F)
        this.dataVO.height = getHeight() / this.mulY; 
    } 
    setText(this.dataVO.text);
    this.customVariables.loadFromString(this.dataVO.customVars);
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setRotation(this.dataVO.rotation);
    setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
    setScale(this.dataVO.scaleX, this.dataVO.scaleY);
    setAlignment(this.dataVO.align);
    setWidth(this.dataVO.width * this.mulY);
    setHeight(this.dataVO.height * this.mulY);
    setWrap(true);
  }
  
  public void setAlign(int paramInt) { this.dataVO.align = paramInt; }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    if (paramFloat1 > 0.0F && paramFloat2 > 0.0F)
      setFontScale(paramFloat1, paramFloat2); 
  }
  
  public void setScaleX(float paramFloat) {
    if (paramFloat <= 0.0F)
      return; 
    setFontScaleX(paramFloat);
  }
  
  public void setScaleY(float paramFloat) {
    if (paramFloat <= 0.0F)
      return; 
    setFontScaleY(paramFloat);
  }
  
  public void setStyle(String paramString, int paramInt) {
    LabelVO labelVO = this.dataVO;
    labelVO.style = paramString;
    labelVO.size = paramInt;
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
    this.dataVO.y = getY() / this.mulY;
    this.dataVO.x = getX() / this.mulX;
    this.dataVO.rotation = getRotation();
    if (getZIndex() >= 0)
      this.dataVO.zIndex = getZIndex(); 
    if (this.dataVO.layerName == null || this.dataVO.layerName.equals(""))
      this.dataVO.layerName = "Default"; 
    this.dataVO.customVars = this.customVariables.saveAsString();
    this.dataVO.scaleX = getScaleX();
    this.dataVO.scaleY = getScaleY();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/LabelItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */