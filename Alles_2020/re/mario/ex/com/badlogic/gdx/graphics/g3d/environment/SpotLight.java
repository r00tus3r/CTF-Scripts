package com.badlogic.gdx.graphics.g3d.environment;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public class SpotLight extends BaseLight<SpotLight> {
  public float cutoffAngle;
  
  public final Vector3 direction = new Vector3();
  
  public float exponent;
  
  public float intensity;
  
  public final Vector3 position = new Vector3();
  
  public boolean equals(SpotLight paramSpotLight) {
    boolean bool;
    if (paramSpotLight != null && (paramSpotLight == this || (this.color.equals(paramSpotLight.color) && this.position.equals(paramSpotLight.position) && this.direction.equals(paramSpotLight.direction) && MathUtils.isEqual(this.intensity, paramSpotLight.intensity) && MathUtils.isEqual(this.cutoffAngle, paramSpotLight.cutoffAngle) && MathUtils.isEqual(this.exponent, paramSpotLight.exponent)))) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean equals(Object paramObject) {
    boolean bool;
    if (paramObject instanceof SpotLight && equals((SpotLight)paramObject)) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public SpotLight set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, 1.0F);
    this.position.set(paramFloat4, paramFloat5, paramFloat6);
    this.direction.set(paramFloat7, paramFloat8, paramFloat9).nor();
    this.intensity = paramFloat10;
    this.cutoffAngle = paramFloat11;
    this.exponent = paramFloat12;
    return this;
  }
  
  public SpotLight set(float paramFloat1, float paramFloat2, float paramFloat3, Vector3 paramVector31, Vector3 paramVector32, float paramFloat4, float paramFloat5, float paramFloat6) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, 1.0F);
    if (paramVector31 != null)
      this.position.set(paramVector31); 
    if (paramVector32 != null)
      this.direction.set(paramVector32).nor(); 
    this.intensity = paramFloat4;
    this.cutoffAngle = paramFloat5;
    this.exponent = paramFloat6;
    return this;
  }
  
  public SpotLight set(Color paramColor, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    if (paramColor != null)
      this.color.set(paramColor); 
    this.position.set(paramFloat1, paramFloat2, paramFloat3);
    this.direction.set(paramFloat4, paramFloat5, paramFloat6).nor();
    this.intensity = paramFloat7;
    this.cutoffAngle = paramFloat8;
    this.exponent = paramFloat9;
    return this;
  }
  
  public SpotLight set(Color paramColor, Vector3 paramVector31, Vector3 paramVector32, float paramFloat1, float paramFloat2, float paramFloat3) {
    if (paramColor != null)
      this.color.set(paramColor); 
    if (paramVector31 != null)
      this.position.set(paramVector31); 
    if (paramVector32 != null)
      this.direction.set(paramVector32).nor(); 
    this.intensity = paramFloat1;
    this.cutoffAngle = paramFloat2;
    this.exponent = paramFloat3;
    return this;
  }
  
  public SpotLight set(SpotLight paramSpotLight) { return set(paramSpotLight.color, paramSpotLight.position, paramSpotLight.direction, paramSpotLight.intensity, paramSpotLight.cutoffAngle, paramSpotLight.exponent); }
  
  public SpotLight setCutoffAngle(float paramFloat) {
    this.cutoffAngle = paramFloat;
    return this;
  }
  
  public SpotLight setDirection(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.direction.set(paramFloat1, paramFloat2, paramFloat3);
    return this;
  }
  
  public SpotLight setDirection(Vector3 paramVector3) {
    this.direction.set(paramVector3);
    return this;
  }
  
  public SpotLight setExponent(float paramFloat) {
    this.exponent = paramFloat;
    return this;
  }
  
  public SpotLight setIntensity(float paramFloat) {
    this.intensity = paramFloat;
    return this;
  }
  
  public SpotLight setPosition(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.position.set(paramFloat1, paramFloat2, paramFloat3);
    return this;
  }
  
  public SpotLight setPosition(Vector3 paramVector3) {
    this.position.set(paramVector3);
    return this;
  }
  
  public SpotLight setTarget(Vector3 paramVector3) {
    this.direction.set(paramVector3).sub(this.position).nor();
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/environment/SpotLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */