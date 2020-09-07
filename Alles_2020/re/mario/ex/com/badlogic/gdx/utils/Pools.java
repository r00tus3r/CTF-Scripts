package com.badlogic.gdx.utils;

public class Pools {
  private static final ObjectMap<Class, Pool> typePools = new ObjectMap();
  
  public static void free(Object paramObject) {
    if (paramObject != null) {
      Pool pool = (Pool)typePools.get(paramObject.getClass());
      if (pool == null)
        return; 
      pool.free(paramObject);
      return;
    } 
    throw new IllegalArgumentException("Object cannot be null.");
  }
  
  public static void freeAll(Array paramArray) { freeAll(paramArray, false); }
  
  public static void freeAll(Array paramArray, boolean paramBoolean) {
    if (paramArray != null) {
      byte b = 0;
      int i = paramArray.size;
      for (Object object = null; b < i; object = SYNTHETIC_LOCAL_VARIABLE_6) {
        Object object1 = paramArray.get(b);
        if (object1 == null) {
          Object object3 = object;
          continue;
        } 
        Object object2 = object;
        if (object == null) {
          object = (Pool)typePools.get(object1.getClass());
          object2 = object;
          if (object == null) {
            object2 = object;
            continue;
          } 
        } 
        object2.free(object1);
        if (!paramBoolean)
          object2 = null; 
        continue;
        b++;
      } 
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("Objects cannot be null.");
    throw illegalArgumentException;
  }
  
  public static <T> Pool<T> get(Class<T> paramClass) { return get(paramClass, 100); }
  
  public static <T> Pool<T> get(Class<T> paramClass, int paramInt) {
    Pool pool1 = (Pool)typePools.get(paramClass);
    Pool pool2 = pool1;
    if (pool1 == null) {
      pool2 = new ReflectionPool(paramClass, 4, paramInt);
      typePools.put(paramClass, pool2);
    } 
    return pool2;
  }
  
  public static <T> T obtain(Class<T> paramClass) { return (T)get(paramClass).obtain(); }
  
  public static <T> void set(Class<T> paramClass, Pool<T> paramPool) { typePools.put(paramClass, paramPool); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Pools.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */