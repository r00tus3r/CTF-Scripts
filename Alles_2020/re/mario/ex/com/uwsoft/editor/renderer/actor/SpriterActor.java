package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.brashmonkey.spriter.Data;
import com.brashmonkey.spriter.Player;
import com.brashmonkey.spriter.Rectangle;
import com.brashmonkey.spriter.SCMLReader;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.SpriterVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import com.uwsoft.editor.renderer.utils.LibGdxDrawer;
import com.uwsoft.editor.renderer.utils.LibGdxLoader;
import java.util.ArrayList;

public class SpriterActor extends Actor implements IBaseItem {
  private ArrayList<String> animations = new ArrayList();
  
  private Body body;
  
  private int currentAnimationIndex;
  
  private String currentAnimationName = "";
  
  private int currentEntityIndex = 0;
  
  private CustomVariables customVariables = new CustomVariables();
  
  private Data data;
  
  public SpriterVO dataVO;
  
  private LibGdxDrawer drawer;
  
  private ArrayList<String> entities = new ArrayList();
  
  private final Essentials essentials;
  
  private int frameHeight;
  
  private int frameWidth;
  
  private boolean isLockedByLayer = false;
  
  protected int layerIndex = 0;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  private Player player;
  
  protected boolean reverse = false;
  
  public SpriterActor(SpriterVO paramSpriterVO, Essentials paramEssentials) {
    this.essentials = paramEssentials;
    this.dataVO = paramSpriterVO;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    this.customVariables.loadFromString(this.dataVO.customVars);
    setRotation(this.dataVO.rotation);
    if (this.dataVO.zIndex < 0)
      this.dataVO.zIndex = 0; 
    if (this.dataVO.tint == null) {
      setTint(new Color(1.0F, 1.0F, 1.0F, 1.0F));
    } else {
      setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    } 
    initSpriteAnimation();
  }
  
  public SpriterActor(SpriterVO paramSpriterVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramSpriterVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  private void initPlayer() {
    this.player = new Player(this.data.getEntity(this.currentEntityIndex));
    this.player.setAnimation(this.currentAnimationIndex);
    this.player.setScale(this.dataVO.scale * this.mulX);
    setRectangle();
  }
  
  private void initSpriteAnimation() {
    setOriginX(0.0F);
    setOriginY(0.0F);
    FileHandle fileHandle = this.essentials.rm.getSCMLFile(this.dataVO.animationName);
    this.data = (new SCMLReader(fileHandle.read())).getData();
    LibGdxLoader libGdxLoader = new LibGdxLoader(this.data);
    libGdxLoader.load(fileHandle.file());
    this.drawer = new LibGdxDrawer(libGdxLoader, new ShapeRenderer());
    this.currentAnimationIndex = this.dataVO.animation;
    this.currentEntityIndex = this.dataVO.entity;
    initPlayer();
  }
  
  private void setRectangle() {
    this.player.update();
    Rectangle rectangle = this.player.getBoundingRectangle(null);
    this.frameWidth = (int)rectangle.size.width;
    this.frameHeight = (int)rectangle.size.height;
    setWidth(this.frameWidth);
    setHeight(this.frameHeight);
  }
  
  public void act(float paramFloat) { super.act(paramFloat); }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    updateDataVO();
    initPlayer();
  }
  
  public void dispose() {}
  
  public void draw(Batch paramBatch, float paramFloat) {
    paramBatch.setColor(1.0F, 1.0F, 1.0F, (getColor()).a * paramFloat);
    super.draw(paramBatch, paramFloat);
    this.player.setPosition(getX(), getY());
    this.player.setPivot(getWidth() / 2.0F, getHeight() / 2.0F);
    this.player.setScale(this.dataVO.scale * this.mulX);
    this.player.rotate(getRotation() - this.player.getAngle());
    this.player.update();
    this.drawer.beforeDraw(this.player, paramBatch);
  }
  
  public ArrayList<String> getAnimations() {
    this.animations = new ArrayList();
    for (byte b = 0; b < this.data.getEntity(this.currentEntityIndex).animations(); b++)
      this.animations.add((this.data.getEntity(this.currentEntityIndex).getAnimation(b)).name); 
    return this.animations;
  }
  
  public Body getBody() { return null; }
  
  public int getCurrentAnimationIndex() { return this.currentAnimationIndex; }
  
  public String getCurrentAnimationName() { return this.currentAnimationName; }
  
  public int getCurrentEntityIndex() { return this.currentEntityIndex; }
  
  public String getCurrentEntityName() { return (String)this.entities.get(this.currentEntityIndex); }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public MainItemVO getDataVO() { return this.dataVO; }
  
  public ArrayList<String> getEntities() {
    this.entities = this.data.getEntities();
    return this.entities;
  }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void renew() {
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    this.player.setScale(this.dataVO.scale * this.mulX);
    setRotation(this.dataVO.rotation);
    this.customVariables.loadFromString(this.dataVO.customVars);
    setRectangle();
  }
  
  public void setAnimation(int paramInt) {
    this.currentAnimationIndex = paramInt;
    updateDataVO();
    initPlayer();
  }
  
  public void setBody(Body paramBody) {}
  
  public void setEntity(int paramInt) {
    this.currentEntityIndex = paramInt;
    setAnimation(0);
    updateDataVO();
    initPlayer();
  }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setSpriterScale(float paramFloat) {
    this.dataVO.scale = paramFloat;
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
    SpriterVO spriterVO = this.dataVO;
    spriterVO.entity = this.currentEntityIndex;
    spriterVO.animation = this.currentAnimationIndex;
    spriterVO.customVars = this.customVariables.saveAsString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/SpriterActor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */