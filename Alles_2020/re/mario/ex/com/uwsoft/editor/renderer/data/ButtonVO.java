package com.uwsoft.editor.renderer.data;

public class ButtonVO extends MainItemVO {
  public String style = "";
  
  public String text = "Button";
  
  public ButtonVO() {}
  
  public ButtonVO(ButtonVO paramButtonVO) {
    super(paramButtonVO);
    this.text = new String(paramButtonVO.text);
    this.style = new String(paramButtonVO.style);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/ButtonVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */