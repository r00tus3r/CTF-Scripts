package com.badlogic.gdx;

import java.util.Map;

public interface Preferences {
  void clear();
  
  boolean contains(String paramString);
  
  void flush();
  
  Map<String, ?> get();
  
  boolean getBoolean(String paramString);
  
  boolean getBoolean(String paramString, boolean paramBoolean);
  
  float getFloat(String paramString);
  
  float getFloat(String paramString, float paramFloat);
  
  int getInteger(String paramString);
  
  int getInteger(String paramString, int paramInt);
  
  long getLong(String paramString);
  
  long getLong(String paramString, long paramLong);
  
  String getString(String paramString);
  
  String getString(String paramString1, String paramString2);
  
  Preferences put(Map<String, ?> paramMap);
  
  Preferences putBoolean(String paramString, boolean paramBoolean);
  
  Preferences putFloat(String paramString, float paramFloat);
  
  Preferences putInteger(String paramString, int paramInt);
  
  Preferences putLong(String paramString, long paramLong);
  
  Preferences putString(String paramString1, String paramString2);
  
  void remove(String paramString);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Preferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */