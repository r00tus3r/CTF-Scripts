package com.uwsoft.editor.renderer.data;

public class SpriterVO extends MainItemVO {
  public int animation;
  
  public String animationName = "";
  
  public int entity;
  
  public float scale = 1.0F;
  
  public SpriterVO() {}
  
  public SpriterVO(SpriterVO paramSpriterVO) {
    super(paramSpriterVO);
    this.entity = paramSpriterVO.entity;
    this.animation = paramSpriterVO.animation;
    this.animationName = paramSpriterVO.animationName;
    this.scale = paramSpriterVO.scale;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/SpriterVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */