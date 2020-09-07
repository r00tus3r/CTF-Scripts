package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.audio.Music;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;

public class MusicLoader extends AsynchronousAssetLoader<Music, MusicLoader.MusicParameter> {
  private Music music;
  
  public MusicLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, MusicParameter paramMusicParameter) { return null; }
  
  protected Music getLoadedMusic() { return this.music; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, MusicParameter paramMusicParameter) { this.music = Gdx.audio.newMusic(paramFileHandle); }
  
  public Music loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, MusicParameter paramMusicParameter) {
    Music music1 = this.music;
    this.music = null;
    return music1;
  }
  
  public static class MusicParameter extends AssetLoaderParameters<Music> {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/MusicLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */