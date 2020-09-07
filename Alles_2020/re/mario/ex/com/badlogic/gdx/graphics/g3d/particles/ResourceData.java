package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import java.util.Iterator;

public class ResourceData<T> extends Object implements Json.Serializable {
  private int currentLoadIndex = 0;
  
  private Array<SaveData> data = new Array(true, 3, SaveData.class);
  
  public T resource;
  
  Array<AssetData> sharedAssets = new Array();
  
  private ObjectMap<String, SaveData> uniqueData = new ObjectMap();
  
  public ResourceData() {}
  
  public ResourceData(T paramT) {
    this();
    this.resource = paramT;
  }
  
  public SaveData createSaveData() {
    SaveData saveData = new SaveData(this);
    this.data.add(saveData);
    return saveData;
  }
  
  public SaveData createSaveData(String paramString) {
    SaveData saveData = new SaveData(this);
    if (!this.uniqueData.containsKey(paramString)) {
      this.uniqueData.put(paramString, saveData);
      return saveData;
    } 
    throw new RuntimeException("Key already used, data must be unique, use a different key");
  }
  
  <K> int getAssetData(String paramString, Class<K> paramClass) {
    Iterator iterator = this.sharedAssets.iterator();
    for (byte b = 0; iterator.hasNext(); b++) {
      AssetData assetData = (AssetData)iterator.next();
      if (assetData.filename.equals(paramString) && assetData.type.equals(paramClass))
        return b; 
    } 
    return -1;
  }
  
  public Array<AssetDescriptor> getAssetDescriptors() {
    Array array = new Array();
    for (AssetData assetData : this.sharedAssets)
      array.add(new AssetDescriptor(assetData.filename, assetData.type)); 
    return array;
  }
  
  public Array<AssetData> getAssets() { return this.sharedAssets; }
  
  public SaveData getSaveData() {
    Array array = this.data;
    int i = this.currentLoadIndex;
    this.currentLoadIndex = i + 1;
    return (SaveData)array.get(i);
  }
  
  public SaveData getSaveData(String paramString) { return (SaveData)this.uniqueData.get(paramString); }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    this.uniqueData = (ObjectMap)paramJson.readValue("unique", ObjectMap.class, paramJsonValue);
    ObjectMap.Entries entries = this.uniqueData.entries().iterator();
    while (entries.hasNext())
      ((SaveData)((ObjectMap.Entry)entries.next()).value).resources = this; 
    this.data = (Array)paramJson.readValue("data", Array.class, SaveData.class, paramJsonValue);
    Iterator iterator = this.data.iterator();
    while (iterator.hasNext())
      ((SaveData)iterator.next()).resources = this; 
    this.sharedAssets.addAll((Array)paramJson.readValue("assets", Array.class, AssetData.class, paramJsonValue));
    this.resource = paramJson.readValue("resource", null, paramJsonValue);
  }
  
  public void write(Json paramJson) {
    paramJson.writeValue("unique", this.uniqueData, ObjectMap.class);
    paramJson.writeValue("data", this.data, Array.class, SaveData.class);
    paramJson.writeValue("assets", this.sharedAssets.toArray(AssetData.class), AssetData[].class);
    paramJson.writeValue("resource", this.resource, null);
  }
  
  public static class AssetData<T> extends Object implements Json.Serializable {
    public String filename;
    
    public Class<T> type;
    
    public AssetData() {}
    
    public AssetData(String param1String, Class<T> param1Class) {
      this.filename = param1String;
      this.type = param1Class;
    }
    
    public void read(Json param1Json, JsonValue param1JsonValue) {
      this.filename = (String)param1Json.readValue("filename", String.class, param1JsonValue);
      String str = (String)param1Json.readValue("type", String.class, param1JsonValue);
      try {
        this.type = ClassReflection.forName(str);
        return;
      } catch (ReflectionException reflectionException) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Class not found: ");
        stringBuilder.append(str);
        throw new GdxRuntimeException(stringBuilder.toString(), reflectionException);
      } 
    }
    
    public void write(Json param1Json) {
      param1Json.writeValue("filename", this.filename);
      param1Json.writeValue("type", this.type.getName());
    }
  }
  
  public static interface Configurable<T> {
    void load(AssetManager param1AssetManager, ResourceData<T> param1ResourceData);
    
    void save(AssetManager param1AssetManager, ResourceData<T> param1ResourceData);
  }
  
  public static class SaveData implements Json.Serializable {
    IntArray assets = new IntArray();
    
    ObjectMap<String, Object> data = new ObjectMap();
    
    private int loadIndex = 0;
    
    protected ResourceData resources;
    
    public SaveData() {}
    
    public SaveData(ResourceData param1ResourceData) { this.resources = param1ResourceData; }
    
    public <K> K load(String param1String) { return (K)this.data.get(param1String); }
    
    public AssetDescriptor loadAsset() {
      if (this.loadIndex == this.assets.size)
        return null; 
      Array array = this.resources.sharedAssets;
      IntArray intArray = this.assets;
      int i = this.loadIndex;
      this.loadIndex = i + 1;
      ResourceData.AssetData assetData = (ResourceData.AssetData)array.get(intArray.get(i));
      return new AssetDescriptor(assetData.filename, assetData.type);
    }
    
    public void read(Json param1Json, JsonValue param1JsonValue) {
      this.data = (ObjectMap)param1Json.readValue("data", ObjectMap.class, param1JsonValue);
      this.assets.addAll((int[])param1Json.readValue("indices", int[].class, param1JsonValue));
    }
    
    public void save(String param1String, Object param1Object) { this.data.put(param1String, param1Object); }
    
    public <K> void saveAsset(String param1String, Class<K> param1Class) {
      int i = this.resources.getAssetData(param1String, param1Class);
      int j = i;
      if (i == -1) {
        this.resources.sharedAssets.add(new ResourceData.AssetData(param1String, param1Class));
        j = this.resources.sharedAssets.size - 1;
      } 
      this.assets.add(j);
    }
    
    public void write(Json param1Json) {
      param1Json.writeValue("data", this.data, ObjectMap.class);
      param1Json.writeValue("indices", this.assets.toArray(), int[].class);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ResourceData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */