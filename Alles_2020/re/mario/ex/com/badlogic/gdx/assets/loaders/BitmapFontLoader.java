package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class BitmapFontLoader extends AsynchronousAssetLoader<BitmapFont, BitmapFontLoader.BitmapFontParameter> {
  BitmapFont.BitmapFontData data;
  
  public BitmapFontLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, BitmapFontParameter paramBitmapFontParameter) {
    boolean bool;
    Array array = new Array();
    if (paramBitmapFontParameter != null && paramBitmapFontParameter.bitmapFontData != null) {
      this.data = paramBitmapFontParameter.bitmapFontData;
      return array;
    } 
    byte b1 = 0;
    if (paramBitmapFontParameter != null && paramBitmapFontParameter.flip) {
      bool = true;
    } else {
      bool = false;
    } 
    this.data = new BitmapFont.BitmapFontData(paramFileHandle, bool);
    byte b2 = b1;
    if (paramBitmapFontParameter != null) {
      b2 = b1;
      if (paramBitmapFontParameter.atlasName != null) {
        array.add(new AssetDescriptor(paramBitmapFontParameter.atlasName, TextureAtlas.class));
        return array;
      } 
    } 
    while (b2 < this.data.getImagePaths().length) {
      FileHandle fileHandle = resolve(this.data.getImagePath(b2));
      TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
      if (paramBitmapFontParameter != null) {
        textureParameter.genMipMaps = paramBitmapFontParameter.genMipMaps;
        textureParameter.minFilter = paramBitmapFontParameter.minFilter;
        textureParameter.magFilter = paramBitmapFontParameter.magFilter;
      } 
      array.add(new AssetDescriptor(fileHandle, Texture.class, textureParameter));
      b2++;
    } 
    return array;
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, BitmapFontParameter paramBitmapFontParameter) {}
  
  public BitmapFont loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, BitmapFontParameter paramBitmapFontParameter) {
    String str;
    byte b = 0;
    if (paramBitmapFontParameter != null && paramBitmapFontParameter.atlasName != null) {
      TextureAtlas textureAtlas = (TextureAtlas)paramAssetManager.get(paramBitmapFontParameter.atlasName, TextureAtlas.class);
      str = paramFileHandle.sibling(this.data.imagePaths[0]).nameWithoutExtension().toString();
      TextureAtlas.AtlasRegion atlasRegion = textureAtlas.findRegion(str);
      if (atlasRegion != null)
        return new BitmapFont(paramFileHandle, atlasRegion); 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Could not find font region ");
      stringBuilder.append(str);
      stringBuilder.append(" in atlas ");
      stringBuilder.append(paramBitmapFontParameter.atlasName);
      throw new GdxRuntimeException(stringBuilder.toString());
    } 
    int i = this.data.getImagePaths().length;
    Array array = new Array(i);
    while (b < i) {
      array.add(new TextureRegion((Texture)str.get(this.data.getImagePath(b), Texture.class)));
      b++;
    } 
    return new BitmapFont(this.data, array, true);
  }
  
  public static class BitmapFontParameter extends AssetLoaderParameters<BitmapFont> {
    public String atlasName = null;
    
    public BitmapFont.BitmapFontData bitmapFontData = null;
    
    public boolean flip = false;
    
    public boolean genMipMaps = false;
    
    public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/BitmapFontLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */