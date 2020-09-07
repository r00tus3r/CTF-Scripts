package com.badlogic.gdx.maps;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.util.Iterator;

public class MapObjects extends Object implements Iterable<MapObject> {
  private Array<MapObject> objects = new Array();
  
  public void add(MapObject paramMapObject) { this.objects.add(paramMapObject); }
  
  public MapObject get(int paramInt) { return (MapObject)this.objects.get(paramInt); }
  
  public MapObject get(String paramString) {
    int i = this.objects.size;
    for (byte b = 0; b < i; b++) {
      MapObject mapObject = (MapObject)this.objects.get(b);
      if (paramString.equals(mapObject.getName()))
        return mapObject; 
    } 
    return null;
  }
  
  public <T extends MapObject> Array<T> getByType(Class<T> paramClass) { return getByType(paramClass, new Array()); }
  
  public <T extends MapObject> Array<T> getByType(Class<T> paramClass, Array<T> paramArray) {
    paramArray.clear();
    int i = this.objects.size;
    for (byte b = 0; b < i; b++) {
      MapObject mapObject = (MapObject)this.objects.get(b);
      if (ClassReflection.isInstance(paramClass, mapObject))
        paramArray.add(mapObject); 
    } 
    return paramArray;
  }
  
  public int getCount() { return this.objects.size; }
  
  public int getIndex(MapObject paramMapObject) { return this.objects.indexOf(paramMapObject, true); }
  
  public int getIndex(String paramString) { return getIndex(get(paramString)); }
  
  public Iterator<MapObject> iterator() { return this.objects.iterator(); }
  
  public void remove(int paramInt) { this.objects.removeIndex(paramInt); }
  
  public void remove(MapObject paramMapObject) { this.objects.removeValue(paramMapObject, true); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapObjects.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */