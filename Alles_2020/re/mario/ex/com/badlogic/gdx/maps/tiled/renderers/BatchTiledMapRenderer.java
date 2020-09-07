package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapGroupLayer;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapLayers;
import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapImageLayer;
import com.badlogic.gdx.maps.tiled.TiledMapRenderer;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public abstract class BatchTiledMapRenderer implements TiledMapRenderer, Disposable {
  protected static final int NUM_VERTICES = 20;
  
  protected Batch batch;
  
  protected Rectangle imageBounds = new Rectangle();
  
  protected TiledMap map;
  
  protected boolean ownsBatch;
  
  protected float unitScale;
  
  protected float[] vertices = new float[20];
  
  protected Rectangle viewBounds;
  
  public BatchTiledMapRenderer(TiledMap paramTiledMap) { this(paramTiledMap, 1.0F); }
  
  public BatchTiledMapRenderer(TiledMap paramTiledMap, float paramFloat) {
    this.map = paramTiledMap;
    this.unitScale = paramFloat;
    this.viewBounds = new Rectangle();
    this.batch = new SpriteBatch();
    this.ownsBatch = true;
  }
  
  public BatchTiledMapRenderer(TiledMap paramTiledMap, float paramFloat, Batch paramBatch) {
    this.map = paramTiledMap;
    this.unitScale = paramFloat;
    this.viewBounds = new Rectangle();
    this.batch = paramBatch;
    this.ownsBatch = false;
  }
  
  public BatchTiledMapRenderer(TiledMap paramTiledMap, Batch paramBatch) { this(paramTiledMap, 1.0F, paramBatch); }
  
  protected void beginRender() {
    AnimatedTiledMapTile.updateAnimationBaseTime();
    this.batch.begin();
  }
  
  public void dispose() {
    if (this.ownsBatch)
      this.batch.dispose(); 
  }
  
  protected void endRender() { this.batch.end(); }
  
  public Batch getBatch() { return this.batch; }
  
  public TiledMap getMap() { return this.map; }
  
  public float getUnitScale() { return this.unitScale; }
  
  public Rectangle getViewBounds() { return this.viewBounds; }
  
  public void render() {
    beginRender();
    Iterator iterator = this.map.getLayers().iterator();
    while (iterator.hasNext())
      renderMapLayer((MapLayer)iterator.next()); 
    endRender();
  }
  
  public void render(int[] paramArrayOfInt) {
    beginRender();
    int i = paramArrayOfInt.length;
    for (byte b = 0; b < i; b++) {
      int j = paramArrayOfInt[b];
      renderMapLayer(this.map.getLayers().get(j));
    } 
    endRender();
  }
  
  public void renderImageLayer(TiledMapImageLayer paramTiledMapImageLayer) {
    Color color;
    float f1 = (color = this.batch.getColor()).toFloatBits(color.r, color.g, color.b, color.a * paramTiledMapImageLayer.getOpacity());
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
    f3 = textureRegion.getRegionHeight() * this.unitScale + f5;
    this.imageBounds.set(f2, f5, f6 - f2, f3 - f5);
    if (this.viewBounds.contains(this.imageBounds) || this.viewBounds.overlaps(this.imageBounds)) {
      float f7 = textureRegion.getU();
      float f8 = textureRegion.getV2();
      float f9 = textureRegion.getU2();
      f4 = textureRegion.getV();
      arrayOfFloat[0] = f2;
      arrayOfFloat[1] = f5;
      arrayOfFloat[2] = f1;
      arrayOfFloat[3] = f7;
      arrayOfFloat[4] = f8;
      arrayOfFloat[5] = f2;
      arrayOfFloat[6] = f3;
      arrayOfFloat[7] = f1;
      arrayOfFloat[8] = f7;
      arrayOfFloat[9] = f4;
      arrayOfFloat[10] = f6;
      arrayOfFloat[11] = f3;
      arrayOfFloat[12] = f1;
      arrayOfFloat[13] = f9;
      arrayOfFloat[14] = f4;
      arrayOfFloat[15] = f6;
      arrayOfFloat[16] = f5;
      arrayOfFloat[17] = f1;
      arrayOfFloat[18] = f9;
      arrayOfFloat[19] = f8;
      this.batch.draw(textureRegion.getTexture(), arrayOfFloat, 0, 20);
    } 
  }
  
  protected void renderMapLayer(MapLayer paramMapLayer) {
    MapLayers mapLayers;
    if (!paramMapLayer.isVisible())
      return; 
    if (paramMapLayer instanceof MapGroupLayer) {
      mapLayers = ((MapGroupLayer)paramMapLayer).getLayers();
      for (byte b = 0; b < mapLayers.size(); b++) {
        MapLayer mapLayer = mapLayers.get(b);
        if (mapLayer.isVisible())
          renderMapLayer(mapLayer); 
      } 
    } else if (mapLayers instanceof TiledMapTileLayer) {
      renderTileLayer((TiledMapTileLayer)mapLayers);
    } else if (mapLayers instanceof TiledMapImageLayer) {
      renderImageLayer((TiledMapImageLayer)mapLayers);
    } else {
      renderObjects(mapLayers);
    } 
  }
  
  public void renderObject(MapObject paramMapObject) {}
  
  public void renderObjects(MapLayer paramMapLayer) {
    Iterator iterator = paramMapLayer.getObjects().iterator();
    while (iterator.hasNext())
      renderObject((MapObject)iterator.next()); 
  }
  
  public void setMap(TiledMap paramTiledMap) { this.map = paramTiledMap; }
  
  public void setView(OrthographicCamera paramOrthographicCamera) {
    this.batch.setProjectionMatrix(paramOrthographicCamera.combined);
    float f1 = paramOrthographicCamera.viewportWidth * paramOrthographicCamera.zoom;
    float f2 = paramOrthographicCamera.viewportHeight * paramOrthographicCamera.zoom;
    float f3 = Math.abs(paramOrthographicCamera.up.y) * f1 + Math.abs(paramOrthographicCamera.up.x) * f2;
    f2 = f2 * Math.abs(paramOrthographicCamera.up.y) + f1 * Math.abs(paramOrthographicCamera.up.x);
    this.viewBounds.set(paramOrthographicCamera.position.x - f3 / 2.0F, paramOrthographicCamera.position.y - f2 / 2.0F, f3, f2);
  }
  
  public void setView(Matrix4 paramMatrix4, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.batch.setProjectionMatrix(paramMatrix4);
    this.viewBounds.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */