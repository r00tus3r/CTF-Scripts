package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.CubemapLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.glutils.FacedCubemapData;
import com.badlogic.gdx.graphics.glutils.PixmapTextureData;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.HashMap;
import java.util.Map;

public class Cubemap extends GLTexture {
  private static AssetManager assetManager;
  
  static final Map<Application, Array<Cubemap>> managedCubemaps = new HashMap();
  
  protected CubemapData data;
  
  public Cubemap(int paramInt1, int paramInt2, int paramInt3, Pixmap.Format paramFormat) { this(new PixmapTextureData(new Pixmap(paramInt3, paramInt2, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt3, paramInt2, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt3, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt3, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt2, paramFormat), null, false, true), new PixmapTextureData(new Pixmap(paramInt1, paramInt2, paramFormat), null, false, true)); }
  
  public Cubemap(FileHandle paramFileHandle1, FileHandle paramFileHandle2, FileHandle paramFileHandle3, FileHandle paramFileHandle4, FileHandle paramFileHandle5, FileHandle paramFileHandle6) { this(paramFileHandle1, paramFileHandle2, paramFileHandle3, paramFileHandle4, paramFileHandle5, paramFileHandle6, false); }
  
  public Cubemap(FileHandle paramFileHandle1, FileHandle paramFileHandle2, FileHandle paramFileHandle3, FileHandle paramFileHandle4, FileHandle paramFileHandle5, FileHandle paramFileHandle6, boolean paramBoolean) { this(TextureData.Factory.loadFromFile(paramFileHandle1, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle2, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle3, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle4, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle5, paramBoolean), TextureData.Factory.loadFromFile(paramFileHandle6, paramBoolean)); }
  
  public Cubemap(CubemapData paramCubemapData) {
    super(34067);
    this.data = paramCubemapData;
    load(paramCubemapData);
  }
  
  public Cubemap(Pixmap paramPixmap1, Pixmap paramPixmap2, Pixmap paramPixmap3, Pixmap paramPixmap4, Pixmap paramPixmap5, Pixmap paramPixmap6) { this(paramPixmap1, paramPixmap2, paramPixmap3, paramPixmap4, paramPixmap5, paramPixmap6, false); }
  
  public Cubemap(Pixmap paramPixmap1, Pixmap paramPixmap2, Pixmap paramPixmap3, Pixmap paramPixmap4, Pixmap paramPixmap5, Pixmap paramPixmap6, boolean paramBoolean) { this(pixmapTextureData1, pixmapTextureData2, pixmapTextureData3, pixmapTextureData4, pixmapTextureData5, pixmapTextureData6); }
  
  public Cubemap(TextureData paramTextureData1, TextureData paramTextureData2, TextureData paramTextureData3, TextureData paramTextureData4, TextureData paramTextureData5, TextureData paramTextureData6) {
    super(34067);
    this.minFilter = Texture.TextureFilter.Nearest;
    this.magFilter = Texture.TextureFilter.Nearest;
    this.uWrap = Texture.TextureWrap.ClampToEdge;
    this.vWrap = Texture.TextureWrap.ClampToEdge;
    this.data = new FacedCubemapData(paramTextureData1, paramTextureData2, paramTextureData3, paramTextureData4, paramTextureData5, paramTextureData6);
    load(this.data);
  }
  
  private static void addManagedCubemap(Application paramApplication, Cubemap paramCubemap) {
    Array array1 = (Array)managedCubemaps.get(paramApplication);
    Array array2 = array1;
    if (array1 == null)
      array2 = new Array(); 
    array2.add(paramCubemap);
    managedCubemaps.put(paramApplication, array2);
  }
  
  public static void clearAllCubemaps(Application paramApplication) { managedCubemaps.remove(paramApplication); }
  
  public static String getManagedStatus() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Managed cubemap/app: { ");
    for (Application application : managedCubemaps.keySet()) {
      stringBuilder.append(((Array)managedCubemaps.get(application)).size);
      stringBuilder.append(" ");
    } 
    stringBuilder.append("}");
    return stringBuilder.toString();
  }
  
  public static int getNumManagedCubemaps() { return ((Array)managedCubemaps.get(Gdx.app)).size; }
  
  public static void invalidateAllCubemaps(Application paramApplication) {
    Array array = (Array)managedCubemaps.get(paramApplication);
    if (array == null)
      return; 
    AssetManager assetManager1 = assetManager;
    final int refCount = 0;
    if (assetManager1 == null) {
      while (i < array.size) {
        ((Cubemap)array.get(i)).reload();
        i++;
      } 
    } else {
      assetManager1.finishLoading();
      Array array1 = new Array(array);
      for (Cubemap cubemap : array1) {
        String str = assetManager.getAssetFileName(cubemap);
        if (str == null) {
          cubemap.reload();
          continue;
        } 
        i = assetManager.getReferenceCount(str);
        assetManager.setReferenceCount(str, 0);
        cubemap.glHandle = 0;
        CubemapLoader.CubemapParameter cubemapParameter = new CubemapLoader.CubemapParameter();
        cubemapParameter.cubemapData = cubemap.getCubemapData();
        cubemapParameter.minFilter = cubemap.getMinFilter();
        cubemapParameter.magFilter = cubemap.getMagFilter();
        cubemapParameter.wrapU = cubemap.getUWrap();
        cubemapParameter.wrapV = cubemap.getVWrap();
        cubemapParameter.cubemap = cubemap;
        cubemapParameter.loadedCallback = new AssetLoaderParameters.LoadedCallback() {
            public void finishedLoading(AssetManager param1AssetManager, String param1String, Class param1Class) { param1AssetManager.setReferenceCount(param1String, refCount); }
          };
        assetManager.unload(str);
        cubemap.glHandle = Gdx.gl.glGenTexture();
        assetManager.load(str, Cubemap.class, cubemapParameter);
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
    if (this.data.isManaged() && managedCubemaps.get(Gdx.app) != null)
      ((Array)managedCubemaps.get(Gdx.app)).removeValue(this, true); 
  }
  
  public CubemapData getCubemapData() { return this.data; }
  
  public int getDepth() { return 0; }
  
  public int getHeight() { return this.data.getHeight(); }
  
  public int getWidth() { return this.data.getWidth(); }
  
  public boolean isManaged() { return this.data.isManaged(); }
  
  public void load(CubemapData paramCubemapData) {
    if (!paramCubemapData.isPrepared())
      paramCubemapData.prepare(); 
    bind();
    unsafeSetFilter(this.minFilter, this.magFilter, true);
    unsafeSetWrap(this.uWrap, this.vWrap, true);
    paramCubemapData.consumeCubemapData();
    Gdx.gl.glBindTexture(this.glTarget, 0);
  }
  
  protected void reload() {
    if (isManaged()) {
      this.glHandle = Gdx.gl.glGenTexture();
      load(this.data);
      return;
    } 
    throw new GdxRuntimeException("Tried to reload an unmanaged Cubemap");
  }
  
  public enum CubemapSide {
    NegativeX,
    NegativeY,
    NegativeZ,
    PositiveX(false, '蔕', 0.0F, -1.0F, 0.0F, 1.0F, 0.0F, 0.0F),
    PositiveY(false, '蔕', 0.0F, -1.0F, 0.0F, 1.0F, 0.0F, 0.0F),
    PositiveZ(false, '蔕', 0.0F, -1.0F, 0.0F, 1.0F, 0.0F, 0.0F);
    
    public final Vector3 direction;
    
    public final int glEnum;
    
    public final int index;
    
    public final Vector3 up;
    
    static  {
      NegativeX = new CubemapSide("NegativeX", true, true, '蔖', 0.0F, -1.0F, 0.0F, -1.0F, 0.0F, 0.0F);
      PositiveY = new CubemapSide("PositiveY", 2, 2, '蔗', 0.0F, 0.0F, 1.0F, 0.0F, 1.0F, 0.0F);
      NegativeY = new CubemapSide("NegativeY", 3, 3, '蔘', 0.0F, 0.0F, -1.0F, 0.0F, -1.0F, 0.0F);
      PositiveZ = new CubemapSide("PositiveZ", 4, 4, '蔙', 0.0F, -1.0F, 0.0F, 0.0F, 0.0F, 1.0F);
      NegativeZ = new CubemapSide("NegativeZ", 5, 5, '蔚', 0.0F, -1.0F, 0.0F, 0.0F, 0.0F, -1.0F);
      $VALUES = new CubemapSide[] { PositiveX, NegativeX, PositiveY, NegativeY, PositiveZ, NegativeZ };
    }
    
    CubemapSide(int param1Int1, float param1Float1, float param1Float2, float param1Float3, float param1Float4, float param1Float5, float param1Float6, float param1Float7) {
      this.index = param1Int1;
      this.glEnum = param1Float1;
      this.up = new Vector3(param1Float2, param1Float3, param1Float4);
      this.direction = new Vector3(param1Float5, param1Float6, param1Float7);
    }
    
    public Vector3 getDirection(Vector3 param1Vector3) { return param1Vector3.set(this.direction); }
    
    public int getGLEnum() { return this.glEnum; }
    
    public Vector3 getUp(Vector3 param1Vector3) { return param1Vector3.set(this.up); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/Cubemap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */