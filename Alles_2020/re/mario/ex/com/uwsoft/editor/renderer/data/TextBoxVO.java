package com.uwsoft.editor.renderer.data;

public class TextBoxVO extends MainItemVO {
  public String defaultText = "";
  
  public float height = 0.0F;
  
  public String style = "";
  
  public float width = 0.0F;
  
  public TextBoxVO() {}
  
  public TextBoxVO(TextBoxVO paramTextBoxVO) {
    super(paramTextBoxVO);
    this.defaultText = new String(paramTextBoxVO.defaultText);
    this.width = paramTextBoxVO.width;
    this.height = paramTextBoxVO.height;
    this.style = new String(paramTextBoxVO.style);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/TextBoxVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */