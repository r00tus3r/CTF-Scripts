package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.utils.Array;

public class FreetypeFontLoader extends AsynchronousAssetLoader<BitmapFont, FreetypeFontLoader.FreeTypeFontLoaderParameter> {
  public FreetypeFontLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, FreeTypeFontLoaderParameter paramFreeTypeFontLoaderParameter) {
    Array array = new Array();
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(paramFreeTypeFontLoaderParameter.fontFileName);
    stringBuilder.append(".gen");
    array.add(new AssetDescriptor(stringBuilder.toString(), FreeTypeFontGenerator.class));
    return array;
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, FreeTypeFontLoaderParameter paramFreeTypeFontLoaderParameter) {
    if (paramFreeTypeFontLoaderParameter != null)
      return; 
    throw new RuntimeException("FreetypeFontParameter must be set in AssetManager#load to point at a TTF file!");
  }
  
  public BitmapFont loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, FreeTypeFontLoaderParameter paramFreeTypeFontLoaderParameter) {
    if (paramFreeTypeFontLoaderParameter != null) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(paramFreeTypeFontLoaderParameter.fontFileName);
      stringBuilder.append(".gen");
      return ((FreeTypeFontGenerator)paramAssetManager.get(stringBuilder.toString(), FreeTypeFontGenerator.class)).generateFont(paramFreeTypeFontLoaderParameter.fontParameters);
    } 
    throw new RuntimeException("FreetypeFontParameter must be set in AssetManager#load to point at a TTF file!");
  }
  
  public static class FreeTypeFontLoaderParameter extends AssetLoaderParameters<BitmapFont> {
    public String fontFileName;
    
    public FreeTypeFontGenerator.FreeTypeFontParameter fontParameters = new FreeTypeFontGenerator.FreeTypeFontParameter();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */