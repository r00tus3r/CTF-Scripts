package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.SpineVO;
import com.uwsoft.editor.renderer.spine.SpineDataHelper;
import com.uwsoft.editor.renderer.spine.SpineReflectionHelper;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.lang.reflect.InvocationTargetException;

public class SpineActor extends Actor implements IBaseItem {
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public SpineVO dataVO;
  
  private Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  private SpineDataHelper spineData;
  
  private SpineReflectionHelper spineReflectionHelper;
  
  public SpineActor(SpineVO paramSpineVO, Essentials paramEssentials) {
    this.essentials = paramEssentials;
    this.spineReflectionHelper = this.essentials.spineReflectionHelper;
    this.dataVO = paramSpineVO;
    initSpine();
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
  
  public SpineActor(SpineVO paramSpineVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramSpineVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  private void initSpine() {
    this.spineData = new SpineDataHelper();
    try {
      this.spineData.initSpine(this.dataVO, this.essentials.rm, this.spineReflectionHelper, this.mulX);
    } catch (InstantiationException instantiationException) {
      System.out.println("Reflection problem");
      instantiationException.printStackTrace();
    } catch (IllegalAccessException illegalAccessException) {
    
    } catch (IllegalArgumentException illegalArgumentException) {
    
    } catch (InvocationTargetException invocationTargetException) {
    
    } catch (ReflectionException reflectionException) {}
    setWidth(this.spineData.width);
    setHeight(this.spineData.height);
  }
  
  public void act(float paramFloat) {
    this.spineData.act(paramFloat, getX(), getY());
    super.act(paramFloat);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    updateDataVO();
    initSpine();
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    this.spineData.draw(paramBatch, paramFloat);
    super.draw(paramBatch, paramFloat);
  }
  
  public Array<Object> getAnimations() { return this.spineData.getAnimations(); }
  
  public Body getBody() { return this.body; }
  
  public String getCurrentAnimationName() { return this.dataVO.currentAnimationName; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public SpineVO getDataVO() { return this.dataVO; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public Object getState() { return this.spineData.stateObject; }
  
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
    initSpine();
  }
  
  public void setAnimation(String paramString) {
    this.spineData.setAnimation(paramString);
    this.dataVO.currentAnimationName = paramString;
  }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setScale(float paramFloat) {
    setScale(paramFloat, paramFloat);
    this.dataVO.scaleX = paramFloat;
    renew();
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/SpineActor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */