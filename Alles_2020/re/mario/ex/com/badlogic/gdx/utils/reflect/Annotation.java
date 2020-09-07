package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;

public final class Annotation {
  private Annotation annotation;
  
  Annotation(Annotation paramAnnotation) { this.annotation = paramAnnotation; }
  
  public <T extends Annotation> T getAnnotation(Class<T> paramClass) { return this.annotation.annotationType().equals(paramClass) ? (T)this.annotation : null; }
  
  public Class<? extends Annotation> getAnnotationType() { return this.annotation.annotationType(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/reflect/Annotation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */