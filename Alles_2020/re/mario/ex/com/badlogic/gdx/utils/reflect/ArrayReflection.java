package com.badlogic.gdx.utils.reflect;

import java.lang.reflect.Array;

public final class ArrayReflection {
  public static Object get(Object paramObject, int paramInt) { return Array.get(paramObject, paramInt); }
  
  public static int getLength(Object paramObject) { return Array.getLength(paramObject); }
  
  public static Object newInstance(Class paramClass, int paramInt) { return Array.newInstance(paramClass, paramInt); }
  
  public static void set(Object paramObject1, int paramInt, Object paramObject2) { Array.set(paramObject1, paramInt, paramObject2); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/reflect/ArrayReflection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */