package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.glutils.PixmapTextureData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.HashMap;
import java.util.Map;

public class Texture extends GLTexture {
  private static AssetManager assetManager;
  
  static final Map<Application, Array<Texture>> managedTextures = new HashMap();
  
  TextureData data;
  
  public Texture(int paramInt1, int paramInt2, Pixmap.Format paramFormat) { this(new PixmapTextureData(new Pixmap(paramInt1, paramInt2, paramFormat), null, false, true)); }
  
  protected Texture(int paramInt1, int paramInt2, TextureData paramTextureData) {
    super(paramInt1, paramInt2);
    load(paramTextureData);
    if (paramTextureData.isManaged())
      addManagedTexture(Gdx.app, this); 
  }
  
  public Texture(FileHandle paramFileHandle) { this(paramFileHandle, null, false); }
  
  public Texture(FileHandle paramFileHandle, Pixmap.Format paramFormat, boolean paramBoolean) { this(TextureData.Factory.loadFromFile(paramFileHandle, paramFormat, paramBoolean)); }
  
  public Texture(FileHandle paramFileHandle, boolean paramBoolean) { this(paramFileHandle, null, paramBoolean); }
  
  public Texture(Pixmap paramPixmap) { this(new PixmapTextureData(paramPixmap, null, false, false)); }
  
  public Texture(Pixmap paramPixmap, Pixmap.Format paramFormat, boolean paramBoolean) { this(new PixmapTextureData(paramPixmap, paramFormat, paramBoolean, false)); }
  
  public Texture(Pixmap paramPixmap, boolean paramBoolean) { this(new PixmapTextureData(paramPixmap, null, paramBoolean, false)); }
  
  public Texture(TextureData paramTextureData) { this(3553, Gdx.gl.glGenTexture(), paramTextureData); }
  
  public Texture(String paramString) { this(Gdx.files.internal(paramString)); }
  
  private static void addManagedTexture(Application paramApplication, Texture paramTexture) {
    Array array1 = (Array)managedTextures.get(paramApplication);
    Array array2 = array1;
    if (array1 == null)
      array2 = new Array(); 
    array2.add(paramTexture);
    managedTextures.put(paramApplication, array2);
  }
  
  public static void clearAllTextures(Application paramApplication) { managedTextures.remove(paramApplication); }
  
  public static String getManagedStatus() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Managed textures/app: { ");
    for (Application application : managedTextures.keySet()) {
      stringBuilder.append(((Array)managedTextures.get(application)).size);
      stringBuilder.append(" ");
    } 
    stringBuilder.append("}");
    return stringBuilder.toString();
  }
  
  public static int getNumManagedTextures() { return ((Array)managedTextures.get(Gdx.app)).size; }
  
  public static void invalidateAllTextures(Application paramApplication) {
    Array array = (Array)managedTextures.get(paramApplication);
    if (array == null)
      return; 
    AssetManager assetManager1 = assetManager;
    final int refCount = 0;
    if (assetManager1 == null) {
      while (i < array.size) {
        ((Texture)array.get(i)).reload();
        i++;
      } 
    } else {
      assetManager1.finishLoading();
      Array array1 = new Array(array);
      for (Texture texture : array1) {
        String str = assetManager.getAssetFileName(texture);
        if (str == null) {
          texture.reload();
          continue;
        } 
        i = assetManager.getReferenceCount(str);
        assetManager.setReferenceCount(str, 0);
        texture.glHandle = 0;
        TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
        textureParameter.textureData = texture.getTextureData();
        textureParameter.minFilter = texture.getMinFilter();
        textureParameter.magFilter = texture.getMagFilter();
        textureParameter.wrapU = texture.getUWrap();
        textureParameter.wrapV = texture.getVWrap();
        textureParameter.genMipMaps = texture.data.useMipMaps();
        textureParameter.texture = texture;
        textureParameter.loadedCallback = new AssetLoaderParameters.LoadedCallback() {
            public void finishedLoading(AssetManager param1AssetManager, String param1String, Class param1Class) { param1AssetManager.setReferenceCount(param1String, refCount); }
          };
        assetManager.unload(str);
        texture.glHandle = Gdx.gl.glGenTexture();
        assetManager.load(str, Texture.class, textureParameter);
      } 
      array.clear();
      array.addAll(array1);
    } 
  }
  
  public static void setAssetManager(AssetManager paramAssetManager) { assetManager = paramAssetManager; }
  
  public void dispose() {
    if (this.glHandle == 0)
      return; 
    delete();
    if (this.data.isManaged() && managedTextures.get(Gdx.app) != null)
      ((Array)managedTextures.get(Gdx.app)).removeValue(this, true); 
  }
  
  public void draw(Pixmap paramPixmap, int paramInt1, int paramInt2) {
    if (!this.data.isManaged()) {
      bind();
      Gdx.gl.glTexSubImage2D(this.glTarget, 0, paramInt1, paramInt2, paramPixmap.getWidth(), paramPixmap.getHeight(), paramPixmap.getGLFormat(), paramPixmap.getGLType(), paramPixmap.getPixels());
      return;
    } 
    throw new GdxRuntimeException("can't draw to a managed texture");
  }
  
  public int getDepth() { return 0; }
  
  public int getHeight() { return this.data.getHeight(); }
  
  public TextureData getTextureData() { return this.data; }
  
  public int getWidth() { return this.data.getWidth(); }
  
  public boolean isManaged() { return this.data.isManaged(); }
  
  public void load(TextureData paramTextureData) {
    if (this.data == null || paramTextureData.isManaged() == this.data.isManaged()) {
      this.data = paramTextureData;
      if (!paramTextureData.isPrepared())
        paramTextureData.prepare(); 
      bind();
      uploadImageData(3553, paramTextureData);
      unsafeSetFilter(this.minFilter, this.magFilter, true);
      unsafeSetWrap(this.uWrap, this.vWrap, true);
      Gdx.gl.glBindTexture(this.glTarget, 0);
      return;
    } 
    throw new GdxRuntimeException("New data must have the same managed status as the old data");
  }
  
  protected void reload() {
    if (isManaged()) {
      this.glHandle = Gdx.gl.glGenTexture();
      load(this.data);
      return;
    } 
    throw new GdxRuntimeException("Tried to reload unmanaged Texture");
  }
  
  public String toString() {
    TextureData textureData = this.data;
    return (textureData instanceof com.badlogic.gdx.graphics.glutils.FileTextureData) ? textureData.toString() : super.toString();
  }
  
  public enum TextureFilter {
    Linear,
    MipMap,
    MipMapLinearLinear,
    MipMapLinearNearest,
    MipMapNearestLinear,
    MipMapNearestNearest,
    Nearest('☀');
    
    final int glEnum;
    
    static  {
      Linear = new TextureFilter("Linear", true, '☁');
      MipMap = new TextureFilter("MipMap", 2, '✃');
      MipMapNearestNearest = new TextureFilter("MipMapNearestNearest", 3, '✀');
      MipMapLinearNearest = new TextureFilter("MipMapLinearNearest", 4, '✁');
      MipMapNearestLinear = new TextureFilter("MipMapNearestLinear", 5, '✂');
      MipMapLinearLinear = new TextureFilter("MipMapLinearLinear", 6, '✃');
      $VALUES = new TextureFilter[] { Nearest, Linear, MipMap, MipMapNearestNearest, MipMapLinearNearest, MipMapNearestLinear, MipMapLinearLinear };
    }
    
    TextureFilter(int param1Int1) { this.glEnum = param1Int1; }
    
    public int getGLEnum() { return this.glEnum; }
    
    public boolean isMipMap() {
      boolean bool;
      int i = this.glEnum;
      if (i != 9728 && i != 9729) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
  }
  
  public enum TextureWrap {
    ClampToEdge('☀'),
    MirroredRepeat('荰'),
    Repeat('荰');
    
    final int glEnum;
    
    static  {
      ClampToEdge = new TextureWrap("ClampToEdge", true, '脯');
      Repeat = new TextureWrap("Repeat", 2, '⤁');
      $VALUES = new TextureWrap[] { MirroredRepeat, ClampToEdge, Repeat };
    }
    
    TextureWrap(int param1Int1) { this.glEnum = param1Int1; }
    
    public int getGLEnum() { return this.glEnum; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Texture.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */