package com.badlogic.gdx.maps;

public class MapGroupLayer extends MapLayer {
  private MapLayers layers = new MapLayers();
  
  public MapLayers getLayers() { return this.layers; }
  
  public void invalidateRenderOffset() {
    super.invalidateRenderOffset();
    for (byte b = 0; b < this.layers.size(); b++)
      this.layers.get(b).invalidateRenderOffset(); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapGroupLayer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */