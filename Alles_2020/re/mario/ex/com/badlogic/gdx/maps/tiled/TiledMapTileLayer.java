package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.maps.MapLayer;

public class TiledMapTileLayer extends MapLayer {
  private Cell[][] cells;
  
  private int height;
  
  private float tileHeight;
  
  private float tileWidth;
  
  private int width;
  
  public TiledMapTileLayer(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.width = paramInt1;
    this.height = paramInt2;
    this.tileWidth = paramInt3;
    this.tileHeight = paramInt4;
    this.cells = new Cell[paramInt1][paramInt2];
  }
  
  public Cell getCell(int paramInt1, int paramInt2) { return (paramInt1 < 0 || paramInt1 >= this.width || paramInt2 < 0 || paramInt2 >= this.height) ? null : this.cells[paramInt1][paramInt2]; }
  
  public int getHeight() { return this.height; }
  
  public float getTileHeight() { return this.tileHeight; }
  
  public float getTileWidth() { return this.tileWidth; }
  
  public int getWidth() { return this.width; }
  
  public void setCell(int paramInt1, int paramInt2, Cell paramCell) {
    if (paramInt1 >= 0 && paramInt1 < this.width && paramInt2 >= 0 && paramInt2 < this.height)
      this.cells[paramInt1][paramInt2] = paramCell; 
  }
  
  public static class Cell {
    public static final int ROTATE_0 = 0;
    
    public static final int ROTATE_180 = 2;
    
    public static final int ROTATE_270 = 3;
    
    public static final int ROTATE_90 = 1;
    
    private boolean flipHorizontally;
    
    private boolean flipVertically;
    
    private int rotation;
    
    private TiledMapTile tile;
    
    public boolean getFlipHorizontally() { return this.flipHorizontally; }
    
    public boolean getFlipVertically() { return this.flipVertically; }
    
    public int getRotation() { return this.rotation; }
    
    public TiledMapTile getTile() { return this.tile; }
    
    public Cell setFlipHorizontally(boolean param1Boolean) {
      this.flipHorizontally = param1Boolean;
      return this;
    }
    
    public Cell setFlipVertically(boolean param1Boolean) {
      this.flipVertically = param1Boolean;
      return this;
    }
    
    public Cell setRotation(int param1Int) {
      this.rotation = param1Int;
      return this;
    }
    
    public Cell setTile(TiledMapTile param1TiledMapTile) {
      this.tile = param1TiledMapTile;
      return this;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TiledMapTileLayer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */