package com.badlogic.gdx.utils;

import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class JsonValue extends Object implements Iterable<JsonValue> {
  public JsonValue child;
  
  private double doubleValue;
  
  private long longValue;
  
  public String name;
  
  public JsonValue next;
  
  public JsonValue parent;
  
  public JsonValue prev;
  
  public int size;
  
  private String stringValue;
  
  private ValueType type;
  
  public JsonValue(double paramDouble) { set(paramDouble, null); }
  
  public JsonValue(double paramDouble, String paramString) { set(paramDouble, paramString); }
  
  public JsonValue(long paramLong) { set(paramLong, null); }
  
  public JsonValue(long paramLong, String paramString) { set(paramLong, paramString); }
  
  public JsonValue(ValueType paramValueType) { this.type = paramValueType; }
  
  public JsonValue(String paramString) { set(paramString); }
  
  public JsonValue(boolean paramBoolean) { set(paramBoolean); }
  
  private static void indent(int paramInt, StringBuilder paramStringBuilder) {
    for (byte b = 0; b < paramInt; b++)
      paramStringBuilder.append('\t'); 
  }
  
  private static void indent(int paramInt, Writer paramWriter) throws IOException {
    for (byte b = 0; b < paramInt; b++)
      paramWriter.append('\t'); 
  }
  
  private static boolean isFlat(JsonValue paramJsonValue) {
    for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
      if (paramJsonValue.isObject() || paramJsonValue.isArray())
        return false; 
    } 
    return true;
  }
  
  private static boolean isNumeric(JsonValue paramJsonValue) {
    for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
      if (!paramJsonValue.isNumber())
        return false; 
    } 
    return true;
  }
  
  private void json(JsonValue paramJsonValue, StringBuilder paramStringBuilder, JsonWriter.OutputType paramOutputType) {
    if (paramJsonValue.isObject()) {
      if (paramJsonValue.child == null) {
        paramStringBuilder.append("{}");
      } else {
        paramStringBuilder.length();
        paramStringBuilder.append('{');
        for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
          paramStringBuilder.append(paramOutputType.quoteName(paramJsonValue.name));
          paramStringBuilder.append(':');
          json(paramJsonValue, paramStringBuilder, paramOutputType);
          if (paramJsonValue.next != null)
            paramStringBuilder.append(','); 
        } 
        paramStringBuilder.append('}');
      } 
    } else if (paramJsonValue.isArray()) {
      if (paramJsonValue.child == null) {
        paramStringBuilder.append("[]");
      } else {
        paramStringBuilder.length();
        paramStringBuilder.append('[');
        for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
          json(paramJsonValue, paramStringBuilder, paramOutputType);
          if (paramJsonValue.next != null)
            paramStringBuilder.append(','); 
        } 
        paramStringBuilder.append(']');
      } 
    } else if (paramJsonValue.isString()) {
      paramStringBuilder.append(paramOutputType.quoteValue(paramJsonValue.asString()));
    } else if (paramJsonValue.isDouble()) {
      double d1 = paramJsonValue.asDouble();
      double d2 = paramJsonValue.asLong();
      double d3 = d1;
      if (d1 == d2)
        d3 = d2; 
      paramStringBuilder.append(d3);
    } else if (paramJsonValue.isLong()) {
      paramStringBuilder.append(paramJsonValue.asLong());
    } else if (paramJsonValue.isBoolean()) {
      paramStringBuilder.append(paramJsonValue.asBoolean());
    } else {
      if (paramJsonValue.isNull()) {
        paramStringBuilder.append("null");
        return;
      } 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Unknown object type: ");
      stringBuilder.append(paramJsonValue);
      SerializationException serializationException = new SerializationException(stringBuilder.toString());
      throw serializationException;
    } 
  }
  
  private void prettyPrint(JsonValue paramJsonValue, StringBuilder paramStringBuilder, int paramInt, PrettyPrintSettings paramPrettyPrintSettings) {
    JsonWriter.OutputType outputType = paramPrettyPrintSettings.outputType;
    if (paramJsonValue.isObject()) {
      if (paramJsonValue.child == null) {
        paramStringBuilder.append("{}");
      } else {
        boolean bool = isFlat(paramJsonValue) ^ true;
        int i = paramStringBuilder.length();
        label102: while (true) {
          String str;
          if (bool) {
            str = "{\n";
          } else {
            str = "{ ";
          } 
          paramStringBuilder.append(str);
          for (JsonValue jsonValue = paramJsonValue.child; jsonValue != null; jsonValue = jsonValue.next) {
            char c;
            if (bool)
              indent(paramInt, paramStringBuilder); 
            paramStringBuilder.append(outputType.quoteName(jsonValue.name));
            paramStringBuilder.append(": ");
            prettyPrint(jsonValue, paramStringBuilder, paramInt + 1, paramPrettyPrintSettings);
            if ((!bool || outputType != JsonWriter.OutputType.minimal) && jsonValue.next != null)
              paramStringBuilder.append(','); 
            if (bool) {
              byte b = 10;
              c = b;
            } else {
              byte b = 32;
              c = b;
            } 
            paramStringBuilder.append(c);
            if (!bool && paramStringBuilder.length() - i > paramPrettyPrintSettings.singleLineColumns) {
              paramStringBuilder.setLength(i);
              bool = true;
              continue label102;
            } 
          } 
          break;
        } 
        if (bool)
          indent(paramInt - 1, paramStringBuilder); 
        paramStringBuilder.append('}');
      } 
    } else if (paramJsonValue.isArray()) {
      if (paramJsonValue.child == null) {
        paramStringBuilder.append("[]");
      } else {
        boolean bool;
        boolean bool1 = isFlat(paramJsonValue) ^ true;
        if (paramPrettyPrintSettings.wrapNumericArrays || !isNumeric(paramJsonValue)) {
          bool = true;
        } else {
          bool = false;
        } 
        int i = paramStringBuilder.length();
        label103: while (true) {
          String str;
          if (bool1) {
            str = "[\n";
          } else {
            str = "[ ";
          } 
          paramStringBuilder.append(str);
          for (JsonValue jsonValue = paramJsonValue.child; jsonValue != null; jsonValue = jsonValue.next) {
            char c;
            if (bool1)
              indent(paramInt, paramStringBuilder); 
            prettyPrint(jsonValue, paramStringBuilder, paramInt + 1, paramPrettyPrintSettings);
            if ((!bool1 || outputType != JsonWriter.OutputType.minimal) && jsonValue.next != null)
              paramStringBuilder.append(','); 
            if (bool1) {
              byte b = 10;
              c = b;
            } else {
              byte b = 32;
              c = b;
            } 
            paramStringBuilder.append(c);
            if (bool && !bool1 && paramStringBuilder.length() - i > paramPrettyPrintSettings.singleLineColumns) {
              paramStringBuilder.setLength(i);
              bool1 = true;
              continue label103;
            } 
          } 
          break;
        } 
        if (bool1)
          indent(paramInt - 1, paramStringBuilder); 
        paramStringBuilder.append(']');
      } 
    } else if (paramJsonValue.isString()) {
      paramStringBuilder.append(outputType.quoteValue(paramJsonValue.asString()));
    } else if (paramJsonValue.isDouble()) {
      double d1 = paramJsonValue.asDouble();
      double d2 = paramJsonValue.asLong();
      double d3 = d1;
      if (d1 == d2)
        d3 = d2; 
      paramStringBuilder.append(d3);
    } else if (paramJsonValue.isLong()) {
      paramStringBuilder.append(paramJsonValue.asLong());
    } else if (paramJsonValue.isBoolean()) {
      paramStringBuilder.append(paramJsonValue.asBoolean());
    } else {
      if (paramJsonValue.isNull()) {
        paramStringBuilder.append("null");
        return;
      } 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Unknown object type: ");
      stringBuilder.append(paramJsonValue);
      SerializationException serializationException = new SerializationException(stringBuilder.toString());
      throw serializationException;
    } 
  }
  
  private void prettyPrint(JsonValue paramJsonValue, Writer paramWriter, int paramInt, PrettyPrintSettings paramPrettyPrintSettings) throws IOException {
    JsonWriter.OutputType outputType = paramPrettyPrintSettings.outputType;
    if (paramJsonValue.isObject()) {
      if (paramJsonValue.child == null) {
        paramWriter.append("{}");
      } else {
        String str;
        boolean bool;
        if (!isFlat(paramJsonValue) || paramJsonValue.size > 6) {
          bool = true;
        } else {
          bool = false;
        } 
        if (bool) {
          str = "{\n";
        } else {
          str = "{ ";
        } 
        paramWriter.append(str);
        for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
          char c;
          if (bool)
            indent(paramInt, paramWriter); 
          paramWriter.append(outputType.quoteName(paramJsonValue.name));
          paramWriter.append(": ");
          prettyPrint(paramJsonValue, paramWriter, paramInt + 1, paramPrettyPrintSettings);
          if ((!bool || outputType != JsonWriter.OutputType.minimal) && paramJsonValue.next != null)
            paramWriter.append(','); 
          if (bool) {
            byte b = 10;
            c = b;
          } else {
            byte b = 32;
            c = b;
          } 
          paramWriter.append(c);
        } 
        if (bool)
          indent(paramInt - 1, paramWriter); 
        paramWriter.append('}');
      } 
    } else if (paramJsonValue.isArray()) {
      if (paramJsonValue.child == null) {
        paramWriter.append("[]");
      } else {
        String str;
        boolean bool = isFlat(paramJsonValue) ^ true;
        if (bool) {
          str = "[\n";
        } else {
          str = "[ ";
        } 
        paramWriter.append(str);
        for (paramJsonValue = paramJsonValue.child; paramJsonValue != null; paramJsonValue = paramJsonValue.next) {
          char c;
          if (bool)
            indent(paramInt, paramWriter); 
          prettyPrint(paramJsonValue, paramWriter, paramInt + 1, paramPrettyPrintSettings);
          if ((!bool || outputType != JsonWriter.OutputType.minimal) && paramJsonValue.next != null)
            paramWriter.append(','); 
          if (bool) {
            byte b = 10;
            c = b;
          } else {
            byte b = 32;
            c = b;
          } 
          paramWriter.append(c);
        } 
        if (bool)
          indent(paramInt - 1, paramWriter); 
        paramWriter.append(']');
      } 
    } else if (paramJsonValue.isString()) {
      paramWriter.append(outputType.quoteValue(paramJsonValue.asString()));
    } else if (paramJsonValue.isDouble()) {
      double d1 = paramJsonValue.asDouble();
      double d2 = paramJsonValue.asLong();
      double d3 = d1;
      if (d1 == d2)
        d3 = d2; 
      paramWriter.append(Double.toString(d3));
    } else if (paramJsonValue.isLong()) {
      paramWriter.append(Long.toString(paramJsonValue.asLong()));
    } else if (paramJsonValue.isBoolean()) {
      paramWriter.append(Boolean.toString(paramJsonValue.asBoolean()));
    } else {
      if (paramJsonValue.isNull()) {
        paramWriter.append("null");
        return;
      } 
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Unknown object type: ");
      stringBuilder.append(paramJsonValue);
      SerializationException serializationException = new SerializationException(stringBuilder.toString());
      throw serializationException;
    } 
  }
  
  public void addChild(JsonValue paramJsonValue) {
    paramJsonValue.parent = this;
    JsonValue jsonValue1 = this.child;
    JsonValue jsonValue2 = jsonValue1;
    if (jsonValue1 == null) {
      this.child = paramJsonValue;
      return;
    } 
    while (true) {
      jsonValue1 = jsonValue2.next;
      if (jsonValue1 == null) {
        jsonValue2.next = paramJsonValue;
        return;
      } 
      jsonValue2 = jsonValue1;
    } 
  }
  
  public void addChild(String paramString, JsonValue paramJsonValue) {
    if (paramString != null) {
      paramJsonValue.name = paramString;
      addChild(paramJsonValue);
      return;
    } 
    throw new IllegalArgumentException("name cannot be null.");
  }
  
  public boolean asBoolean() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    boolean bool1 = true;
    boolean bool2 = true;
    boolean bool = true;
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            if (this.longValue == 0L)
              bool = false; 
            return bool;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to boolean: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        if (this.longValue != 0L) {
          bool = bool1;
        } else {
          bool = false;
        } 
        return bool;
      } 
      if (this.doubleValue != 0.0D) {
        bool = bool2;
      } else {
        bool = false;
      } 
      return bool;
    } 
    return this.stringValue.equalsIgnoreCase("true");
  }
  
  public boolean[] asBooleanArray() { // Byte code:
    //   0: aload_0
    //   1: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   4: getstatic com/badlogic/gdx/utils/JsonValue$ValueType.array : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   7: if_acmpne -> 174
    //   10: aload_0
    //   11: getfield size : I
    //   14: newarray boolean
    //   16: astore_1
    //   17: aload_0
    //   18: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   21: astore_2
    //   22: iconst_0
    //   23: istore_3
    //   24: aload_2
    //   25: ifnull -> 172
    //   28: getstatic com/badlogic/gdx/utils/JsonValue$1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType : [I
    //   31: aload_2
    //   32: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   35: invokevirtual ordinal : ()I
    //   38: iaload
    //   39: istore #4
    //   41: iload #4
    //   43: iconst_1
    //   44: if_icmpeq -> 147
    //   47: iload #4
    //   49: iconst_2
    //   50: if_icmpeq -> 135
    //   53: iload #4
    //   55: iconst_3
    //   56: if_icmpeq -> 123
    //   59: iload #4
    //   61: iconst_4
    //   62: if_icmpne -> 86
    //   65: aload_2
    //   66: getfield longValue : J
    //   69: lconst_0
    //   70: lcmp
    //   71: ifeq -> 80
    //   74: iconst_1
    //   75: istore #5
    //   77: goto -> 156
    //   80: iconst_0
    //   81: istore #5
    //   83: goto -> 156
    //   86: new java/lang/StringBuilder
    //   89: dup
    //   90: invokespecial <init> : ()V
    //   93: astore_1
    //   94: aload_1
    //   95: ldc_w 'Value cannot be converted to boolean: '
    //   98: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: pop
    //   102: aload_1
    //   103: aload_2
    //   104: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   107: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   110: pop
    //   111: new java/lang/IllegalStateException
    //   114: dup
    //   115: aload_1
    //   116: invokevirtual toString : ()Ljava/lang/String;
    //   119: invokespecial <init> : (Ljava/lang/String;)V
    //   122: athrow
    //   123: aload_2
    //   124: getfield longValue : J
    //   127: lconst_0
    //   128: lcmp
    //   129: ifne -> 80
    //   132: goto -> 74
    //   135: aload_2
    //   136: getfield doubleValue : D
    //   139: dconst_0
    //   140: dcmpl
    //   141: ifne -> 80
    //   144: goto -> 74
    //   147: aload_2
    //   148: getfield stringValue : Ljava/lang/String;
    //   151: invokestatic parseBoolean : (Ljava/lang/String;)Z
    //   154: istore #5
    //   156: aload_1
    //   157: iload_3
    //   158: iload #5
    //   160: bastore
    //   161: aload_2
    //   162: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   165: astore_2
    //   166: iinc #3, 1
    //   169: goto -> 24
    //   172: aload_1
    //   173: areturn
    //   174: new java/lang/StringBuilder
    //   177: dup
    //   178: invokespecial <init> : ()V
    //   181: astore_2
    //   182: aload_2
    //   183: ldc_w 'Value is not an array: '
    //   186: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   189: pop
    //   190: aload_2
    //   191: aload_0
    //   192: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   195: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   198: pop
    //   199: new java/lang/IllegalStateException
    //   202: dup
    //   203: aload_2
    //   204: invokevirtual toString : ()Ljava/lang/String;
    //   207: invokespecial <init> : (Ljava/lang/String;)V
    //   210: astore_2
    //   211: goto -> 216
    //   214: aload_2
    //   215: athrow
    //   216: goto -> 214 }
  
  public byte asByte() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    boolean bool = true;
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            int j;
            if (this.longValue != 0L) {
              j = bool;
            } else {
              i = 0;
              j = i;
            } 
            return j;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to byte: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return (byte)(int)this.longValue;
      } 
      return (byte)(int)this.doubleValue;
    } 
    return Byte.parseByte(this.stringValue);
  }
  
  public byte[] asByteArray() {
    if (this.type == ValueType.array) {
      java.lang.StringBuilder stringBuilder1 = new byte[this.size];
      JsonValue jsonValue = this.child;
      for (byte b = 0; jsonValue != null; b++) {
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i == 4) {
                if (jsonValue.longValue != 0L) {
                  i = 1;
                } else {
                  i = 0;
                } 
              } else {
                stringBuilder1 = new java.lang.StringBuilder();
                stringBuilder1.append("Value cannot be converted to byte: ");
                stringBuilder1.append(jsonValue.type);
                throw new IllegalStateException(stringBuilder1.toString());
              } 
            } else {
              i = (int)jsonValue.longValue;
              i = (byte)i;
            } 
          } else {
            i = (int)jsonValue.doubleValue;
            i = (byte)i;
          } 
        } else {
          i = Byte.parseByte(jsonValue.stringValue);
        } 
        stringBuilder1[b] = (byte)i;
        jsonValue = jsonValue.next;
      } 
      return stringBuilder1;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public char asChar() {
    int j;
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    boolean bool1 = true;
    boolean bool2 = false;
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            if (this.longValue != 0L) {
              j = bool1;
            } else {
              i = 0;
              j = i;
            } 
            return j;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to char: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return (char)(int)this.longValue;
      } 
      return (char)(int)this.doubleValue;
    } 
    if (this.stringValue.length() == 0) {
      j = bool2;
    } else {
      i = this.stringValue.charAt(0);
      j = i;
    } 
    return j;
  }
  
  public char[] asCharArray() {
    if (this.type == ValueType.array) {
      java.lang.StringBuilder stringBuilder1 = new char[this.size];
      JsonValue jsonValue = this.child;
      for (byte b = 0; jsonValue != null; b++) {
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i == 4) {
                if (jsonValue.longValue != 0L) {
                  i = 1;
                  continue;
                } 
              } else {
                stringBuilder1 = new java.lang.StringBuilder();
                stringBuilder1.append("Value cannot be converted to char: ");
                stringBuilder1.append(jsonValue.type);
                throw new IllegalStateException(stringBuilder1.toString());
              } 
            } else {
              i = (int)jsonValue.longValue;
              i = (char)i;
            } 
          } else {
            i = (int)jsonValue.doubleValue;
            i = (char)i;
          } 
        } else if (jsonValue.stringValue.length() != 0) {
          i = jsonValue.stringValue.charAt(0);
          continue;
        } 
        i = 0;
        continue;
        stringBuilder1[b] = (char)SYNTHETIC_LOCAL_VARIABLE_4;
        jsonValue = jsonValue.next;
      } 
      return stringBuilder1;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public double asDouble() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            double d;
            if (this.longValue != 0L) {
              d = 1.0D;
            } else {
              d = 0.0D;
            } 
            return d;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to double: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return this.longValue;
      } 
      return this.doubleValue;
    } 
    return Double.parseDouble(this.stringValue);
  }
  
  public double[] asDoubleArray() {
    if (this.type == ValueType.array) {
      java.lang.StringBuilder stringBuilder1 = new double[this.size];
      byte b = 0;
      JsonValue jsonValue = this.child;
      while (jsonValue != null) {
        double d;
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i == 4) {
                if (jsonValue.longValue != 0L) {
                  d = 1.0D;
                } else {
                  d = 0.0D;
                } 
              } else {
                stringBuilder1 = new java.lang.StringBuilder();
                stringBuilder1.append("Value cannot be converted to double: ");
                stringBuilder1.append(jsonValue.type);
                throw new IllegalStateException(stringBuilder1.toString());
              } 
            } else {
              d = jsonValue.longValue;
            } 
          } else {
            d = jsonValue.doubleValue;
          } 
        } else {
          d = Double.parseDouble(jsonValue.stringValue);
        } 
        stringBuilder1[b] = d;
        jsonValue = jsonValue.next;
        b++;
      } 
      return stringBuilder1;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public float asFloat() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            float f;
            if (this.longValue != 0L) {
              f = 1.0F;
            } else {
              f = 0.0F;
            } 
            return f;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to float: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return (float)this.longValue;
      } 
      return (float)this.doubleValue;
    } 
    return Float.parseFloat(this.stringValue);
  }
  
  public float[] asFloatArray() {
    if (this.type == ValueType.array) {
      java.lang.StringBuilder stringBuilder1 = new float[this.size];
      byte b = 0;
      JsonValue jsonValue = this.child;
      while (jsonValue != null) {
        float f;
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i == 4) {
                if (jsonValue.longValue != 0L) {
                  f = 1.0F;
                } else {
                  f = 0.0F;
                } 
              } else {
                stringBuilder1 = new java.lang.StringBuilder();
                stringBuilder1.append("Value cannot be converted to float: ");
                stringBuilder1.append(jsonValue.type);
                throw new IllegalStateException(stringBuilder1.toString());
              } 
            } else {
              f = (float)jsonValue.longValue;
            } 
          } else {
            f = (float)jsonValue.doubleValue;
          } 
        } else {
          f = Float.parseFloat(jsonValue.stringValue);
        } 
        stringBuilder1[b] = f;
        jsonValue = jsonValue.next;
        b++;
      } 
      return stringBuilder1;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public int asInt() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    byte b = 1;
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            if (this.longValue == 0L)
              b = 0; 
            return b;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to int: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return (int)this.longValue;
      } 
      return (int)this.doubleValue;
    } 
    return Integer.parseInt(this.stringValue);
  }
  
  public int[] asIntArray() { // Byte code:
    //   0: aload_0
    //   1: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   4: getstatic com/badlogic/gdx/utils/JsonValue$ValueType.array : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   7: if_acmpne -> 170
    //   10: aload_0
    //   11: getfield size : I
    //   14: newarray int
    //   16: astore_1
    //   17: aload_0
    //   18: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   21: astore_2
    //   22: iconst_0
    //   23: istore_3
    //   24: aload_2
    //   25: ifnull -> 168
    //   28: getstatic com/badlogic/gdx/utils/JsonValue$1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType : [I
    //   31: aload_2
    //   32: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   35: invokevirtual ordinal : ()I
    //   38: iaload
    //   39: istore #4
    //   41: iload #4
    //   43: iconst_1
    //   44: if_icmpeq -> 143
    //   47: iload #4
    //   49: iconst_2
    //   50: if_icmpeq -> 133
    //   53: iload #4
    //   55: iconst_3
    //   56: if_icmpeq -> 123
    //   59: iload #4
    //   61: iconst_4
    //   62: if_icmpne -> 86
    //   65: aload_2
    //   66: getfield longValue : J
    //   69: lconst_0
    //   70: lcmp
    //   71: ifeq -> 80
    //   74: iconst_1
    //   75: istore #4
    //   77: goto -> 152
    //   80: iconst_0
    //   81: istore #4
    //   83: goto -> 152
    //   86: new java/lang/StringBuilder
    //   89: dup
    //   90: invokespecial <init> : ()V
    //   93: astore_1
    //   94: aload_1
    //   95: ldc_w 'Value cannot be converted to int: '
    //   98: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: pop
    //   102: aload_1
    //   103: aload_2
    //   104: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   107: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   110: pop
    //   111: new java/lang/IllegalStateException
    //   114: dup
    //   115: aload_1
    //   116: invokevirtual toString : ()Ljava/lang/String;
    //   119: invokespecial <init> : (Ljava/lang/String;)V
    //   122: athrow
    //   123: aload_2
    //   124: getfield longValue : J
    //   127: l2i
    //   128: istore #4
    //   130: goto -> 152
    //   133: aload_2
    //   134: getfield doubleValue : D
    //   137: d2i
    //   138: istore #4
    //   140: goto -> 152
    //   143: aload_2
    //   144: getfield stringValue : Ljava/lang/String;
    //   147: invokestatic parseInt : (Ljava/lang/String;)I
    //   150: istore #4
    //   152: aload_1
    //   153: iload_3
    //   154: iload #4
    //   156: iastore
    //   157: aload_2
    //   158: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   161: astore_2
    //   162: iinc #3, 1
    //   165: goto -> 24
    //   168: aload_1
    //   169: areturn
    //   170: new java/lang/StringBuilder
    //   173: dup
    //   174: invokespecial <init> : ()V
    //   177: astore_2
    //   178: aload_2
    //   179: ldc_w 'Value is not an array: '
    //   182: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   185: pop
    //   186: aload_2
    //   187: aload_0
    //   188: getfield type : Lcom/badlogic/gdx/utils/JsonValue$ValueType;
    //   191: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   194: pop
    //   195: new java/lang/IllegalStateException
    //   198: dup
    //   199: aload_2
    //   200: invokevirtual toString : ()Ljava/lang/String;
    //   203: invokespecial <init> : (Ljava/lang/String;)V
    //   206: astore_2
    //   207: goto -> 212
    //   210: aload_2
    //   211: athrow
    //   212: goto -> 210 }
  
  public long asLong() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            long l1 = this.longValue;
            long l2 = 0L;
            if (l1 != 0L)
              l2 = 1L; 
            return l2;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to long: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return this.longValue;
      } 
      return (long)this.doubleValue;
    } 
    return Long.parseLong(this.stringValue);
  }
  
  public long[] asLongArray() {
    if (this.type == ValueType.array) {
      java.lang.StringBuilder stringBuilder1 = new long[this.size];
      byte b = 0;
      JsonValue jsonValue = this.child;
      while (jsonValue != null) {
        long l;
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i == 4) {
                long l1 = jsonValue.longValue;
                l = 0L;
                if (l1 != 0L)
                  l = 1L; 
              } else {
                stringBuilder1 = new java.lang.StringBuilder();
                stringBuilder1.append("Value cannot be converted to long: ");
                stringBuilder1.append(jsonValue.type);
                throw new IllegalStateException(stringBuilder1.toString());
              } 
            } else {
              l = jsonValue.longValue;
            } 
          } else {
            l = (long)jsonValue.doubleValue;
          } 
        } else {
          l = Long.parseLong(jsonValue.stringValue);
        } 
        stringBuilder1[b] = l;
        jsonValue = jsonValue.next;
        b++;
      } 
      return stringBuilder1;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public short asShort() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    boolean bool = true;
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i == 4) {
            int j;
            if (this.longValue != 0L) {
              j = bool;
            } else {
              i = 0;
              j = i;
            } 
            return j;
          } 
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Value cannot be converted to short: ");
          stringBuilder.append(this.type);
          throw new IllegalStateException(stringBuilder.toString());
        } 
        return (short)(int)this.longValue;
      } 
      return (short)(int)this.doubleValue;
    } 
    return Short.parseShort(this.stringValue);
  }
  
  public short[] asShortArray() {
    if (this.type == ValueType.array) {
      java.lang.StringBuilder stringBuilder1 = new short[this.size];
      JsonValue jsonValue = this.child;
      for (byte b = 0; jsonValue != null; b++) {
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i == 4) {
                if (jsonValue.longValue != 0L) {
                  i = 1;
                } else {
                  i = 0;
                } 
              } else {
                stringBuilder1 = new java.lang.StringBuilder();
                stringBuilder1.append("Value cannot be converted to short: ");
                stringBuilder1.append(jsonValue.type);
                throw new IllegalStateException(stringBuilder1.toString());
              } 
            } else {
              i = (int)jsonValue.longValue;
              i = (short)i;
            } 
          } else {
            i = (int)jsonValue.doubleValue;
            i = (short)i;
          } 
        } else {
          i = Short.parseShort(jsonValue.stringValue);
        } 
        stringBuilder1[b] = (short)i;
        jsonValue = jsonValue.next;
      } 
      return stringBuilder1;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public String asString() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          String str2;
          if (i != 4) {
            if (i == 5)
              return null; 
            str2 = new java.lang.StringBuilder();
            str2.append("Value cannot be converted to string: ");
            str2.append(this.type);
            throw new IllegalStateException(str2.toString());
          } 
          if (this.longValue != 0L) {
            str2 = "true";
          } else {
            str2 = "false";
          } 
          return str2;
        } 
        String str1 = this.stringValue;
        if (str1 == null)
          str1 = Long.toString(this.longValue); 
        return str1;
      } 
      String str = this.stringValue;
      if (str == null)
        str = Double.toString(this.doubleValue); 
      return str;
    } 
    return this.stringValue;
  }
  
  public String[] asStringArray() {
    if (this.type == ValueType.array) {
      String[] arrayOfString = new String[this.size];
      byte b = 0;
      JsonValue jsonValue = this.child;
      while (jsonValue != null) {
        String str;
        int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
        if (i != 1) {
          if (i != 2) {
            if (i != 3) {
              if (i != 4) {
                if (i == 5) {
                  str = null;
                } else {
                  str = new java.lang.StringBuilder();
                  str.append("Value cannot be converted to string: ");
                  str.append(jsonValue.type);
                  throw new IllegalStateException(str.toString());
                } 
              } else if (jsonValue.longValue != 0L) {
                str = "true";
              } else {
                str = "false";
              } 
            } else {
              str = this.stringValue;
              if (str == null)
                str = Long.toString(jsonValue.longValue); 
            } 
          } else {
            str = this.stringValue;
            if (str == null)
              str = Double.toString(jsonValue.doubleValue); 
          } 
        } else {
          str = jsonValue.stringValue;
        } 
        arrayOfString[b] = str;
        jsonValue = jsonValue.next;
        b++;
      } 
      return arrayOfString;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Value is not an array: ");
    stringBuilder.append(this.type);
    IllegalStateException illegalStateException = new IllegalStateException(stringBuilder.toString());
    throw illegalStateException;
  }
  
  public JsonValue child() { return this.child; }
  
  public JsonValue get(int paramInt) {
    JsonValue jsonValue;
    for (jsonValue = this.child; jsonValue != null && paramInt > 0; jsonValue = jsonValue.next)
      paramInt--; 
    return jsonValue;
  }
  
  public JsonValue get(String paramString) {
    JsonValue jsonValue = this.child;
    while (jsonValue != null) {
      String str = jsonValue.name;
      if (str == null || !str.equalsIgnoreCase(paramString))
        jsonValue = jsonValue.next; 
    } 
    return jsonValue;
  }
  
  public boolean getBoolean(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asBoolean(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public boolean getBoolean(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asBoolean(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public boolean getBoolean(String paramString, boolean paramBoolean) {
    JsonValue jsonValue = get(paramString);
    boolean bool = paramBoolean;
    if (jsonValue != null) {
      bool = paramBoolean;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          bool = paramBoolean;
        } else {
          bool = jsonValue.asBoolean();
        }  
    } 
    return bool;
  }
  
  public byte getByte(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asByte(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public byte getByte(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asByte(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public byte getByte(String paramString, byte paramByte) {
    JsonValue jsonValue = get(paramString);
    byte b = paramByte;
    if (jsonValue != null) {
      b = paramByte;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          b = paramByte;
        } else {
          paramByte = jsonValue.asByte();
          b = paramByte;
        }  
    } 
    return b;
  }
  
  public char getChar(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asChar(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public char getChar(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asChar(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public char getChar(String paramString, char paramChar) {
    JsonValue jsonValue = get(paramString);
    char c = paramChar;
    if (jsonValue != null) {
      c = paramChar;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          c = paramChar;
        } else {
          paramChar = jsonValue.asChar();
          c = paramChar;
        }  
    } 
    return c;
  }
  
  public JsonValue getChild(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue == null) {
      jsonValue = null;
    } else {
      jsonValue = jsonValue.child;
    } 
    return jsonValue;
  }
  
  public double getDouble(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asDouble(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public double getDouble(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asDouble(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public double getDouble(String paramString, double paramDouble) {
    JsonValue jsonValue = get(paramString);
    double d = paramDouble;
    if (jsonValue != null) {
      d = paramDouble;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          d = paramDouble;
        } else {
          d = jsonValue.asDouble();
        }  
    } 
    return d;
  }
  
  public float getFloat(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asFloat(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public float getFloat(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asFloat(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public float getFloat(String paramString, float paramFloat) {
    JsonValue jsonValue = get(paramString);
    float f = paramFloat;
    if (jsonValue != null) {
      f = paramFloat;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          f = paramFloat;
        } else {
          f = jsonValue.asFloat();
        }  
    } 
    return f;
  }
  
  public int getInt(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asInt(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public int getInt(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asInt(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public int getInt(String paramString, int paramInt) {
    JsonValue jsonValue = get(paramString);
    int i = paramInt;
    if (jsonValue != null) {
      i = paramInt;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          i = paramInt;
        } else {
          i = jsonValue.asInt();
        }  
    } 
    return i;
  }
  
  public long getLong(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asLong(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public long getLong(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asLong(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public long getLong(String paramString, long paramLong) {
    JsonValue jsonValue = get(paramString);
    long l = paramLong;
    if (jsonValue != null) {
      l = paramLong;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          l = paramLong;
        } else {
          l = jsonValue.asLong();
        }  
    } 
    return l;
  }
  
  public short getShort(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asShort(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public short getShort(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asShort(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public short getShort(String paramString, short paramShort) {
    JsonValue jsonValue = get(paramString);
    short s = paramShort;
    if (jsonValue != null) {
      s = paramShort;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          s = paramShort;
        } else {
          paramShort = jsonValue.asShort();
          s = paramShort;
        }  
    } 
    return s;
  }
  
  public String getString(int paramInt) {
    JsonValue jsonValue = get(paramInt);
    if (jsonValue != null)
      return jsonValue.asString(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Indexed value not found: ");
    stringBuilder.append(this.name);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public String getString(String paramString) {
    JsonValue jsonValue = get(paramString);
    if (jsonValue != null)
      return jsonValue.asString(); 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Named value not found: ");
    stringBuilder.append(paramString);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public String getString(String paramString1, String paramString2) {
    JsonValue jsonValue = get(paramString1);
    paramString1 = paramString2;
    if (jsonValue != null) {
      paramString1 = paramString2;
      if (jsonValue.isValue())
        if (jsonValue.isNull()) {
          paramString1 = paramString2;
        } else {
          paramString1 = jsonValue.asString();
        }  
    } 
    return paramString1;
  }
  
  public boolean has(String paramString) {
    boolean bool;
    if (get(paramString) != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean hasChild(String paramString) {
    boolean bool;
    if (getChild(paramString) != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isArray() {
    boolean bool;
    if (this.type == ValueType.array) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isBoolean() {
    boolean bool;
    if (this.type == ValueType.booleanValue) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isDouble() {
    boolean bool;
    if (this.type == ValueType.doubleValue) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.size == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isLong() {
    boolean bool;
    if (this.type == ValueType.longValue) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isNull() {
    boolean bool;
    if (this.type == ValueType.nullValue) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isNumber() { return (this.type == ValueType.doubleValue || this.type == ValueType.longValue); }
  
  public boolean isObject() {
    boolean bool;
    if (this.type == ValueType.object) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isString() {
    boolean bool;
    if (this.type == ValueType.stringValue) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isValue() {
    int i = null.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
    return !(i != 1 && i != 2 && i != 3 && i != 4 && i != 5);
  }
  
  public JsonIterator iterator() { return new JsonIterator(); }
  
  public String name() { return this.name; }
  
  public JsonValue next() { return this.next; }
  
  public boolean notEmpty() {
    boolean bool;
    if (this.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public JsonValue parent() { return this.parent; }
  
  public String prettyPrint(PrettyPrintSettings paramPrettyPrintSettings) {
    StringBuilder stringBuilder = new StringBuilder('Ȁ');
    prettyPrint(this, stringBuilder, 0, paramPrettyPrintSettings);
    return stringBuilder.toString();
  }
  
  public String prettyPrint(JsonWriter.OutputType paramOutputType, int paramInt) {
    PrettyPrintSettings prettyPrintSettings = new PrettyPrintSettings();
    prettyPrintSettings.outputType = paramOutputType;
    prettyPrintSettings.singleLineColumns = paramInt;
    return prettyPrint(prettyPrintSettings);
  }
  
  public void prettyPrint(JsonWriter.OutputType paramOutputType, Writer paramWriter) throws IOException {
    PrettyPrintSettings prettyPrintSettings = new PrettyPrintSettings();
    prettyPrintSettings.outputType = paramOutputType;
    prettyPrint(this, paramWriter, 0, prettyPrintSettings);
  }
  
  public JsonValue prev() { return this.prev; }
  
  public JsonValue remove(int paramInt) {
    JsonValue jsonValue1 = get(paramInt);
    if (jsonValue1 == null)
      return null; 
    JsonValue jsonValue2 = jsonValue1.prev;
    if (jsonValue2 == null) {
      this.child = jsonValue1.next;
      JsonValue jsonValue = this.child;
      if (jsonValue != null)
        jsonValue.prev = null; 
    } else {
      jsonValue2.next = jsonValue1.next;
      JsonValue jsonValue = jsonValue1.next;
      if (jsonValue != null)
        jsonValue.prev = jsonValue2; 
    } 
    this.size--;
    return jsonValue1;
  }
  
  public JsonValue remove(String paramString) {
    JsonValue jsonValue1 = get(paramString);
    if (jsonValue1 == null)
      return null; 
    JsonValue jsonValue2 = jsonValue1.prev;
    if (jsonValue2 == null) {
      this.child = jsonValue1.next;
      jsonValue2 = this.child;
      if (jsonValue2 != null)
        jsonValue2.prev = null; 
    } else {
      jsonValue2.next = jsonValue1.next;
      JsonValue jsonValue = jsonValue1.next;
      if (jsonValue != null)
        jsonValue.prev = jsonValue2; 
    } 
    this.size--;
    return jsonValue1;
  }
  
  public JsonValue require(int paramInt) {
    JsonValue jsonValue;
    for (jsonValue = this.child; jsonValue != null && paramInt > 0; jsonValue = jsonValue.next)
      paramInt--; 
    if (jsonValue != null)
      return jsonValue; 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Child not found with index: ");
    stringBuilder.append(paramInt);
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException(stringBuilder.toString());
    throw illegalArgumentException;
  }
  
  public JsonValue require(String paramString) {
    JsonValue jsonValue = this.child;
    while (jsonValue != null) {
      String str = jsonValue.name;
      if (str == null || !str.equalsIgnoreCase(paramString))
        jsonValue = jsonValue.next; 
    } 
    if (jsonValue != null)
      return jsonValue; 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Child not found with name: ");
    stringBuilder.append(paramString);
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException(stringBuilder.toString());
    throw illegalArgumentException;
  }
  
  public void set(double paramDouble, String paramString) {
    this.doubleValue = paramDouble;
    this.longValue = (long)paramDouble;
    this.stringValue = paramString;
    this.type = ValueType.doubleValue;
  }
  
  public void set(long paramLong, String paramString) {
    this.longValue = paramLong;
    this.doubleValue = paramLong;
    this.stringValue = paramString;
    this.type = ValueType.longValue;
  }
  
  public void set(String paramString) {
    ValueType valueType;
    this.stringValue = paramString;
    if (paramString == null) {
      valueType = ValueType.nullValue;
    } else {
      valueType = ValueType.stringValue;
    } 
    this.type = valueType;
  }
  
  public void set(boolean paramBoolean) {
    long l;
    if (paramBoolean) {
      l = 1L;
    } else {
      l = 0L;
    } 
    this.longValue = l;
    this.type = ValueType.booleanValue;
  }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public void setNext(JsonValue paramJsonValue) { this.next = paramJsonValue; }
  
  public void setPrev(JsonValue paramJsonValue) { this.prev = paramJsonValue; }
  
  public void setType(ValueType paramValueType) {
    if (paramValueType != null) {
      this.type = paramValueType;
      return;
    } 
    throw new IllegalArgumentException("type cannot be null.");
  }
  
  @Deprecated
  public int size() { return this.size; }
  
  public String toJson(JsonWriter.OutputType paramOutputType) {
    if (isValue())
      return asString(); 
    StringBuilder stringBuilder = new StringBuilder('Ȁ');
    json(this, stringBuilder, paramOutputType);
    return stringBuilder.toString();
  }
  
  public String toString() {
    String str;
    if (isValue()) {
      if (this.name == null) {
        str = asString();
      } else {
        java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
        stringBuilder1.append(this.name);
        stringBuilder1.append(": ");
        stringBuilder1.append(asString());
        str = stringBuilder1.toString();
      } 
      return str;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    if (this.name == null) {
      str = "";
    } else {
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append(this.name);
      stringBuilder1.append(": ");
      str = stringBuilder1.toString();
    } 
    stringBuilder.append(str);
    stringBuilder.append(prettyPrint(JsonWriter.OutputType.minimal, 0));
    return stringBuilder.toString();
  }
  
  public String trace() {
    String str1 = this.parent;
    String str2 = "[]";
    if (str1 == null)
      return (this.type == ValueType.array) ? "[]" : ((this.type == ValueType.object) ? "{}" : ""); 
    if (str1.type == ValueType.array) {
      byte b = 0;
      JsonValue jsonValue = this.parent.child;
      while (true) {
        String str = str2;
        if (jsonValue != null) {
          if (jsonValue == this) {
            java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
            stringBuilder1.append("[");
            stringBuilder1.append(b);
            stringBuilder1.append("]");
            String str3 = stringBuilder1.toString();
            break;
          } 
          jsonValue = jsonValue.next;
          b++;
          continue;
        } 
        break;
      } 
    } else if (this.name.indexOf('.') != -1) {
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append(".\"");
      stringBuilder1.append(this.name.replace("\"", "\\\""));
      stringBuilder1.append("\"");
      String str = stringBuilder1.toString();
    } else {
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append('.');
      stringBuilder1.append(this.name);
      str1 = stringBuilder1.toString();
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append(this.parent.trace());
    stringBuilder.append(str1);
    return stringBuilder.toString();
  }
  
  public ValueType type() { return this.type; }
  
  public class JsonIterator extends Object implements Iterator<JsonValue>, Iterable<JsonValue> {
    JsonValue current;
    
    JsonValue entry = JsonValue.this.child;
    
    public boolean hasNext() {
      boolean bool;
      if (this.entry != null) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public Iterator<JsonValue> iterator() { return this; }
    
    public JsonValue next() {
      this.current = this.entry;
      JsonValue jsonValue = this.current;
      if (jsonValue != null) {
        this.entry = jsonValue.next;
        return this.current;
      } 
      throw new NoSuchElementException();
    }
    
    public void remove() {
      if (this.current.prev == null) {
        JsonValue.this.child = this.current.next;
        if (JsonValue.this.child != null)
          this.this$0.child.prev = null; 
      } else {
        this.current.prev.next = this.current.next;
        if (this.current.next != null)
          this.current.next.prev = this.current.prev; 
      } 
      JsonValue jsonValue = JsonValue.this;
      jsonValue.size--;
    }
  }
  
  public static class PrettyPrintSettings {
    public JsonWriter.OutputType outputType;
    
    public int singleLineColumns;
    
    public boolean wrapNumericArrays;
  }
  
  public enum ValueType {
    array, booleanValue, doubleValue, longValue, nullValue, object, stringValue;
    
    static  {
      array = new ValueType("array", true);
      stringValue = new ValueType("stringValue", 2);
      doubleValue = new ValueType("doubleValue", 3);
      longValue = new ValueType("longValue", 4);
      booleanValue = new ValueType("booleanValue", 5);
      nullValue = new ValueType("nullValue", 6);
      $VALUES = new ValueType[] { object, array, stringValue, doubleValue, longValue, booleanValue, nullValue };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/JsonValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */