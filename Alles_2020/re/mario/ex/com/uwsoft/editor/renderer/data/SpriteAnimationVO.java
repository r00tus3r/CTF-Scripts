package com.uwsoft.editor.renderer.data;

public class SpriteAnimationVO extends MainItemVO {
  public String animationName = "";
  
  public String animations = "";
  
  public int fps = 24;
  
  public SpriteAnimationVO() {}
  
  public SpriteAnimationVO(SpriteAnimationVO paramSpriteAnimationVO) {
    super(paramSpriteAnimationVO);
    this.animationName = paramSpriteAnimationVO.animationName;
    this.fps = paramSpriteAnimationVO.fps;
    this.animations = paramSpriteAnimationVO.animations;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/SpriteAnimationVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */