package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.CubemapData;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.KTXTextureData;
import com.badlogic.gdx.utils.Array;

public class CubemapLoader extends AsynchronousAssetLoader<Cubemap, CubemapLoader.CubemapParameter> {
  CubemapLoaderInfo info = new CubemapLoaderInfo();
  
  public CubemapLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, CubemapParameter paramCubemapParameter) { return null; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, CubemapParameter paramCubemapParameter) {
    this.info.filename = paramString;
    if (paramCubemapParameter == null || paramCubemapParameter.cubemapData == null) {
      this.info.cubemap = null;
      if (paramCubemapParameter != null) {
        Pixmap.Format format = paramCubemapParameter.format;
        this.info.cubemap = paramCubemapParameter.cubemap;
      } 
      if (paramString.contains(".ktx") || paramString.contains(".zktx"))
        this.info.data = new KTXTextureData(paramFileHandle, false); 
    } else {
      this.info.data = paramCubemapParameter.cubemapData;
      this.info.cubemap = paramCubemapParameter.cubemap;
    } 
    if (!this.info.data.isPrepared())
      this.info.data.prepare(); 
  }
  
  public Cubemap loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, CubemapParameter paramCubemapParameter) {
    CubemapLoaderInfo cubemapLoaderInfo = this.info;
    if (cubemapLoaderInfo == null)
      return null; 
    Cubemap cubemap = cubemapLoaderInfo.cubemap;
    if (cubemap != null) {
      cubemap.load(this.info.data);
    } else {
      cubemap = new Cubemap(this.info.data);
    } 
    if (paramCubemapParameter != null) {
      cubemap.setFilter(paramCubemapParameter.minFilter, paramCubemapParameter.magFilter);
      cubemap.setWrap(paramCubemapParameter.wrapU, paramCubemapParameter.wrapV);
    } 
    return cubemap;
  }
  
  public static class CubemapLoaderInfo {
    Cubemap cubemap;
    
    CubemapData data;
    
    String filename;
  }
  
  public static class CubemapParameter extends AssetLoaderParameters<Cubemap> {
    public Cubemap cubemap = null;
    
    public CubemapData cubemapData = null;
    
    public Pixmap.Format format = null;
    
    public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureWrap wrapU = Texture.TextureWrap.ClampToEdge;
    
    public Texture.TextureWrap wrapV = Texture.TextureWrap.ClampToEdge;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/CubemapLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */