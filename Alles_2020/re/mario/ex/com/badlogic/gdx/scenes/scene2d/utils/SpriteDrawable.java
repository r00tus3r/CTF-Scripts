package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;

public class SpriteDrawable extends BaseDrawable implements TransformDrawable {
  private static final Color temp = new Color();
  
  private Sprite sprite;
  
  public SpriteDrawable() {}
  
  public SpriteDrawable(Sprite paramSprite) { setSprite(paramSprite); }
  
  public SpriteDrawable(SpriteDrawable paramSpriteDrawable) {
    super(paramSpriteDrawable);
    setSprite(paramSpriteDrawable.sprite);
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    Color color = this.sprite.getColor();
    temp.set(color);
    this.sprite.setColor(color.mul(paramBatch.getColor()));
    this.sprite.setRotation(0.0F);
    this.sprite.setScale(1.0F, 1.0F);
    this.sprite.setBounds(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.sprite.draw(paramBatch);
    this.sprite.setColor(temp);
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    Color color = this.sprite.getColor();
    temp.set(color);
    this.sprite.setColor(color.mul(paramBatch.getColor()));
    this.sprite.setOrigin(paramFloat3, paramFloat4);
    this.sprite.setRotation(paramFloat9);
    this.sprite.setScale(paramFloat7, paramFloat8);
    this.sprite.setBounds(paramFloat1, paramFloat2, paramFloat5, paramFloat6);
    this.sprite.draw(paramBatch);
    this.sprite.setColor(temp);
  }
  
  public Sprite getSprite() { return this.sprite; }
  
  public void setSprite(Sprite paramSprite) {
    this.sprite = paramSprite;
    setMinWidth(paramSprite.getWidth());
    setMinHeight(paramSprite.getHeight());
  }
  
  public SpriteDrawable tint(Color paramColor) {
    Sprite sprite1 = this.sprite;
    if (sprite1 instanceof TextureAtlas.AtlasSprite) {
      sprite1 = new TextureAtlas.AtlasSprite((TextureAtlas.AtlasSprite)sprite1);
    } else {
      sprite1 = new Sprite(sprite1);
    } 
    sprite1.setColor(paramColor);
    sprite1.setSize(getMinWidth(), getMinHeight());
    SpriteDrawable spriteDrawable = new SpriteDrawable(sprite1);
    spriteDrawable.setLeftWidth(getLeftWidth());
    spriteDrawable.setRightWidth(getRightWidth());
    spriteDrawable.setTopHeight(getTopHeight());
    spriteDrawable.setBottomHeight(getBottomHeight());
    return spriteDrawable;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */