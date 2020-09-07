package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.Constructor;
import com.badlogic.gdx.utils.reflect.Field;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.security.AccessControlException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;

public class Json {
  private static final boolean debug = false;
  
  private final ObjectMap<Class, Object[]> classToDefaultValues = new ObjectMap();
  
  private final ObjectMap<Class, Serializer> classToSerializer = new ObjectMap();
  
  private final ObjectMap<Class, String> classToTag = new ObjectMap();
  
  private Serializer defaultSerializer;
  
  private boolean enumNames = true;
  
  private final Object[] equals1 = { null };
  
  private final Object[] equals2 = { null };
  
  private boolean ignoreDeprecated;
  
  private boolean ignoreUnknownFields;
  
  private JsonWriter.OutputType outputType = JsonWriter.OutputType.minimal;
  
  private boolean quoteLongValues;
  
  private boolean readDeprecated;
  
  private boolean sortFields;
  
  private final ObjectMap<String, Class> tagToClass = new ObjectMap();
  
  private String typeName = "class";
  
  private final ObjectMap<Class, OrderedMap<String, FieldMetadata>> typeToFields = new ObjectMap();
  
  private boolean usePrototypes = true;
  
  private JsonWriter writer;
  
  public Json() {}
  
  public Json(JsonWriter.OutputType paramOutputType) {}
  
  private String convertToString(Enum paramEnum) {
    String str;
    if (this.enumNames) {
      str = paramEnum.name();
    } else {
      str = str.toString();
    } 
    return str;
  }
  
  private String convertToString(Object paramObject) { return (paramObject instanceof Enum) ? convertToString((Enum)paramObject) : ((paramObject instanceof Class) ? ((Class)paramObject).getName() : String.valueOf(paramObject)); }
  
  private Object[] getDefaultValues(Class paramClass) {
    if (!this.usePrototypes)
      return null; 
    if (this.classToDefaultValues.containsKey(paramClass))
      return (Object[])this.classToDefaultValues.get(paramClass); 
    try {
      object = newInstance(paramClass);
      OrderedMap orderedMap = getFields(paramClass);
      SerializationException serializationException = new Object[orderedMap.size];
      this.classToDefaultValues.put(paramClass, serializationException);
      byte b = 0;
      ObjectMap.Values values = orderedMap.values().iterator();
      while (values.hasNext()) {
        FieldMetadata fieldMetadata = (FieldMetadata)values.next();
        if (this.ignoreDeprecated && fieldMetadata.deprecated)
          continue; 
        Field field = fieldMetadata.field;
        try {
          serializationException[b] = field.get(object);
          b++;
        } catch (ReflectionException object) {
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Error accessing field: ");
          stringBuilder.append(field.getName());
          stringBuilder.append(" (");
          stringBuilder.append(paramClass.getName());
          stringBuilder.append(")");
          throw new SerializationException(stringBuilder.toString(), object);
        } catch (SerializationException object) {
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append(field);
          stringBuilder.append(" (");
          stringBuilder.append(paramClass.getName());
          stringBuilder.append(")");
          object.addTrace(stringBuilder.toString());
          throw object;
        } catch (RuntimeException object) {
          serializationException = new SerializationException(object);
          object = new java.lang.StringBuilder();
          object.append(field);
          object.append(" (");
          object.append(paramClass.getName());
          object.append(")");
          serializationException.addTrace(object.toString());
          throw serializationException;
        } 
      } 
      return serializationException;
    } catch (Exception exception) {
      this.classToDefaultValues.put(paramClass, null);
      return null;
    } 
  }
  
  private OrderedMap<String, FieldMetadata> getFields(Class paramClass) {
    OrderedMap orderedMap1 = (OrderedMap)this.typeToFields.get(paramClass);
    if (orderedMap1 != null)
      return orderedMap1; 
    Array array = new Array();
    for (Class clazz = paramClass; clazz != Object.class; clazz = clazz.getSuperclass())
      array.add(clazz); 
    ArrayList arrayList = new ArrayList();
    int i;
    for (i = array.size - 1; i >= 0; i--)
      Collections.addAll(arrayList, ClassReflection.getDeclaredFields((Class)array.get(i))); 
    OrderedMap orderedMap2 = new OrderedMap(arrayList.size());
    i = 0;
    int j = arrayList.size();
    while (true) {
      if (i < j) {
        field = (Field)arrayList.get(i);
        if (field.isTransient() || field.isStatic() || field.isSynthetic())
          continue; 
        if (!field.isAccessible()) {
          try {
            field.setAccessible(true);
            orderedMap2.put(field.getName(), new FieldMetadata(field));
          } catch (AccessControlException field) {}
          continue;
        } 
      } else {
        if (this.sortFields)
          orderedMap2.keys.sort(); 
        this.typeToFields.put(paramClass, orderedMap2);
        return orderedMap2;
      } 
      orderedMap2.put(field.getName(), new FieldMetadata(field));
      i++;
    } 
  }
  
  public void addClassTag(String paramString, Class paramClass) {
    this.tagToClass.put(paramString, paramClass);
    this.classToTag.put(paramClass, paramString);
  }
  
  public void copyFields(Object paramObject1, Object paramObject2) {
    OrderedMap orderedMap = getFields(paramObject1.getClass());
    ObjectMap.Entries entries = getFields(paramObject1.getClass()).iterator();
    while (entries.hasNext()) {
      ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
      FieldMetadata fieldMetadata = (FieldMetadata)orderedMap.get(entry.key);
      Field field = ((FieldMetadata)entry.value).field;
      if (fieldMetadata != null)
        try {
          fieldMetadata.field.set(paramObject2, field.get(paramObject1));
          continue;
        } catch (ReflectionException paramObject2) {
          paramObject1 = new java.lang.StringBuilder();
          paramObject1.append("Error copying field: ");
          paramObject1.append(field.getName());
          throw new SerializationException(paramObject1.toString(), paramObject2);
        }  
      paramObject1 = new java.lang.StringBuilder();
      paramObject1.append("To object is missing field");
      paramObject1.append((String)entry.key);
      throw new SerializationException(paramObject1.toString());
    } 
  }
  
  public <T> T fromJson(Class<T> paramClass, FileHandle paramFileHandle) {
    try {
      JsonReader jsonReader = new JsonReader();
      this();
      return (T)readValue(paramClass, null, jsonReader.parse(paramFileHandle));
    } catch (Exception exception) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(paramFileHandle);
      throw new SerializationException(stringBuilder.toString(), exception);
    } 
  }
  
  public <T> T fromJson(Class<T> paramClass, InputStream paramInputStream) { return (T)readValue(paramClass, null, (new JsonReader()).parse(paramInputStream)); }
  
  public <T> T fromJson(Class<T> paramClass, Reader paramReader) { return (T)readValue(paramClass, null, (new JsonReader()).parse(paramReader)); }
  
  public <T> T fromJson(Class<T> paramClass1, Class paramClass2, FileHandle paramFileHandle) {
    try {
      JsonReader jsonReader = new JsonReader();
      this();
      return (T)readValue(paramClass1, paramClass2, jsonReader.parse(paramFileHandle));
    } catch (Exception paramClass2) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(paramFileHandle);
      throw new SerializationException(stringBuilder.toString(), paramClass2);
    } 
  }
  
  public <T> T fromJson(Class<T> paramClass1, Class paramClass2, InputStream paramInputStream) { return (T)readValue(paramClass1, paramClass2, (new JsonReader()).parse(paramInputStream)); }
  
  public <T> T fromJson(Class<T> paramClass1, Class paramClass2, Reader paramReader) { return (T)readValue(paramClass1, paramClass2, (new JsonReader()).parse(paramReader)); }
  
  public <T> T fromJson(Class<T> paramClass1, Class paramClass2, String paramString) { return (T)readValue(paramClass1, paramClass2, (new JsonReader()).parse(paramString)); }
  
  public <T> T fromJson(Class<T> paramClass1, Class paramClass2, char[] paramArrayOfChar, int paramInt1, int paramInt2) { return (T)readValue(paramClass1, paramClass2, (new JsonReader()).parse(paramArrayOfChar, paramInt1, paramInt2)); }
  
  public <T> T fromJson(Class<T> paramClass, String paramString) { return (T)readValue(paramClass, null, (new JsonReader()).parse(paramString)); }
  
  public <T> T fromJson(Class<T> paramClass, char[] paramArrayOfChar, int paramInt1, int paramInt2) { return (T)readValue(paramClass, null, (new JsonReader()).parse(paramArrayOfChar, paramInt1, paramInt2)); }
  
  public Class getClass(String paramString) { return (Class)this.tagToClass.get(paramString); }
  
  public boolean getIgnoreUnknownFields() { return this.ignoreUnknownFields; }
  
  public <T> Serializer<T> getSerializer(Class<T> paramClass) { return (Serializer)this.classToSerializer.get(paramClass); }
  
  public String getTag(Class paramClass) { return (String)this.classToTag.get(paramClass); }
  
  public JsonWriter getWriter() { return this.writer; }
  
  protected boolean ignoreUnknownField(Class paramClass, String paramString) { return false; }
  
  protected Object newInstance(Class paramClass) {
    try {
      return ClassReflection.newInstance(paramClass);
    } catch (Exception exception) {
      try {
        Constructor constructor = ClassReflection.getDeclaredConstructor(paramClass, new Class[0]);
        constructor.setAccessible(true);
        return constructor.newInstance(new Object[0]);
      } catch (SecurityException securityException) {
      
      } catch (ReflectionException reflectionException) {
        Class clazz;
        if (ClassReflection.isAssignableFrom(Enum.class, paramClass)) {
          clazz = paramClass;
          if (paramClass.getEnumConstants() == null)
            clazz = paramClass.getSuperclass(); 
          return clazz.getEnumConstants()[0];
        } 
        if (!paramClass.isArray()) {
          if (ClassReflection.isMemberClass(paramClass) && !ClassReflection.isStaticClass(paramClass)) {
            java.lang.StringBuilder stringBuilder3 = new java.lang.StringBuilder();
            stringBuilder3.append("Class cannot be created (non-static member class): ");
            stringBuilder3.append(paramClass.getName());
            throw new SerializationException(stringBuilder3.toString(), clazz);
          } 
          java.lang.StringBuilder stringBuilder2 = new java.lang.StringBuilder();
          stringBuilder2.append("Class cannot be created (missing no-arg constructor): ");
          stringBuilder2.append(paramClass.getName());
          throw new SerializationException(stringBuilder2.toString(), clazz);
        } 
        java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
        stringBuilder1.append("Encountered JSON object when expected array of type: ");
        stringBuilder1.append(paramClass.getName());
        throw new SerializationException(stringBuilder1.toString(), clazz);
      } catch (Exception exception) {}
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error constructing instance of class: ");
      stringBuilder.append(paramClass.getName());
      throw new SerializationException(stringBuilder.toString(), exception);
    } 
  }
  
  public String prettyPrint(Object paramObject) { return prettyPrint(paramObject, 0); }
  
  public String prettyPrint(Object paramObject, int paramInt) { return prettyPrint(toJson(paramObject), paramInt); }
  
  public String prettyPrint(Object paramObject, JsonValue.PrettyPrintSettings paramPrettyPrintSettings) { return prettyPrint(toJson(paramObject), paramPrettyPrintSettings); }
  
  public String prettyPrint(String paramString) { return prettyPrint(paramString, 0); }
  
  public String prettyPrint(String paramString, int paramInt) { return (new JsonReader()).parse(paramString).prettyPrint(this.outputType, paramInt); }
  
  public String prettyPrint(String paramString, JsonValue.PrettyPrintSettings paramPrettyPrintSettings) { return (new JsonReader()).parse(paramString).prettyPrint(paramPrettyPrintSettings); }
  
  public void readField(Object paramObject, Field paramField, String paramString, Class paramClass, JsonValue paramJsonValue) {
    java.lang.StringBuilder stringBuilder = paramJsonValue.get(paramString);
    if (stringBuilder == null)
      return; 
    try {
      paramField.set(paramObject, readValue(paramField.getType(), paramClass, stringBuilder));
      return;
    } catch (ReflectionException paramObject) {
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("Error accessing field: ");
      stringBuilder1.append(paramField.getName());
      stringBuilder1.append(" (");
      stringBuilder1.append(paramField.getDeclaringClass().getName());
      stringBuilder1.append(")");
      throw new SerializationException(stringBuilder1.toString(), paramObject);
    } catch (SerializationException paramObject) {
      stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(paramField.getName());
      stringBuilder.append(" (");
      stringBuilder.append(paramField.getDeclaringClass().getName());
      stringBuilder.append(")");
      paramObject.addTrace(stringBuilder.toString());
      throw paramObject;
    } catch (RuntimeException paramObject) {
      paramObject = new SerializationException(paramObject);
      paramObject.addTrace(stringBuilder.trace());
      stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(paramField.getName());
      stringBuilder.append(" (");
      stringBuilder.append(paramField.getDeclaringClass().getName());
      stringBuilder.append(")");
      paramObject.addTrace(stringBuilder.toString());
      throw paramObject;
    } 
  }
  
  public void readField(Object paramObject, String paramString, JsonValue paramJsonValue) { readField(paramObject, paramString, paramString, null, paramJsonValue); }
  
  public void readField(Object paramObject, String paramString, Class paramClass, JsonValue paramJsonValue) { readField(paramObject, paramString, paramString, paramClass, paramJsonValue); }
  
  public void readField(Object paramObject, String paramString1, String paramString2, JsonValue paramJsonValue) { readField(paramObject, paramString1, paramString2, null, paramJsonValue); }
  
  public void readField(Object paramObject, String paramString1, String paramString2, Class paramClass, JsonValue paramJsonValue) {
    Class clazz;
    Field field = paramObject.getClass();
    FieldMetadata fieldMetadata = (FieldMetadata)getFields(field).get(paramString1);
    if (fieldMetadata != null) {
      field = fieldMetadata.field;
      clazz = paramClass;
      if (paramClass == null)
        clazz = fieldMetadata.elementType; 
      readField(paramObject, field, paramString2, clazz, paramJsonValue);
      return;
    } 
    paramObject = new java.lang.StringBuilder();
    paramObject.append("Field not found: ");
    paramObject.append(clazz);
    paramObject.append(" (");
    paramObject.append(field.getName());
    paramObject.append(")");
    throw new SerializationException(paramObject.toString());
  }
  
  public void readFields(Object paramObject, JsonValue paramJsonValue) {
    Class clazz = paramObject.getClass();
    OrderedMap orderedMap = getFields(clazz);
    paramJsonValue = paramJsonValue.child;
    while (true) {
      java.lang.StringBuilder stringBuilder;
      if (paramJsonValue != null) {
        FieldMetadata fieldMetadata = (FieldMetadata)orderedMap.get(paramJsonValue.name().replace(" ", "_"));
        if (fieldMetadata == null) {
          if (!paramJsonValue.name.equals(this.typeName) && !this.ignoreUnknownFields && !ignoreUnknownField(clazz, paramJsonValue.name)) {
            paramObject = new java.lang.StringBuilder();
            paramObject.append("Field not found: ");
            paramObject.append(paramJsonValue.name);
            paramObject.append(" (");
            paramObject.append(clazz.getName());
            paramObject.append(")");
            paramObject = new SerializationException(paramObject.toString());
            paramObject.addTrace(paramJsonValue.trace());
            throw paramObject;
          } 
        } else if (!this.ignoreDeprecated || this.readDeprecated || !fieldMetadata.deprecated) {
          Field field = fieldMetadata.field;
          try {
            field.set(paramObject, readValue(field.getType(), fieldMetadata.elementType, paramJsonValue));
            paramJsonValue = paramJsonValue.next;
            continue;
          } catch (ReflectionException paramJsonValue) {
            paramObject = new java.lang.StringBuilder();
            paramObject.append("Error accessing field: ");
            paramObject.append(field.getName());
            paramObject.append(" (");
            paramObject.append(clazz.getName());
            paramObject.append(")");
            throw new SerializationException(paramObject.toString(), paramJsonValue);
          } catch (SerializationException paramObject) {
            stringBuilder = new java.lang.StringBuilder();
            stringBuilder.append(field.getName());
            stringBuilder.append(" (");
            stringBuilder.append(clazz.getName());
            stringBuilder.append(")");
            paramObject.addTrace(stringBuilder.toString());
            throw paramObject;
          } catch (RuntimeException paramObject) {
            paramObject = new SerializationException(paramObject);
            paramObject.addTrace(stringBuilder.trace());
            stringBuilder = new java.lang.StringBuilder();
            stringBuilder.append(field.getName());
            stringBuilder.append(" (");
            stringBuilder.append(clazz.getName());
            stringBuilder.append(")");
            paramObject.addTrace(stringBuilder.toString());
            throw paramObject;
          } 
        } 
      } else {
        break;
      } 
      JsonValue jsonValue = stringBuilder.next;
    } 
  }
  
  public <T> T readValue(Class<T> paramClass, JsonValue paramJsonValue) { return (T)readValue(paramClass, null, paramJsonValue); }
  
  public <T> T readValue(Class<T> paramClass1, Class paramClass2, JsonValue paramJsonValue) { // Byte code:
    //   0: aload_3
    //   1: ifnonnull -> 6
    //   4: aconst_null
    //   5: areturn
    //   6: aload_1
    //   7: astore #4
    //   9: aload_3
    //   10: astore #5
    //   12: aload_3
    //   13: invokevirtual isObject : ()Z
    //   16: ifeq -> 613
    //   19: aload_0
    //   20: getfield typeName : Ljava/lang/String;
    //   23: astore #5
    //   25: aload #5
    //   27: ifnonnull -> 36
    //   30: aconst_null
    //   31: astore #5
    //   33: goto -> 45
    //   36: aload_3
    //   37: aload #5
    //   39: aconst_null
    //   40: invokevirtual getString : (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   43: astore #5
    //   45: aload #5
    //   47: ifnull -> 85
    //   50: aload_0
    //   51: aload #5
    //   53: invokevirtual getClass : (Ljava/lang/String;)Ljava/lang/Class;
    //   56: astore #4
    //   58: aload #4
    //   60: astore_1
    //   61: aload #4
    //   63: ifnonnull -> 85
    //   66: aload #5
    //   68: invokestatic forName : (Ljava/lang/String;)Ljava/lang/Class;
    //   71: astore_1
    //   72: goto -> 85
    //   75: astore_1
    //   76: new com/badlogic/gdx/utils/SerializationException
    //   79: dup
    //   80: aload_1
    //   81: invokespecial <init> : (Ljava/lang/Throwable;)V
    //   84: athrow
    //   85: aload_1
    //   86: ifnonnull -> 110
    //   89: aload_0
    //   90: getfield defaultSerializer : Lcom/badlogic/gdx/utils/Json$Serializer;
    //   93: astore_2
    //   94: aload_2
    //   95: ifnull -> 108
    //   98: aload_2
    //   99: aload_0
    //   100: aload_3
    //   101: aload_1
    //   102: invokeinterface read : (Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;Ljava/lang/Class;)Ljava/lang/Object;
    //   107: areturn
    //   108: aload_3
    //   109: areturn
    //   110: aload_0
    //   111: getfield typeName : Ljava/lang/String;
    //   114: ifnull -> 205
    //   117: ldc_w java/util/Collection
    //   120: aload_1
    //   121: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   124: ifeq -> 205
    //   127: aload_3
    //   128: ldc_w 'items'
    //   131: invokevirtual get : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;
    //   134: astore #5
    //   136: aload #5
    //   138: ifnull -> 147
    //   141: aload_1
    //   142: astore #4
    //   144: goto -> 613
    //   147: new java/lang/StringBuilder
    //   150: dup
    //   151: invokespecial <init> : ()V
    //   154: astore_2
    //   155: aload_2
    //   156: ldc_w 'Unable to convert object to collection: '
    //   159: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: pop
    //   163: aload_2
    //   164: aload #5
    //   166: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   169: pop
    //   170: aload_2
    //   171: ldc ' ('
    //   173: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   176: pop
    //   177: aload_2
    //   178: aload_1
    //   179: invokevirtual getName : ()Ljava/lang/String;
    //   182: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   185: pop
    //   186: aload_2
    //   187: ldc ')'
    //   189: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   192: pop
    //   193: new com/badlogic/gdx/utils/SerializationException
    //   196: dup
    //   197: aload_2
    //   198: invokevirtual toString : ()Ljava/lang/String;
    //   201: invokespecial <init> : (Ljava/lang/String;)V
    //   204: athrow
    //   205: aload_0
    //   206: getfield classToSerializer : Lcom/badlogic/gdx/utils/ObjectMap;
    //   209: aload_1
    //   210: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   213: checkcast com/badlogic/gdx/utils/Json$Serializer
    //   216: astore #5
    //   218: aload #5
    //   220: ifnull -> 234
    //   223: aload #5
    //   225: aload_0
    //   226: aload_3
    //   227: aload_1
    //   228: invokeinterface read : (Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;Ljava/lang/Class;)Ljava/lang/Object;
    //   233: areturn
    //   234: aload_1
    //   235: ldc java/lang/String
    //   237: if_acmpeq -> 603
    //   240: aload_1
    //   241: ldc_w java/lang/Integer
    //   244: if_acmpeq -> 603
    //   247: aload_1
    //   248: ldc_w java/lang/Boolean
    //   251: if_acmpeq -> 603
    //   254: aload_1
    //   255: ldc_w java/lang/Float
    //   258: if_acmpeq -> 603
    //   261: aload_1
    //   262: ldc_w java/lang/Long
    //   265: if_acmpeq -> 603
    //   268: aload_1
    //   269: ldc_w java/lang/Double
    //   272: if_acmpeq -> 603
    //   275: aload_1
    //   276: ldc_w java/lang/Short
    //   279: if_acmpeq -> 603
    //   282: aload_1
    //   283: ldc_w java/lang/Byte
    //   286: if_acmpeq -> 603
    //   289: aload_1
    //   290: ldc_w java/lang/Character
    //   293: if_acmpeq -> 603
    //   296: ldc java/lang/Enum
    //   298: aload_1
    //   299: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   302: ifeq -> 308
    //   305: goto -> 603
    //   308: aload_0
    //   309: aload_1
    //   310: invokevirtual newInstance : (Ljava/lang/Class;)Ljava/lang/Object;
    //   313: astore_1
    //   314: aload_1
    //   315: instanceof com/badlogic/gdx/utils/Json$Serializable
    //   318: ifeq -> 334
    //   321: aload_1
    //   322: checkcast com/badlogic/gdx/utils/Json$Serializable
    //   325: aload_0
    //   326: aload_3
    //   327: invokeinterface read : (Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    //   332: aload_1
    //   333: areturn
    //   334: aload_1
    //   335: instanceof com/badlogic/gdx/utils/ObjectMap
    //   338: ifeq -> 384
    //   341: aload_1
    //   342: checkcast com/badlogic/gdx/utils/ObjectMap
    //   345: astore #5
    //   347: aload_3
    //   348: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   351: astore_1
    //   352: aload_1
    //   353: ifnull -> 381
    //   356: aload #5
    //   358: aload_1
    //   359: getfield name : Ljava/lang/String;
    //   362: aload_0
    //   363: aload_2
    //   364: aconst_null
    //   365: aload_1
    //   366: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   369: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   372: pop
    //   373: aload_1
    //   374: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   377: astore_1
    //   378: goto -> 352
    //   381: aload #5
    //   383: areturn
    //   384: aload_1
    //   385: instanceof com/badlogic/gdx/utils/ObjectSet
    //   388: ifeq -> 433
    //   391: aload_1
    //   392: checkcast com/badlogic/gdx/utils/ObjectSet
    //   395: astore #5
    //   397: aload_3
    //   398: ldc_w 'values'
    //   401: invokevirtual getChild : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;
    //   404: astore_1
    //   405: aload_1
    //   406: ifnull -> 430
    //   409: aload #5
    //   411: aload_0
    //   412: aload_2
    //   413: aconst_null
    //   414: aload_1
    //   415: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   418: invokevirtual add : (Ljava/lang/Object;)Z
    //   421: pop
    //   422: aload_1
    //   423: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   426: astore_1
    //   427: goto -> 405
    //   430: aload #5
    //   432: areturn
    //   433: aload_1
    //   434: instanceof com/badlogic/gdx/utils/IntSet
    //   437: ifeq -> 476
    //   440: aload_1
    //   441: checkcast com/badlogic/gdx/utils/IntSet
    //   444: astore_2
    //   445: aload_3
    //   446: ldc_w 'values'
    //   449: invokevirtual getChild : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonValue;
    //   452: astore_1
    //   453: aload_1
    //   454: ifnull -> 474
    //   457: aload_2
    //   458: aload_1
    //   459: invokevirtual asInt : ()I
    //   462: invokevirtual add : (I)Z
    //   465: pop
    //   466: aload_1
    //   467: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   470: astore_1
    //   471: goto -> 453
    //   474: aload_2
    //   475: areturn
    //   476: aload_1
    //   477: instanceof com/badlogic/gdx/utils/ArrayMap
    //   480: ifeq -> 526
    //   483: aload_1
    //   484: checkcast com/badlogic/gdx/utils/ArrayMap
    //   487: astore #5
    //   489: aload_3
    //   490: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   493: astore_1
    //   494: aload_1
    //   495: ifnull -> 523
    //   498: aload #5
    //   500: aload_1
    //   501: getfield name : Ljava/lang/String;
    //   504: aload_0
    //   505: aload_2
    //   506: aconst_null
    //   507: aload_1
    //   508: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   511: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)I
    //   514: pop
    //   515: aload_1
    //   516: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   519: astore_1
    //   520: goto -> 494
    //   523: aload #5
    //   525: areturn
    //   526: aload_1
    //   527: instanceof java/util/Map
    //   530: ifeq -> 595
    //   533: aload_1
    //   534: checkcast java/util/Map
    //   537: astore #5
    //   539: aload_3
    //   540: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   543: astore_1
    //   544: aload_1
    //   545: ifnull -> 592
    //   548: aload_1
    //   549: getfield name : Ljava/lang/String;
    //   552: aload_0
    //   553: getfield typeName : Ljava/lang/String;
    //   556: invokevirtual equals : (Ljava/lang/Object;)Z
    //   559: ifeq -> 565
    //   562: goto -> 584
    //   565: aload #5
    //   567: aload_1
    //   568: getfield name : Ljava/lang/String;
    //   571: aload_0
    //   572: aload_2
    //   573: aconst_null
    //   574: aload_1
    //   575: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   578: invokeinterface put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   583: pop
    //   584: aload_1
    //   585: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   588: astore_1
    //   589: goto -> 544
    //   592: aload #5
    //   594: areturn
    //   595: aload_0
    //   596: aload_1
    //   597: aload_3
    //   598: invokevirtual readFields : (Ljava/lang/Object;Lcom/badlogic/gdx/utils/JsonValue;)V
    //   601: aload_1
    //   602: areturn
    //   603: aload_0
    //   604: ldc_w 'value'
    //   607: aload_1
    //   608: aload_3
    //   609: invokevirtual readValue : (Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   612: areturn
    //   613: aload #4
    //   615: ifnull -> 678
    //   618: aload_0
    //   619: getfield classToSerializer : Lcom/badlogic/gdx/utils/ObjectMap;
    //   622: aload #4
    //   624: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   627: checkcast com/badlogic/gdx/utils/Json$Serializer
    //   630: astore_1
    //   631: aload_1
    //   632: ifnull -> 647
    //   635: aload_1
    //   636: aload_0
    //   637: aload #5
    //   639: aload #4
    //   641: invokeinterface read : (Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;Ljava/lang/Class;)Ljava/lang/Object;
    //   646: areturn
    //   647: ldc com/badlogic/gdx/utils/Json$Serializable
    //   649: aload #4
    //   651: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   654: ifeq -> 678
    //   657: aload_0
    //   658: aload #4
    //   660: invokevirtual newInstance : (Ljava/lang/Class;)Ljava/lang/Object;
    //   663: astore_1
    //   664: aload_1
    //   665: checkcast com/badlogic/gdx/utils/Json$Serializable
    //   668: aload_0
    //   669: aload #5
    //   671: invokeinterface read : (Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    //   676: aload_1
    //   677: areturn
    //   678: aload #5
    //   680: invokevirtual isArray : ()Z
    //   683: istore #6
    //   685: iconst_0
    //   686: istore #7
    //   688: iconst_0
    //   689: istore #8
    //   691: iload #6
    //   693: ifeq -> 1047
    //   696: aload #4
    //   698: ifnull -> 711
    //   701: aload #4
    //   703: astore_1
    //   704: aload #4
    //   706: ldc java/lang/Object
    //   708: if_acmpne -> 714
    //   711: ldc com/badlogic/gdx/utils/Array
    //   713: astore_1
    //   714: ldc com/badlogic/gdx/utils/Array
    //   716: aload_1
    //   717: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   720: ifeq -> 780
    //   723: aload_1
    //   724: ldc com/badlogic/gdx/utils/Array
    //   726: if_acmpne -> 740
    //   729: new com/badlogic/gdx/utils/Array
    //   732: dup
    //   733: invokespecial <init> : ()V
    //   736: astore_1
    //   737: goto -> 749
    //   740: aload_0
    //   741: aload_1
    //   742: invokevirtual newInstance : (Ljava/lang/Class;)Ljava/lang/Object;
    //   745: checkcast com/badlogic/gdx/utils/Array
    //   748: astore_1
    //   749: aload #5
    //   751: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   754: astore_3
    //   755: aload_3
    //   756: ifnull -> 778
    //   759: aload_1
    //   760: aload_0
    //   761: aload_2
    //   762: aconst_null
    //   763: aload_3
    //   764: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   767: invokevirtual add : (Ljava/lang/Object;)V
    //   770: aload_3
    //   771: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   774: astore_3
    //   775: goto -> 755
    //   778: aload_1
    //   779: areturn
    //   780: ldc_w com/badlogic/gdx/utils/Queue
    //   783: aload_1
    //   784: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   787: ifeq -> 848
    //   790: aload_1
    //   791: ldc_w com/badlogic/gdx/utils/Queue
    //   794: if_acmpne -> 808
    //   797: new com/badlogic/gdx/utils/Queue
    //   800: dup
    //   801: invokespecial <init> : ()V
    //   804: astore_1
    //   805: goto -> 817
    //   808: aload_0
    //   809: aload_1
    //   810: invokevirtual newInstance : (Ljava/lang/Class;)Ljava/lang/Object;
    //   813: checkcast com/badlogic/gdx/utils/Queue
    //   816: astore_1
    //   817: aload #5
    //   819: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   822: astore_3
    //   823: aload_3
    //   824: ifnull -> 846
    //   827: aload_1
    //   828: aload_0
    //   829: aload_2
    //   830: aconst_null
    //   831: aload_3
    //   832: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   835: invokevirtual addLast : (Ljava/lang/Object;)V
    //   838: aload_3
    //   839: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   842: astore_3
    //   843: goto -> 823
    //   846: aload_1
    //   847: areturn
    //   848: ldc_w java/util/Collection
    //   851: aload_1
    //   852: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   855: ifeq -> 919
    //   858: aload_1
    //   859: invokevirtual isInterface : ()Z
    //   862: ifeq -> 876
    //   865: new java/util/ArrayList
    //   868: dup
    //   869: invokespecial <init> : ()V
    //   872: astore_1
    //   873: goto -> 885
    //   876: aload_0
    //   877: aload_1
    //   878: invokevirtual newInstance : (Ljava/lang/Class;)Ljava/lang/Object;
    //   881: checkcast java/util/Collection
    //   884: astore_1
    //   885: aload #5
    //   887: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   890: astore_3
    //   891: aload_3
    //   892: ifnull -> 917
    //   895: aload_1
    //   896: aload_0
    //   897: aload_2
    //   898: aconst_null
    //   899: aload_3
    //   900: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   903: invokeinterface add : (Ljava/lang/Object;)Z
    //   908: pop
    //   909: aload_3
    //   910: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   913: astore_3
    //   914: goto -> 891
    //   917: aload_1
    //   918: areturn
    //   919: aload_1
    //   920: invokevirtual isArray : ()Z
    //   923: ifeq -> 989
    //   926: aload_1
    //   927: invokevirtual getComponentType : ()Ljava/lang/Class;
    //   930: astore_3
    //   931: aload_2
    //   932: astore_1
    //   933: aload_2
    //   934: ifnonnull -> 939
    //   937: aload_3
    //   938: astore_1
    //   939: aload_3
    //   940: aload #5
    //   942: getfield size : I
    //   945: invokestatic newInstance : (Ljava/lang/Class;I)Ljava/lang/Object;
    //   948: astore_3
    //   949: aload #5
    //   951: getfield child : Lcom/badlogic/gdx/utils/JsonValue;
    //   954: astore_2
    //   955: iload #8
    //   957: istore #7
    //   959: aload_2
    //   960: ifnull -> 987
    //   963: aload_3
    //   964: iload #7
    //   966: aload_0
    //   967: aload_1
    //   968: aconst_null
    //   969: aload_2
    //   970: invokevirtual readValue : (Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    //   973: invokestatic set : (Ljava/lang/Object;ILjava/lang/Object;)V
    //   976: aload_2
    //   977: getfield next : Lcom/badlogic/gdx/utils/JsonValue;
    //   980: astore_2
    //   981: iinc #7, 1
    //   984: goto -> 959
    //   987: aload_3
    //   988: areturn
    //   989: new java/lang/StringBuilder
    //   992: dup
    //   993: invokespecial <init> : ()V
    //   996: astore_2
    //   997: aload_2
    //   998: ldc_w 'Unable to convert value to required type: '
    //   1001: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1004: pop
    //   1005: aload_2
    //   1006: aload #5
    //   1008: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1011: pop
    //   1012: aload_2
    //   1013: ldc ' ('
    //   1015: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1018: pop
    //   1019: aload_2
    //   1020: aload_1
    //   1021: invokevirtual getName : ()Ljava/lang/String;
    //   1024: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1027: pop
    //   1028: aload_2
    //   1029: ldc ')'
    //   1031: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1034: pop
    //   1035: new com/badlogic/gdx/utils/SerializationException
    //   1038: dup
    //   1039: aload_2
    //   1040: invokevirtual toString : ()Ljava/lang/String;
    //   1043: invokespecial <init> : (Ljava/lang/String;)V
    //   1046: athrow
    //   1047: aload #5
    //   1049: invokevirtual isNumber : ()Z
    //   1052: ifeq -> 1258
    //   1055: aload #4
    //   1057: ifnull -> 1229
    //   1060: aload #4
    //   1062: getstatic java/lang/Float.TYPE : Ljava/lang/Class;
    //   1065: if_acmpeq -> 1229
    //   1068: aload #4
    //   1070: ldc_w java/lang/Float
    //   1073: if_acmpne -> 1079
    //   1076: goto -> 1229
    //   1079: aload #4
    //   1081: getstatic java/lang/Integer.TYPE : Ljava/lang/Class;
    //   1084: if_acmpeq -> 1220
    //   1087: aload #4
    //   1089: ldc_w java/lang/Integer
    //   1092: if_acmpne -> 1098
    //   1095: goto -> 1220
    //   1098: aload #4
    //   1100: getstatic java/lang/Long.TYPE : Ljava/lang/Class;
    //   1103: if_acmpeq -> 1211
    //   1106: aload #4
    //   1108: ldc_w java/lang/Long
    //   1111: if_acmpne -> 1117
    //   1114: goto -> 1211
    //   1117: aload #4
    //   1119: getstatic java/lang/Double.TYPE : Ljava/lang/Class;
    //   1122: if_acmpeq -> 1202
    //   1125: aload #4
    //   1127: ldc_w java/lang/Double
    //   1130: if_acmpne -> 1136
    //   1133: goto -> 1202
    //   1136: aload #4
    //   1138: ldc java/lang/String
    //   1140: if_acmpne -> 1149
    //   1143: aload #5
    //   1145: invokevirtual asString : ()Ljava/lang/String;
    //   1148: areturn
    //   1149: aload #4
    //   1151: getstatic java/lang/Short.TYPE : Ljava/lang/Class;
    //   1154: if_acmpeq -> 1193
    //   1157: aload #4
    //   1159: ldc_w java/lang/Short
    //   1162: if_acmpne -> 1168
    //   1165: goto -> 1193
    //   1168: aload #4
    //   1170: getstatic java/lang/Byte.TYPE : Ljava/lang/Class;
    //   1173: if_acmpeq -> 1184
    //   1176: aload #4
    //   1178: ldc_w java/lang/Byte
    //   1181: if_acmpne -> 1242
    //   1184: aload #5
    //   1186: invokevirtual asByte : ()B
    //   1189: invokestatic valueOf : (B)Ljava/lang/Byte;
    //   1192: areturn
    //   1193: aload #5
    //   1195: invokevirtual asShort : ()S
    //   1198: invokestatic valueOf : (S)Ljava/lang/Short;
    //   1201: areturn
    //   1202: aload #5
    //   1204: invokevirtual asDouble : ()D
    //   1207: invokestatic valueOf : (D)Ljava/lang/Double;
    //   1210: areturn
    //   1211: aload #5
    //   1213: invokevirtual asLong : ()J
    //   1216: invokestatic valueOf : (J)Ljava/lang/Long;
    //   1219: areturn
    //   1220: aload #5
    //   1222: invokevirtual asInt : ()I
    //   1225: invokestatic valueOf : (I)Ljava/lang/Integer;
    //   1228: areturn
    //   1229: aload #5
    //   1231: invokevirtual asFloat : ()F
    //   1234: fstore #9
    //   1236: fload #9
    //   1238: invokestatic valueOf : (F)Ljava/lang/Float;
    //   1241: areturn
    //   1242: new com/badlogic/gdx/utils/JsonValue
    //   1245: dup
    //   1246: aload #5
    //   1248: invokevirtual asString : ()Ljava/lang/String;
    //   1251: invokespecial <init> : (Ljava/lang/String;)V
    //   1254: astore_1
    //   1255: goto -> 1261
    //   1258: aload #5
    //   1260: astore_1
    //   1261: aload_1
    //   1262: astore_2
    //   1263: aload_1
    //   1264: invokevirtual isBoolean : ()Z
    //   1267: ifeq -> 1315
    //   1270: aload #4
    //   1272: ifnull -> 1291
    //   1275: aload #4
    //   1277: getstatic java/lang/Boolean.TYPE : Ljava/lang/Class;
    //   1280: if_acmpeq -> 1291
    //   1283: aload #4
    //   1285: ldc_w java/lang/Boolean
    //   1288: if_acmpne -> 1303
    //   1291: aload_1
    //   1292: invokevirtual asBoolean : ()Z
    //   1295: istore #6
    //   1297: iload #6
    //   1299: invokestatic valueOf : (Z)Ljava/lang/Boolean;
    //   1302: areturn
    //   1303: new com/badlogic/gdx/utils/JsonValue
    //   1306: dup
    //   1307: aload_1
    //   1308: invokevirtual asString : ()Ljava/lang/String;
    //   1311: invokespecial <init> : (Ljava/lang/String;)V
    //   1314: astore_2
    //   1315: aload_2
    //   1316: invokevirtual isString : ()Z
    //   1319: ifeq -> 1665
    //   1322: aload_2
    //   1323: invokevirtual asString : ()Ljava/lang/String;
    //   1326: astore_1
    //   1327: aload #4
    //   1329: ifnull -> 1663
    //   1332: aload #4
    //   1334: ldc java/lang/String
    //   1336: if_acmpne -> 1342
    //   1339: goto -> 1663
    //   1342: aload #4
    //   1344: getstatic java/lang/Integer.TYPE : Ljava/lang/Class;
    //   1347: if_acmpeq -> 1478
    //   1350: aload #4
    //   1352: ldc_w java/lang/Integer
    //   1355: if_acmpne -> 1361
    //   1358: goto -> 1478
    //   1361: aload #4
    //   1363: getstatic java/lang/Float.TYPE : Ljava/lang/Class;
    //   1366: if_acmpeq -> 1473
    //   1369: aload #4
    //   1371: ldc_w java/lang/Float
    //   1374: if_acmpne -> 1380
    //   1377: goto -> 1473
    //   1380: aload #4
    //   1382: getstatic java/lang/Long.TYPE : Ljava/lang/Class;
    //   1385: if_acmpeq -> 1468
    //   1388: aload #4
    //   1390: ldc_w java/lang/Long
    //   1393: if_acmpne -> 1399
    //   1396: goto -> 1468
    //   1399: aload #4
    //   1401: getstatic java/lang/Double.TYPE : Ljava/lang/Class;
    //   1404: if_acmpeq -> 1463
    //   1407: aload #4
    //   1409: ldc_w java/lang/Double
    //   1412: if_acmpne -> 1418
    //   1415: goto -> 1463
    //   1418: aload #4
    //   1420: getstatic java/lang/Short.TYPE : Ljava/lang/Class;
    //   1423: if_acmpeq -> 1458
    //   1426: aload #4
    //   1428: ldc_w java/lang/Short
    //   1431: if_acmpne -> 1437
    //   1434: goto -> 1458
    //   1437: aload #4
    //   1439: getstatic java/lang/Byte.TYPE : Ljava/lang/Class;
    //   1442: if_acmpeq -> 1453
    //   1445: aload #4
    //   1447: ldc_w java/lang/Byte
    //   1450: if_acmpne -> 1485
    //   1453: aload_1
    //   1454: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Byte;
    //   1457: areturn
    //   1458: aload_1
    //   1459: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Short;
    //   1462: areturn
    //   1463: aload_1
    //   1464: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Double;
    //   1467: areturn
    //   1468: aload_1
    //   1469: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Long;
    //   1472: areturn
    //   1473: aload_1
    //   1474: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Float;
    //   1477: areturn
    //   1478: aload_1
    //   1479: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Integer;
    //   1482: astore_3
    //   1483: aload_3
    //   1484: areturn
    //   1485: aload #4
    //   1487: getstatic java/lang/Boolean.TYPE : Ljava/lang/Class;
    //   1490: if_acmpeq -> 1658
    //   1493: aload #4
    //   1495: ldc_w java/lang/Boolean
    //   1498: if_acmpne -> 1504
    //   1501: goto -> 1658
    //   1504: aload #4
    //   1506: getstatic java/lang/Character.TYPE : Ljava/lang/Class;
    //   1509: if_acmpeq -> 1649
    //   1512: aload #4
    //   1514: ldc_w java/lang/Character
    //   1517: if_acmpne -> 1523
    //   1520: goto -> 1649
    //   1523: ldc java/lang/Enum
    //   1525: aload #4
    //   1527: invokestatic isAssignableFrom : (Ljava/lang/Class;Ljava/lang/Class;)Z
    //   1530: ifeq -> 1581
    //   1533: aload #4
    //   1535: invokevirtual getEnumConstants : ()[Ljava/lang/Object;
    //   1538: checkcast [Ljava/lang/Enum;
    //   1541: astore_3
    //   1542: aload_3
    //   1543: arraylength
    //   1544: istore #8
    //   1546: iload #7
    //   1548: iload #8
    //   1550: if_icmpge -> 1581
    //   1553: aload_3
    //   1554: iload #7
    //   1556: aaload
    //   1557: astore #5
    //   1559: aload_1
    //   1560: aload_0
    //   1561: aload #5
    //   1563: invokespecial convertToString : (Ljava/lang/Enum;)Ljava/lang/String;
    //   1566: invokevirtual equals : (Ljava/lang/Object;)Z
    //   1569: ifeq -> 1575
    //   1572: aload #5
    //   1574: areturn
    //   1575: iinc #7, 1
    //   1578: goto -> 1546
    //   1581: aload #4
    //   1583: ldc_w java/lang/CharSequence
    //   1586: if_acmpne -> 1591
    //   1589: aload_1
    //   1590: areturn
    //   1591: new java/lang/StringBuilder
    //   1594: dup
    //   1595: invokespecial <init> : ()V
    //   1598: astore_1
    //   1599: aload_1
    //   1600: ldc_w 'Unable to convert value to required type: '
    //   1603: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1606: pop
    //   1607: aload_1
    //   1608: aload_2
    //   1609: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1612: pop
    //   1613: aload_1
    //   1614: ldc ' ('
    //   1616: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1619: pop
    //   1620: aload_1
    //   1621: aload #4
    //   1623: invokevirtual getName : ()Ljava/lang/String;
    //   1626: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1629: pop
    //   1630: aload_1
    //   1631: ldc ')'
    //   1633: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1636: pop
    //   1637: new com/badlogic/gdx/utils/SerializationException
    //   1640: dup
    //   1641: aload_1
    //   1642: invokevirtual toString : ()Ljava/lang/String;
    //   1645: invokespecial <init> : (Ljava/lang/String;)V
    //   1648: athrow
    //   1649: aload_1
    //   1650: iconst_0
    //   1651: invokevirtual charAt : (I)C
    //   1654: invokestatic valueOf : (C)Ljava/lang/Character;
    //   1657: areturn
    //   1658: aload_1
    //   1659: invokestatic valueOf : (Ljava/lang/String;)Ljava/lang/Boolean;
    //   1662: areturn
    //   1663: aload_1
    //   1664: areturn
    //   1665: aconst_null
    //   1666: areturn
    //   1667: astore_1
    //   1668: goto -> 1242
    //   1671: astore_2
    //   1672: goto -> 1303
    //   1675: astore_3
    //   1676: goto -> 1485
    // Exception table:
    //   from	to	target	type
    //   66	72	75	com/badlogic/gdx/utils/reflect/ReflectionException
    //   1060	1068	1667	java/lang/NumberFormatException
    //   1079	1087	1667	java/lang/NumberFormatException
    //   1098	1106	1667	java/lang/NumberFormatException
    //   1117	1125	1667	java/lang/NumberFormatException
    //   1143	1149	1667	java/lang/NumberFormatException
    //   1149	1157	1667	java/lang/NumberFormatException
    //   1168	1176	1667	java/lang/NumberFormatException
    //   1184	1193	1667	java/lang/NumberFormatException
    //   1193	1202	1667	java/lang/NumberFormatException
    //   1202	1211	1667	java/lang/NumberFormatException
    //   1211	1220	1667	java/lang/NumberFormatException
    //   1220	1229	1667	java/lang/NumberFormatException
    //   1229	1236	1667	java/lang/NumberFormatException
    //   1275	1283	1671	java/lang/NumberFormatException
    //   1291	1297	1671	java/lang/NumberFormatException
    //   1342	1350	1675	java/lang/NumberFormatException
    //   1361	1369	1675	java/lang/NumberFormatException
    //   1380	1388	1675	java/lang/NumberFormatException
    //   1399	1407	1675	java/lang/NumberFormatException
    //   1418	1426	1675	java/lang/NumberFormatException
    //   1437	1445	1675	java/lang/NumberFormatException
    //   1453	1458	1675	java/lang/NumberFormatException
    //   1458	1463	1675	java/lang/NumberFormatException
    //   1463	1468	1675	java/lang/NumberFormatException
    //   1468	1473	1675	java/lang/NumberFormatException
    //   1473	1478	1675	java/lang/NumberFormatException
    //   1478	1483	1675	java/lang/NumberFormatException }
  
  public <T> T readValue(Class<T> paramClass1, Class paramClass2, T paramT, JsonValue paramJsonValue) { return (paramJsonValue == null) ? paramT : (T)readValue(paramClass1, paramClass2, paramJsonValue); }
  
  public <T> T readValue(String paramString, Class<T> paramClass, JsonValue paramJsonValue) { return (T)readValue(paramClass, null, paramJsonValue.get(paramString)); }
  
  public <T> T readValue(String paramString, Class<T> paramClass1, Class paramClass2, JsonValue paramJsonValue) { return (T)readValue(paramClass1, paramClass2, paramJsonValue.get(paramString)); }
  
  public <T> T readValue(String paramString, Class<T> paramClass1, Class paramClass2, T paramT, JsonValue paramJsonValue) { return (T)readValue(paramClass1, paramClass2, paramT, paramJsonValue.get(paramString)); }
  
  public <T> T readValue(String paramString, Class<T> paramClass, T paramT, JsonValue paramJsonValue) {
    JsonValue jsonValue = paramJsonValue.get(paramString);
    return (jsonValue == null) ? paramT : (T)readValue(paramClass, null, jsonValue);
  }
  
  public void setDefaultSerializer(Serializer paramSerializer) { this.defaultSerializer = paramSerializer; }
  
  public void setDeprecated(Class paramClass, String paramString, boolean paramBoolean) {
    FieldMetadata fieldMetadata = (FieldMetadata)getFields(paramClass).get(paramString);
    if (fieldMetadata != null) {
      fieldMetadata.deprecated = paramBoolean;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Field not found: ");
    stringBuilder.append(paramString);
    stringBuilder.append(" (");
    stringBuilder.append(paramClass.getName());
    stringBuilder.append(")");
    throw new SerializationException(stringBuilder.toString());
  }
  
  public void setElementType(Class paramClass1, String paramString, Class paramClass2) {
    FieldMetadata fieldMetadata = (FieldMetadata)getFields(paramClass1).get(paramString);
    if (fieldMetadata != null) {
      fieldMetadata.elementType = paramClass2;
      return;
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("Field not found: ");
    stringBuilder.append(paramString);
    stringBuilder.append(" (");
    stringBuilder.append(paramClass1.getName());
    stringBuilder.append(")");
    throw new SerializationException(stringBuilder.toString());
  }
  
  public void setEnumNames(boolean paramBoolean) { this.enumNames = paramBoolean; }
  
  public void setIgnoreDeprecated(boolean paramBoolean) { this.ignoreDeprecated = paramBoolean; }
  
  public void setIgnoreUnknownFields(boolean paramBoolean) { this.ignoreUnknownFields = paramBoolean; }
  
  public void setOutputType(JsonWriter.OutputType paramOutputType) { this.outputType = paramOutputType; }
  
  public void setQuoteLongValues(boolean paramBoolean) { this.quoteLongValues = paramBoolean; }
  
  public void setReadDeprecated(boolean paramBoolean) { this.readDeprecated = paramBoolean; }
  
  public <T> void setSerializer(Class<T> paramClass, Serializer<T> paramSerializer) { this.classToSerializer.put(paramClass, paramSerializer); }
  
  public void setSortFields(boolean paramBoolean) { this.sortFields = paramBoolean; }
  
  public void setTypeName(String paramString) { this.typeName = paramString; }
  
  public void setUsePrototypes(boolean paramBoolean) { this.usePrototypes = paramBoolean; }
  
  public void setWriter(Writer paramWriter) {
    Writer writer1 = paramWriter;
    if (!(paramWriter instanceof JsonWriter))
      writer1 = new JsonWriter(paramWriter); 
    this.writer = (JsonWriter)writer1;
    this.writer.setOutputType(this.outputType);
    this.writer.setQuoteLongValues(this.quoteLongValues);
  }
  
  public String toJson(Object paramObject) {
    Class clazz;
    if (paramObject == null) {
      clazz = null;
    } else {
      clazz = paramObject.getClass();
    } 
    return toJson(paramObject, clazz, (Class)null);
  }
  
  public String toJson(Object paramObject, Class paramClass) { return toJson(paramObject, paramClass, (Class)null); }
  
  public String toJson(Object paramObject, Class paramClass1, Class paramClass2) {
    StringWriter stringWriter = new StringWriter();
    toJson(paramObject, paramClass1, paramClass2, stringWriter);
    return stringWriter.toString();
  }
  
  public void toJson(Object paramObject, FileHandle paramFileHandle) {
    Class clazz;
    if (paramObject == null) {
      clazz = null;
    } else {
      clazz = paramObject.getClass();
    } 
    toJson(paramObject, clazz, null, paramFileHandle);
  }
  
  public void toJson(Object paramObject, Writer paramWriter) {
    Class clazz;
    if (paramObject == null) {
      clazz = null;
    } else {
      clazz = paramObject.getClass();
    } 
    toJson(paramObject, clazz, null, paramWriter);
  }
  
  public void toJson(Object paramObject, Class paramClass, FileHandle paramFileHandle) { toJson(paramObject, paramClass, null, paramFileHandle); }
  
  public void toJson(Object paramObject, Class paramClass, Writer paramWriter) { toJson(paramObject, paramClass, null, paramWriter); }
  
  public void toJson(Object paramObject, Class paramClass1, Class paramClass2, FileHandle paramFileHandle) {
    Writer writer1 = null;
    Writer writer2 = null;
    try {
      Writer writer3 = paramFileHandle.writer(false, "UTF-8");
      writer2 = writer3;
      writer1 = writer3;
      toJson(paramObject, paramClass1, paramClass2, writer3);
      StreamUtils.closeQuietly(writer3);
      return;
    } catch (Exception paramClass2) {
      writer2 = writer1;
      paramObject = new SerializationException();
      writer2 = writer1;
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      writer2 = writer1;
      this();
      writer2 = writer1;
      stringBuilder.append("Error writing file: ");
      writer2 = writer1;
      stringBuilder.append(paramFileHandle);
      writer2 = writer1;
      super(stringBuilder.toString(), paramClass2);
      writer2 = writer1;
      throw paramObject;
    } finally {}
    StreamUtils.closeQuietly(writer2);
    throw paramObject;
  }
  
  public void toJson(Object paramObject, Class paramClass1, Class paramClass2, Writer paramWriter) {
    setWriter(paramWriter);
    try {
      writeValue(paramObject, paramClass1, paramClass2);
      return;
    } finally {
      StreamUtils.closeQuietly(this.writer);
      this.writer = null;
    } 
  }
  
  public void writeArrayEnd() {
    try {
      this.writer.pop();
      return;
    } catch (IOException iOException) {
      throw new SerializationException(iOException);
    } 
  }
  
  public void writeArrayStart() {
    try {
      this.writer.array();
      return;
    } catch (IOException iOException) {
      throw new SerializationException(iOException);
    } 
  }
  
  public void writeArrayStart(String paramString) {
    try {
      this.writer.name(paramString);
      this.writer.array();
      return;
    } catch (IOException paramString) {
      throw new SerializationException(paramString);
    } 
  }
  
  public void writeField(Object paramObject, String paramString) { writeField(paramObject, paramString, paramString, null); }
  
  public void writeField(Object paramObject, String paramString, Class paramClass) { writeField(paramObject, paramString, paramString, paramClass); }
  
  public void writeField(Object paramObject, String paramString1, String paramString2) { writeField(paramObject, paramString1, paramString2, null); }
  
  public void writeField(Object paramObject, String paramString1, String paramString2, Class paramClass) {
    java.lang.StringBuilder stringBuilder;
    Class clazz = paramObject.getClass();
    FieldMetadata fieldMetadata = (FieldMetadata)getFields(clazz).get(paramString1);
    if (fieldMetadata != null) {
      Field field = fieldMetadata.field;
      stringBuilder = paramClass;
      if (paramClass == null)
        stringBuilder = fieldMetadata.elementType; 
      try {
        this.writer.name(paramString2);
        writeValue(field.get(paramObject), field.getType(), stringBuilder);
        return;
      } catch (ReflectionException null) {
        paramObject = new java.lang.StringBuilder();
        paramObject.append("Error accessing field: ");
        paramObject.append(field.getName());
        paramObject.append(" (");
        paramObject.append(clazz.getName());
        paramObject.append(")");
        throw new SerializationException(paramObject.toString(), stringBuilder);
      } catch (SerializationException paramObject) {
        java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
        stringBuilder1.append(field);
        stringBuilder1.append(" (");
        stringBuilder1.append(clazz.getName());
        stringBuilder1.append(")");
        paramObject.addTrace(stringBuilder1.toString());
        throw paramObject;
      } catch (Exception paramObject) {
        paramObject = new SerializationException(paramObject);
        stringBuilder = new java.lang.StringBuilder();
        stringBuilder.append(field);
        stringBuilder.append(" (");
        stringBuilder.append(clazz.getName());
        stringBuilder.append(")");
        paramObject.addTrace(stringBuilder.toString());
        throw paramObject;
      } 
    } 
    paramObject = new java.lang.StringBuilder();
    paramObject.append("Field not found: ");
    paramObject.append(stringBuilder);
    paramObject.append(" (");
    paramObject.append(clazz.getName());
    paramObject.append(")");
    throw new SerializationException(paramObject.toString());
  }
  
  public void writeFields(Object paramObject) { // Byte code:
    //   0: aload_1
    //   1: invokevirtual getClass : ()Ljava/lang/Class;
    //   4: astore_2
    //   5: aload_0
    //   6: aload_2
    //   7: invokespecial getDefaultValues : (Ljava/lang/Class;)[Ljava/lang/Object;
    //   10: astore_3
    //   11: new com/badlogic/gdx/utils/OrderedMap$OrderedMapValues
    //   14: dup
    //   15: aload_0
    //   16: aload_2
    //   17: invokespecial getFields : (Ljava/lang/Class;)Lcom/badlogic/gdx/utils/OrderedMap;
    //   20: invokespecial <init> : (Lcom/badlogic/gdx/utils/OrderedMap;)V
    //   23: invokevirtual iterator : ()Lcom/badlogic/gdx/utils/ObjectMap$Values;
    //   26: astore #4
    //   28: iconst_0
    //   29: istore #5
    //   31: aload #4
    //   33: invokeinterface hasNext : ()Z
    //   38: ifeq -> 420
    //   41: aload #4
    //   43: invokeinterface next : ()Ljava/lang/Object;
    //   48: checkcast com/badlogic/gdx/utils/Json$FieldMetadata
    //   51: astore #6
    //   53: aload_0
    //   54: getfield ignoreDeprecated : Z
    //   57: ifeq -> 71
    //   60: aload #6
    //   62: getfield deprecated : Z
    //   65: ifeq -> 71
    //   68: goto -> 31
    //   71: aload #6
    //   73: getfield field : Lcom/badlogic/gdx/utils/reflect/Field;
    //   76: astore #7
    //   78: aload #7
    //   80: aload_1
    //   81: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   84: astore #8
    //   86: iload #5
    //   88: istore #9
    //   90: aload_3
    //   91: ifnull -> 201
    //   94: iload #5
    //   96: iconst_1
    //   97: iadd
    //   98: istore #9
    //   100: aload_3
    //   101: iload #5
    //   103: aaload
    //   104: astore #10
    //   106: aload #8
    //   108: ifnonnull -> 119
    //   111: aload #10
    //   113: ifnonnull -> 119
    //   116: goto -> 194
    //   119: aload #8
    //   121: ifnull -> 201
    //   124: aload #10
    //   126: ifnull -> 201
    //   129: aload #8
    //   131: aload #10
    //   133: invokevirtual equals : (Ljava/lang/Object;)Z
    //   136: ifeq -> 142
    //   139: goto -> 194
    //   142: aload #8
    //   144: invokevirtual getClass : ()Ljava/lang/Class;
    //   147: invokevirtual isArray : ()Z
    //   150: ifeq -> 201
    //   153: aload #10
    //   155: invokevirtual getClass : ()Ljava/lang/Class;
    //   158: invokevirtual isArray : ()Z
    //   161: ifeq -> 201
    //   164: aload_0
    //   165: getfield equals1 : [Ljava/lang/Object;
    //   168: iconst_0
    //   169: aload #8
    //   171: aastore
    //   172: aload_0
    //   173: getfield equals2 : [Ljava/lang/Object;
    //   176: iconst_0
    //   177: aload #10
    //   179: aastore
    //   180: aload_0
    //   181: getfield equals1 : [Ljava/lang/Object;
    //   184: aload_0
    //   185: getfield equals2 : [Ljava/lang/Object;
    //   188: invokestatic deepEquals : ([Ljava/lang/Object;[Ljava/lang/Object;)Z
    //   191: ifeq -> 201
    //   194: iload #9
    //   196: istore #5
    //   198: goto -> 31
    //   201: aload_0
    //   202: getfield writer : Lcom/badlogic/gdx/utils/JsonWriter;
    //   205: aload #7
    //   207: invokevirtual getName : ()Ljava/lang/String;
    //   210: invokevirtual name : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;
    //   213: pop
    //   214: aload_0
    //   215: aload #8
    //   217: aload #7
    //   219: invokevirtual getType : ()Ljava/lang/Class;
    //   222: aload #6
    //   224: getfield elementType : Ljava/lang/Class;
    //   227: invokevirtual writeValue : (Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)V
    //   230: iload #9
    //   232: istore #5
    //   234: goto -> 31
    //   237: astore_1
    //   238: new com/badlogic/gdx/utils/SerializationException
    //   241: dup
    //   242: aload_1
    //   243: invokespecial <init> : (Ljava/lang/Throwable;)V
    //   246: astore_1
    //   247: new java/lang/StringBuilder
    //   250: dup
    //   251: invokespecial <init> : ()V
    //   254: astore #10
    //   256: aload #10
    //   258: aload #7
    //   260: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   263: pop
    //   264: aload #10
    //   266: ldc ' ('
    //   268: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   271: pop
    //   272: aload #10
    //   274: aload_2
    //   275: invokevirtual getName : ()Ljava/lang/String;
    //   278: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   281: pop
    //   282: aload #10
    //   284: ldc ')'
    //   286: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   289: pop
    //   290: aload_1
    //   291: aload #10
    //   293: invokevirtual toString : ()Ljava/lang/String;
    //   296: invokevirtual addTrace : (Ljava/lang/String;)V
    //   299: aload_1
    //   300: athrow
    //   301: astore_1
    //   302: new java/lang/StringBuilder
    //   305: dup
    //   306: invokespecial <init> : ()V
    //   309: astore #10
    //   311: aload #10
    //   313: aload #7
    //   315: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   318: pop
    //   319: aload #10
    //   321: ldc ' ('
    //   323: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   326: pop
    //   327: aload #10
    //   329: aload_2
    //   330: invokevirtual getName : ()Ljava/lang/String;
    //   333: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   336: pop
    //   337: aload #10
    //   339: ldc ')'
    //   341: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   344: pop
    //   345: aload_1
    //   346: aload #10
    //   348: invokevirtual toString : ()Ljava/lang/String;
    //   351: invokevirtual addTrace : (Ljava/lang/String;)V
    //   354: aload_1
    //   355: athrow
    //   356: astore #10
    //   358: new java/lang/StringBuilder
    //   361: dup
    //   362: invokespecial <init> : ()V
    //   365: astore_1
    //   366: aload_1
    //   367: ldc 'Error accessing field: '
    //   369: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   372: pop
    //   373: aload_1
    //   374: aload #7
    //   376: invokevirtual getName : ()Ljava/lang/String;
    //   379: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   382: pop
    //   383: aload_1
    //   384: ldc ' ('
    //   386: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   389: pop
    //   390: aload_1
    //   391: aload_2
    //   392: invokevirtual getName : ()Ljava/lang/String;
    //   395: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: pop
    //   399: aload_1
    //   400: ldc ')'
    //   402: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   405: pop
    //   406: new com/badlogic/gdx/utils/SerializationException
    //   409: dup
    //   410: aload_1
    //   411: invokevirtual toString : ()Ljava/lang/String;
    //   414: aload #10
    //   416: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   419: athrow
    //   420: return
    // Exception table:
    //   from	to	target	type
    //   78	86	356	com/badlogic/gdx/utils/reflect/ReflectionException
    //   78	86	301	com/badlogic/gdx/utils/SerializationException
    //   78	86	237	java/lang/Exception
    //   129	139	356	com/badlogic/gdx/utils/reflect/ReflectionException
    //   129	139	301	com/badlogic/gdx/utils/SerializationException
    //   129	139	237	java/lang/Exception
    //   142	194	356	com/badlogic/gdx/utils/reflect/ReflectionException
    //   142	194	301	com/badlogic/gdx/utils/SerializationException
    //   142	194	237	java/lang/Exception
    //   201	230	356	com/badlogic/gdx/utils/reflect/ReflectionException
    //   201	230	301	com/badlogic/gdx/utils/SerializationException
    //   201	230	237	java/lang/Exception }
  
  public void writeObjectEnd() {
    try {
      this.writer.pop();
      return;
    } catch (IOException iOException) {
      throw new SerializationException(iOException);
    } 
  }
  
  public void writeObjectStart() {
    try {
      this.writer.object();
      return;
    } catch (IOException iOException) {
      throw new SerializationException(iOException);
    } 
  }
  
  public void writeObjectStart(Class paramClass1, Class paramClass2) {
    try {
      this.writer.object();
      if (paramClass2 == null || paramClass2 != paramClass1)
        writeType(paramClass1); 
      return;
    } catch (IOException paramClass1) {
      throw new SerializationException(paramClass1);
    } 
  }
  
  public void writeObjectStart(String paramString) {
    try {
      this.writer.name(paramString);
      writeObjectStart();
      return;
    } catch (IOException paramString) {
      throw new SerializationException(paramString);
    } 
  }
  
  public void writeObjectStart(String paramString, Class paramClass1, Class paramClass2) {
    try {
      this.writer.name(paramString);
      writeObjectStart(paramClass1, paramClass2);
      return;
    } catch (IOException paramString) {
      throw new SerializationException(paramString);
    } 
  }
  
  public void writeType(Class paramClass) {
    if (this.typeName == null)
      return; 
    String str1 = getTag(paramClass);
    String str2 = str1;
    if (str1 == null)
      str2 = paramClass.getName(); 
    try {
      this.writer.set(this.typeName, str2);
      return;
    } catch (IOException paramClass) {
      throw new SerializationException(paramClass);
    } 
  }
  
  public void writeValue(Object paramObject) {
    if (paramObject == null) {
      writeValue(paramObject, null, null);
    } else {
      writeValue(paramObject, paramObject.getClass(), null);
    } 
  }
  
  public void writeValue(Object paramObject, Class paramClass) { writeValue(paramObject, paramClass, null); }
  
  public void writeValue(Object paramObject, Class paramClass1, Class paramClass2) {
    Class clazz2;
    Class clazz1;
    if (paramObject == null)
      try {
        this.writer.value(null);
        return;
      } catch (IOException paramObject) {
        paramObject = new SerializationException(paramObject);
        throw paramObject;
      }  
    if ((paramClass1 != null && paramClass1.isPrimitive()) || paramClass1 == String.class || paramClass1 == Integer.class || paramClass1 == Boolean.class || paramClass1 == Float.class || paramClass1 == Long.class || paramClass1 == Double.class || paramClass1 == Short.class || paramClass1 == Byte.class || paramClass1 == Character.class) {
      this.writer.value(paramObject);
      return;
    } 
    Class clazz3 = paramObject.getClass();
    boolean bool = clazz3.isPrimitive();
    if (bool || clazz3 == String.class || clazz3 == Integer.class || clazz3 == Boolean.class || clazz3 == Float.class || clazz3 == Long.class || clazz3 == Double.class || clazz3 == Short.class || clazz3 == Byte.class || clazz3 == Character.class) {
      writeObjectStart(clazz3, null);
      writeValue("value", paramObject);
      writeObjectEnd();
      return;
    } 
    if (paramObject instanceof Serializable) {
      writeObjectStart(clazz3, paramClass1);
      ((Serializable)paramObject).write(this);
      writeObjectEnd();
      return;
    } 
    Serializer serializer = (Serializer)this.classToSerializer.get(clazz3);
    if (serializer != null) {
      serializer.write(this, paramObject, paramClass1);
      return;
    } 
    bool = paramObject instanceof Array;
    int i = 0;
    int j = 0;
    int k = 0;
    int m = 0;
    if (bool) {
      if (paramClass1 == null || clazz3 == paramClass1 || clazz3 == Array.class) {
        writeArrayStart();
        paramObject = (Array)paramObject;
        i = paramObject.size;
        while (m < i) {
          writeValue(paramObject.get(m), paramClass2, null);
          m++;
        } 
        writeArrayEnd();
        return;
      } 
      clazz2 = new SerializationException();
      paramObject = new java.lang.StringBuilder();
      super();
      paramObject.append("Serialization of an Array other than the known type is not supported.\nKnown type: ");
      paramObject.append(paramClass1);
      paramObject.append("\nActual type: ");
      paramObject.append(clazz3);
      this(paramObject.toString());
      throw clazz2;
    } 
    if (paramObject instanceof Queue) {
      if (paramClass1 == null || clazz3 == paramClass1 || clazz3 == Queue.class) {
        writeArrayStart();
        paramObject = (Queue)paramObject;
        j = paramObject.size;
        for (m = i; m < j; m++)
          writeValue(paramObject.get(m), clazz2, null); 
        writeArrayEnd();
        return;
      } 
      paramObject = new SerializationException();
      clazz2 = new java.lang.StringBuilder();
      this();
      clazz2.append("Serialization of a Queue other than the known type is not supported.\nKnown type: ");
      clazz2.append(paramClass1);
      clazz2.append("\nActual type: ");
      clazz2.append(clazz3);
      super(clazz2.toString());
      throw paramObject;
    } 
    if (paramObject instanceof Collection) {
      if (this.typeName != null && clazz3 != ArrayList.class && (paramClass1 == null || paramClass1 != clazz3)) {
        writeObjectStart(clazz3, paramClass1);
        writeArrayStart("items");
        paramObject = ((Collection)paramObject).iterator();
        while (paramObject.hasNext())
          writeValue(paramObject.next(), clazz2, null); 
        writeArrayEnd();
        writeObjectEnd();
      } else {
        writeArrayStart();
        paramObject = ((Collection)paramObject).iterator();
        while (paramObject.hasNext())
          writeValue(paramObject.next(), clazz2, null); 
        writeArrayEnd();
      } 
      return;
    } 
    if (clazz3.isArray()) {
      clazz1 = clazz2;
      if (clazz2 == null)
        clazz1 = clazz3.getComponentType(); 
      i = ArrayReflection.getLength(paramObject);
      writeArrayStart();
      for (m = j; m < i; m++)
        writeValue(ArrayReflection.get(paramObject, m), clazz1, null); 
      writeArrayEnd();
      return;
    } 
    if (paramObject instanceof ObjectMap) {
      Class clazz = clazz1;
      if (clazz1 == null)
        clazz = ObjectMap.class; 
      writeObjectStart(clazz3, clazz);
      clazz1 = ((ObjectMap)paramObject).entries().iterator();
      while (clazz1.hasNext()) {
        paramObject = (ObjectMap.Entry)clazz1.next();
        this.writer.name(convertToString(paramObject.key));
        writeValue(paramObject.value, clazz2, null);
      } 
      writeObjectEnd();
      return;
    } 
    bool = paramObject instanceof ObjectSet;
    if (bool) {
      Class clazz = clazz1;
      if (clazz1 == null)
        clazz = ObjectSet.class; 
      writeObjectStart(clazz3, clazz);
      this.writer.name("values");
      writeArrayStart();
      paramObject = ((ObjectSet)paramObject).iterator();
      while (paramObject.hasNext())
        writeValue(paramObject.next(), clazz2, null); 
      writeArrayEnd();
      writeObjectEnd();
      return;
    } 
    if (paramObject instanceof IntSet) {
      clazz2 = clazz1;
      if (clazz1 == null)
        clazz2 = IntSet.class; 
      writeObjectStart(clazz3, clazz2);
      this.writer.name("values");
      writeArrayStart();
      paramObject = ((IntSet)paramObject).iterator();
      while (paramObject.hasNext)
        writeValue(Integer.valueOf(paramObject.next()), Integer.class, null); 
      writeArrayEnd();
      writeObjectEnd();
      return;
    } 
    if (paramObject instanceof ArrayMap) {
      Class clazz = clazz1;
      if (clazz1 == null)
        clazz = ArrayMap.class; 
      writeObjectStart(clazz3, clazz);
      paramObject = (ArrayMap)paramObject;
      i = paramObject.size;
      for (m = k; m < i; m++) {
        this.writer.name(convertToString(paramObject.keys[m]));
        writeValue(paramObject.values[m], clazz2, null);
      } 
      writeObjectEnd();
      return;
    } 
    if (paramObject instanceof Map) {
      Class clazz = clazz1;
      if (clazz1 == null)
        clazz = java.util.HashMap.class; 
      writeObjectStart(clazz3, clazz);
      paramObject = ((Map)paramObject).entrySet().iterator();
      while (paramObject.hasNext()) {
        clazz1 = (Map.Entry)paramObject.next();
        this.writer.name(convertToString(clazz1.getKey()));
        writeValue(clazz1.getValue(), clazz2, null);
      } 
      writeObjectEnd();
      return;
    } 
    if (ClassReflection.isAssignableFrom(Enum.class, clazz3)) {
      if (this.typeName != null && (clazz1 == null || clazz1 != clazz3)) {
        clazz1 = clazz3;
        if (clazz3.getEnumConstants() == null)
          clazz1 = clazz3.getSuperclass(); 
        writeObjectStart(clazz1, null);
        this.writer.name("value");
        this.writer.value(convertToString((Enum)paramObject));
        writeObjectEnd();
      } else {
        this.writer.value(convertToString((Enum)paramObject));
      } 
      return;
    } 
    writeObjectStart(clazz3, clazz1);
    writeFields(paramObject);
    writeObjectEnd();
  }
  
  public void writeValue(String paramString, Object paramObject) {
    try {
      this.writer.name(paramString);
      if (paramObject == null) {
        writeValue(paramObject, null, null);
      } else {
        writeValue(paramObject, paramObject.getClass(), null);
      } 
      return;
    } catch (IOException paramString) {
      throw new SerializationException(paramString);
    } 
  }
  
  public void writeValue(String paramString, Object paramObject, Class paramClass) {
    try {
      this.writer.name(paramString);
      writeValue(paramObject, paramClass, null);
      return;
    } catch (IOException paramString) {
      throw new SerializationException(paramString);
    } 
  }
  
  public void writeValue(String paramString, Object paramObject, Class paramClass1, Class paramClass2) {
    try {
      this.writer.name(paramString);
      writeValue(paramObject, paramClass1, paramClass2);
      return;
    } catch (IOException paramString) {
      throw new SerializationException(paramString);
    } 
  }
  
  private static class FieldMetadata {
    boolean deprecated;
    
    Class elementType;
    
    final Field field;
    
    public FieldMetadata(Field param1Field) {
      this.field = param1Field;
      if (ClassReflection.isAssignableFrom(ObjectMap.class, param1Field.getType()) || ClassReflection.isAssignableFrom(Map.class, param1Field.getType())) {
        b = 1;
      } else {
        b = 0;
      } 
      this.elementType = param1Field.getElementType(b);
      this.deprecated = param1Field.isAnnotationPresent(Deprecated.class);
    }
  }
  
  public static abstract class ReadOnlySerializer<T> extends Object implements Serializer<T> {
    public abstract T read(Json param1Json, JsonValue param1JsonValue, Class param1Class);
    
    public void write(Json param1Json, T param1T, Class param1Class) {}
  }
  
  public static interface Serializable {
    void read(Json param1Json, JsonValue param1JsonValue);
    
    void write(Json param1Json);
  }
  
  public static interface Serializer<T> {
    T read(Json param1Json, JsonValue param1JsonValue, Class param1Class);
    
    void write(Json param1Json, T param1T, Class param1Class);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Json.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */