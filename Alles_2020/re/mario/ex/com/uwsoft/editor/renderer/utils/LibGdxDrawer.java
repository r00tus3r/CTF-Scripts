package com.uwsoft.editor.renderer.utils;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.brashmonkey.spriter.Drawer;
import com.brashmonkey.spriter.Loader;
import com.brashmonkey.spriter.Player;
import com.brashmonkey.spriter.Timeline;

public class LibGdxDrawer extends Drawer<Sprite> {
  Batch batch;
  
  ShapeRenderer renderer;
  
  public LibGdxDrawer(Loader<Sprite> paramLoader, ShapeRenderer paramShapeRenderer) {
    super(paramLoader);
    this.renderer = paramShapeRenderer;
  }
  
  public void beforeDraw(Player paramPlayer, Batch paramBatch) {
    this.batch = paramBatch;
    draw(paramPlayer);
  }
  
  public void circle(float paramFloat1, float paramFloat2, float paramFloat3) { this.renderer.circle(paramFloat1, paramFloat2, paramFloat3); }
  
  public void draw(Timeline.Key.Object paramObject) {
    Sprite sprite = (Sprite)this.loader.get(paramObject.ref);
    float f1 = sprite.getWidth() * paramObject.pivot.x;
    float f2 = paramObject.position.x;
    float f3 = sprite.getHeight() * paramObject.pivot.y;
    float f4 = paramObject.position.y;
    sprite.setX(f2 - f1);
    sprite.setY(f4 - f3);
    sprite.setOrigin(f1, f3);
    sprite.setRotation(paramObject.angle);
    sprite.setColor(1.0F, 1.0F, 1.0F, paramObject.alpha);
    sprite.setScale(paramObject.scale.x, paramObject.scale.y);
    sprite.draw(this.batch);
  }
  
  public void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.renderer.line(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void rectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.renderer.rect(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.renderer.setColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/utils/LibGdxDrawer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */