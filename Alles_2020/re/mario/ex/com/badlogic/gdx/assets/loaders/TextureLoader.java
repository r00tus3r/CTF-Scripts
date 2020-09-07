package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.Array;

public class TextureLoader extends AsynchronousAssetLoader<Texture, TextureLoader.TextureParameter> {
  TextureLoaderInfo info = new TextureLoaderInfo();
  
  public TextureLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, TextureParameter paramTextureParameter) { return null; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, TextureParameter paramTextureParameter) {
    this.info.filename = paramString;
    if (paramTextureParameter == null || paramTextureParameter.textureData == null) {
      Pixmap.Format format;
      boolean bool = false;
      TextureLoaderInfo textureLoaderInfo = this.info;
      paramAssetManager = null;
      textureLoaderInfo.texture = null;
      if (paramTextureParameter != null) {
        format = paramTextureParameter.format;
        bool = paramTextureParameter.genMipMaps;
        this.info.texture = paramTextureParameter.texture;
      } 
      this.info.data = TextureData.Factory.loadFromFile(paramFileHandle, format, bool);
    } else {
      this.info.data = paramTextureParameter.textureData;
      this.info.texture = paramTextureParameter.texture;
    } 
    if (!this.info.data.isPrepared())
      this.info.data.prepare(); 
  }
  
  public Texture loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, TextureParameter paramTextureParameter) {
    TextureLoaderInfo textureLoaderInfo = this.info;
    if (textureLoaderInfo == null)
      return null; 
    Texture texture = textureLoaderInfo.texture;
    if (texture != null) {
      texture.load(this.info.data);
    } else {
      texture = new Texture(this.info.data);
    } 
    if (paramTextureParameter != null) {
      texture.setFilter(paramTextureParameter.minFilter, paramTextureParameter.magFilter);
      texture.setWrap(paramTextureParameter.wrapU, paramTextureParameter.wrapV);
    } 
    return texture;
  }
  
  public static class TextureLoaderInfo {
    TextureData data;
    
    String filename;
    
    Texture texture;
  }
  
  public static class TextureParameter extends AssetLoaderParameters<Texture> {
    public Pixmap.Format format = null;
    
    public boolean genMipMaps = false;
    
    public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
    
    public Texture texture = null;
    
    public TextureData textureData = null;
    
    public Texture.TextureWrap wrapU = Texture.TextureWrap.ClampToEdge;
    
    public Texture.TextureWrap wrapV = Texture.TextureWrap.ClampToEdge;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/TextureLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */