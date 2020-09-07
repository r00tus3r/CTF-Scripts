package com.uwsoft.editor.renderer.data;

public class LightVO extends MainItemVO {
  public float coneDegree = 30.0F;
  
  public float directionDegree = 0.0F;
  
  public float distance = 300.0F;
  
  public boolean isStatic = true;
  
  public boolean isXRay = true;
  
  public int rays = 12;
  
  public LightType type;
  
  public LightVO() {
    this.tint = new float[4];
    this.tint[0] = 1.0F;
    this.tint[1] = 1.0F;
    this.tint[2] = 1.0F;
    this.tint[3] = 1.0F;
  }
  
  public LightVO(LightVO paramLightVO) {
    super(paramLightVO);
    this.type = paramLightVO.type;
    this.rays = paramLightVO.rays;
    this.distance = paramLightVO.distance;
    this.directionDegree = paramLightVO.directionDegree;
    this.coneDegree = paramLightVO.coneDegree;
    this.isStatic = paramLightVO.isStatic;
    this.isXRay = paramLightVO.isXRay;
  }
  
  public enum LightType {
    CONE, POINT;
    
    static  {
      CONE = new LightType("CONE", true);
      $VALUES = new LightType[] { POINT, CONE };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/LightVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */