package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public final class Method {
  private final Method method;
  
  Method(Method paramMethod) { this.method = paramMethod; }
  
  public Annotation getDeclaredAnnotation(Class<? extends Annotation> paramClass) {
    Annotation[] arrayOfAnnotation = this.method.getDeclaredAnnotations();
    if (arrayOfAnnotation == null)
      return null; 
    int i = arrayOfAnnotation.length;
    for (byte b = 0; b < i; b++) {
      Annotation annotation = arrayOfAnnotation[b];
      if (annotation.annotationType().equals(paramClass))
        return new Annotation(annotation); 
    } 
    return null;
  }
  
  public Annotation[] getDeclaredAnnotations() {
    Annotation[] arrayOfAnnotation = this.method.getDeclaredAnnotations();
    Annotation[] arrayOfAnnotation1 = new Annotation[arrayOfAnnotation.length];
    for (byte b = 0; b < arrayOfAnnotation.length; b++)
      arrayOfAnnotation1[b] = new Annotation(arrayOfAnnotation[b]); 
    return arrayOfAnnotation1;
  }
  
  public Class getDeclaringClass() { return this.method.getDeclaringClass(); }
  
  public String getName() { return this.method.getName(); }
  
  public Class[] getParameterTypes() { return this.method.getParameterTypes(); }
  
  public Class getReturnType() { return this.method.getReturnType(); }
  
  public Object invoke(Object paramObject, Object... paramVarArgs) throws ReflectionException {
    try {
      return this.method.invoke(paramObject, paramVarArgs);
    } catch (IllegalArgumentException paramVarArgs) {
      paramObject = new StringBuilder();
      paramObject.append("Illegal argument(s) supplied to method: ");
      paramObject.append(getName());
      throw new ReflectionException(paramObject.toString(), paramVarArgs);
    } catch (IllegalAccessException paramObject) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Illegal access to method: ");
      stringBuilder.append(getName());
      throw new ReflectionException(stringBuilder.toString(), paramObject);
    } catch (InvocationTargetException paramVarArgs) {
      paramObject = new StringBuilder();
      paramObject.append("Exception occurred in method: ");
      paramObject.append(getName());
      throw new ReflectionException(paramObject.toString(), paramVarArgs);
    } 
  }
  
  public boolean isAbstract() { return Modifier.isAbstract(this.method.getModifiers()); }
  
  public boolean isAccessible() { return this.method.isAccessible(); }
  
  public boolean isAnnotationPresent(Class<? extends Annotation> paramClass) { return this.method.isAnnotationPresent(paramClass); }
  
  public boolean isDefaultAccess() {
    boolean bool;
    if (!isPrivate() && !isProtected() && !isPublic()) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isFinal() { return Modifier.isFinal(this.method.getModifiers()); }
  
  public boolean isNative() { return Modifier.isNative(this.method.getModifiers()); }
  
  public boolean isPrivate() { return Modifier.isPrivate(this.method.getModifiers()); }
  
  public boolean isProtected() { return Modifier.isProtected(this.method.getModifiers()); }
  
  public boolean isPublic() { return Modifier.isPublic(this.method.getModifiers()); }
  
  public boolean isStatic() { return Modifier.isStatic(this.method.getModifiers()); }
  
  public boolean isVarArgs() { return this.method.isVarArgs(); }
  
  public void setAccessible(boolean paramBoolean) { this.method.setAccessible(paramBoolean); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/reflect/Method.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */