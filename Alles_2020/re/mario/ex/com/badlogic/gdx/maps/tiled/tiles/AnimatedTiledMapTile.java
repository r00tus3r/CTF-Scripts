package com.badlogic.gdx.maps.tiled.tiles;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapObjects;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.TimeUtils;

public class AnimatedTiledMapTile implements TiledMapTile {
  private static final long initialTimeOffset = TimeUtils.millis();
  
  private static long lastTiledMapRenderTime;
  
  private int[] animationIntervals;
  
  private TiledMapTile.BlendMode blendMode = TiledMapTile.BlendMode.ALPHA;
  
  private int frameCount;
  
  private StaticTiledMapTile[] frameTiles;
  
  private int id;
  
  private int loopDuration;
  
  private MapObjects objects;
  
  private MapProperties properties;
  
  public AnimatedTiledMapTile(float paramFloat, Array<StaticTiledMapTile> paramArray) {
    byte b = 0;
    this.frameCount = 0;
    this.frameTiles = new StaticTiledMapTile[paramArray.size];
    this.frameCount = paramArray.size;
    int i = paramArray.size;
    int j = (int)(paramFloat * 1000.0F);
    this.loopDuration = i * j;
    this.animationIntervals = new int[paramArray.size];
    while (b < paramArray.size) {
      this.frameTiles[b] = (StaticTiledMapTile)paramArray.get(b);
      this.animationIntervals[b] = j;
      b++;
    } 
  }
  
  public AnimatedTiledMapTile(IntArray paramIntArray, Array<StaticTiledMapTile> paramArray) {
    byte b = 0;
    this.frameCount = 0;
    this.frameTiles = new StaticTiledMapTile[paramArray.size];
    this.frameCount = paramArray.size;
    this.animationIntervals = paramIntArray.toArray();
    this.loopDuration = 0;
    while (b < paramIntArray.size) {
      this.frameTiles[b] = (StaticTiledMapTile)paramArray.get(b);
      this.loopDuration += paramIntArray.get(b);
      b++;
    } 
  }
  
  public static void updateAnimationBaseTime() { lastTiledMapRenderTime = TimeUtils.millis() - initialTimeOffset; }
  
  public int[] getAnimationIntervals() { return this.animationIntervals; }
  
  public TiledMapTile.BlendMode getBlendMode() { return this.blendMode; }
  
  public TiledMapTile getCurrentFrame() { return this.frameTiles[getCurrentFrameIndex()]; }
  
  public int getCurrentFrameIndex() {
    int i = (int)(lastTiledMapRenderTime % this.loopDuration);
    byte b = 0;
    while (true) {
      int[] arrayOfInt = this.animationIntervals;
      if (b < arrayOfInt.length) {
        int j = arrayOfInt[b];
        if (i <= j)
          return b; 
        i -= j;
        b++;
        continue;
      } 
      break;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Could not determine current animation frame in AnimatedTiledMapTile.  This should never happen.");
    throw gdxRuntimeException;
  }
  
  public StaticTiledMapTile[] getFrameTiles() { return this.frameTiles; }
  
  public int getId() { return this.id; }
  
  public MapObjects getObjects() {
    if (this.objects == null)
      this.objects = new MapObjects(); 
    return this.objects;
  }
  
  public float getOffsetX() { return getCurrentFrame().getOffsetX(); }
  
  public float getOffsetY() { return getCurrentFrame().getOffsetY(); }
  
  public MapProperties getProperties() {
    if (this.properties == null)
      this.properties = new MapProperties(); 
    return this.properties;
  }
  
  public TextureRegion getTextureRegion() { return getCurrentFrame().getTextureRegion(); }
  
  public void setAnimationIntervals(int[] paramArrayOfInt) {
    if (paramArrayOfInt.length == this.animationIntervals.length) {
      this.animationIntervals = paramArrayOfInt;
      byte b = 0;
      this.loopDuration = 0;
      while (b < paramArrayOfInt.length) {
        this.loopDuration += paramArrayOfInt[b];
        b++;
      } 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot set ");
    stringBuilder.append(paramArrayOfInt.length);
    stringBuilder.append(" frame intervals. The given int[] must have a size of ");
    stringBuilder.append(this.animationIntervals.length);
    stringBuilder.append(".");
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  public void setBlendMode(TiledMapTile.BlendMode paramBlendMode) { this.blendMode = paramBlendMode; }
  
  public void setId(int paramInt) { this.id = paramInt; }
  
  public void setOffsetX(float paramFloat) { throw new GdxRuntimeException("Cannot set offset of AnimatedTiledMapTile."); }
  
  public void setOffsetY(float paramFloat) { throw new GdxRuntimeException("Cannot set offset of AnimatedTiledMapTile."); }
  
  public void setTextureRegion(TextureRegion paramTextureRegion) { throw new GdxRuntimeException("Cannot set the texture region of AnimatedTiledMapTile."); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */