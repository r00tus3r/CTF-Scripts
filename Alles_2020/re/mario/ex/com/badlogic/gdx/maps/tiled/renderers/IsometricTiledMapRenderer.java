package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;

public class IsometricTiledMapRenderer extends BatchTiledMapRenderer {
  private Vector2 bottomLeft = new Vector2();
  
  private Vector2 bottomRight = new Vector2();
  
  private Matrix4 invIsotransform;
  
  private Matrix4 isoTransform;
  
  private Vector3 screenPos = new Vector3();
  
  private Vector2 topLeft = new Vector2();
  
  private Vector2 topRight = new Vector2();
  
  public IsometricTiledMapRenderer(TiledMap paramTiledMap) {
    super(paramTiledMap);
    init();
  }
  
  public IsometricTiledMapRenderer(TiledMap paramTiledMap, float paramFloat) {
    super(paramTiledMap, paramFloat);
    init();
  }
  
  public IsometricTiledMapRenderer(TiledMap paramTiledMap, float paramFloat, Batch paramBatch) {
    super(paramTiledMap, paramFloat, paramBatch);
    init();
  }
  
  public IsometricTiledMapRenderer(TiledMap paramTiledMap, Batch paramBatch) {
    super(paramTiledMap, paramBatch);
    init();
  }
  
  private void init() {
    this.isoTransform = new Matrix4();
    this.isoTransform.idt();
    this.isoTransform.scale((float)(Math.sqrt(2.0D) / 2.0D), (float)(Math.sqrt(2.0D) / 4.0D), 1.0F);
    this.isoTransform.rotate(0.0F, 0.0F, 1.0F, -45.0F);
    this.invIsotransform = new Matrix4(this.isoTransform);
    this.invIsotransform.inv();
  }
  
  private Vector3 translateScreenToIso(Vector2 paramVector2) {
    this.screenPos.set(paramVector2.x, paramVector2.y, 0.0F);
    this.screenPos.mul(this.invIsotransform);
    return this.screenPos;
  }
  
  public void renderTileLayer(TiledMapTileLayer paramTiledMapTileLayer) {
    Color color;
    float f1 = (color = this.batch.getColor()).toFloatBits(color.r, color.g, color.b, color.a * paramTiledMapTileLayer.getOpacity());
    float f2 = paramTiledMapTileLayer.getTileWidth() * this.unitScale;
    float f3 = paramTiledMapTileLayer.getTileHeight();
    float f4 = this.unitScale;
    float f5 = paramTiledMapTileLayer.getRenderOffsetX() * this.unitScale;
    float f6 = -paramTiledMapTileLayer.getRenderOffsetY() * this.unitScale;
    float f7 = f2 * 0.5F;
    f3 = f3 * f4 * 0.5F;
    this.topRight.set(this.viewBounds.x + this.viewBounds.width - f5, this.viewBounds.y - f6);
    this.bottomLeft.set(this.viewBounds.x - f5, this.viewBounds.y + this.viewBounds.height - f6);
    this.topLeft.set(this.viewBounds.x - f5, this.viewBounds.y - f6);
    this.bottomRight.set(this.viewBounds.x + this.viewBounds.width - f5, this.viewBounds.y + this.viewBounds.height - f6);
    int i = (int)((translateScreenToIso(this.topLeft)).y / f2);
    int j = (int)((translateScreenToIso(this.bottomRight)).y / f2) + 2;
    int k = (int)((translateScreenToIso(this.bottomLeft)).x / f2);
    int m = (int)((translateScreenToIso(this.topRight)).x / f2) + 2;
    while (j >= i - 2) {
      for (int n = k - 2; n <= m; n++) {
        f4 = n;
        float f = j;
        TiledMapTileLayer.Cell cell = paramTiledMapTileLayer.getCell(n, j);
        if (cell != null) {
          TiledMapTile tiledMapTile = cell.getTile();
          if (tiledMapTile != null) {
            boolean bool1 = cell.getFlipHorizontally();
            boolean bool2 = cell.getFlipVertically();
            int i1 = cell.getRotation();
            TextureRegion textureRegion = tiledMapTile.getTextureRegion();
            f2 = f4 * f7 + f * f7 + tiledMapTile.getOffsetX() * this.unitScale + f5;
            f = f * f3 - f4 * f3 + tiledMapTile.getOffsetY() * this.unitScale + f6;
            float f8 = textureRegion.getRegionWidth() * this.unitScale + f2;
            float f9 = textureRegion.getRegionHeight() * this.unitScale + f;
            float f10 = textureRegion.getU();
            float f11 = textureRegion.getV2();
            float f12 = textureRegion.getU2();
            f4 = textureRegion.getV();
            this.vertices[0] = f2;
            this.vertices[1] = f;
            this.vertices[2] = f1;
            this.vertices[3] = f10;
            this.vertices[4] = f11;
            this.vertices[5] = f2;
            this.vertices[6] = f9;
            this.vertices[7] = f1;
            this.vertices[8] = f10;
            this.vertices[9] = f4;
            this.vertices[10] = f8;
            this.vertices[11] = f9;
            this.vertices[12] = f1;
            this.vertices[13] = f12;
            this.vertices[14] = f4;
            this.vertices[15] = f8;
            this.vertices[16] = f;
            this.vertices[17] = f1;
            this.vertices[18] = f12;
            this.vertices[19] = f11;
            if (bool1) {
              f2 = this.vertices[3];
              this.vertices[3] = this.vertices[13];
              this.vertices[13] = f2;
              f2 = this.vertices[8];
              this.vertices[8] = this.vertices[18];
              this.vertices[18] = f2;
            } 
            if (bool2) {
              f2 = this.vertices[4];
              this.vertices[4] = this.vertices[14];
              this.vertices[14] = f2;
              f2 = this.vertices[9];
              this.vertices[9] = this.vertices[19];
              this.vertices[19] = f2;
            } 
            if (i1 != 0)
              if (i1 != 1) {
                if (i1 != 2) {
                  if (i1 == 3) {
                    f2 = this.vertices[4];
                    this.vertices[4] = this.vertices[19];
                    this.vertices[19] = this.vertices[14];
                    this.vertices[14] = this.vertices[9];
                    this.vertices[9] = f2;
                    f2 = this.vertices[3];
                    this.vertices[3] = this.vertices[18];
                    this.vertices[18] = this.vertices[13];
                    this.vertices[13] = this.vertices[8];
                    this.vertices[8] = f2;
                  } 
                } else {
                  f2 = this.vertices[3];
                  this.vertices[3] = this.vertices[13];
                  this.vertices[13] = f2;
                  f2 = this.vertices[8];
                  this.vertices[8] = this.vertices[18];
                  this.vertices[18] = f2;
                  f2 = this.vertices[4];
                  this.vertices[4] = this.vertices[14];
                  this.vertices[14] = f2;
                  f2 = this.vertices[9];
                  this.vertices[9] = this.vertices[19];
                  this.vertices[19] = f2;
                } 
              } else {
                f2 = this.vertices[4];
                this.vertices[4] = this.vertices[9];
                this.vertices[9] = this.vertices[14];
                this.vertices[14] = this.vertices[19];
                this.vertices[19] = f2;
                f2 = this.vertices[3];
                this.vertices[3] = this.vertices[8];
                this.vertices[8] = this.vertices[13];
                this.vertices[13] = this.vertices[18];
                this.vertices[18] = f2;
              }  
            this.batch.draw(textureRegion.getTexture(), this.vertices, 0, 20);
          } 
        } 
      } 
      j--;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/renderers/IsometricTiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */