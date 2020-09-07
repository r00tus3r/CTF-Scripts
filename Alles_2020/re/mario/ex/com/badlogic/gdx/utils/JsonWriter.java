package com.badlogic.gdx.utils;

import java.io.IOException;
import java.io.Writer;
import java.util.regex.Pattern;

public class JsonWriter extends Writer {
  private JsonObject current;
  
  private boolean named;
  
  private OutputType outputType = OutputType.json;
  
  private boolean quoteLongValues = false;
  
  private final Array<JsonObject> stack = new Array();
  
  final Writer writer;
  
  public JsonWriter(Writer paramWriter) { this.writer = paramWriter; }
  
  private void requireCommaOrName() throws IOException {
    JsonObject jsonObject = this.current;
    if (jsonObject == null)
      return; 
    if (jsonObject.array) {
      if (!this.current.needsComma) {
        this.current.needsComma = true;
      } else {
        this.writer.write(44);
      } 
    } else {
      if (this.named) {
        this.named = false;
        return;
      } 
      throw new IllegalStateException("Name must be set.");
    } 
  }
  
  public JsonWriter array() throws IOException {
    requireCommaOrName();
    Array array = this.stack;
    JsonObject jsonObject = new JsonObject(true);
    this.current = jsonObject;
    array.add(jsonObject);
    return this;
  }
  
  public JsonWriter array(String paramString) throws IOException { return name(paramString).array(); }
  
  public void close() throws IOException {
    while (this.stack.size > 0)
      pop(); 
    this.writer.close();
  }
  
  public void flush() throws IOException { this.writer.flush(); }
  
  public Writer getWriter() { return this.writer; }
  
  public JsonWriter json(String paramString) throws IOException {
    requireCommaOrName();
    this.writer.write(paramString);
    return this;
  }
  
  public JsonWriter json(String paramString1, String paramString2) throws IOException { return name(paramString1).json(paramString2); }
  
  public JsonWriter name(String paramString) throws IOException {
    JsonObject jsonObject = this.current;
    if (jsonObject != null && !jsonObject.array) {
      if (!this.current.needsComma) {
        this.current.needsComma = true;
      } else {
        this.writer.write(44);
      } 
      this.writer.write(this.outputType.quoteName(paramString));
      this.writer.write(58);
      this.named = true;
      return this;
    } 
    throw new IllegalStateException("Current item must be an object.");
  }
  
  public JsonWriter object() throws IOException {
    requireCommaOrName();
    Array array = this.stack;
    JsonObject jsonObject = new JsonObject(false);
    this.current = jsonObject;
    array.add(jsonObject);
    return this;
  }
  
  public JsonWriter object(String paramString) throws IOException { return name(paramString).object(); }
  
  public JsonWriter pop() throws IOException {
    if (!this.named) {
      JsonObject jsonObject;
      ((JsonObject)this.stack.pop()).close();
      if (this.stack.size == 0) {
        jsonObject = null;
      } else {
        jsonObject = (JsonObject)this.stack.peek();
      } 
      this.current = jsonObject;
      return this;
    } 
    throw new IllegalStateException("Expected an object, array, or value since a name was set.");
  }
  
  public JsonWriter set(String paramString, Object paramObject) throws IOException { return name(paramString).value(paramObject); }
  
  public void setOutputType(OutputType paramOutputType) { this.outputType = paramOutputType; }
  
  public void setQuoteLongValues(boolean paramBoolean) { this.quoteLongValues = paramBoolean; }
  
  public JsonWriter value(Object paramObject) throws IOException {
    Object object;
    if (this.quoteLongValues && (paramObject instanceof Long || paramObject instanceof Double || paramObject instanceof java.math.BigDecimal || paramObject instanceof java.math.BigInteger)) {
      object = paramObject.toString();
    } else {
      object = paramObject;
      if (paramObject instanceof Number) {
        Number number = (Number)paramObject;
        long l = number.longValue();
        object = paramObject;
        if (number.doubleValue() == l)
          object = Long.valueOf(l); 
      } 
    } 
    requireCommaOrName();
    this.writer.write(this.outputType.quoteValue(object));
    return this;
  }
  
  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2) throws IOException { this.writer.write(paramArrayOfChar, paramInt1, paramInt2); }
  
  private class JsonObject {
    final boolean array;
    
    boolean needsComma;
    
    JsonObject(boolean param1Boolean) throws IOException {
      this.array = param1Boolean;
      Writer writer = JsonWriter.this.writer;
      if (param1Boolean) {
        b = 91;
      } else {
        b = 123;
      } 
      writer.write(b);
    }
    
    void close() throws IOException {
      byte b;
      Writer writer = JsonWriter.this.writer;
      if (this.array) {
        b = 93;
      } else {
        b = 125;
      } 
      writer.write(b);
    }
  }
  
  public enum OutputType {
    javascript, json, minimal;
    
    private static Pattern javascriptPattern;
    
    private static Pattern minimalNamePattern;
    
    private static Pattern minimalValuePattern;
    
    static  {
      javascript = new OutputType("javascript", true);
      minimal = new OutputType("minimal", 2);
      $VALUES = new OutputType[] { json, javascript, minimal };
      minimalValuePattern = (minimalNamePattern = (javascriptPattern = Pattern.compile("^[a-zA-Z_$][a-zA-Z_$0-9]*$")).compile("^[^\":,}/ ][^:]*$")).compile("^[^\":,{\\[\\]/ ][^}\\],]*$");
    }
    
    public String quoteName(String param1String) {
      StringBuilder stringBuilder1 = new StringBuilder(param1String);
      stringBuilder1.replace('\\', "\\\\").replace('\r', "\\r").replace('\n', "\\n").replace('\t', "\\t");
      int i = JsonWriter.null.$SwitchMap$com$badlogic$gdx$utils$JsonWriter$OutputType[ordinal()];
      if (i != 1) {
        if (i != 2) {
          stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append('"');
          stringBuilder.append(stringBuilder1.replace('"', "\\\"").toString());
          stringBuilder.append('"');
          return stringBuilder.toString();
        } 
      } else if (!stringBuilder.contains("//") && !stringBuilder.contains("/*") && minimalNamePattern.matcher(stringBuilder1).matches()) {
        return stringBuilder1.toString();
      } 
      if (javascriptPattern.matcher(stringBuilder1).matches())
        return stringBuilder1.toString(); 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append('"');
      stringBuilder.append(stringBuilder1.replace('"', "\\\"").toString());
      stringBuilder.append('"');
      return stringBuilder.toString();
    }
    
    public String quoteValue(Object param1Object) {
      if (param1Object == null)
        return "null"; 
      String str = param1Object.toString();
      if (param1Object instanceof Number || param1Object instanceof Boolean)
        return str; 
      param1Object = new StringBuilder(str);
      param1Object.replace('\\', "\\\\").replace('\r', "\\r").replace('\n', "\\n").replace('\t', "\\t");
      if (this == minimal && !str.equals("true") && !str.equals("false") && !str.equals("null") && !str.contains("//") && !str.contains("/*")) {
        int i = param1Object.length();
        if (i > 0 && param1Object.charAt(i - 1) != ' ' && minimalValuePattern.matcher(param1Object).matches())
          return param1Object.toString(); 
      } 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append('"');
      stringBuilder.append(param1Object.replace('"', "\\\"").toString());
      stringBuilder.append('"');
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/JsonWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */