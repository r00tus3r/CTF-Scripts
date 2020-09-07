package com.alles.platformer;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;

public class LocalFileResolver implements FileHandleResolver {
  public FileHandle resolve(String paramString) { return paramString.contains("map_flag.tmx") ? Gdx.files.local("map_flag.tmx") : (paramString.contains("tileSet") ? Gdx.files.internal("tileSet.png") : null); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/alles/platformer/LocalFileResolver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */