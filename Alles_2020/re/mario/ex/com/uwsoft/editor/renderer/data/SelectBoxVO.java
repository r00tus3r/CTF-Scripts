package com.uwsoft.editor.renderer.data;

import java.util.ArrayList;

public class SelectBoxVO extends MainItemVO {
  public float height = 0.0F;
  
  public ArrayList<String> list = new ArrayList();
  
  public String style = "";
  
  public float width = 0.0F;
  
  public SelectBoxVO() {}
  
  public SelectBoxVO(SelectBoxVO paramSelectBoxVO) {
    super(paramSelectBoxVO);
    this.width = paramSelectBoxVO.width;
    this.height = paramSelectBoxVO.height;
    this.style = new String(paramSelectBoxVO.style);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/SelectBoxVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */