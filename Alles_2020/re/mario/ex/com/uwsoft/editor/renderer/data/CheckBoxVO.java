package com.uwsoft.editor.renderer.data;

public class CheckBoxVO extends MainItemVO {
  public String style = "";
  
  public String text = "Label";
  
  public CheckBoxVO() {}
  
  public CheckBoxVO(CheckBoxVO paramCheckBoxVO) {
    super(paramCheckBoxVO);
    this.text = new String(paramCheckBoxVO.text);
    this.style = new String(paramCheckBoxVO.style);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/CheckBoxVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */