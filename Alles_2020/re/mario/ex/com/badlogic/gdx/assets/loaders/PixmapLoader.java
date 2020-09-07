package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.Array;

public class PixmapLoader extends AsynchronousAssetLoader<Pixmap, PixmapLoader.PixmapParameter> {
  Pixmap pixmap;
  
  public PixmapLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, PixmapParameter paramPixmapParameter) { return null; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, PixmapParameter paramPixmapParameter) {
    this.pixmap = null;
    this.pixmap = new Pixmap(paramFileHandle);
  }
  
  public Pixmap loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, PixmapParameter paramPixmapParameter) {
    Pixmap pixmap1 = this.pixmap;
    this.pixmap = null;
    return pixmap1;
  }
  
  public static class PixmapParameter extends AssetLoaderParameters<Pixmap> {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/PixmapLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */