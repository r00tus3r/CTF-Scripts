package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;

public class SoundLoader extends AsynchronousAssetLoader<Sound, SoundLoader.SoundParameter> {
  private Sound sound;
  
  public SoundLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, SoundParameter paramSoundParameter) { return null; }
  
  protected Sound getLoadedSound() { return this.sound; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, SoundParameter paramSoundParameter) { this.sound = Gdx.audio.newSound(paramFileHandle); }
  
  public Sound loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, SoundParameter paramSoundParameter) {
    Sound sound1 = this.sound;
    this.sound = null;
    return sound1;
  }
  
  public static class SoundParameter extends AssetLoaderParameters<Sound> {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/SoundLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */