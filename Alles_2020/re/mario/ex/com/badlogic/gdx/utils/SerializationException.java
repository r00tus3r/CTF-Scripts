package com.badlogic.gdx.utils;

public class SerializationException extends RuntimeException {
  private StringBuilder trace;
  
  public SerializationException() {}
  
  public SerializationException(String paramString) { super(paramString); }
  
  public SerializationException(String paramString, Throwable paramThrowable) { super(paramString, paramThrowable); }
  
  public SerializationException(Throwable paramThrowable) { super("", paramThrowable); }
  
  private boolean causedBy(Throwable paramThrowable, Class paramClass) {
    Throwable throwable = paramThrowable.getCause();
    return (throwable == null || throwable == paramThrowable) ? false : (paramClass.isAssignableFrom(throwable.getClass()) ? true : causedBy(throwable, paramClass));
  }
  
  public void addTrace(String paramString) {
    if (paramString != null) {
      if (this.trace == null)
        this.trace = new StringBuilder('Ȁ'); 
      this.trace.append('\n');
      this.trace.append(paramString);
      return;
    } 
    throw new IllegalArgumentException("info cannot be null.");
  }
  
  public boolean causedBy(Class paramClass) { return causedBy(this, paramClass); }
  
  public String getMessage() {
    if (this.trace == null)
      return super.getMessage(); 
    StringBuilder stringBuilder = new StringBuilder('Ȁ');
    stringBuilder.append(super.getMessage());
    if (stringBuilder.length() > 0)
      stringBuilder.append('\n'); 
    stringBuilder.append("Serialization trace:");
    stringBuilder.append(this.trace);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/SerializationException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */