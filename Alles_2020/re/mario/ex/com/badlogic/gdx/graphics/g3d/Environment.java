package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.g3d.attributes.DirectionalLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.PointLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.SpotLightsAttribute;
import com.badlogic.gdx.graphics.g3d.environment.BaseLight;
import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight;
import com.badlogic.gdx.graphics.g3d.environment.PointLight;
import com.badlogic.gdx.graphics.g3d.environment.ShadowMap;
import com.badlogic.gdx.graphics.g3d.environment.SpotLight;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class Environment extends Attributes {
  public ShadowMap shadowMap;
  
  public Environment add(BaseLight paramBaseLight) {
    if (paramBaseLight instanceof DirectionalLight) {
      add((DirectionalLight)paramBaseLight);
    } else if (paramBaseLight instanceof PointLight) {
      add((PointLight)paramBaseLight);
    } else {
      if (paramBaseLight instanceof SpotLight) {
        add((SpotLight)paramBaseLight);
        return this;
      } 
      throw new GdxRuntimeException("Unknown light type");
    } 
    return this;
  }
  
  public Environment add(DirectionalLight paramDirectionalLight) {
    DirectionalLightsAttribute directionalLightsAttribute1 = (DirectionalLightsAttribute)get(DirectionalLightsAttribute.Type);
    DirectionalLightsAttribute directionalLightsAttribute2 = directionalLightsAttribute1;
    if (directionalLightsAttribute1 == null) {
      directionalLightsAttribute2 = new DirectionalLightsAttribute();
      set(directionalLightsAttribute2);
    } 
    directionalLightsAttribute2.lights.add(paramDirectionalLight);
    return this;
  }
  
  public Environment add(PointLight paramPointLight) {
    PointLightsAttribute pointLightsAttribute1 = (PointLightsAttribute)get(PointLightsAttribute.Type);
    PointLightsAttribute pointLightsAttribute2 = pointLightsAttribute1;
    if (pointLightsAttribute1 == null) {
      pointLightsAttribute2 = new PointLightsAttribute();
      set(pointLightsAttribute2);
    } 
    pointLightsAttribute2.lights.add(paramPointLight);
    return this;
  }
  
  public Environment add(SpotLight paramSpotLight) {
    SpotLightsAttribute spotLightsAttribute1 = (SpotLightsAttribute)get(SpotLightsAttribute.Type);
    SpotLightsAttribute spotLightsAttribute2 = spotLightsAttribute1;
    if (spotLightsAttribute1 == null) {
      spotLightsAttribute2 = new SpotLightsAttribute();
      set(spotLightsAttribute2);
    } 
    spotLightsAttribute2.lights.add(paramSpotLight);
    return this;
  }
  
  public Environment add(Array<BaseLight> paramArray) {
    Iterator iterator = paramArray.iterator();
    while (iterator.hasNext())
      add((BaseLight)iterator.next()); 
    return this;
  }
  
  public Environment add(BaseLight... paramVarArgs) {
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      add(paramVarArgs[b]); 
    return this;
  }
  
  public Environment remove(BaseLight paramBaseLight) {
    if (paramBaseLight instanceof DirectionalLight) {
      remove((DirectionalLight)paramBaseLight);
    } else if (paramBaseLight instanceof PointLight) {
      remove((PointLight)paramBaseLight);
    } else {
      if (paramBaseLight instanceof SpotLight) {
        remove((SpotLight)paramBaseLight);
        return this;
      } 
      throw new GdxRuntimeException("Unknown light type");
    } 
    return this;
  }
  
  public Environment remove(DirectionalLight paramDirectionalLight) {
    if (has(DirectionalLightsAttribute.Type)) {
      DirectionalLightsAttribute directionalLightsAttribute = (DirectionalLightsAttribute)get(DirectionalLightsAttribute.Type);
      directionalLightsAttribute.lights.removeValue(paramDirectionalLight, false);
      if (directionalLightsAttribute.lights.size == 0)
        remove(DirectionalLightsAttribute.Type); 
    } 
    return this;
  }
  
  public Environment remove(PointLight paramPointLight) {
    if (has(PointLightsAttribute.Type)) {
      PointLightsAttribute pointLightsAttribute = (PointLightsAttribute)get(PointLightsAttribute.Type);
      pointLightsAttribute.lights.removeValue(paramPointLight, false);
      if (pointLightsAttribute.lights.size == 0)
        remove(PointLightsAttribute.Type); 
    } 
    return this;
  }
  
  public Environment remove(SpotLight paramSpotLight) {
    if (has(SpotLightsAttribute.Type)) {
      SpotLightsAttribute spotLightsAttribute = (SpotLightsAttribute)get(SpotLightsAttribute.Type);
      spotLightsAttribute.lights.removeValue(paramSpotLight, false);
      if (spotLightsAttribute.lights.size == 0)
        remove(SpotLightsAttribute.Type); 
    } 
    return this;
  }
  
  public Environment remove(Array<BaseLight> paramArray) {
    Iterator iterator = paramArray.iterator();
    while (iterator.hasNext())
      remove((BaseLight)iterator.next()); 
    return this;
  }
  
  public Environment remove(BaseLight... paramVarArgs) {
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      remove(paramVarArgs[b]); 
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Environment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */