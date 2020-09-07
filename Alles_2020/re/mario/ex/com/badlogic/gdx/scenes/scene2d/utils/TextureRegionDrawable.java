package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;

public class TextureRegionDrawable extends BaseDrawable implements TransformDrawable {
  private TextureRegion region;
  
  public TextureRegionDrawable() {}
  
  public TextureRegionDrawable(Texture paramTexture) { setRegion(new TextureRegion(paramTexture)); }
  
  public TextureRegionDrawable(TextureRegion paramTextureRegion) { setRegion(paramTextureRegion); }
  
  public TextureRegionDrawable(TextureRegionDrawable paramTextureRegionDrawable) {
    super(paramTextureRegionDrawable);
    setRegion(paramTextureRegionDrawable.region);
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { paramBatch.draw(this.region, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { paramBatch.draw(this.region, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9); }
  
  public TextureRegion getRegion() { return this.region; }
  
  public void setRegion(TextureRegion paramTextureRegion) {
    this.region = paramTextureRegion;
    if (paramTextureRegion != null) {
      setMinWidth(paramTextureRegion.getRegionWidth());
      setMinHeight(paramTextureRegion.getRegionHeight());
    } 
  }
  
  public Drawable tint(Color paramColor) {
    Sprite sprite = this.region;
    if (sprite instanceof TextureAtlas.AtlasRegion) {
      sprite = new TextureAtlas.AtlasSprite((TextureAtlas.AtlasRegion)sprite);
    } else {
      sprite = new Sprite(sprite);
    } 
    sprite.setColor(paramColor);
    sprite.setSize(getMinWidth(), getMinHeight());
    SpriteDrawable spriteDrawable = new SpriteDrawable(sprite);
    spriteDrawable.setLeftWidth(getLeftWidth());
    spriteDrawable.setRightWidth(getRightWidth());
    spriteDrawable.setTopHeight(getTopHeight());
    spriteDrawable.setBottomHeight(getBottomHeight());
    return spriteDrawable;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */