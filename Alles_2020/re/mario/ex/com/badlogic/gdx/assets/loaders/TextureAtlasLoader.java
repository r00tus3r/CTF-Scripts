package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.utils.Array;

public class TextureAtlasLoader extends SynchronousAssetLoader<TextureAtlas, TextureAtlasLoader.TextureAtlasParameter> {
  TextureAtlas.TextureAtlasData data;
  
  public TextureAtlasLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, TextureAtlasParameter paramTextureAtlasParameter) {
    FileHandle fileHandle = paramFileHandle.parent();
    if (paramTextureAtlasParameter != null) {
      this.data = new TextureAtlas.TextureAtlasData(paramFileHandle, fileHandle, paramTextureAtlasParameter.flip);
    } else {
      this.data = new TextureAtlas.TextureAtlasData(paramFileHandle, fileHandle, false);
    } 
    Array array = new Array();
    for (TextureAtlas.TextureAtlasData.Page page : this.data.getPages()) {
      TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
      textureParameter.format = page.format;
      textureParameter.genMipMaps = page.useMipMaps;
      textureParameter.minFilter = page.minFilter;
      textureParameter.magFilter = page.magFilter;
      array.add(new AssetDescriptor(page.textureFile, Texture.class, textureParameter));
    } 
    return array;
  }
  
  public TextureAtlas load(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, TextureAtlasParameter paramTextureAtlasParameter) {
    for (TextureAtlas.TextureAtlasData.Page page : this.data.getPages())
      page.texture = (Texture)paramAssetManager.get(page.textureFile.path().replaceAll("\\\\", "/"), Texture.class); 
    TextureAtlas textureAtlas = new TextureAtlas(this.data);
    this.data = null;
    return textureAtlas;
  }
  
  public static class TextureAtlasParameter extends AssetLoaderParameters<TextureAtlas> {
    public boolean flip = false;
    
    public TextureAtlasParameter() {}
    
    public TextureAtlasParameter(boolean param1Boolean) { this.flip = param1Boolean; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/TextureAtlasLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */