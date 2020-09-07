package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.ParticleEmitter;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.utils.Array;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.ParticleEffectVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class ParticleItem extends Group implements IBaseItem {
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public ParticleEffectVO dataVO;
  
  public Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  private ParticleActor particle;
  
  public ParticleItem(ParticleEffectVO paramParticleEffectVO, Essentials paramEssentials) {
    this.essentials = paramEssentials;
    this.dataVO = paramParticleEffectVO;
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
    this.particle = new ParticleActor(paramEssentials.rm.getParticleEffect(paramParticleEffectVO.particleName));
    addActor(this.particle);
    this.particle.setX(50.0F);
    this.particle.setY(50.0F);
    setWidth(paramParticleEffectVO.particleWidth);
    setHeight(paramParticleEffectVO.particleHeight);
  }
  
  public ParticleItem(ParticleEffectVO paramParticleEffectVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramParticleEffectVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    updateDataVO();
    setScale(paramFloat1, paramFloat2);
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public void forceContinuous() {
    Array array = getParticle().getParticleEffect().getEmitters();
    for (byte b = 0; b < array.size; b++)
      ((ParticleEmitter)array.get(b)).setContinuous(true); 
  }
  
  public Body getBody() { return this.body; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public ParticleEffectVO getDataVO() { return this.dataVO; }
  
  public float getHeight() { return super.getHeight() * getScaleY(); }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public ParticleActor getParticle() { return this.particle; }
  
  public float getWidth() { return super.getWidth() * getScaleX(); }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void renew() {
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScaleX(this.dataVO.scaleX * this.mulX);
    setScaleY(this.dataVO.scaleY * this.mulY);
    setRotation(this.dataVO.rotation);
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
  
  public void start() { this.particle.start(); }
  
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/ParticleItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */