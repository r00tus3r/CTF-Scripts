package com.badlogic.gdx.net;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;

public class HttpParametersUtils {
  public static String defaultEncoding = "UTF-8";
  
  public static String nameValueSeparator = "=";
  
  public static String parameterSeparator = "&";
  
  static  {
  
  }
  
  public static String convertHttpParameters(Map<String, String> paramMap) {
    Set set = paramMap.keySet();
    StringBuilder stringBuilder = new StringBuilder();
    for (String str : set) {
      stringBuilder.append(encode(str, defaultEncoding));
      stringBuilder.append(nameValueSeparator);
      stringBuilder.append(encode((String)paramMap.get(str), defaultEncoding));
      stringBuilder.append(parameterSeparator);
    } 
    if (stringBuilder.length() > 0)
      stringBuilder.deleteCharAt(stringBuilder.length() - 1); 
    return stringBuilder.toString();
  }
  
  private static String encode(String paramString1, String paramString2) {
    try {
      return URLEncoder.encode(paramString1, paramString2);
    } catch (UnsupportedEncodingException paramString1) {
      throw new IllegalArgumentException(paramString1);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/HttpParametersUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */