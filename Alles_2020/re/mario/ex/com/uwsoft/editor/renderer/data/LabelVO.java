package com.uwsoft.editor.renderer.data;

public class LabelVO extends MainItemVO {
  public int align;
  
  public float height = 0.0F;
  
  public boolean multiline = false;
  
  public int size;
  
  public String style = "";
  
  public String text = "Label";
  
  public float width = 0.0F;
  
  public LabelVO() {}
  
  public LabelVO(LabelVO paramLabelVO) {
    super(paramLabelVO);
    this.text = new String(paramLabelVO.text);
    this.style = new String(paramLabelVO.style);
    this.size = paramLabelVO.size;
    this.align = paramLabelVO.align;
    this.width = paramLabelVO.width;
    this.height = paramLabelVO.height;
    this.multiline = paramLabelVO.multiline;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/LabelVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */