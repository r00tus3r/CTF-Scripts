package com.uwsoft.editor.renderer.data;

public class CompositeItemVO extends MainItemVO {
  public CompositeVO composite = new CompositeVO();
  
  public float scissorHeight;
  
  public float scissorWidth;
  
  public float scissorX;
  
  public float scissorY;
  
  public CompositeItemVO() {}
  
  public CompositeItemVO(CompositeItemVO paramCompositeItemVO) { super(paramCompositeItemVO); }
  
  public CompositeItemVO(CompositeVO paramCompositeVO) {}
  
  public CompositeItemVO clone() {
    CompositeItemVO compositeItemVO = new CompositeItemVO();
    compositeItemVO.composite = this.composite;
    compositeItemVO.isFlipedH = this.isFlipedH;
    compositeItemVO.isFlipedV = this.isFlipedV;
    compositeItemVO.itemName = this.itemName;
    compositeItemVO.layerName = this.layerName;
    compositeItemVO.rotation = this.rotation;
    compositeItemVO.tint = this.tint;
    compositeItemVO.x = this.x;
    compositeItemVO.y = this.y;
    compositeItemVO.zIndex = this.zIndex;
    compositeItemVO.scissorX = this.scissorX;
    compositeItemVO.scissorY = this.scissorY;
    compositeItemVO.scissorWidth = this.scissorWidth;
    compositeItemVO.scissorHeight = this.scissorHeight;
    return compositeItemVO;
  }
  
  public void update(CompositeItemVO paramCompositeItemVO) { this.composite = new CompositeVO(paramCompositeItemVO.composite); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/CompositeItemVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */