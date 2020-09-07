package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;

public class OrthogonalTiledMapRenderer extends BatchTiledMapRenderer {
  public OrthogonalTiledMapRenderer(TiledMap paramTiledMap) { super(paramTiledMap); }
  
  public OrthogonalTiledMapRenderer(TiledMap paramTiledMap, float paramFloat) { super(paramTiledMap, paramFloat); }
  
  public OrthogonalTiledMapRenderer(TiledMap paramTiledMap, float paramFloat, Batch paramBatch) { super(paramTiledMap, paramFloat, paramBatch); }
  
  public OrthogonalTiledMapRenderer(TiledMap paramTiledMap, Batch paramBatch) { super(paramTiledMap, paramBatch); }
  
  public void renderTileLayer(TiledMapTileLayer paramTiledMapTileLayer) {
    Color color;
    float f1 = (color = this.batch.getColor()).toFloatBits(color.r, color.g, color.b, color.a * paramTiledMapTileLayer.getOpacity());
    int i = paramTiledMapTileLayer.getWidth();
    int j = paramTiledMapTileLayer.getHeight();
    float f2 = paramTiledMapTileLayer.getTileWidth() * this.unitScale;
    float f3 = paramTiledMapTileLayer.getTileHeight() * this.unitScale;
    float f4 = paramTiledMapTileLayer.getRenderOffsetX() * this.unitScale;
    float f5 = -paramTiledMapTileLayer.getRenderOffsetY() * this.unitScale;
    int k = Math.max(0, (int)((this.viewBounds.x - f4) / f2));
    int m = Math.min(i, (int)((this.viewBounds.x + this.viewBounds.width + f2 - f4) / f2));
    i = Math.max(0, (int)((this.viewBounds.y - f5) / f3));
    j = Math.min(j, (int)((this.viewBounds.y + this.viewBounds.height + f3 - f5) / f3));
    f5 = j * f3 + f5;
    f4 = k * f2 + f4;
    float[] arrayOfFloat = this.vertices;
    while (j >= i) {
      float f6 = f4;
      int n = k;
      float f7 = f4;
      while (n < m) {
        TiledMapTileLayer.Cell cell = paramTiledMapTileLayer.getCell(n, j);
        if (cell == null) {
          f4 = f6 + f2;
        } else {
          TiledMapTile tiledMapTile = cell.getTile();
          if (tiledMapTile != null) {
            boolean bool1 = cell.getFlipHorizontally();
            boolean bool2 = cell.getFlipVertically();
            int i1 = cell.getRotation();
            TextureRegion textureRegion = tiledMapTile.getTextureRegion();
            float f8 = f6 + tiledMapTile.getOffsetX() * this.unitScale;
            float f9 = tiledMapTile.getOffsetY() * this.unitScale + f5;
            float f10 = f8 + textureRegion.getRegionWidth() * this.unitScale;
            float f11 = textureRegion.getRegionHeight() * this.unitScale + f9;
            float f12 = textureRegion.getU();
            f4 = textureRegion.getV2();
            float f13 = textureRegion.getU2();
            float f14 = textureRegion.getV();
            arrayOfFloat[0] = f8;
            arrayOfFloat[1] = f9;
            arrayOfFloat[2] = f1;
            arrayOfFloat[3] = f12;
            arrayOfFloat[4] = f4;
            arrayOfFloat[5] = f8;
            arrayOfFloat[6] = f11;
            arrayOfFloat[7] = f1;
            arrayOfFloat[8] = f12;
            arrayOfFloat[9] = f14;
            arrayOfFloat[10] = f10;
            arrayOfFloat[11] = f11;
            arrayOfFloat[12] = f1;
            arrayOfFloat[13] = f13;
            arrayOfFloat[14] = f14;
            arrayOfFloat[15] = f10;
            arrayOfFloat[16] = f9;
            arrayOfFloat[17] = f1;
            arrayOfFloat[18] = f13;
            arrayOfFloat[19] = f4;
            if (bool1) {
              f4 = arrayOfFloat[3];
              arrayOfFloat[3] = arrayOfFloat[13];
              arrayOfFloat[13] = f4;
              f4 = arrayOfFloat[8];
              arrayOfFloat[8] = arrayOfFloat[18];
              arrayOfFloat[18] = f4;
            } 
            if (bool2) {
              f4 = arrayOfFloat[4];
              arrayOfFloat[4] = arrayOfFloat[14];
              arrayOfFloat[14] = f4;
              f4 = arrayOfFloat[9];
              arrayOfFloat[9] = arrayOfFloat[19];
              arrayOfFloat[19] = f4;
            } 
            if (i1 != 0)
              if (i1 != 1) {
                if (i1 != 2) {
                  if (i1 == 3) {
                    f4 = arrayOfFloat[4];
                    arrayOfFloat[4] = arrayOfFloat[19];
                    arrayOfFloat[19] = arrayOfFloat[14];
                    arrayOfFloat[14] = arrayOfFloat[9];
                    arrayOfFloat[9] = f4;
                    f4 = arrayOfFloat[3];
                    arrayOfFloat[3] = arrayOfFloat[18];
                    arrayOfFloat[18] = arrayOfFloat[13];
                    arrayOfFloat[13] = arrayOfFloat[8];
                    arrayOfFloat[8] = f4;
                  } 
                } else {
                  f4 = arrayOfFloat[3];
                  arrayOfFloat[3] = arrayOfFloat[13];
                  arrayOfFloat[13] = f4;
                  f4 = arrayOfFloat[8];
                  arrayOfFloat[8] = arrayOfFloat[18];
                  arrayOfFloat[18] = f4;
                  f4 = arrayOfFloat[4];
                  arrayOfFloat[4] = arrayOfFloat[14];
                  arrayOfFloat[14] = f4;
                  f4 = arrayOfFloat[9];
                  arrayOfFloat[9] = arrayOfFloat[19];
                  arrayOfFloat[19] = f4;
                } 
              } else {
                f4 = arrayOfFloat[4];
                arrayOfFloat[4] = arrayOfFloat[9];
                arrayOfFloat[9] = arrayOfFloat[14];
                arrayOfFloat[14] = arrayOfFloat[19];
                arrayOfFloat[19] = f4;
                f4 = arrayOfFloat[3];
                arrayOfFloat[3] = arrayOfFloat[8];
                arrayOfFloat[8] = arrayOfFloat[13];
                arrayOfFloat[13] = arrayOfFloat[18];
                arrayOfFloat[18] = f4;
              }  
            this.batch.draw(textureRegion.getTexture(), arrayOfFloat, 0, 20);
          } 
          f4 = f6 + f2;
        } 
        n++;
        f6 = f4;
      } 
      f5 -= f3;
      j--;
      f4 = f7;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */