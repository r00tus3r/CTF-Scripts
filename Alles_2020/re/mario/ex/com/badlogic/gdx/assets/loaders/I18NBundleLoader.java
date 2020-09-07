package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.I18NBundle;
import java.util.Locale;

public class I18NBundleLoader extends AsynchronousAssetLoader<I18NBundle, I18NBundleLoader.I18NBundleParameter> {
  I18NBundle bundle;
  
  public I18NBundleLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, I18NBundleParameter paramI18NBundleParameter) { return null; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, I18NBundleParameter paramI18NBundleParameter) {
    Locale locale;
    paramString = null;
    this.bundle = null;
    if (paramI18NBundleParameter == null) {
      locale = Locale.getDefault();
    } else {
      if (paramI18NBundleParameter.locale == null) {
        locale = Locale.getDefault();
      } else {
        locale = paramI18NBundleParameter.locale;
      } 
      paramString = paramI18NBundleParameter.encoding;
    } 
    if (paramString == null) {
      this.bundle = I18NBundle.createBundle(paramFileHandle, locale);
    } else {
      this.bundle = I18NBundle.createBundle(paramFileHandle, locale, paramString);
    } 
  }
  
  public I18NBundle loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, I18NBundleParameter paramI18NBundleParameter) {
    I18NBundle i18NBundle = this.bundle;
    this.bundle = null;
    return i18NBundle;
  }
  
  public static class I18NBundleParameter extends AssetLoaderParameters<I18NBundle> {
    public final String encoding;
    
    public final Locale locale;
    
    public I18NBundleParameter() { this(null, null); }
    
    public I18NBundleParameter(Locale param1Locale) { this(param1Locale, null); }
    
    public I18NBundleParameter(Locale param1Locale, String param1String) {
      this.locale = param1Locale;
      this.encoding = param1String;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/I18NBundleLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */