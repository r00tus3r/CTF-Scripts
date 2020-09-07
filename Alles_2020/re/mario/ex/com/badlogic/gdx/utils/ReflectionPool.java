package com.badlogic.gdx.utils;

import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.Constructor;
import com.badlogic.gdx.utils.reflect.ReflectionException;

public class ReflectionPool<T> extends Pool<T> {
  private final Constructor constructor;
  
  public ReflectionPool(Class<T> paramClass) { this(paramClass, 16, 2147483647); }
  
  public ReflectionPool(Class<T> paramClass, int paramInt) { this(paramClass, paramInt, 2147483647); }
  
  public ReflectionPool(Class<T> paramClass, int paramInt1, int paramInt2) {
    super(paramInt1, paramInt2);
    this.constructor = findConstructor(paramClass);
    if (this.constructor != null)
      return; 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Class cannot be created (missing no-arg constructor): ");
    stringBuilder.append(paramClass.getName());
    throw new RuntimeException(stringBuilder.toString());
  }
  
  private Constructor findConstructor(Class<T> paramClass) {
    try {
      return ClassReflection.getConstructor(paramClass, (Class[])null);
    } catch (Exception exception) {
      try {
        Constructor constructor1 = ClassReflection.getDeclaredConstructor(paramClass, (Class[])null);
        constructor1.setAccessible(true);
        return constructor1;
      } catch (ReflectionException paramClass) {
        return null;
      } 
    } 
  }
  
  protected T newObject() {
    try {
      return (T)this.constructor.newInstance((Object[])null);
    } catch (Exception exception) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Unable to create new instance: ");
      stringBuilder.append(this.constructor.getDeclaringClass().getName());
      throw new GdxRuntimeException(stringBuilder.toString(), exception);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ReflectionPool.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */