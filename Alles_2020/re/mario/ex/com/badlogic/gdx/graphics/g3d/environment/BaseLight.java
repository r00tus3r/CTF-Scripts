package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.graphics.Color;

public abstract class BaseLight<T extends BaseLight<T>> extends Object {
  public final Color color = new Color(0.0F, 0.0F, 0.0F, 1.0F);
  
  public T setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    return (T)this;
  }
  
  public T setColor(Color paramColor) {
    this.color.set(paramColor);
    return (T)this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/BaseLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */