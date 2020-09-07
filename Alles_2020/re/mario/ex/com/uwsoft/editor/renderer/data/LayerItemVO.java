package com.uwsoft.editor.renderer.data;

public class LayerItemVO {
  public boolean isLocked = false;
  
  public boolean isVisible = true;
  
  public String layerName = "";
  
  public LayerItemVO() {}
  
  public LayerItemVO(LayerItemVO paramLayerItemVO) {
    this.layerName = new String(paramLayerItemVO.layerName);
    this.isLocked = paramLayerItemVO.isLocked;
    this.isVisible = paramLayerItemVO.isVisible;
  }
  
  public LayerItemVO(String paramString) { this.layerName = new String(paramString); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/LayerItemVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */