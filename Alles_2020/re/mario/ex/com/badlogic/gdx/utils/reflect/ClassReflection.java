package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public final class ClassReflection {
  public static Class forName(String paramString) throws ReflectionException {
    try {
      return Class.forName(paramString);
    } catch (ClassNotFoundException classNotFoundException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Class not found: ");
      stringBuilder.append(paramString);
      throw new ReflectionException(stringBuilder.toString(), classNotFoundException);
    } 
  }
  
  public static Annotation getAnnotation(Class paramClass1, Class<? extends Annotation> paramClass2) {
    Annotation annotation = paramClass1.getAnnotation(paramClass2);
    return (annotation != null) ? new Annotation(annotation) : null;
  }
  
  public static Annotation[] getAnnotations(Class paramClass) {
    Annotation[] arrayOfAnnotation1 = paramClass.getAnnotations();
    Annotation[] arrayOfAnnotation = new Annotation[arrayOfAnnotation1.length];
    for (byte b = 0; b < arrayOfAnnotation1.length; b++)
      arrayOfAnnotation[b] = new Annotation(arrayOfAnnotation1[b]); 
    return arrayOfAnnotation;
  }
  
  public static Class getComponentType(Class paramClass) { return paramClass.getComponentType(); }
  
  public static Constructor getConstructor(Class paramClass, Class... paramVarArgs) throws ReflectionException {
    try {
      return new Constructor(paramClass.getConstructor(paramVarArgs));
    } catch (SecurityException securityException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Security violation occurred while getting constructor for class: '");
      stringBuilder.append(paramClass.getName());
      stringBuilder.append("'.");
      throw new ReflectionException(stringBuilder.toString(), securityException);
    } catch (NoSuchMethodException noSuchMethodException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Constructor not found for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), noSuchMethodException);
    } 
  }
  
  public static Constructor[] getConstructors(Class paramClass) {
    Constructor[] arrayOfConstructor1 = paramClass.getConstructors();
    Constructor[] arrayOfConstructor = new Constructor[arrayOfConstructor1.length];
    int i = arrayOfConstructor1.length;
    for (byte b = 0; b < i; b++)
      arrayOfConstructor[b] = new Constructor(arrayOfConstructor1[b]); 
    return arrayOfConstructor;
  }
  
  public static Annotation getDeclaredAnnotation(Class paramClass1, Class<? extends Annotation> paramClass2) {
    for (Annotation annotation : paramClass1.getDeclaredAnnotations()) {
      if (annotation.annotationType().equals(paramClass2))
        return new Annotation(annotation); 
    } 
    return null;
  }
  
  public static Annotation[] getDeclaredAnnotations(Class paramClass) {
    Annotation[] arrayOfAnnotation = paramClass.getDeclaredAnnotations();
    Annotation[] arrayOfAnnotation1 = new Annotation[arrayOfAnnotation.length];
    for (byte b = 0; b < arrayOfAnnotation.length; b++)
      arrayOfAnnotation1[b] = new Annotation(arrayOfAnnotation[b]); 
    return arrayOfAnnotation1;
  }
  
  public static Constructor getDeclaredConstructor(Class paramClass, Class... paramVarArgs) throws ReflectionException {
    try {
      return new Constructor(paramClass.getDeclaredConstructor(paramVarArgs));
    } catch (SecurityException securityException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Security violation while getting constructor for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), securityException);
    } catch (NoSuchMethodException paramVarArgs) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Constructor not found for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), paramVarArgs);
    } 
  }
  
  public static Field getDeclaredField(Class paramClass, String paramString) throws ReflectionException {
    try {
      return new Field(paramClass.getDeclaredField(paramString));
    } catch (SecurityException securityException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Security violation while getting field: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), securityException);
    } catch (NoSuchFieldException noSuchFieldException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Field not found: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), noSuchFieldException);
    } 
  }
  
  public static Field[] getDeclaredFields(Class paramClass) {
    Field[] arrayOfField1 = paramClass.getDeclaredFields();
    Field[] arrayOfField = new Field[arrayOfField1.length];
    int i = arrayOfField1.length;
    for (byte b = 0; b < i; b++)
      arrayOfField[b] = new Field(arrayOfField1[b]); 
    return arrayOfField;
  }
  
  public static Method getDeclaredMethod(Class paramClass, String paramString, Class... paramVarArgs) throws ReflectionException {
    try {
      return new Method(paramClass.getDeclaredMethod(paramString, paramVarArgs));
    } catch (SecurityException securityException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Security violation while getting method: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), securityException);
    } catch (NoSuchMethodException paramVarArgs) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Method not found: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), paramVarArgs);
    } 
  }
  
  public static Method[] getDeclaredMethods(Class paramClass) {
    Method[] arrayOfMethod1 = paramClass.getDeclaredMethods();
    Method[] arrayOfMethod = new Method[arrayOfMethod1.length];
    int i = arrayOfMethod1.length;
    for (byte b = 0; b < i; b++)
      arrayOfMethod[b] = new Method(arrayOfMethod1[b]); 
    return arrayOfMethod;
  }
  
  public static Object[] getEnumConstants(Class paramClass) { return paramClass.getEnumConstants(); }
  
  public static Field getField(Class paramClass, String paramString) throws ReflectionException {
    try {
      return new Field(paramClass.getField(paramString));
    } catch (SecurityException securityException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Security violation while getting field: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), securityException);
    } catch (NoSuchFieldException noSuchFieldException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Field not found: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), noSuchFieldException);
    } 
  }
  
  public static Field[] getFields(Class paramClass) {
    Field[] arrayOfField = paramClass.getFields();
    Field[] arrayOfField1 = new Field[arrayOfField.length];
    int i = arrayOfField.length;
    for (byte b = 0; b < i; b++)
      arrayOfField1[b] = new Field(arrayOfField[b]); 
    return arrayOfField1;
  }
  
  public static Class[] getInterfaces(Class paramClass) { return paramClass.getInterfaces(); }
  
  public static Method getMethod(Class paramClass, String paramString, Class... paramVarArgs) throws ReflectionException {
    try {
      return new Method(paramClass.getMethod(paramString, paramVarArgs));
    } catch (SecurityException paramVarArgs) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Security violation while getting method: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), paramVarArgs);
    } catch (NoSuchMethodException noSuchMethodException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Method not found: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", for class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), noSuchMethodException);
    } 
  }
  
  public static Method[] getMethods(Class paramClass) {
    Method[] arrayOfMethod = paramClass.getMethods();
    Method[] arrayOfMethod1 = new Method[arrayOfMethod.length];
    int i = arrayOfMethod.length;
    for (byte b = 0; b < i; b++)
      arrayOfMethod1[b] = new Method(arrayOfMethod[b]); 
    return arrayOfMethod1;
  }
  
  public static String getSimpleName(Class paramClass) { return paramClass.getSimpleName(); }
  
  public static boolean isAbstract(Class paramClass) { return Modifier.isAbstract(paramClass.getModifiers()); }
  
  public static boolean isAnnotation(Class paramClass) { return paramClass.isAnnotation(); }
  
  public static boolean isAnnotationPresent(Class paramClass1, Class<? extends Annotation> paramClass2) { return paramClass1.isAnnotationPresent(paramClass2); }
  
  public static boolean isArray(Class paramClass) { return paramClass.isArray(); }
  
  public static boolean isAssignableFrom(Class paramClass1, Class paramClass2) { return paramClass1.isAssignableFrom(paramClass2); }
  
  public static boolean isEnum(Class paramClass) { return paramClass.isEnum(); }
  
  public static boolean isInstance(Class paramClass, Object paramObject) { return paramClass.isInstance(paramObject); }
  
  public static boolean isInterface(Class paramClass) { return paramClass.isInterface(); }
  
  public static boolean isMemberClass(Class paramClass) { return paramClass.isMemberClass(); }
  
  public static boolean isPrimitive(Class paramClass) { return paramClass.isPrimitive(); }
  
  public static boolean isStaticClass(Class paramClass) { return Modifier.isStatic(paramClass.getModifiers()); }
  
  public static <T> T newInstance(Class<T> paramClass) throws ReflectionException {
    try {
      return (T)paramClass.newInstance();
    } catch (InstantiationException instantiationException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Could not instantiate instance of class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), instantiationException);
    } catch (IllegalAccessException illegalAccessException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Could not instantiate instance of class: ");
      stringBuilder.append(paramClass.getName());
      throw new ReflectionException(stringBuilder.toString(), illegalAccessException);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/reflect/ClassReflection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */