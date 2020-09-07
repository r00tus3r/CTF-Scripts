package com.badlogic.gdx.utils.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public final class Constructor {
  private final Constructor constructor;
  
  Constructor(Constructor paramConstructor) { this.constructor = paramConstructor; }
  
  public Class getDeclaringClass() { return this.constructor.getDeclaringClass(); }
  
  public Class[] getParameterTypes() { return this.constructor.getParameterTypes(); }
  
  public boolean isAccessible() { return this.constructor.isAccessible(); }
  
  public Object newInstance(Object... paramVarArgs) throws ReflectionException {
    try {
      return this.constructor.newInstance(paramVarArgs);
    } catch (IllegalArgumentException paramVarArgs) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Illegal argument(s) supplied to constructor for class: ");
      stringBuilder.append(getDeclaringClass().getName());
      throw new ReflectionException(stringBuilder.toString(), paramVarArgs);
    } catch (InstantiationException instantiationException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Could not instantiate instance of class: ");
      stringBuilder.append(getDeclaringClass().getName());
      throw new ReflectionException(stringBuilder.toString(), instantiationException);
    } catch (IllegalAccessException paramVarArgs) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Could not instantiate instance of class: ");
      stringBuilder.append(getDeclaringClass().getName());
      throw new ReflectionException(stringBuilder.toString(), paramVarArgs);
    } catch (InvocationTargetException invocationTargetException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Exception occurred in constructor for class: ");
      stringBuilder.append(getDeclaringClass().getName());
      throw new ReflectionException(stringBuilder.toString(), invocationTargetException);
    } 
  }
  
  public void setAccessible(boolean paramBoolean) { this.constructor.setAccessible(paramBoolean); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/reflect/Constructor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */