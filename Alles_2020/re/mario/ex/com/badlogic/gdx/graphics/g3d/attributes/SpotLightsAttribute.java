package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.environment.SpotLight;
import com.badlogic.gdx.utils.Array;

public class SpotLightsAttribute extends Attribute {
  public static final String Alias = "spotLights";
  
  public static final long Type = register("spotLights");
  
  public final Array<SpotLight> lights = new Array(true);
  
  public SpotLightsAttribute() { super(Type); }
  
  public SpotLightsAttribute(SpotLightsAttribute paramSpotLightsAttribute) {
    this();
    this.lights.addAll(paramSpotLightsAttribute.lights);
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
  
  public SpotLightsAttribute copy() { return new SpotLightsAttribute(this); }
  
  public int hashCode() {
    int i = super.hashCode();
    for (SpotLight spotLight : this.lights) {
      int j;
      if (spotLight == null) {
        j = 0;
      } else {
        j = spotLight.hashCode();
      } 
      i = i * 1237 + j;
    } 
    return i;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */