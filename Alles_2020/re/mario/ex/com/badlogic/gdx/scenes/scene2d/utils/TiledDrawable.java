package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;

public class TiledDrawable extends TextureRegionDrawable {
  private static final Color temp = new Color();
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  public TiledDrawable() {}
  
  public TiledDrawable(TextureRegion paramTextureRegion) { super(paramTextureRegion); }
  
  public TiledDrawable(TextureRegionDrawable paramTextureRegionDrawable) { super(paramTextureRegionDrawable); }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    Color color1 = paramBatch.getColor();
    temp.set(color1);
    paramBatch.setColor(color1.mul(this.color));
    TextureRegion textureRegion = getRegion();
    float f1 = textureRegion.getRegionWidth();
    float f2 = textureRegion.getRegionHeight();
    int i = (int)(paramFloat3 / f1);
    int j = (int)(paramFloat4 / f2);
    float f3 = paramFloat3 - i * f1;
    float f4 = paramFloat4 - j * f2;
    paramFloat4 = paramFloat1;
    paramFloat3 = paramFloat2;
    int k;
    for (k = 0; k < i; k++) {
      paramFloat3 = paramFloat2;
      for (byte b = 0; b < j; b++) {
        paramBatch.draw(textureRegion, paramFloat4, paramFloat3, f1, f2);
        paramFloat3 += f2;
      } 
      paramFloat4 += f1;
    } 
    Texture texture = textureRegion.getTexture();
    float f5 = textureRegion.getU();
    float f6 = textureRegion.getV2();
    if (f3 > 0.0F) {
      float f = f5 + f3 / texture.getWidth();
      paramFloat3 = textureRegion.getV();
      byte b = 0;
      k = j;
      while (b < k) {
        paramBatch.draw(texture, paramFloat4, paramFloat2, f3, f2, f5, f6, f, paramFloat3);
        paramFloat2 += f2;
        b++;
      } 
      paramFloat3 = paramFloat2;
      if (f4 > 0.0F) {
        paramBatch.draw(texture, paramFloat4, paramFloat2, f3, f4, f5, f6, f, f6 - f4 / texture.getHeight());
        paramFloat3 = paramFloat2;
      } 
    } 
    if (f4 > 0.0F) {
      paramFloat4 = textureRegion.getU2();
      paramFloat2 = f4 / texture.getHeight();
      for (k = 0; k < i; k++) {
        paramBatch.draw(texture, paramFloat1, paramFloat3, f1, f4, f5, f6, paramFloat4, f6 - paramFloat2);
        paramFloat1 += f1;
      } 
    } 
    paramBatch.setColor(temp);
  }
  
  public void draw(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) { throw new UnsupportedOperationException(); }
  
  public Color getColor() { return this.color; }
  
  public TiledDrawable tint(Color paramColor) {
    TiledDrawable tiledDrawable = new TiledDrawable(this);
    tiledDrawable.color.set(paramColor);
    tiledDrawable.setLeftWidth(getLeftWidth());
    tiledDrawable.setRightWidth(getRightWidth());
    tiledDrawable.setTopHeight(getTopHeight());
    tiledDrawable.setBottomHeight(getBottomHeight());
    return tiledDrawable;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/TiledDrawable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */