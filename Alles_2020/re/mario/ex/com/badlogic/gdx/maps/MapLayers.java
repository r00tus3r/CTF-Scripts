package com.badlogic.gdx.maps;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.util.Iterator;

public class MapLayers extends Object implements Iterable<MapLayer> {
  private Array<MapLayer> layers = new Array();
  
  public void add(MapLayer paramMapLayer) { this.layers.add(paramMapLayer); }
  
  public MapLayer get(int paramInt) { return (MapLayer)this.layers.get(paramInt); }
  
  public MapLayer get(String paramString) {
    int i = this.layers.size;
    for (byte b = 0; b < i; b++) {
      MapLayer mapLayer = (MapLayer)this.layers.get(b);
      if (paramString.equals(mapLayer.getName()))
        return mapLayer; 
    } 
    return null;
  }
  
  public <T extends MapLayer> Array<T> getByType(Class<T> paramClass) { return getByType(paramClass, new Array()); }
  
  public <T extends MapLayer> Array<T> getByType(Class<T> paramClass, Array<T> paramArray) {
    paramArray.clear();
    int i = this.layers.size;
    for (byte b = 0; b < i; b++) {
      MapLayer mapLayer = (MapLayer)this.layers.get(b);
      if (ClassReflection.isInstance(paramClass, mapLayer))
        paramArray.add(mapLayer); 
    } 
    return paramArray;
  }
  
  public int getCount() { return this.layers.size; }
  
  public int getIndex(MapLayer paramMapLayer) { return this.layers.indexOf(paramMapLayer, true); }
  
  public int getIndex(String paramString) { return getIndex(get(paramString)); }
  
  public Iterator<MapLayer> iterator() { return this.layers.iterator(); }
  
  public void remove(int paramInt) { this.layers.removeIndex(paramInt); }
  
  public void remove(MapLayer paramMapLayer) { this.layers.removeValue(paramMapLayer, true); }
  
  public int size() { return this.layers.size; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapLayers.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */