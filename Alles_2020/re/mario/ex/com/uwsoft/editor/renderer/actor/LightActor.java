package com.uwsoft.editor.renderer.actor;

import box2dLight.ConeLight;
import box2dLight.Light;
import box2dLight.PointLight;
import box2dLight.RayHandler;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.LightVO;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.io.PrintStream;

public class LightActor extends Actor implements IBaseItem {
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  private LightVO dataVO;
  
  private Image debugImg;
  
  private float direction;
  
  public Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public Light lightObject = null;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  public RayHandler rayHandler = null;
  
  private Vector2 tmpVector = new Vector2();
  
  public LightActor(LightVO paramLightVO, Essentials paramEssentials) {
    this.essentials = paramEssentials;
    this.rayHandler = this.essentials.rayHandler;
    this.dataVO = paramLightVO;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    this.customVariables.loadFromString(this.dataVO.customVars);
    if (this.dataVO.type == LightVO.LightType.POINT) {
      createPointLight();
    } else {
      createConeLight();
    } 
    setWidth(40.0F);
    setHeight(40.0F);
  }
  
  public LightActor(LightVO paramLightVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramLightVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  public void act(float paramFloat) {
    float f1 = getX();
    float f2 = getY();
    Group group = getParent();
    float f3 = 0.0F;
    float f4 = 0.0F;
    while (group != null) {
      f1 += group.getX();
      f2 += group.getY();
      f4 += group.getRotation();
      group = group.getParent();
    } 
    if (this.lightObject != null) {
      float f;
      if (f4 != 0.0F) {
        float f5 = getX();
        float f6 = MathUtils.cosDeg(f4);
        float f7 = getY();
        f = MathUtils.sinDeg(f4);
        f3 = getY();
        float f8 = MathUtils.cosDeg(f4);
        float f9 = getX();
        float f10 = MathUtils.sinDeg(f4);
        f3 = getY() - f3 * f8 + f9 * f10;
        f = getX() - f5 * f6 - f7 * f;
      } else {
        f = 0.0F;
      } 
      this.lightObject.setPosition((f1 - f + 20.0F) * PhysicsBodyLoader.SCALE, (f2 - f3 + 20.0F) * PhysicsBodyLoader.SCALE);
    } 
    if (this.dataVO.type == LightVO.LightType.CONE)
      this.lightObject.setDirection(this.direction + f4); 
    super.act(paramFloat);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    Light light = this.lightObject;
    if (light != null)
      light.setDistance(this.dataVO.distance * this.mulX * PhysicsBodyLoader.SCALE); 
    updateDataVO();
  }
  
  public void changeDistance(int paramInt) { this.lightObject.setDistance(paramInt * PhysicsBodyLoader.SCALE); }
  
  public void createConeLight() {
    this.lightObject = new ConeLight(this.rayHandler, this.dataVO.rays, Color.WHITE, 1.0F, 0.0F, 0.0F, 0.0F, 0.0F);
    this.lightObject.setColor(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    this.lightObject.setDistance(this.dataVO.distance * this.mulX * PhysicsBodyLoader.SCALE);
    this.lightObject.setPosition(this.dataVO.x * this.mulX * PhysicsBodyLoader.SCALE, this.dataVO.y * this.mulY * PhysicsBodyLoader.SCALE);
    this.lightObject.setStaticLight(this.dataVO.isStatic);
    this.direction = this.dataVO.directionDegree;
    this.lightObject.setDirection(this.direction);
    ((ConeLight)this.lightObject).setConeDegree(this.dataVO.coneDegree);
    this.lightObject.setActive(true);
    this.lightObject.setXray(this.dataVO.isXRay);
  }
  
  public void createPointLight() {
    this.lightObject = new PointLight(this.rayHandler, this.dataVO.rays);
    this.lightObject.setColor(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    this.lightObject.setDistance(this.dataVO.distance * this.mulX * PhysicsBodyLoader.SCALE);
    this.lightObject.setPosition(this.dataVO.x * this.mulX * PhysicsBodyLoader.SCALE, this.dataVO.y * this.mulY * PhysicsBodyLoader.SCALE);
    this.lightObject.setStaticLight(this.dataVO.isStatic);
    this.lightObject.setActive(true);
    this.lightObject.setXray(this.dataVO.isXRay);
  }
  
  public void dispose() {
    removeLights();
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public void draw(Batch paramBatch, float paramFloat) { super.draw(paramBatch, paramFloat); }
  
  public Body getBody() { return this.body; }
  
  public Color getColor() { return this.lightObject.getColor(); }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public LightVO getDataVO() { return this.dataVO; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public float getRotation() { return (this.dataVO.type == LightVO.LightType.POINT) ? 0.0F : super.getRotation(); }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void removeLights() {
    Light light = this.lightObject;
    if (light == null)
      return; 
    light.remove();
    this.lightObject = null;
  }
  
  public void renew() {
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    removeLights();
    if (this.dataVO.type == LightVO.LightType.POINT) {
      createPointLight();
    } else {
      createConeLight();
    } 
    this.customVariables.loadFromString(this.dataVO.customVars);
  }
  
  public void rotateBy(float paramFloat) {
    if (this.dataVO.type == LightVO.LightType.POINT) {
      Light light = this.lightObject;
      light.setDistance(light.getDistance() + paramFloat * PhysicsBodyLoader.SCALE);
    } else {
      this.direction += paramFloat;
      this.lightObject.setDirection(this.direction);
    } 
  }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setColor(Color paramColor) {
    if (paramColor == null)
      return; 
    this.lightObject.setColor(paramColor);
  }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setRotation(float paramFloat) {
    if (this.dataVO.type == LightVO.LightType.CONE)
      this.lightObject.setDirection(this.direction + paramFloat); 
  }
  
  public void updateDataVO() {
    this.dataVO.distance = (int)this.lightObject.getDistance() / this.mulX / PhysicsBodyLoader.SCALE;
    PrintStream printStream = System.out;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("dataVO.distance = ");
    stringBuilder.append(this.dataVO.distance);
    printStream.println(stringBuilder.toString());
    LightVO lightVO = this.dataVO;
    lightVO.directionDegree = this.direction;
    if (lightVO.type == LightVO.LightType.CONE)
      this.dataVO.coneDegree = ((ConeLight)this.lightObject).getConeDegree(); 
    this.dataVO.x = getX() / this.mulX;
    this.dataVO.y = getY() / this.mulY;
    if (this.dataVO.layerName == null || this.dataVO.layerName.equals(""))
      this.dataVO.layerName = "Default"; 
    this.dataVO.customVars = this.customVariables.saveAsString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/LightActor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */