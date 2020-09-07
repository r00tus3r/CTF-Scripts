package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.Texture;

public interface TextureProvider {
  Texture load(String paramString);
  
  public static class AssetTextureProvider implements TextureProvider {
    public final AssetManager assetManager;
    
    public AssetTextureProvider(AssetManager param1AssetManager) { this.assetManager = param1AssetManager; }
    
    public Texture load(String param1String) { return (Texture)this.assetManager.get(param1String, Texture.class); }
  }
  
  public static class FileTextureProvider implements TextureProvider {
    private Texture.TextureFilter magFilter;
    
    private Texture.TextureFilter minFilter;
    
    private Texture.TextureWrap uWrap;
    
    private boolean useMipMaps;
    
    private Texture.TextureWrap vWrap;
    
    public FileTextureProvider() {
      Texture.TextureFilter textureFilter = Texture.TextureFilter.Linear;
      this.magFilter = textureFilter;
      this.minFilter = textureFilter;
      Texture.TextureWrap textureWrap = Texture.TextureWrap.Repeat;
      this.vWrap = textureWrap;
      this.uWrap = textureWrap;
      this.useMipMaps = false;
    }
    
    public FileTextureProvider(Texture.TextureFilter param1TextureFilter1, Texture.TextureFilter param1TextureFilter2, Texture.TextureWrap param1TextureWrap1, Texture.TextureWrap param1TextureWrap2, boolean param1Boolean) {
      this.minFilter = param1TextureFilter1;
      this.magFilter = param1TextureFilter2;
      this.uWrap = param1TextureWrap1;
      this.vWrap = param1TextureWrap2;
      this.useMipMaps = param1Boolean;
    }
    
    public Texture load(String param1String) {
      Texture texture = new Texture(Gdx.files.internal(param1String), this.useMipMaps);
      texture.setFilter(this.minFilter, this.magFilter);
      texture.setWrap(this.uWrap, this.vWrap);
      return texture;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/TextureProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */