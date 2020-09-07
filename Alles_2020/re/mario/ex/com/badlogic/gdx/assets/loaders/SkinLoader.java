package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ObjectMap;

public class SkinLoader extends AsynchronousAssetLoader<Skin, SkinLoader.SkinParameter> {
  public SkinLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, SkinParameter paramSkinParameter) {
    StringBuilder stringBuilder;
    Array array = new Array();
    if (paramSkinParameter == null || paramSkinParameter.textureAtlasPath == null) {
      stringBuilder = new StringBuilder();
      stringBuilder.append(paramFileHandle.pathWithoutExtension());
      stringBuilder.append(".atlas");
      array.add(new AssetDescriptor(stringBuilder.toString(), TextureAtlas.class));
      return array;
    } 
    if (stringBuilder.textureAtlasPath != null)
      array.add(new AssetDescriptor(stringBuilder.textureAtlasPath, TextureAtlas.class)); 
    return array;
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, SkinParameter paramSkinParameter) {}
  
  public Skin loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, SkinParameter paramSkinParameter) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(paramFileHandle.pathWithoutExtension());
    stringBuilder.append(".atlas");
    String str1 = stringBuilder.toString();
    Object object = null;
    ObjectMap objectMap = object;
    String str2 = str1;
    if (paramSkinParameter != null) {
      if (paramSkinParameter.textureAtlasPath != null)
        str1 = paramSkinParameter.textureAtlasPath; 
      objectMap = object;
      str2 = str1;
      if (paramSkinParameter.resources != null) {
        objectMap = paramSkinParameter.resources;
        str2 = str1;
      } 
    } 
    Skin skin = newSkin((TextureAtlas)paramAssetManager.get(str2, TextureAtlas.class));
    if (objectMap != null) {
      ObjectMap.Entries entries = objectMap.entries().iterator();
      while (entries.hasNext()) {
        ObjectMap.Entry entry = (ObjectMap.Entry)entries.next();
        skin.add((String)entry.key, entry.value);
      } 
    } 
    skin.load(paramFileHandle);
    return skin;
  }
  
  protected Skin newSkin(TextureAtlas paramTextureAtlas) { return new Skin(paramTextureAtlas); }
  
  public static class SkinParameter extends AssetLoaderParameters<Skin> {
    public final ObjectMap<String, Object> resources;
    
    public final String textureAtlasPath;
    
    public SkinParameter() { this(null, null); }
    
    public SkinParameter(ObjectMap<String, Object> param1ObjectMap) { this(null, param1ObjectMap); }
    
    public SkinParameter(String param1String) { this(param1String, null); }
    
    public SkinParameter(String param1String, ObjectMap<String, Object> param1ObjectMap) {
      this.textureAtlasPath = param1String;
      this.resources = param1ObjectMap;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/SkinLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */