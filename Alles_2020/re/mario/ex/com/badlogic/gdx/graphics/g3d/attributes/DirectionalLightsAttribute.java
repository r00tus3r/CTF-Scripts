package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight;
import com.badlogic.gdx.utils.Array;

public class DirectionalLightsAttribute extends Attribute {
  public static final String Alias = "directionalLights";
  
  public static final long Type = register("directionalLights");
  
  public final Array<DirectionalLight> lights = new Array(true);
  
  public DirectionalLightsAttribute() { super(Type); }
  
  public DirectionalLightsAttribute(DirectionalLightsAttribute paramDirectionalLightsAttribute) {
    this();
    this.lights.addAll(paramDirectionalLightsAttribute.lights);
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
  
  public DirectionalLightsAttribute copy() { return new DirectionalLightsAttribute(this); }
  
  public int hashCode() {
    int i = super.hashCode();
    for (DirectionalLight directionalLight : this.lights) {
      int j;
      if (directionalLight == null) {
        j = 0;
      } else {
        j = directionalLight.hashCode();
      } 
      i = i * 1229 + j;
    } 
    return i;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */