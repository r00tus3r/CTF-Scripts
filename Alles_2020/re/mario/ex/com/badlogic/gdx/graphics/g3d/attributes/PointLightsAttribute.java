package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.environment.PointLight;
import com.badlogic.gdx.utils.Array;

public class PointLightsAttribute extends Attribute {
  public static final String Alias = "pointLights";
  
  public static final long Type = register("pointLights");
  
  public final Array<PointLight> lights = new Array(true);
  
  public PointLightsAttribute() { super(Type); }
  
  public PointLightsAttribute(PointLightsAttribute paramPointLightsAttribute) {
    this();
    this.lights.addAll(paramPointLightsAttribute.lights);
  }
  
  public static final boolean is(long paramLong) {
    boolean bool;
    if ((Type & paramLong) == paramLong) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int compareTo(Attribute paramAttribute) {
    if (this.type != paramAttribute.type) {
      byte b;
      if (this.type < paramAttribute.type) {
        b = -1;
      } else {
        b = 1;
      } 
      return b;
    } 
    return 0;
  }
  
  public PointLightsAttribute copy() { return new PointLightsAttribute(this); }
  
  public int hashCode() {
    int i = super.hashCode();
    for (PointLight pointLight : this.lights) {
      int j;
      if (pointLight == null) {
        j = 0;
      } else {
        j = pointLight.hashCode();
      } 
      i = i * 1231 + j;
    } 
    return i;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */