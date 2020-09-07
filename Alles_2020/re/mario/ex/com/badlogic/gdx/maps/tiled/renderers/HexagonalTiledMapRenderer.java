package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;

public class HexagonalTiledMapRenderer extends BatchTiledMapRenderer {
  private float hexSideLength = 0.0F;
  
  private boolean staggerAxisX = true;
  
  private boolean staggerIndexEven = false;
  
  public HexagonalTiledMapRenderer(TiledMap paramTiledMap) {
    super(paramTiledMap);
    init(paramTiledMap);
  }
  
  public HexagonalTiledMapRenderer(TiledMap paramTiledMap, float paramFloat) {
    super(paramTiledMap, paramFloat);
    init(paramTiledMap);
  }
  
  public HexagonalTiledMapRenderer(TiledMap paramTiledMap, float paramFloat, Batch paramBatch) {
    super(paramTiledMap, paramFloat, paramBatch);
    init(paramTiledMap);
  }
  
  public HexagonalTiledMapRenderer(TiledMap paramTiledMap, Batch paramBatch) {
    super(paramTiledMap, paramBatch);
    init(paramTiledMap);
  }
  
  private void init(TiledMap paramTiledMap) {
    String str = (String)paramTiledMap.getProperties().get("staggeraxis", String.class);
    if (str != null)
      if (str.equals("x")) {
        this.staggerAxisX = true;
      } else {
        this.staggerAxisX = false;
      }  
    str = (String)paramTiledMap.getProperties().get("staggerindex", String.class);
    if (str != null)
      if (str.equals("even")) {
        this.staggerIndexEven = true;
      } else {
        this.staggerIndexEven = false;
      }  
    Integer integer = (Integer)paramTiledMap.getProperties().get("hexsidelength", Integer.class);
    if (integer != null) {
      this.hexSideLength = integer.intValue();
    } else if (this.staggerAxisX) {
      integer = (Integer)paramTiledMap.getProperties().get("tilewidth", Integer.class);
      if (integer != null) {
        this.hexSideLength = integer.intValue() * 0.5F;
      } else {
        this.hexSideLength = ((TiledMapTileLayer)paramTiledMap.getLayers().get(0)).getTileWidth() * 0.5F;
      } 
    } else {
      integer = (Integer)paramTiledMap.getProperties().get("tileheight", Integer.class);
      if (integer != null) {
        this.hexSideLength = integer.intValue() * 0.5F;
      } else {
        this.hexSideLength = ((TiledMapTileLayer)paramTiledMap.getLayers().get(0)).getTileHeight() * 0.5F;
      } 
    } 
  }
  
  private void renderCell(TiledMapTileLayer.Cell paramCell, float paramFloat1, float paramFloat2, float paramFloat3) {
    if (paramCell != null) {
      TiledMapTile tiledMapTile = paramCell.getTile();
      if (tiledMapTile != null) {
        if (tiledMapTile instanceof com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile)
          return; 
        boolean bool1 = paramCell.getFlipHorizontally();
        boolean bool2 = paramCell.getFlipVertically();
        int i = paramCell.getRotation();
        TextureRegion textureRegion = tiledMapTile.getTextureRegion();
        paramFloat1 += tiledMapTile.getOffsetX() * this.unitScale;
        float f1 = paramFloat2 + tiledMapTile.getOffsetY() * this.unitScale;
        float f2 = textureRegion.getRegionWidth() * this.unitScale + paramFloat1;
        paramFloat2 = textureRegion.getRegionHeight() * this.unitScale + f1;
        float f3 = textureRegion.getU();
        float f4 = textureRegion.getV2();
        float f5 = textureRegion.getU2();
        float f6 = textureRegion.getV();
        this.vertices[0] = paramFloat1;
        this.vertices[1] = f1;
        this.vertices[2] = paramFloat3;
        this.vertices[3] = f3;
        this.vertices[4] = f4;
        this.vertices[5] = paramFloat1;
        this.vertices[6] = paramFloat2;
        this.vertices[7] = paramFloat3;
        this.vertices[8] = f3;
        this.vertices[9] = f6;
        this.vertices[10] = f2;
        this.vertices[11] = paramFloat2;
        this.vertices[12] = paramFloat3;
        this.vertices[13] = f5;
        this.vertices[14] = f6;
        this.vertices[15] = f2;
        this.vertices[16] = f1;
        this.vertices[17] = paramFloat3;
        this.vertices[18] = f5;
        this.vertices[19] = f4;
        if (bool1) {
          paramFloat1 = this.vertices[3];
          this.vertices[3] = this.vertices[13];
          this.vertices[13] = paramFloat1;
          paramFloat1 = this.vertices[8];
          this.vertices[8] = this.vertices[18];
          this.vertices[18] = paramFloat1;
        } 
        if (bool2) {
          paramFloat1 = this.vertices[4];
          this.vertices[4] = this.vertices[14];
          this.vertices[14] = paramFloat1;
          paramFloat1 = this.vertices[9];
          this.vertices[9] = this.vertices[19];
          this.vertices[19] = paramFloat1;
        } 
        if (i == 2) {
          paramFloat1 = this.vertices[3];
          this.vertices[3] = this.vertices[13];
          this.vertices[13] = paramFloat1;
          paramFloat1 = this.vertices[8];
          this.vertices[8] = this.vertices[18];
          this.vertices[18] = paramFloat1;
          paramFloat1 = this.vertices[4];
          this.vertices[4] = this.vertices[14];
          this.vertices[14] = paramFloat1;
          paramFloat1 = this.vertices[9];
          this.vertices[9] = this.vertices[19];
          this.vertices[19] = paramFloat1;
        } 
        this.batch.draw(textureRegion.getTexture(), this.vertices, 0, 20);
      } 
    } 
  }
  
  public void renderTileLayer(TiledMapTileLayer paramTiledMapTileLayer) {
    TiledMapTileLayer tiledMapTileLayer = paramTiledMapTileLayer;
    Color color;
    float f1 = (color = this.batch.getColor()).toFloatBits(color.r, color.g, color.b, color.a * paramTiledMapTileLayer.getOpacity());
    int i = paramTiledMapTileLayer.getWidth();
    int j = paramTiledMapTileLayer.getHeight();
    float f2 = paramTiledMapTileLayer.getTileWidth() * this.unitScale;
    float f3 = paramTiledMapTileLayer.getTileHeight() * this.unitScale;
    float f4 = paramTiledMapTileLayer.getRenderOffsetX() * this.unitScale;
    float f5 = -paramTiledMapTileLayer.getRenderOffsetY() * this.unitScale;
    float f6 = this.hexSideLength * this.unitScale;
    boolean bool = this.staggerAxisX;
    boolean bool1 = false;
    if (bool) {
      float f = (f2 - f6) / 2.0F;
      f6 = (f2 + f6) / 2.0F;
      f2 = 0.5F * f3;
      int k = Math.max(0, (int)((this.viewBounds.y - f2 - f4) / f3));
      int m = Math.min(j, (int)((this.viewBounds.y + this.viewBounds.height + f3 - f4) / f3));
      j = Math.max(0, (int)((this.viewBounds.x - f - f5) / f6));
      int n = Math.min(i, (int)((this.viewBounds.x + this.viewBounds.width + f6 - f5) / f6));
      bool = this.staggerIndexEven;
      int i1 = j % 2;
      if (i1 == 0)
        bool1 = true; 
      if (bool == bool1) {
        i = j + 1;
      } else {
        i = j;
      } 
      bool = this.staggerIndexEven;
      if (i1 == 0) {
        bool1 = true;
      } else {
        bool1 = false;
      } 
      if (bool != bool1)
        j++; 
      while (--m >= k) {
        for (i1 = i; i1 < n; i1 += 2)
          renderCell(tiledMapTileLayer.getCell(i1, m), i1 * f6 + f4, m * f3 + f2 + f5, f1); 
        for (i1 = j; i1 < n; i1 += 2)
          renderCell(tiledMapTileLayer.getCell(i1, m), i1 * f6 + f4, m * f3 + f5, f1); 
        m--;
      } 
    } else {
      float f8 = (f3 - f6) / 2.0F;
      f6 = (f3 + f6) / 2.0F;
      float f7 = 0.5F * f2;
      int m = Math.max(0, (int)((this.viewBounds.y - f8 - f4) / f6));
      j = Math.min(j, (int)((this.viewBounds.y + this.viewBounds.height + f6 - f4) / f6));
      int k = Math.max(0, (int)((this.viewBounds.x - f7 - f5) / f2));
      int n = Math.min(i, (int)((this.viewBounds.x + this.viewBounds.width + f2 - f5) / f2));
      for (i = j - 1; i >= m; i--) {
        if (i % 2 == 0) {
          bool1 = true;
        } else {
          bool1 = false;
        } 
        if (bool1 == this.staggerIndexEven) {
          f3 = f7;
        } else {
          f3 = 0.0F;
        } 
        for (j = k; j < n; j++)
          renderCell(paramTiledMapTileLayer.getCell(j, i), j * f2 + f3 + f4, i * f6 + f5, f1); 
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */