package com.badlogic.gdx.utils;

import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class UBJsonWriter implements Closeable {
  private JsonObject current;
  
  private boolean named;
  
  final DataOutputStream out;
  
  private final Array<JsonObject> stack = new Array();
  
  public UBJsonWriter(OutputStream paramOutputStream) {
    OutputStream outputStream = paramOutputStream;
    if (!(paramOutputStream instanceof DataOutputStream))
      outputStream = new DataOutputStream(paramOutputStream); 
    this.out = (DataOutputStream)outputStream;
  }
  
  private void checkName() {
    JsonObject jsonObject = this.current;
    if (jsonObject != null && !jsonObject.array)
      if (this.named) {
        this.named = false;
      } else {
        throw new IllegalStateException("Name must be set.");
      }  
  }
  
  public UBJsonWriter array() throws IOException {
    JsonObject jsonObject1 = this.current;
    if (jsonObject1 != null && !jsonObject1.array)
      if (this.named) {
        this.named = false;
      } else {
        throw new IllegalStateException("Name must be set.");
      }  
    Array array = this.stack;
    JsonObject jsonObject2 = new JsonObject(true);
    this.current = jsonObject2;
    array.add(jsonObject2);
    return this;
  }
  
  public UBJsonWriter array(String paramString) throws IOException {
    name(paramString).array();
    return this;
  }
  
  public void close() {
    while (this.stack.size > 0)
      pop(); 
    this.out.close();
  }
  
  public void flush() { this.out.flush(); }
  
  public UBJsonWriter name(String paramString) throws IOException {
    JsonObject jsonObject = this.current;
    if (jsonObject != null && !jsonObject.array) {
      byte[] arrayOfByte = paramString.getBytes("UTF-8");
      if (arrayOfByte.length <= 127) {
        this.out.writeByte(105);
        this.out.writeByte(arrayOfByte.length);
      } else if (arrayOfByte.length <= 32767) {
        this.out.writeByte(73);
        this.out.writeShort(arrayOfByte.length);
      } else {
        this.out.writeByte(108);
        this.out.writeInt(arrayOfByte.length);
      } 
      this.out.write(arrayOfByte);
      this.named = true;
      return this;
    } 
    throw new IllegalStateException("Current item must be an object.");
  }
  
  public UBJsonWriter object() throws IOException {
    JsonObject jsonObject = this.current;
    if (jsonObject != null && !jsonObject.array)
      if (this.named) {
        this.named = false;
      } else {
        throw new IllegalStateException("Name must be set.");
      }  
    Array array = this.stack;
    jsonObject = new JsonObject(false);
    this.current = jsonObject;
    array.add(jsonObject);
    return this;
  }
  
  public UBJsonWriter object(String paramString) throws IOException {
    name(paramString).object();
    return this;
  }
  
  public UBJsonWriter pop() throws IOException { return pop(false); }
  
  protected UBJsonWriter pop(boolean paramBoolean) throws IOException {
    if (!this.named) {
      JsonObject jsonObject;
      if (paramBoolean) {
        this.stack.pop();
      } else {
        ((JsonObject)this.stack.pop()).close();
      } 
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
  
  public UBJsonWriter set(String paramString) throws IOException { return name(paramString).value(); }
  
  public UBJsonWriter set(String paramString, byte paramByte) throws IOException { return name(paramString).value(paramByte); }
  
  public UBJsonWriter set(String paramString, char paramChar) throws IOException { return name(paramString).value(paramChar); }
  
  public UBJsonWriter set(String paramString, double paramDouble) throws IOException { return name(paramString).value(paramDouble); }
  
  public UBJsonWriter set(String paramString, float paramFloat) throws IOException { return name(paramString).value(paramFloat); }
  
  public UBJsonWriter set(String paramString, int paramInt) throws IOException { return name(paramString).value(paramInt); }
  
  public UBJsonWriter set(String paramString, long paramLong) throws IOException { return name(paramString).value(paramLong); }
  
  public UBJsonWriter set(String paramString1, String paramString2) throws IOException { return name(paramString1).value(paramString2); }
  
  public UBJsonWriter set(String paramString, short paramShort) throws IOException { return name(paramString).value(paramShort); }
  
  public UBJsonWriter set(String paramString, boolean paramBoolean) throws IOException { return name(paramString).value(paramBoolean); }
  
  public UBJsonWriter set(String paramString, byte[] paramArrayOfByte) throws IOException { return name(paramString).value(paramArrayOfByte); }
  
  public UBJsonWriter set(String paramString, char[] paramArrayOfChar) throws IOException { return name(paramString).value(paramArrayOfChar); }
  
  public UBJsonWriter set(String paramString, double[] paramArrayOfDouble) throws IOException { return name(paramString).value(paramArrayOfDouble); }
  
  public UBJsonWriter set(String paramString, float[] paramArrayOfFloat) throws IOException { return name(paramString).value(paramArrayOfFloat); }
  
  public UBJsonWriter set(String paramString, int[] paramArrayOfInt) throws IOException { return name(paramString).value(paramArrayOfInt); }
  
  public UBJsonWriter set(String paramString, long[] paramArrayOfLong) throws IOException { return name(paramString).value(paramArrayOfLong); }
  
  public UBJsonWriter set(String paramString, String[] paramArrayOfString) throws IOException { return name(paramString).value(paramArrayOfString); }
  
  public UBJsonWriter set(String paramString, short[] paramArrayOfShort) throws IOException { return name(paramString).value(paramArrayOfShort); }
  
  public UBJsonWriter set(String paramString, boolean[] paramArrayOfBoolean) throws IOException { return name(paramString).value(paramArrayOfBoolean); }
  
  public UBJsonWriter value() throws IOException {
    checkName();
    this.out.writeByte(90);
    return this;
  }
  
  public UBJsonWriter value(byte paramByte) throws IOException {
    checkName();
    this.out.writeByte(105);
    this.out.writeByte(paramByte);
    return this;
  }
  
  public UBJsonWriter value(char paramChar) throws IOException {
    checkName();
    this.out.writeByte(73);
    this.out.writeChar(paramChar);
    return this;
  }
  
  public UBJsonWriter value(double paramDouble) throws IOException {
    checkName();
    this.out.writeByte(68);
    this.out.writeDouble(paramDouble);
    return this;
  }
  
  public UBJsonWriter value(float paramFloat) throws IOException {
    checkName();
    this.out.writeByte(100);
    this.out.writeFloat(paramFloat);
    return this;
  }
  
  public UBJsonWriter value(int paramInt) throws IOException {
    checkName();
    this.out.writeByte(108);
    this.out.writeInt(paramInt);
    return this;
  }
  
  public UBJsonWriter value(long paramLong) throws IOException {
    checkName();
    this.out.writeByte(76);
    this.out.writeLong(paramLong);
    return this;
  }
  
  public UBJsonWriter value(JsonValue paramJsonValue) throws IOException {
    if (paramJsonValue.isObject()) {
      if (paramJsonValue.name != null) {
        object(paramJsonValue.name);
      } else {
        object();
      } 
      for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next)
        value(paramJsonValue); 
      pop();
    } else if (paramJsonValue.isArray()) {
      if (paramJsonValue.name != null) {
        array(paramJsonValue.name);
      } else {
        array();
      } 
      for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next)
        value(paramJsonValue); 
      pop();
    } else if (paramJsonValue.isBoolean()) {
      if (paramJsonValue.name != null)
        name(paramJsonValue.name); 
      value(paramJsonValue.asBoolean());
    } else if (paramJsonValue.isDouble()) {
      if (paramJsonValue.name != null)
        name(paramJsonValue.name); 
      value(paramJsonValue.asDouble());
    } else if (paramJsonValue.isLong()) {
      if (paramJsonValue.name != null)
        name(paramJsonValue.name); 
      value(paramJsonValue.asLong());
    } else if (paramJsonValue.isString()) {
      if (paramJsonValue.name != null)
        name(paramJsonValue.name); 
      value(paramJsonValue.asString());
    } else {
      if (paramJsonValue.isNull()) {
        if (paramJsonValue.name != null)
          name(paramJsonValue.name); 
        value();
        return this;
      } 
      IOException iOException = new IOException("Unhandled JsonValue type");
      throw iOException;
    } 
    return this;
  }
  
  public UBJsonWriter value(Object paramObject) throws IOException {
    if (paramObject == null)
      return value(); 
    if (paramObject instanceof Number) {
      Number number = (Number)paramObject;
      return (paramObject instanceof Byte) ? value(number.byteValue()) : ((paramObject instanceof Short) ? value(number.shortValue()) : ((paramObject instanceof Integer) ? value(number.intValue()) : ((paramObject instanceof Long) ? value(number.longValue()) : ((paramObject instanceof Float) ? value(number.floatValue()) : ((paramObject instanceof Double) ? value(number.doubleValue()) : this)))));
    } 
    if (paramObject instanceof Character)
      return value(((Character)paramObject).charValue()); 
    if (paramObject instanceof CharSequence)
      return value(paramObject.toString()); 
    throw new IOException("Unknown object type.");
  }
  
  public UBJsonWriter value(String paramString) throws IOException {
    checkName();
    byte[] arrayOfByte = paramString.getBytes("UTF-8");
    this.out.writeByte(83);
    if (arrayOfByte.length <= 127) {
      this.out.writeByte(105);
      this.out.writeByte(arrayOfByte.length);
    } else if (arrayOfByte.length <= 32767) {
      this.out.writeByte(73);
      this.out.writeShort(arrayOfByte.length);
    } else {
      this.out.writeByte(108);
      this.out.writeInt(arrayOfByte.length);
    } 
    this.out.write(arrayOfByte);
    return this;
  }
  
  public UBJsonWriter value(short paramShort) throws IOException {
    checkName();
    this.out.writeByte(73);
    this.out.writeShort(paramShort);
    return this;
  }
  
  public UBJsonWriter value(boolean paramBoolean) throws IOException {
    byte b;
    checkName();
    DataOutputStream dataOutputStream = this.out;
    if (paramBoolean) {
      b = 84;
    } else {
      b = 70;
    } 
    dataOutputStream.writeByte(b);
    return this;
  }
  
  public UBJsonWriter value(byte[] paramArrayOfByte) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(105);
    this.out.writeByte(35);
    value(paramArrayOfByte.length);
    int i = paramArrayOfByte.length;
    for (byte b = 0; b < i; b++)
      this.out.writeByte(paramArrayOfByte[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(char[] paramArrayOfChar) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(67);
    this.out.writeByte(35);
    value(paramArrayOfChar.length);
    int i = paramArrayOfChar.length;
    for (byte b = 0; b < i; b++)
      this.out.writeChar(paramArrayOfChar[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(double[] paramArrayOfDouble) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(68);
    this.out.writeByte(35);
    value(paramArrayOfDouble.length);
    int i = paramArrayOfDouble.length;
    for (byte b = 0; b < i; b++)
      this.out.writeDouble(paramArrayOfDouble[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(float[] paramArrayOfFloat) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(100);
    this.out.writeByte(35);
    value(paramArrayOfFloat.length);
    int i = paramArrayOfFloat.length;
    for (byte b = 0; b < i; b++)
      this.out.writeFloat(paramArrayOfFloat[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(int[] paramArrayOfInt) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(108);
    this.out.writeByte(35);
    value(paramArrayOfInt.length);
    int i = paramArrayOfInt.length;
    for (byte b = 0; b < i; b++)
      this.out.writeInt(paramArrayOfInt[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(long[] paramArrayOfLong) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(76);
    this.out.writeByte(35);
    value(paramArrayOfLong.length);
    int i = paramArrayOfLong.length;
    for (byte b = 0; b < i; b++)
      this.out.writeLong(paramArrayOfLong[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(String[] paramArrayOfString) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(83);
    this.out.writeByte(35);
    value(paramArrayOfString.length);
    int i = paramArrayOfString.length;
    for (byte b = 0; b < i; b++) {
      byte[] arrayOfByte = paramArrayOfString[b].getBytes("UTF-8");
      if (arrayOfByte.length <= 127) {
        this.out.writeByte(105);
        this.out.writeByte(arrayOfByte.length);
      } else if (arrayOfByte.length <= 32767) {
        this.out.writeByte(73);
        this.out.writeShort(arrayOfByte.length);
      } else {
        this.out.writeByte(108);
        this.out.writeInt(arrayOfByte.length);
      } 
      this.out.write(arrayOfByte);
    } 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(short[] paramArrayOfShort) throws IOException {
    array();
    this.out.writeByte(36);
    this.out.writeByte(73);
    this.out.writeByte(35);
    value(paramArrayOfShort.length);
    int i = paramArrayOfShort.length;
    for (byte b = 0; b < i; b++)
      this.out.writeShort(paramArrayOfShort[b]); 
    pop(true);
    return this;
  }
  
  public UBJsonWriter value(boolean[] paramArrayOfBoolean) throws IOException {
    array();
    int i = paramArrayOfBoolean.length;
    for (byte b = 0; b < i; b++) {
      byte b1;
      DataOutputStream dataOutputStream = this.out;
      if (paramArrayOfBoolean[b]) {
        b1 = 84;
      } else {
        b1 = 70;
      } 
      dataOutputStream.writeByte(b1);
    } 
    pop();
    return this;
  }
  
  private class JsonObject {
    final boolean array;
    
    JsonObject(boolean param1Boolean) throws IOException {
      this.array = param1Boolean;
      DataOutputStream dataOutputStream = UBJsonWriter.this.out;
      if (param1Boolean) {
        b = 91;
      } else {
        b = 123;
      } 
      dataOutputStream.writeByte(b);
    }
    
    void close() {
      byte b;
      DataOutputStream dataOutputStream = UBJsonWriter.this.out;
      if (this.array) {
        b = 93;
      } else {
        b = 125;
      } 
      dataOutputStream.writeByte(b);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/UBJsonWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */