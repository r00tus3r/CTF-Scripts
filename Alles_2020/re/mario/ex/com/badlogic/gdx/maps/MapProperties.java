package com.badlogic.gdx.maps;

import com.badlogic.gdx.utils.ObjectMap;
import java.util.Iterator;

public class MapProperties {
  private ObjectMap<String, Object> properties = new ObjectMap();
  
  public void clear() { this.properties.clear(); }
  
  public boolean containsKey(String paramString) { return this.properties.containsKey(paramString); }
  
  public Object get(String paramString) { return this.properties.get(paramString); }
  
  public <T> T get(String paramString, Class<T> paramClass) { return (T)get(paramString); }
  
  public <T> T get(String paramString, T paramT, Class<T> paramClass) {
    T t;
    Object object2 = get(paramString);
    Object object1 = object2;
    if (object2 == null)
      t = paramT; 
    return t;
  }
  
  public Iterator<String> getKeys() { return this.properties.keys(); }
  
  public Iterator<Object> getValues() { return this.properties.values(); }
  
  public void put(String paramString, Object paramObject) { this.properties.put(paramString, paramObject); }
  
  public void putAll(MapProperties paramMapProperties) { this.properties.putAll(paramMapProperties.properties); }
  
  public void remove(String paramString) { this.properties.remove(paramString); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapProperties.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */