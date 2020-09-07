package com.badlogic.gdx.backends.android;

import android.content.SharedPreferences;
import android.os.Build;
import com.badlogic.gdx.Preferences;
import java.util.Map;

public class AndroidPreferences implements Preferences {
  SharedPreferences.Editor editor;
  
  SharedPreferences sharedPrefs;
  
  public AndroidPreferences(SharedPreferences paramSharedPreferences) { this.sharedPrefs = paramSharedPreferences; }
  
  private void edit() {
    if (this.editor == null)
      this.editor = this.sharedPrefs.edit(); 
  }
  
  public void clear() {
    edit();
    this.editor.clear();
  }
  
  public boolean contains(String paramString) { return this.sharedPrefs.contains(paramString); }
  
  public void flush() {
    if (this.editor != null) {
      if (Build.VERSION.SDK_INT >= 9) {
        this.editor.apply();
      } else {
        this.editor.commit();
      } 
      this.editor = null;
    } 
  }
  
  public Map<String, ?> get() { return this.sharedPrefs.getAll(); }
  
  public boolean getBoolean(String paramString) { return this.sharedPrefs.getBoolean(paramString, false); }
  
  public boolean getBoolean(String paramString, boolean paramBoolean) { return this.sharedPrefs.getBoolean(paramString, paramBoolean); }
  
  public float getFloat(String paramString) { return this.sharedPrefs.getFloat(paramString, 0.0F); }
  
  public float getFloat(String paramString, float paramFloat) { return this.sharedPrefs.getFloat(paramString, paramFloat); }
  
  public int getInteger(String paramString) { return this.sharedPrefs.getInt(paramString, 0); }
  
  public int getInteger(String paramString, int paramInt) { return this.sharedPrefs.getInt(paramString, paramInt); }
  
  public long getLong(String paramString) { return this.sharedPrefs.getLong(paramString, 0L); }
  
  public long getLong(String paramString, long paramLong) { return this.sharedPrefs.getLong(paramString, paramLong); }
  
  public String getString(String paramString) { return this.sharedPrefs.getString(paramString, ""); }
  
  public String getString(String paramString1, String paramString2) { return this.sharedPrefs.getString(paramString1, paramString2); }
  
  public Preferences put(Map<String, ?> paramMap) {
    edit();
    for (Map.Entry entry : paramMap.entrySet()) {
      if (entry.getValue() instanceof Boolean)
        putBoolean((String)entry.getKey(), ((Boolean)entry.getValue()).booleanValue()); 
      if (entry.getValue() instanceof Integer)
        putInteger((String)entry.getKey(), ((Integer)entry.getValue()).intValue()); 
      if (entry.getValue() instanceof Long)
        putLong((String)entry.getKey(), ((Long)entry.getValue()).longValue()); 
      if (entry.getValue() instanceof String)
        putString((String)entry.getKey(), (String)entry.getValue()); 
      if (entry.getValue() instanceof Float)
        putFloat((String)entry.getKey(), ((Float)entry.getValue()).floatValue()); 
    } 
    return this;
  }
  
  public Preferences putBoolean(String paramString, boolean paramBoolean) {
    edit();
    this.editor.putBoolean(paramString, paramBoolean);
    return this;
  }
  
  public Preferences putFloat(String paramString, float paramFloat) {
    edit();
    this.editor.putFloat(paramString, paramFloat);
    return this;
  }
  
  public Preferences putInteger(String paramString, int paramInt) {
    edit();
    this.editor.putInt(paramString, paramInt);
    return this;
  }
  
  public Preferences putLong(String paramString, long paramLong) {
    edit();
    this.editor.putLong(paramString, paramLong);
    return this;
  }
  
  public Preferences putString(String paramString1, String paramString2) {
    edit();
    this.editor.putString(paramString1, paramString2);
    return this;
  }
  
  public void remove(String paramString) {
    edit();
    this.editor.remove(paramString);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidPreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */