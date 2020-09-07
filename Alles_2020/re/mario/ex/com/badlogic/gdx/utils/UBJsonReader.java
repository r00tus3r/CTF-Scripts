package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

public class UBJsonReader implements BaseJsonReader {
  public boolean oldFormat = true;
  
  public JsonValue parse(FileHandle paramFileHandle) {
    try {
      return parse(paramFileHandle.read(8192));
    } catch (Exception exception) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error parsing file: ");
      stringBuilder.append(paramFileHandle);
      throw new SerializationException(stringBuilder.toString(), exception);
    } 
  }
  
  public JsonValue parse(DataInputStream paramDataInputStream) throws IOException {
    try {
      return parse(paramDataInputStream, paramDataInputStream.readByte());
    } finally {
      StreamUtils.closeQuietly(paramDataInputStream);
    } 
  }
  
  protected JsonValue parse(DataInputStream paramDataInputStream, byte paramByte) throws IOException {
    if (paramByte == 91)
      return parseArray(paramDataInputStream); 
    if (paramByte == 123)
      return parseObject(paramDataInputStream); 
    if (paramByte == 90)
      return new JsonValue(JsonValue.ValueType.nullValue); 
    if (paramByte == 84)
      return new JsonValue(true); 
    if (paramByte == 70)
      return new JsonValue(false); 
    if (paramByte == 66)
      return new JsonValue(readUChar(paramDataInputStream)); 
    if (paramByte == 85)
      return new JsonValue(readUChar(paramDataInputStream)); 
    if (paramByte == 105) {
      byte b;
      if (this.oldFormat) {
        b = paramDataInputStream.readShort();
      } else {
        b = paramDataInputStream.readByte();
      } 
      return new JsonValue(b);
    } 
    if (paramByte == 73) {
      short s;
      if (this.oldFormat) {
        s = paramDataInputStream.readInt();
      } else {
        s = paramDataInputStream.readShort();
      } 
      return new JsonValue(s);
    } 
    if (paramByte == 108)
      return new JsonValue(paramDataInputStream.readInt()); 
    if (paramByte == 76)
      return new JsonValue(paramDataInputStream.readLong()); 
    if (paramByte == 100)
      return new JsonValue(paramDataInputStream.readFloat()); 
    if (paramByte == 68)
      return new JsonValue(paramDataInputStream.readDouble()); 
    if (paramByte == 115 || paramByte == 83)
      return new JsonValue(parseString(paramDataInputStream, paramByte)); 
    if (paramByte == 97 || paramByte == 65)
      return parseData(paramDataInputStream, paramByte); 
    if (paramByte == 67)
      return new JsonValue(paramDataInputStream.readChar()); 
    throw new GdxRuntimeException("Unrecognized data type");
  }
  
  public JsonValue parse(InputStream paramInputStream) {
    InputStream inputStream1 = null;
    Object object = null;
    dataInputStream = object;
    try {
      iOException = new DataInputStream();
      dataInputStream = object;
      this(paramInputStream);
      try {
        return parse(iOException);
      } catch (IOException dataInputStream) {
        paramInputStream = iOException;
      } finally {
        paramInputStream = null;
      } 
    } catch (IOException iOException) {
      paramInputStream = inputStream1;
    } finally {}
    InputStream inputStream2 = paramInputStream;
    SerializationException serializationException = new SerializationException();
    inputStream2 = paramInputStream;
    this(iOException);
    inputStream2 = paramInputStream;
    throw serializationException;
  }
  
  protected JsonValue parseArray(DataInputStream paramDataInputStream) throws IOException {
    byte b2;
    JsonValue jsonValue1 = new JsonValue(JsonValue.ValueType.array);
    byte b1 = paramDataInputStream.readByte();
    if (b1 == 36) {
      b2 = paramDataInputStream.readByte();
      b1 = paramDataInputStream.readByte();
    } else {
      b2 = 0;
    } 
    long l1 = -1L;
    byte b = b1;
    if (b1 == 35) {
      l1 = parseSize(paramDataInputStream, false, -1L);
      if (l1 >= 0L) {
        if (l1 == 0L)
          return jsonValue1; 
        if (!b2) {
          b = paramDataInputStream.readByte();
        } else {
          b = b2;
        } 
      } else {
        throw new GdxRuntimeException("Unrecognized data type");
      } 
    } 
    JsonValue jsonValue2 = null;
    long l2 = 0L;
    byte b3 = b;
    while (paramDataInputStream.available() > 0 && b3 != 93) {
      JsonValue jsonValue = parse(paramDataInputStream, b3);
      jsonValue.parent = jsonValue1;
      if (jsonValue2 != null) {
        jsonValue.prev = jsonValue2;
        jsonValue2.next = jsonValue;
        jsonValue1.size++;
      } else {
        jsonValue1.child = jsonValue;
        jsonValue1.size = 1;
      } 
      long l = l2;
      if (l1 > 0L) {
        l = ++l2;
        if (l2 >= l1)
          break; 
      } 
      if (b2 == 0) {
        b1 = paramDataInputStream.readByte();
      } else {
        b1 = b2;
      } 
      jsonValue2 = jsonValue;
      b3 = b1;
      l2 = l;
    } 
    return jsonValue1;
  }
  
  protected JsonValue parseData(DataInputStream paramDataInputStream, byte paramByte) throws IOException {
    long l1;
    byte b = paramDataInputStream.readByte();
    if (paramByte == 65) {
      l1 = readUInt(paramDataInputStream);
    } else {
      l1 = readUChar(paramDataInputStream);
    } 
    JsonValue jsonValue1 = new JsonValue(JsonValue.ValueType.array);
    JsonValue jsonValue2 = null;
    long l2 = 0L;
    while (l2 < l1) {
      JsonValue jsonValue = parse(paramDataInputStream, b);
      jsonValue.parent = jsonValue1;
      if (jsonValue2 != null) {
        jsonValue2.next = jsonValue;
        jsonValue1.size++;
      } else {
        jsonValue1.child = jsonValue;
        jsonValue1.size = 1;
      } 
      l2++;
      jsonValue2 = jsonValue;
    } 
    return jsonValue1;
  }
  
  protected JsonValue parseObject(DataInputStream paramDataInputStream) throws IOException {
    byte b2;
    JsonValue jsonValue1 = new JsonValue(JsonValue.ValueType.object);
    byte b1 = paramDataInputStream.readByte();
    if (b1 == 36) {
      b2 = paramDataInputStream.readByte();
      b1 = paramDataInputStream.readByte();
    } else {
      b2 = 0;
    } 
    long l1 = -1L;
    byte b = b1;
    if (b1 == 35) {
      l1 = parseSize(paramDataInputStream, false, -1L);
      if (l1 >= 0L) {
        if (l1 == 0L)
          return jsonValue1; 
        b = paramDataInputStream.readByte();
      } else {
        throw new GdxRuntimeException("Unrecognized data type");
      } 
    } 
    JsonValue jsonValue2 = null;
    long l2 = 0L;
    byte b3 = b;
    while (paramDataInputStream.available() > 0 && b3 != 125) {
      String str = parseString(paramDataInputStream, true, b3);
      if (!b2) {
        b1 = paramDataInputStream.readByte();
        b3 = b1;
      } else {
        b1 = b2;
        b3 = b1;
      } 
      JsonValue jsonValue = parse(paramDataInputStream, b3);
      jsonValue.setName(str);
      jsonValue.parent = jsonValue1;
      if (jsonValue2 != null) {
        jsonValue.prev = jsonValue2;
        jsonValue2.next = jsonValue;
        jsonValue1.size++;
      } else {
        jsonValue1.child = jsonValue;
        jsonValue1.size = 1;
      } 
      long l = l2;
      if (l1 > 0L) {
        l = ++l2;
        if (l2 >= l1)
          break; 
      } 
      b1 = paramDataInputStream.readByte();
      jsonValue2 = jsonValue;
      b3 = b1;
      l2 = l;
    } 
    return jsonValue1;
  }
  
  protected long parseSize(DataInputStream paramDataInputStream, byte paramByte, boolean paramBoolean, long paramLong) throws IOException {
    int i;
    if (paramByte == 105) {
      i = readUChar(paramDataInputStream);
      return i;
    } 
    if (i == 73) {
      i = readUShort(paramDataInputStream);
      return i;
    } 
    return (i == 108) ? readUInt(paramDataInputStream) : ((i == 76) ? paramDataInputStream.readLong() : (paramBoolean ? (((short)i & 0xFF) << 24 | ((short)paramDataInputStream.readByte() & 0xFF) << 16 | ((short)paramDataInputStream.readByte() & 0xFF) << 8 | ((short)paramDataInputStream.readByte() & 0xFF)) : paramLong));
  }
  
  protected long parseSize(DataInputStream paramDataInputStream, boolean paramBoolean, long paramLong) throws IOException { return parseSize(paramDataInputStream, paramDataInputStream.readByte(), paramBoolean, paramLong); }
  
  protected String parseString(DataInputStream paramDataInputStream, byte paramByte) throws IOException { return parseString(paramDataInputStream, false, paramByte); }
  
  protected String parseString(DataInputStream paramDataInputStream, boolean paramBoolean, byte paramByte) throws IOException {
    long l = -1L;
    if (paramByte == 83) {
      l = parseSize(paramDataInputStream, true, -1L);
    } else if (paramByte == 115) {
      l = readUChar(paramDataInputStream);
    } else if (paramBoolean) {
      l = parseSize(paramDataInputStream, paramByte, false, -1L);
    } 
    if (l >= 0L) {
      String str;
      if (l > 0L) {
        str = readString(paramDataInputStream, l);
      } else {
        str = "";
      } 
      return str;
    } 
    throw new GdxRuntimeException("Unrecognized data type, string expected");
  }
  
  protected String readString(DataInputStream paramDataInputStream, long paramLong) throws IOException {
    byte[] arrayOfByte = new byte[(int)paramLong];
    paramDataInputStream.readFully(arrayOfByte);
    return new String(arrayOfByte, "UTF-8");
  }
  
  protected short readUChar(DataInputStream paramDataInputStream) throws IOException { return (short)((short)paramDataInputStream.readByte() & 0xFF); }
  
  protected long readUInt(DataInputStream paramDataInputStream) throws IOException { return paramDataInputStream.readInt() & 0xFFFFFFFFFFFFFFFFL; }
  
  protected int readUShort(DataInputStream paramDataInputStream) throws IOException { return paramDataInputStream.readShort() & 0xFFFF; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/UBJsonReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */