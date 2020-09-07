package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.utils.Array;

public class ParticleEffectLoader extends SynchronousAssetLoader<ParticleEffect, ParticleEffectLoader.ParticleEffectParameter> {
  public ParticleEffectLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, ParticleEffectParameter paramParticleEffectParameter) {
    if (paramParticleEffectParameter != null && paramParticleEffectParameter.atlasFile != null) {
      Array array = new Array();
      array.add(new AssetDescriptor(paramParticleEffectParameter.atlasFile, TextureAtlas.class));
    } else {
      paramString = null;
    } 
    return paramString;
  }
  
  public ParticleEffect load(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, ParticleEffectParameter paramParticleEffectParameter) {
    ParticleEffect particleEffect = new ParticleEffect();
    if (paramParticleEffectParameter != null && paramParticleEffectParameter.atlasFile != null) {
      particleEffect.load(paramFileHandle, (TextureAtlas)paramAssetManager.get(paramParticleEffectParameter.atlasFile, TextureAtlas.class), paramParticleEffectParameter.atlasPrefix);
    } else if (paramParticleEffectParameter != null && paramParticleEffectParameter.imagesDir != null) {
      particleEffect.load(paramFileHandle, paramParticleEffectParameter.imagesDir);
    } else {
      particleEffect.load(paramFileHandle, paramFileHandle.parent());
    } 
    return particleEffect;
  }
  
  public static class ParticleEffectParameter extends AssetLoaderParameters<ParticleEffect> {
    public String atlasFile;
    
    public String atlasPrefix;
    
    public FileHandle imagesDir;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/ParticleEffectLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */