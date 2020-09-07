package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;

public class FreeTypeFontGeneratorLoader extends SynchronousAssetLoader<FreeTypeFontGenerator, FreeTypeFontGeneratorLoader.FreeTypeFontGeneratorParameters> {
  public FreeTypeFontGeneratorLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, FreeTypeFontGeneratorParameters paramFreeTypeFontGeneratorParameters) { return null; }
  
  public FreeTypeFontGenerator load(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, FreeTypeFontGeneratorParameters paramFreeTypeFontGeneratorParameters) {
    FreeTypeFontGenerator freeTypeFontGenerator;
    if (paramFileHandle.extension().equals("gen")) {
      freeTypeFontGenerator = new FreeTypeFontGenerator(paramFileHandle.sibling(paramFileHandle.nameWithoutExtension()));
    } else {
      freeTypeFontGenerator = new FreeTypeFontGenerator(paramFileHandle);
    } 
    return freeTypeFontGenerator;
  }
  
  public static class FreeTypeFontGeneratorParameters extends AssetLoaderParameters<FreeTypeFontGenerator> {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGeneratorLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */