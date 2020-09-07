package com.uwsoft.editor.renderer.data;

public class Image9patchVO extends SimpleImageVO {
  public float height = 0.0F;
  
  public float width = 0.0F;
  
  public Image9patchVO() {}
  
  public Image9patchVO(Image9patchVO paramImage9patchVO) {
    super(paramImage9patchVO);
    this.width = paramImage9patchVO.width;
    this.height = paramImage9patchVO.height;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/Image9patchVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */