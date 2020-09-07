package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonWriter;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.SpriteAnimationVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SpriteAnimation extends Actor implements IBaseItem {
  private TextureAtlas.AtlasRegion[] animationAtlasRegions;
  
  public AnimationCompleteListener animationCompleteListener;
  
  private Map<String, Animation> animations = new HashMap();
  
  private Body body;
  
  private String currentAnimationName = "";
  
  private CustomVariables customVariables = new CustomVariables();
  
  public SpriteAnimationVO dataVO;
  
  private int endFrame;
  
  private final Essentials essentials;
  
  private int firstFrame;
  
  private float frameDuration;
  
  private int frameHeight;
  
  private int frameIndex;
  
  private int frameWidth;
  
  private int framesCount;
  
  private boolean isLockedByLayer = false;
  
  private float lastFrame;
  
  protected int layerIndex = 0;
  
  public boolean looping;
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private float normalSpeed = 1.0F;
  
  private CompositeItem parentItem = null;
  
  private boolean paused = true;
  
  private int playingTo = -1;
  
  protected boolean reverse = false;
  
  public SpriteAnimation(SpriteAnimationVO paramSpriteAnimationVO, Essentials paramEssentials) {
    this.essentials = paramEssentials;
    this.dataVO = paramSpriteAnimationVO;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    this.customVariables.loadFromString(this.dataVO.customVars);
    this.animations = Animation.constructJsonObject(this.dataVO.animations);
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
  
  public SpriteAnimation(SpriteAnimationVO paramSpriteAnimationVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramSpriteAnimationVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  private int getFrameNumberFromName(String paramString) {
    byte b = 0;
    String str = "";
    while (Character.isDigit(paramString.charAt(b))) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append(paramString.charAt(b));
      str = stringBuilder.toString();
      b++;
    } 
    return Integer.parseInt(str);
  }
  
  private void initSpriteAnimation() {
    this.lastFrame = 0.0F;
    this.frameIndex = -1;
    setOriginX(0.0F);
    setOriginY(0.0F);
    Array array = this.essentials.rm.getSpriteAnimation(this.dataVO.animationName).getRegions();
    this.animationAtlasRegions = new TextureAtlas.AtlasRegion[array.size];
    byte b = 0;
    this.frameHeight = ((TextureAtlas.AtlasRegion)array.get(0)).originalHeight;
    this.frameWidth = ((TextureAtlas.AtlasRegion)array.get(0)).originalWidth;
    setWidth(this.frameWidth);
    setHeight(this.frameHeight);
    this.framesCount = array.size;
    while (b < array.size) {
      String str = ((TextureAtlas.AtlasRegion)array.get(b)).name;
      this.animationAtlasRegions[regNameToFrame(str) - 1] = (TextureAtlas.AtlasRegion)array.get(b);
      b++;
    } 
    setAnimation(this.dataVO.fps, true);
  }
  
  private int regNameToFrame(String paramString) {
    Matcher matcher = Pattern.compile("[^0-9]+([0-9]+)$").matcher(paramString);
    if (matcher.find())
      return Integer.parseInt(matcher.group(1)); 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Frame name should be something like this '*0001', but not ");
    stringBuilder.append(paramString);
    stringBuilder.append(".");
    throw new RuntimeException(stringBuilder.toString());
  }
  
  public void act(float paramFloat) {
    boolean bool = this.paused;
    if (bool)
      return; 
    float f = this.frameDuration / this.normalSpeed;
    this.lastFrame += paramFloat;
    if (this.lastFrame > f) {
      if (!bool)
        if (this.reverse) {
          this.frameIndex--;
        } else {
          this.frameIndex++;
        }  
      this.lastFrame = 0.0F;
      if ((this.frameIndex > this.playingTo && !this.reverse) || (this.frameIndex < this.playingTo && this.reverse))
        if (this.looping) {
          this.frameIndex = this.firstFrame;
        } else {
          AnimationCompleteListener animationCompleteListener1 = this.animationCompleteListener;
          if (animationCompleteListener1 != null) {
            animationCompleteListener1.complete(this);
            this.paused = true;
            int i = this.frameIndex;
            int j = this.endFrame;
            if (i > j)
              this.frameIndex = j; 
          } else {
            this.paused = true;
            int i = this.frameIndex;
            int j = this.endFrame;
            if (i > j)
              this.frameIndex = j; 
          } 
        }  
      if (!this.looping) {
        int i = this.playingTo;
        if (i != -1 && this.frameIndex == i) {
          this.playingTo = -1;
          this.paused = true;
          AnimationCompleteListener animationCompleteListener1 = this.animationCompleteListener;
          if (animationCompleteListener1 != null)
            animationCompleteListener1.complete(this); 
        } 
      } 
    } 
    super.act(paramFloat);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    updateDataVO();
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    paramBatch.setColor(1.0F, 1.0F, 1.0F, (getColor()).a * paramFloat);
    paramBatch.draw(this.animationAtlasRegions[this.frameIndex], getX() + (this.animationAtlasRegions[this.frameIndex]).offsetX, getY() + (this.animationAtlasRegions[this.frameIndex]).offsetY, getOriginX(), getOriginY(), this.animationAtlasRegions[this.frameIndex].getRegionWidth(), this.animationAtlasRegions[this.frameIndex].getRegionHeight(), getScaleX(), getScaleY(), getRotation());
    super.draw(paramBatch, paramFloat);
  }
  
  public Map<String, Animation> getAnimations() { return this.animations; }
  
  public TextureAtlas.AtlasRegion getAtlasRegionAt(int paramInt) { return this.animationAtlasRegions[paramInt]; }
  
  public Body getBody() { return this.body; }
  
  public String getCurrentAnimationName() { return this.currentAnimationName; }
  
  public int getCurrentFrameIndex() { return this.frameIndex; }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public MainItemVO getDataVO() { return this.dataVO; }
  
  public int getFramesCount() { return this.animationAtlasRegions.length; }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public boolean isComposite() { return false; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public void pause() { this.paused = true; }
  
  public void playTo(int paramInt) {
    int i = this.framesCount;
    int j = paramInt;
    if (paramInt >= i)
      j = i - 1; 
    paramInt = j;
    if (j < 0)
      paramInt = 0; 
    j = this.frameIndex;
    if (j == paramInt)
      return; 
    if (j > paramInt) {
      this.reverse = true;
    } else {
      this.reverse = false;
    } 
    this.playingTo = paramInt;
    this.paused = false;
  }
  
  public void renew() {
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    setRotation(this.dataVO.rotation);
    setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
    if (this.currentAnimationName.isEmpty()) {
      setAnimation(this.dataVO.fps, this.looping);
    } else {
      setAnimation(this.currentAnimationName);
    } 
    this.customVariables.loadFromString(this.dataVO.customVars);
    this.animations = Animation.constructJsonObject(this.dataVO.animations);
  }
  
  public void resume() { this.paused = false; }
  
  public void setAnimation(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean) {
    this.firstFrame = paramInt1;
    this.endFrame = paramInt2;
    this.playingTo = this.endFrame;
    this.frameIndex = paramInt1;
    this.frameDuration = 1.0F / paramInt3;
    this.looping = paramBoolean;
    if (paramInt1 > paramInt2) {
      this.reverse = true;
    } else {
      this.reverse = false;
    } 
  }
  
  public void setAnimation(int paramInt, boolean paramBoolean) {
    boolean bool = false;
    this.firstFrame = 0;
    this.endFrame = this.framesCount - 1;
    int i = this.endFrame;
    this.playingTo = i;
    this.frameIndex = 0;
    this.frameDuration = 1.0F / paramInt;
    this.looping = paramBoolean;
    paramBoolean = bool;
    if (this.firstFrame > i)
      paramBoolean = true; 
    this.reverse = paramBoolean;
  }
  
  public void setAnimation(String paramString) {
    Animation animation = (Animation)this.animations.get(paramString);
    if (animation != null) {
      setAnimation(animation.startFrame, animation.endFrame, this.dataVO.fps, this.looping);
      this.currentAnimationName = paramString;
    } 
  }
  
  public void setAnimation(boolean paramBoolean) { setAnimation(24, paramBoolean); }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setCompletionListener(AnimationCompleteListener paramAnimationCompleteListener) { this.animationCompleteListener = paramAnimationCompleteListener; }
  
  public void setCurrFrame(int paramInt) {
    this.frameIndex = paramInt;
    this.playingTo = -1;
    paramInt = this.frameIndex;
    int i = this.framesCount;
    if (paramInt >= i)
      this.frameIndex = i - 1; 
    if (this.frameIndex < 0)
      this.frameIndex = 0; 
  }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setNormalSpeed(float paramFloat) { this.normalSpeed = paramFloat; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setScale(float paramFloat) {
    setScale(paramFloat, paramFloat);
    SpriteAnimationVO spriteAnimationVO = this.dataVO;
    spriteAnimationVO.scaleX = paramFloat;
    spriteAnimationVO.scaleY = paramFloat;
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
  
  public void start() {
    this.frameIndex = 0;
    this.paused = false;
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
    this.dataVO.animations = Animation.constructJsonString(this.animations);
  }
  
  public static class Animation {
    public int endFrame;
    
    public String name;
    
    public int startFrame;
    
    public Animation() {}
    
    public Animation(int param1Int1, int param1Int2, String param1String) {
      this.startFrame = param1Int1;
      this.endFrame = param1Int2;
      this.name = param1String;
    }
    
    public static Map<String, Animation> constructJsonObject(String param1String) { return param1String.isEmpty() ? new HashMap() : (Map)(new Json()).fromJson(HashMap.class, param1String); }
    
    public static String constructJsonString(Map<String, Animation> param1Map) {
      Json json = new Json();
      json.setOutputType(JsonWriter.OutputType.json);
      return json.toJson(param1Map);
    }
  }
  
  public static interface AnimationCompleteListener {
    void complete(SpriteAnimation param1SpriteAnimation);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/SpriteAnimation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */