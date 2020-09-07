package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public final class Field {
  private final Field field;
  
  Field(Field paramField) { this.field = paramField; }
  
  public Object get(Object paramObject) throws ReflectionException {
    try {
      return this.field.get(paramObject);
    } catch (IllegalArgumentException illegalArgumentException) {
      paramObject = new StringBuilder();
      paramObject.append("Object is not an instance of ");
      paramObject.append(getDeclaringClass());
      throw new ReflectionException(paramObject.toString(), illegalArgumentException);
    } catch (IllegalAccessException paramObject) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Illegal access to field: ");
      stringBuilder.append(getName());
      throw new ReflectionException(stringBuilder.toString(), paramObject);
    } 
  }
  
  public Annotation getDeclaredAnnotation(Class<? extends Annotation> paramClass) {
    Annotation[] arrayOfAnnotation = this.field.getDeclaredAnnotations();
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
    Annotation[] arrayOfAnnotation = this.field.getDeclaredAnnotations();
    Annotation[] arrayOfAnnotation1 = new Annotation[arrayOfAnnotation.length];
    for (byte b = 0; b < arrayOfAnnotation.length; b++)
      arrayOfAnnotation1[b] = new Annotation(arrayOfAnnotation[b]); 
    return arrayOfAnnotation1;
  }
  
  public Class getDeclaringClass() { return this.field.getDeclaringClass(); }
  
  public Class getElementType(int paramInt) {
    Type type = this.field.getGenericType();
    if (type instanceof ParameterizedType) {
      Type[] arrayOfType = ((ParameterizedType)type).getActualTypeArguments();
      if (arrayOfType.length - 1 >= paramInt) {
        Type type1 = arrayOfType[paramInt];
        if (type1 instanceof Class)
          return (Class)type1; 
        if (type1 instanceof ParameterizedType)
          return (Class)((ParameterizedType)type1).getRawType(); 
        if (type1 instanceof GenericArrayType) {
          type1 = ((GenericArrayType)type1).getGenericComponentType();
          if (type1 instanceof Class)
            return ArrayReflection.newInstance((Class)type1, 0).getClass(); 
        } 
      } 
    } 
    return null;
  }
  
  public String getName() { return this.field.getName(); }
  
  public Class getType() { return this.field.getType(); }
  
  public boolean isAccessible() { return this.field.isAccessible(); }
  
  public boolean isAnnotationPresent(Class<? extends Annotation> paramClass) { return this.field.isAnnotationPresent(paramClass); }
  
  public boolean isDefaultAccess() {
    boolean bool;
    if (!isPrivate() && !isProtected() && !isPublic()) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isFinal() { return Modifier.isFinal(this.field.getModifiers()); }
  
  public boolean isPrivate() { return Modifier.isPrivate(this.field.getModifiers()); }
  
  public boolean isProtected() { return Modifier.isProtected(this.field.getModifiers()); }
  
  public boolean isPublic() { return Modifier.isPublic(this.field.getModifiers()); }
  
  public boolean isStatic() { return Modifier.isStatic(this.field.getModifiers()); }
  
  public boolean isSynthetic() { return this.field.isSynthetic(); }
  
  public boolean isTransient() { return Modifier.isTransient(this.field.getModifiers()); }
  
  public boolean isVolatile() { return Modifier.isVolatile(this.field.getModifiers()); }
  
  public void set(Object paramObject1, Object paramObject2) throws ReflectionException {
    try {
      this.field.set(paramObject1, paramObject2);
      return;
    } catch (IllegalArgumentException paramObject1) {
      paramObject2 = new StringBuilder();
      paramObject2.append("Argument not valid for field: ");
      paramObject2.append(getName());
      throw new ReflectionException(paramObject2.toString(), paramObject1);
    } catch (IllegalAccessException paramObject1) {
      paramObject2 = new StringBuilder();
      paramObject2.append("Illegal access to field: ");
      paramObject2.append(getName());
      throw new ReflectionException(paramObject2.toString(), paramObject1);
    } 
  }
  
  public void setAccessible(boolean paramBoolean) { this.field.setAccessible(paramBoolean); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/reflect/Field.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */