package com.uwsoft.editor.renderer.data;

public class SpineVO extends MainItemVO {
  public String animationName = "";
  
  public String currentAnimationName = "";
  
  public SpineVO() {}
  
  public SpineVO(SpineVO paramSpineVO) {
    super(paramSpineVO);
    this.animationName = paramSpineVO.animationName;
    this.currentAnimationName = paramSpineVO.currentAnimationName;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/SpineVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */