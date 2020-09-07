package com.uwsoft.editor.renderer.data;

import java.util.Arrays;

public class MainItemVO {
  public String customVars = "";
  
  public boolean isFlipedH = false;
  
  public boolean isFlipedV = false;
  
  public String itemIdentifier = "";
  
  public String itemName = "";
  
  public String layerName = "";
  
  public String meshId = "-1";
  
  public PhysicsBodyDataVO physicsBodyData = null;
  
  public float rotation;
  
  public float scaleX = 1.0F;
  
  public float scaleY = 1.0F;
  
  public String[] tags = null;
  
  public float[] tint = null;
  
  public float x;
  
  public float y;
  
  public int zIndex = 0;
  
  public MainItemVO() {}
  
  public MainItemVO(MainItemVO paramMainItemVO) {
    this.itemIdentifier = new String(paramMainItemVO.itemIdentifier);
    this.itemName = new String(paramMainItemVO.itemName);
    if (this.tags != null) {
      String[] arrayOfString = paramMainItemVO.tags;
      this.tags = (String[])Arrays.copyOf(arrayOfString, arrayOfString.length);
    } 
    this.customVars = new String(paramMainItemVO.customVars);
    this.x = paramMainItemVO.x;
    this.y = paramMainItemVO.y;
    this.rotation = paramMainItemVO.rotation;
    this.zIndex = paramMainItemVO.zIndex;
    this.layerName = new String(paramMainItemVO.layerName);
    float[] arrayOfFloat = paramMainItemVO.tint;
    if (arrayOfFloat != null)
      this.tint = Arrays.copyOf(arrayOfFloat, arrayOfFloat.length); 
    this.isFlipedH = paramMainItemVO.isFlipedH;
    this.isFlipedV = paramMainItemVO.isFlipedV;
    this.scaleX = paramMainItemVO.scaleX;
    this.scaleY = paramMainItemVO.scaleY;
    this.meshId = paramMainItemVO.meshId;
    PhysicsBodyDataVO physicsBodyDataVO = paramMainItemVO.physicsBodyData;
    if (physicsBodyDataVO != null)
      this.physicsBodyData = new PhysicsBodyDataVO(physicsBodyDataVO); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/MainItemVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */