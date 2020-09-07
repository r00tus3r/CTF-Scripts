package com.uwsoft.editor.renderer.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CustomVariables {
  private HashMap<String, String> variables = new HashMap();
  
  public int getCount() { return this.variables.size(); }
  
  public Float getFloatVariable(String paramString) {
    try {
      Float float = Float.valueOf(Float.parseFloat((String)this.variables.get(paramString)));
    } catch (Exception paramString) {
      paramString = null;
    } 
    return paramString;
  }
  
  public HashMap<String, String> getHashMap() { return this.variables; }
  
  public Integer getIntegerVariable(String paramString) {
    try {
      Integer integer = Integer.valueOf(Integer.parseInt((String)this.variables.get(paramString)));
    } catch (Exception paramString) {
      paramString = null;
    } 
    return paramString;
  }
  
  public String getStringVariable(String paramString) { return (String)this.variables.get(paramString); }
  
  public void loadFromString(String paramString) {
    this.variables.clear();
    String[] arrayOfString = paramString.split(";");
    for (byte b = 0; b < arrayOfString.length; b++) {
      String[] arrayOfString1 = arrayOfString[b].split(":");
      if (arrayOfString1.length > 1)
        setVariable(arrayOfString1[0], arrayOfString1[1]); 
    } 
  }
  
  public void removeVariable(String paramString) { this.variables.remove(paramString); }
  
  public String saveAsString() {
    Iterator iterator = this.variables.entrySet().iterator();
    String str2;
    for (str2 = ""; iterator.hasNext(); str2 = stringBuilder.toString()) {
      Map.Entry entry = (Map.Entry)iterator.next();
      String str4 = (String)entry.getKey();
      String str3 = (String)entry.getValue();
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str2);
      stringBuilder.append(str4);
      stringBuilder.append(":");
      stringBuilder.append(str3);
      stringBuilder.append(";");
    } 
    String str1 = str2;
    if (str2.length() > 0)
      str1 = str2.substring(0, str2.length() - 1); 
    return str1;
  }
  
  public void setVariable(String paramString1, String paramString2) { this.variables.put(paramString1, paramString2); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/utils/CustomVariables.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */