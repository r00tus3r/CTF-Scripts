package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.g2d.NinePatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.physics.box2d.Body;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.Image9patchVO;

public class Image9patchItem extends ImageItem implements IBaseItem {
  private Body body;
  
  private Image9patchVO image9patchVO;
  
  private final int[] splits;
  
  public Image9patchItem(Image9patchVO paramImage9patchVO, Essentials paramEssentials) { this(paramImage9patchVO, paramEssentials, (TextureAtlas.AtlasRegion)paramEssentials.rm.getTextureRegion(paramImage9patchVO.imageName)); }
  
  private Image9patchItem(Image9patchVO paramImage9patchVO, Essentials paramEssentials, TextureAtlas.AtlasRegion paramAtlasRegion) {
    super(paramImage9patchVO, paramEssentials, new NinePatch(paramAtlasRegion, paramAtlasRegion.splits[0], paramAtlasRegion.splits[1], paramAtlasRegion.splits[2], paramAtlasRegion.splits[3]));
    this.splits = paramAtlasRegion.splits;
    this.image9patchVO = paramImage9patchVO;
  }
  
  public Image9patchItem(Image9patchVO paramImage9patchVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramImage9patchVO, paramEssentials);
    paramImage9patchVO = this.image9patchVO;
    if (paramImage9patchVO.width == 0.0F) {
      f = getWidth();
    } else {
      f = this.image9patchVO.width;
    } 
    paramImage9patchVO.width = f;
    paramImage9patchVO = this.image9patchVO;
    if (paramImage9patchVO.height == 0.0F) {
      f = getHeight();
    } else {
      f = this.image9patchVO.height;
    } 
    paramImage9patchVO.height = f;
    setParentItem(paramCompositeItem);
    setWidth(this.image9patchVO.width);
    setHeight(this.image9patchVO.height);
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    Image9patchVO image9patchVO1 = (Image9patchVO)this.dataVO;
    setWidth(image9patchVO1.width * paramFloat1);
    setHeight(image9patchVO1.height * paramFloat2);
    super.applyResolution(paramFloat1, paramFloat2);
  }
  
  public void dispose() {
    if (this.essentials.world != null && getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
  }
  
  public Body getBody() { return this.body; }
  
  public float getMinHeight() {
    int[] arrayOfInt = this.splits;
    return (arrayOfInt[0] + arrayOfInt[1]);
  }
  
  public float getMinWidth() {
    int[] arrayOfInt = this.splits;
    return (arrayOfInt[0] + arrayOfInt[1]);
  }
  
  public void renew() {
    setWidth(this.image9patchVO.width * this.mulX);
    setHeight(this.image9patchVO.height * this.mulY);
    super.renew();
  }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    setScaleX(paramFloat1);
    setScaleY(paramFloat2);
  }
  
  public void setScaleX(float paramFloat) {
    float f = getWidth() * paramFloat;
    int[] arrayOfInt = this.splits;
    paramFloat = f;
    if (arrayOfInt != null) {
      paramFloat = f;
      if (f < (arrayOfInt[0] + arrayOfInt[1]))
        paramFloat = (arrayOfInt[0] + arrayOfInt[1]); 
    } 
    setWidth(paramFloat);
  }
  
  public void setScaleY(float paramFloat) {
    float f = getHeight() * paramFloat;
    int[] arrayOfInt = this.splits;
    paramFloat = f;
    if (arrayOfInt != null) {
      paramFloat = f;
      if (f < (arrayOfInt[2] + arrayOfInt[3]))
        paramFloat = (arrayOfInt[2] + arrayOfInt[3]); 
    } 
    setHeight(paramFloat);
  }
  
  public void updateDataVO() {
    this.image9patchVO.width = getWidth() / this.mulX;
    this.image9patchVO.height = getHeight() / this.mulY;
    super.updateDataVO();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/Image9patchItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */