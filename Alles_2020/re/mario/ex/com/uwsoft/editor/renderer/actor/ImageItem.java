package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.NinePatch;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.SimpleImageVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class ImageItem extends Image implements IBaseItem {
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public SimpleImageVO dataVO;
  
  public Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  public ImageItem(SimpleImageVO paramSimpleImageVO, Essentials paramEssentials) {
    super(paramEssentials.rm.getTextureRegion(paramSimpleImageVO.imageName));
    init(paramSimpleImageVO, paramEssentials);
  }
  
  protected ImageItem(SimpleImageVO paramSimpleImageVO, Essentials paramEssentials, NinePatch paramNinePatch) {
    super(paramNinePatch);
    init(paramSimpleImageVO, paramEssentials);
  }
  
  public ImageItem(SimpleImageVO paramSimpleImageVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramSimpleImageVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  private void init(SimpleImageVO paramSimpleImageVO, Essentials paramEssentials) {
    this.dataVO = paramSimpleImageVO;
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
  
  public void act(float paramFloat) {
    if (this.essentials.world != null && this.body != null && this.dataVO.physicsBodyData != null && this.dataVO.physicsBodyData.bodyType > 0 && !this.essentials.physicsStopped) {
      setX((this.body.getPosition()).x / PhysicsBodyLoader.SCALE);
      setY((this.body.getPosition()).y / PhysicsBodyLoader.SCALE);
      setRotation(this.body.getAngle() * 57.295776F);
    } 
    super.act(paramFloat);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    updateDataVO();
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public Body getBody() { return this.body; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public SimpleImageVO getDataVO() { return this.dataVO; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void renew() {
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    setRotation(this.dataVO.rotation);
    setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
    this.customVariables.loadFromString(this.dataVO.customVars);
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
    this.dataVO.x = getX() / this.mulX;
    this.dataVO.y = getY() / this.mulY;
    this.dataVO.scaleX = getScaleX();
    this.dataVO.scaleY = getScaleY();
    this.dataVO.rotation = getRotation();
    if (getZIndex() >= 0)
      this.dataVO.zIndex = getZIndex(); 
    if (this.dataVO.layerName == null || this.dataVO.layerName.equals(""))
      this.dataVO.layerName = "Default"; 
    this.dataVO.customVars = this.customVariables.saveAsString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/ImageItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */