package com.badlogic.gdx.maps;

import com.badlogic.gdx.utils.GdxRuntimeException;

public class MapLayer {
  private String name = "";
  
  private MapObjects objects = new MapObjects();
  
  private float offsetX;
  
  private float offsetY;
  
  private float opacity = 1.0F;
  
  private MapLayer parent;
  
  private MapProperties properties = new MapProperties();
  
  private boolean renderOffsetDirty = true;
  
  private float renderOffsetX;
  
  private float renderOffsetY;
  
  private boolean visible = true;
  
  protected void calculateRenderOffsets() {
    MapLayer mapLayer = this.parent;
    if (mapLayer != null) {
      mapLayer.calculateRenderOffsets();
      this.renderOffsetX = this.parent.getRenderOffsetX() + this.offsetX;
      this.renderOffsetY = this.parent.getRenderOffsetY() + this.offsetY;
    } else {
      this.renderOffsetX = this.offsetX;
      this.renderOffsetY = this.offsetY;
    } 
    this.renderOffsetDirty = false;
  }
  
  public String getName() { return this.name; }
  
  public MapObjects getObjects() { return this.objects; }
  
  public float getOffsetX() { return this.offsetX; }
  
  public float getOffsetY() { return this.offsetY; }
  
  public float getOpacity() { return this.opacity; }
  
  public MapLayer getParent() { return this.parent; }
  
  public MapProperties getProperties() { return this.properties; }
  
  public float getRenderOffsetX() {
    if (this.renderOffsetDirty)
      calculateRenderOffsets(); 
    return this.renderOffsetX;
  }
  
  public float getRenderOffsetY() {
    if (this.renderOffsetDirty)
      calculateRenderOffsets(); 
    return this.renderOffsetY;
  }
  
  public void invalidateRenderOffset() { this.renderOffsetDirty = true; }
  
  public boolean isVisible() { return this.visible; }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public void setOffsetX(float paramFloat) {
    this.offsetX = paramFloat;
    invalidateRenderOffset();
  }
  
  public void setOffsetY(float paramFloat) {
    this.offsetY = paramFloat;
    invalidateRenderOffset();
  }
  
  public void setOpacity(float paramFloat) { this.opacity = paramFloat; }
  
  public void setParent(MapLayer paramMapLayer) {
    if (paramMapLayer != this) {
      this.parent = paramMapLayer;
      return;
    } 
    throw new GdxRuntimeException("Can't set self as the parent");
  }
  
  public void setVisible(boolean paramBoolean) { this.visible = paramBoolean; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapLayer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */