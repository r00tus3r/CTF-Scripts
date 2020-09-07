package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Vector3;

public class PointLight extends BaseLight<PointLight> {
  public float intensity;
  
  public final Vector3 position = new Vector3();
  
  public boolean equals(PointLight paramPointLight) {
    boolean bool;
    if (paramPointLight != null && (paramPointLight == this || (this.color.equals(paramPointLight.color) && this.position.equals(paramPointLight.position) && this.intensity == paramPointLight.intensity))) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool;
    if (paramObject instanceof PointLight && equals((PointLight)paramObject)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public PointLight set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, 1.0F);
    this.position.set(paramFloat4, paramFloat5, paramFloat6);
    this.intensity = paramFloat7;
    return this;
  }
  
  public PointLight set(float paramFloat1, float paramFloat2, float paramFloat3, Vector3 paramVector3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, 1.0F);
    if (paramVector3 != null)
      this.position.set(paramVector3); 
    this.intensity = paramFloat4;
    return this;
  }
  
  public PointLight set(Color paramColor, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramColor != null)
      this.color.set(paramColor); 
    this.position.set(paramFloat1, paramFloat2, paramFloat3);
    this.intensity = paramFloat4;
    return this;
  }
  
  public PointLight set(Color paramColor, Vector3 paramVector3, float paramFloat) {
    if (paramColor != null)
      this.color.set(paramColor); 
    if (paramVector3 != null)
      this.position.set(paramVector3); 
    this.intensity = paramFloat;
    return this;
  }
  
  public PointLight set(PointLight paramPointLight) { return set(paramPointLight.color, paramPointLight.position, paramPointLight.intensity); }
  
  public PointLight setIntensity(float paramFloat) {
    this.intensity = paramFloat;
    return this;
  }
  
  public PointLight setPosition(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.position.set(paramFloat1, paramFloat2, paramFloat3);
    return this;
  }
  
  public PointLight setPosition(Vector3 paramVector3) {
    this.position.set(paramVector3);
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/PointLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */