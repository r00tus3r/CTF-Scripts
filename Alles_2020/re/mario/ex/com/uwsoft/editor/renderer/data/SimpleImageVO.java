package com.uwsoft.editor.renderer.data;

public class SimpleImageVO extends MainItemVO {
  public String imageName = "";
  
  public SimpleImageVO() {}
  
  public SimpleImageVO(SimpleImageVO paramSimpleImageVO) {
    super(paramSimpleImageVO);
    this.imageName = new String(paramSimpleImageVO.imageName);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/SimpleImageVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */