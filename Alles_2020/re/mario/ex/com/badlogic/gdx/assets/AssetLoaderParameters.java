package com.badlogic.gdx.assets;

public class AssetLoaderParameters<T> extends Object {
  public LoadedCallback loadedCallback;
  
  public static interface LoadedCallback {
    void finishedLoading(AssetManager param1AssetManager, String param1String, Class param1Class);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/AssetLoaderParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */