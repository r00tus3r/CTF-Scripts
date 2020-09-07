package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteCache;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapLayers;
import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapImageLayer;
import com.badlogic.gdx.maps.tiled.TiledMapRenderer;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public class OrthoCachedTiledMapRenderer implements TiledMapRenderer, Disposable {
  protected static final int NUM_VERTICES = 20;
  
  private static final float tolerance = 1.0E-5F;
  
  protected boolean blending;
  
  protected final Rectangle cacheBounds = new Rectangle();
  
  protected boolean cached;
  
  protected boolean canCacheMoreE;
  
  protected boolean canCacheMoreN;
  
  protected boolean canCacheMoreS;
  
  protected boolean canCacheMoreW;
  
  protected int count;
  
  protected final TiledMap map;
  
  protected float maxTileHeight;
  
  protected float maxTileWidth;
  
  protected float overCache = 0.5F;
  
  protected final SpriteCache spriteCache;
  
  protected float unitScale;
  
  protected final float[] vertices = new float[20];
  
  protected final Rectangle viewBounds = new Rectangle();
  
  public OrthoCachedTiledMapRenderer(TiledMap paramTiledMap) { this(paramTiledMap, 1.0F, 2000); }
  
  public OrthoCachedTiledMapRenderer(TiledMap paramTiledMap, float paramFloat) { this(paramTiledMap, paramFloat, 2000); }
  
  public OrthoCachedTiledMapRenderer(TiledMap paramTiledMap, float paramFloat, int paramInt) {
    this.map = paramTiledMap;
    this.unitScale = paramFloat;
    this.spriteCache = new SpriteCache(paramInt, true);
  }
  
  public void dispose() { this.spriteCache.dispose(); }
  
  public SpriteCache getSpriteCache() { return this.spriteCache; }
  
  public void invalidateCache() { this.cached = false; }
  
  public boolean isCached() { return this.cached; }
  
  public void render() {
    boolean bool = this.cached;
    byte b = 0;
    if (!bool) {
      this.cached = true;
      this.count = 0;
      this.spriteCache.clear();
      float f1 = this.viewBounds.width * this.overCache;
      float f2 = this.viewBounds.height * this.overCache;
      this.viewBounds.x -= f1;
      this.viewBounds.y -= f2;
      this.viewBounds.width += f1 * 2.0F;
      this.viewBounds.height += f2 * 2.0F;
      for (MapLayer mapLayer : this.map.getLayers()) {
        this.spriteCache.beginCache();
        if (mapLayer instanceof TiledMapTileLayer) {
          renderTileLayer((TiledMapTileLayer)mapLayer);
        } else if (mapLayer instanceof TiledMapImageLayer) {
          renderImageLayer((TiledMapImageLayer)mapLayer);
        } 
        this.spriteCache.endCache();
      } 
    } 
    if (this.blending) {
      Gdx.gl.glEnable(3042);
      Gdx.gl.glBlendFunc(770, 771);
    } 
    this.spriteCache.begin();
    MapLayers mapLayers = this.map.getLayers();
    int i = mapLayers.getCount();
    while (b < i) {
      MapLayer mapLayer = mapLayers.get(b);
      if (mapLayer.isVisible()) {
        this.spriteCache.draw(b);
        renderObjects(mapLayer);
      } 
      b++;
    } 
    this.spriteCache.end();
    if (this.blending)
      Gdx.gl.glDisable(3042); 
  }
  
  public void render(int[] paramArrayOfInt) {
    boolean bool = this.cached;
    byte b = 0;
    if (!bool) {
      this.cached = true;
      this.count = 0;
      this.spriteCache.clear();
      float f1 = this.viewBounds.width * this.overCache;
      float f2 = this.viewBounds.height * this.overCache;
      this.viewBounds.x -= f1;
      this.viewBounds.y -= f2;
      this.viewBounds.width += f1 * 2.0F;
      this.viewBounds.height += f2 * 2.0F;
      for (MapLayer mapLayer : this.map.getLayers()) {
        this.spriteCache.beginCache();
        if (mapLayer instanceof TiledMapTileLayer) {
          renderTileLayer((TiledMapTileLayer)mapLayer);
        } else if (mapLayer instanceof TiledMapImageLayer) {
          renderImageLayer((TiledMapImageLayer)mapLayer);
        } 
        this.spriteCache.endCache();
      } 
    } 
    if (this.blending) {
      Gdx.gl.glEnable(3042);
      Gdx.gl.glBlendFunc(770, 771);
    } 
    this.spriteCache.begin();
    MapLayers mapLayers = this.map.getLayers();
    int i = paramArrayOfInt.length;
    while (b < i) {
      int j = paramArrayOfInt[b];
      MapLayer mapLayer = mapLayers.get(j);
      if (mapLayer.isVisible()) {
        this.spriteCache.draw(j);
        renderObjects(mapLayer);
      } 
      b++;
    } 
    this.spriteCache.end();
    if (this.blending)
      Gdx.gl.glDisable(3042); 
  }
  
  public void renderImageLayer(TiledMapImageLayer paramTiledMapImageLayer) {
    float f1 = Color.toFloatBits(1.0F, 1.0F, 1.0F, paramTiledMapImageLayer.getOpacity());
    float[] arrayOfFloat = this.vertices;
    TextureRegion textureRegion = paramTiledMapImageLayer.getTextureRegion();
    if (textureRegion == null)
      return; 
    float f2 = paramTiledMapImageLayer.getX();
    float f3 = paramTiledMapImageLayer.getY();
    float f4 = this.unitScale;
    f2 *= f4;
    float f5 = f3 * f4;
    float f6 = textureRegion.getRegionWidth() * this.unitScale + f2;
    float f7 = textureRegion.getRegionHeight() * this.unitScale + f5;
    f3 = textureRegion.getU();
    float f8 = textureRegion.getV2();
    f4 = textureRegion.getU2();
    float f9 = textureRegion.getV();
    arrayOfFloat[0] = f2;
    arrayOfFloat[1] = f5;
    arrayOfFloat[2] = f1;
    arrayOfFloat[3] = f3;
    arrayOfFloat[4] = f8;
    arrayOfFloat[5] = f2;
    arrayOfFloat[6] = f7;
    arrayOfFloat[7] = f1;
    arrayOfFloat[8] = f3;
    arrayOfFloat[9] = f9;
    arrayOfFloat[10] = f6;
    arrayOfFloat[11] = f7;
    arrayOfFloat[12] = f1;
    arrayOfFloat[13] = f4;
    arrayOfFloat[14] = f9;
    arrayOfFloat[15] = f6;
    arrayOfFloat[16] = f5;
    arrayOfFloat[17] = f1;
    arrayOfFloat[18] = f4;
    arrayOfFloat[19] = f8;
    this.spriteCache.add(textureRegion.getTexture(), arrayOfFloat, 0, 20);
  }
  
  public void renderObject(MapObject paramMapObject) {}
  
  public void renderObjects(MapLayer paramMapLayer) {
    Iterator iterator = paramMapLayer.getObjects().iterator();
    while (iterator.hasNext())
      renderObject((MapObject)iterator.next()); 
  }
  
  public void renderTileLayer(TiledMapTileLayer paramTiledMapTileLayer) {
    boolean bool;
    float f1 = Color.toFloatBits(1.0F, 1.0F, 1.0F, paramTiledMapTileLayer.getOpacity());
    int i = paramTiledMapTileLayer.getWidth();
    int j = paramTiledMapTileLayer.getHeight();
    float f2 = paramTiledMapTileLayer.getTileWidth() * this.unitScale;
    float f3 = paramTiledMapTileLayer.getTileHeight() * this.unitScale;
    float f4 = paramTiledMapTileLayer.getRenderOffsetX() * this.unitScale;
    float f5 = -paramTiledMapTileLayer.getRenderOffsetY() * this.unitScale;
    int k = Math.max(0, (int)((this.cacheBounds.x - f4) / f2));
    int m = Math.min(i, (int)((this.cacheBounds.x + this.cacheBounds.width + f2 - f4) / f2));
    int n = Math.max(0, (int)((this.cacheBounds.y - f5) / f3));
    int i1 = Math.min(j, (int)((this.cacheBounds.y + this.cacheBounds.height + f3 - f5) / f3));
    if (i1 < j) {
      bool = true;
    } else {
      bool = false;
    } 
    this.canCacheMoreN = bool;
    if (m < i) {
      bool = true;
    } else {
      bool = false;
    } 
    this.canCacheMoreE = bool;
    if (k > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    this.canCacheMoreW = bool;
    if (n > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    this.canCacheMoreS = bool;
    float[] arrayOfFloat = this.vertices;
    while (i1 >= n) {
      for (i = k; i < m; i++) {
        TiledMapTileLayer.Cell cell = paramTiledMapTileLayer.getCell(i, i1);
        if (cell != null) {
          TiledMapTile tiledMapTile = cell.getTile();
          if (tiledMapTile != null) {
            this.count++;
            bool = cell.getFlipHorizontally();
            boolean bool1 = cell.getFlipVertically();
            j = cell.getRotation();
            TextureRegion textureRegion = tiledMapTile.getTextureRegion();
            Texture texture = textureRegion.getTexture();
            float f6 = i * f2 + tiledMapTile.getOffsetX() * this.unitScale + f4;
            float f7 = i1 * f3 + tiledMapTile.getOffsetY() * this.unitScale + f5;
            float f8 = textureRegion.getRegionWidth() * this.unitScale + f6;
            float f9 = textureRegion.getRegionHeight() * this.unitScale + f7;
            float f10 = 0.5F / texture.getWidth();
            float f11 = 0.5F / texture.getHeight();
            float f12 = textureRegion.getU() + f10;
            float f13 = textureRegion.getV2() - f11;
            f10 = textureRegion.getU2() - f10;
            f11 = textureRegion.getV() + f11;
            arrayOfFloat[0] = f6;
            arrayOfFloat[1] = f7;
            arrayOfFloat[2] = f1;
            arrayOfFloat[3] = f12;
            arrayOfFloat[4] = f13;
            arrayOfFloat[5] = f6;
            arrayOfFloat[6] = f9;
            arrayOfFloat[7] = f1;
            arrayOfFloat[8] = f12;
            arrayOfFloat[9] = f11;
            arrayOfFloat[10] = f8;
            arrayOfFloat[11] = f9;
            arrayOfFloat[12] = f1;
            arrayOfFloat[13] = f10;
            arrayOfFloat[14] = f11;
            arrayOfFloat[15] = f8;
            arrayOfFloat[16] = f7;
            arrayOfFloat[17] = f1;
            arrayOfFloat[18] = f10;
            arrayOfFloat[19] = f13;
            if (bool) {
              f7 = arrayOfFloat[3];
              arrayOfFloat[3] = arrayOfFloat[13];
              arrayOfFloat[13] = f7;
              f7 = arrayOfFloat[8];
              arrayOfFloat[8] = arrayOfFloat[18];
              arrayOfFloat[18] = f7;
            } 
            if (bool1) {
              f7 = arrayOfFloat[4];
              arrayOfFloat[4] = arrayOfFloat[14];
              arrayOfFloat[14] = f7;
              f7 = arrayOfFloat[9];
              arrayOfFloat[9] = arrayOfFloat[19];
              arrayOfFloat[19] = f7;
            } 
            if (j != 0)
              if (j != 1) {
                if (j != 2) {
                  if (j == 3) {
                    f7 = arrayOfFloat[4];
                    arrayOfFloat[4] = arrayOfFloat[19];
                    arrayOfFloat[19] = arrayOfFloat[14];
                    arrayOfFloat[14] = arrayOfFloat[9];
                    arrayOfFloat[9] = f7;
                    f7 = arrayOfFloat[3];
                    arrayOfFloat[3] = arrayOfFloat[18];
                    arrayOfFloat[18] = arrayOfFloat[13];
                    arrayOfFloat[13] = arrayOfFloat[8];
                    arrayOfFloat[8] = f7;
                  } 
                } else {
                  f7 = arrayOfFloat[3];
                  arrayOfFloat[3] = arrayOfFloat[13];
                  arrayOfFloat[13] = f7;
                  f7 = arrayOfFloat[8];
                  arrayOfFloat[8] = arrayOfFloat[18];
                  arrayOfFloat[18] = f7;
                  f7 = arrayOfFloat[4];
                  arrayOfFloat[4] = arrayOfFloat[14];
                  arrayOfFloat[14] = f7;
                  f7 = arrayOfFloat[9];
                  arrayOfFloat[9] = arrayOfFloat[19];
                  arrayOfFloat[19] = f7;
                } 
              } else {
                f7 = arrayOfFloat[4];
                arrayOfFloat[4] = arrayOfFloat[9];
                arrayOfFloat[9] = arrayOfFloat[14];
                arrayOfFloat[14] = arrayOfFloat[19];
                arrayOfFloat[19] = f7;
                f7 = arrayOfFloat[3];
                arrayOfFloat[3] = arrayOfFloat[8];
                arrayOfFloat[8] = arrayOfFloat[13];
                arrayOfFloat[13] = arrayOfFloat[18];
                arrayOfFloat[18] = f7;
              }  
            this.spriteCache.add(texture, arrayOfFloat, 0, 20);
          } 
        } 
      } 
      i1--;
    } 
  }
  
  public void setBlending(boolean paramBoolean) { this.blending = paramBoolean; }
  
  public void setMaxTileSize(float paramFloat1, float paramFloat2) {
    this.maxTileWidth = paramFloat1;
    this.maxTileHeight = paramFloat2;
  }
  
  public void setOverCache(float paramFloat) { this.overCache = paramFloat; }
  
  public void setView(OrthographicCamera paramOrthographicCamera) {
    this.spriteCache.setProjectionMatrix(paramOrthographicCamera.combined);
    float f1 = paramOrthographicCamera.viewportWidth * paramOrthographicCamera.zoom + this.maxTileWidth * 2.0F * this.unitScale;
    float f2 = paramOrthographicCamera.viewportHeight * paramOrthographicCamera.zoom + this.maxTileHeight * 2.0F * this.unitScale;
    this.viewBounds.set(paramOrthographicCamera.position.x - f1 / 2.0F, paramOrthographicCamera.position.y - f2 / 2.0F, f1, f2);
    if ((this.canCacheMoreW && this.viewBounds.x < this.cacheBounds.x - 1.0E-5F) || (this.canCacheMoreS && this.viewBounds.y < this.cacheBounds.y - 1.0E-5F) || (this.canCacheMoreE && this.viewBounds.x + this.viewBounds.width > this.cacheBounds.x + this.cacheBounds.width + 1.0E-5F) || (this.canCacheMoreN && this.viewBounds.y + this.viewBounds.height > this.cacheBounds.y + this.cacheBounds.height + 1.0E-5F))
      this.cached = false; 
  }
  
  public void setView(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.spriteCache.setProjectionMatrix(paramMatrix4);
    float f1 = this.maxTileWidth;
    float f2 = this.unitScale;
    float f3 = this.maxTileHeight;
    this.viewBounds.set(paramFloat1 - f1 * f2, paramFloat2 - f3 * f2, paramFloat3 + f1 * 2.0F * f2, paramFloat4 + f3 * 2.0F * f2);
    if ((this.canCacheMoreW && this.viewBounds.x < this.cacheBounds.x - 1.0E-5F) || (this.canCacheMoreS && this.viewBounds.y < this.cacheBounds.y - 1.0E-5F) || (this.canCacheMoreE && this.viewBounds.x + this.viewBounds.width > this.cacheBounds.x + this.cacheBounds.width + 1.0E-5F) || (this.canCacheMoreN && this.viewBounds.y + this.viewBounds.height > this.cacheBounds.y + this.cacheBounds.height + 1.0E-5F))
      this.cached = false; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */