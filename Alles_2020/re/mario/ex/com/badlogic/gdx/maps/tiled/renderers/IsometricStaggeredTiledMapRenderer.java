package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;

public class IsometricStaggeredTiledMapRenderer extends BatchTiledMapRenderer {
  public IsometricStaggeredTiledMapRenderer(TiledMap paramTiledMap) { super(paramTiledMap); }
  
  public IsometricStaggeredTiledMapRenderer(TiledMap paramTiledMap, float paramFloat) { super(paramTiledMap, paramFloat); }
  
  public IsometricStaggeredTiledMapRenderer(TiledMap paramTiledMap, float paramFloat, Batch paramBatch) { super(paramTiledMap, paramFloat, paramBatch); }
  
  public IsometricStaggeredTiledMapRenderer(TiledMap paramTiledMap, Batch paramBatch) { super(paramTiledMap, paramBatch); }
  
  public void renderTileLayer(TiledMapTileLayer paramTiledMapTileLayer) {
    Color color;
    float f1 = (color = this.batch.getColor()).toFloatBits(color.r, color.g, color.b, color.a * paramTiledMapTileLayer.getOpacity());
    int i = paramTiledMapTileLayer.getWidth();
    int j = paramTiledMapTileLayer.getHeight();
    float f2 = paramTiledMapTileLayer.getRenderOffsetX() * this.unitScale;
    float f3 = -paramTiledMapTileLayer.getRenderOffsetY() * this.unitScale;
    float f4 = paramTiledMapTileLayer.getTileWidth() * this.unitScale;
    float f5 = paramTiledMapTileLayer.getTileHeight() * this.unitScale;
    float f6 = f4 * 0.5F;
    float f7 = 0.5F * f5;
    int k = Math.max(0, (int)((this.viewBounds.x - f6 - f2) / f4));
    i = Math.min(i, (int)((this.viewBounds.x + this.viewBounds.width + f4 + f6 - f2) / f4));
    int m = Math.max(0, (int)((this.viewBounds.y - f5 - f3) / f5));
    for (j = Math.min(j, (int)((this.viewBounds.y + this.viewBounds.height + f5 - f3) / f7)) - 1; j >= m; j--) {
      if (j % 2 == 1) {
        f5 = f6;
      } else {
        f5 = 0.0F;
      } 
      for (int n = i - 1; n >= k; n--) {
        TiledMapTileLayer.Cell cell = paramTiledMapTileLayer.getCell(n, j);
        if (cell != null) {
          TiledMapTile tiledMapTile = cell.getTile();
          if (tiledMapTile != null) {
            boolean bool1 = cell.getFlipHorizontally();
            boolean bool2 = cell.getFlipVertically();
            int i1 = cell.getRotation();
            TextureRegion textureRegion = tiledMapTile.getTextureRegion();
            float f8 = n * f4 - f5 + tiledMapTile.getOffsetX() * this.unitScale + f2;
            float f9 = j * f7 + tiledMapTile.getOffsetY() * this.unitScale + f3;
            float f10 = textureRegion.getRegionWidth() * this.unitScale + f8;
            float f11 = textureRegion.getRegionHeight() * this.unitScale + f9;
            float f12 = textureRegion.getU();
            float f13 = textureRegion.getV2();
            float f14 = textureRegion.getU2();
            float f15 = textureRegion.getV();
            this.vertices[0] = f8;
            this.vertices[1] = f9;
            this.vertices[2] = f1;
            this.vertices[3] = f12;
            this.vertices[4] = f13;
            this.vertices[5] = f8;
            this.vertices[6] = f11;
            this.vertices[7] = f1;
            this.vertices[8] = f12;
            this.vertices[9] = f15;
            this.vertices[10] = f10;
            this.vertices[11] = f11;
            this.vertices[12] = f1;
            this.vertices[13] = f14;
            this.vertices[14] = f15;
            this.vertices[15] = f10;
            this.vertices[16] = f9;
            this.vertices[17] = f1;
            this.vertices[18] = f14;
            this.vertices[19] = f13;
            if (bool1) {
              f11 = this.vertices[3];
              this.vertices[3] = this.vertices[13];
              this.vertices[13] = f11;
              f11 = this.vertices[8];
              this.vertices[8] = this.vertices[18];
              this.vertices[18] = f11;
            } 
            if (bool2) {
              f11 = this.vertices[4];
              this.vertices[4] = this.vertices[14];
              this.vertices[14] = f11;
              f11 = this.vertices[9];
              this.vertices[9] = this.vertices[19];
              this.vertices[19] = f11;
            } 
            if (i1 != 0)
              if (i1 != 1) {
                if (i1 != 2) {
                  if (i1 == 3) {
                    f11 = this.vertices[4];
                    this.vertices[4] = this.vertices[19];
                    this.vertices[19] = this.vertices[14];
                    this.vertices[14] = this.vertices[9];
                    this.vertices[9] = f11;
                    f11 = this.vertices[3];
                    this.vertices[3] = this.vertices[18];
                    this.vertices[18] = this.vertices[13];
                    this.vertices[13] = this.vertices[8];
                    this.vertices[8] = f11;
                  } 
                } else {
                  f11 = this.vertices[3];
                  this.vertices[3] = this.vertices[13];
                  this.vertices[13] = f11;
                  f11 = this.vertices[8];
                  this.vertices[8] = this.vertices[18];
                  this.vertices[18] = f11;
                  f11 = this.vertices[4];
                  this.vertices[4] = this.vertices[14];
                  this.vertices[14] = f11;
                  f11 = this.vertices[9];
                  this.vertices[9] = this.vertices[19];
                  this.vertices[19] = f11;
                } 
              } else {
                f11 = this.vertices[4];
                this.vertices[4] = this.vertices[9];
                this.vertices[9] = this.vertices[14];
                this.vertices[14] = this.vertices[19];
                this.vertices[19] = f11;
                f11 = this.vertices[3];
                this.vertices[3] = this.vertices[8];
                this.vertices[8] = this.vertices[13];
                this.vertices[13] = this.vertices[18];
                this.vertices[18] = f11;
              }  
            this.batch.draw(textureRegion.getTexture(), this.vertices, 0, 20);
          } 
        } 
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */