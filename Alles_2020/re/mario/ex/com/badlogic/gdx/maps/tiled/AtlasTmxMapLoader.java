package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.XmlReader;
import java.util.Iterator;

public class AtlasTmxMapLoader extends BaseTmxMapLoader<AtlasTmxMapLoader.AtlasTiledMapLoaderParameters> {
  protected AtlasResolver atlasResolver;
  
  protected Array<Texture> trackedTextures = new Array();
  
  public AtlasTmxMapLoader() { super(new InternalFileHandleResolver()); }
  
  public AtlasTmxMapLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  private FileHandle getAtlasFileHandle(FileHandle paramFileHandle) { // Byte code:
    //   0: aload_0
    //   1: getfield root : Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   4: ldc 'properties'
    //   6: invokevirtual getChildByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;
    //   9: astore_2
    //   10: aload_2
    //   11: ifnull -> 67
    //   14: aload_2
    //   15: ldc 'property'
    //   17: invokevirtual getChildrenByName : (Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;
    //   20: invokevirtual iterator : ()Ljava/util/Iterator;
    //   23: astore_3
    //   24: aload_3
    //   25: invokeinterface hasNext : ()Z
    //   30: ifeq -> 67
    //   33: aload_3
    //   34: invokeinterface next : ()Ljava/lang/Object;
    //   39: checkcast com/badlogic/gdx/utils/XmlReader$Element
    //   42: astore_2
    //   43: aload_2
    //   44: ldc 'name'
    //   46: invokevirtual getAttribute : (Ljava/lang/String;)Ljava/lang/String;
    //   49: ldc 'atlas'
    //   51: invokevirtual startsWith : (Ljava/lang/String;)Z
    //   54: ifeq -> 24
    //   57: aload_2
    //   58: ldc 'value'
    //   60: invokevirtual getAttribute : (Ljava/lang/String;)Ljava/lang/String;
    //   63: astore_2
    //   64: goto -> 69
    //   67: aconst_null
    //   68: astore_2
    //   69: aload_2
    //   70: ifnull -> 128
    //   73: aload_1
    //   74: aload_2
    //   75: invokestatic getRelativeFileHandle : (Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    //   78: astore_1
    //   79: aload_1
    //   80: invokevirtual exists : ()Z
    //   83: ifeq -> 88
    //   86: aload_1
    //   87: areturn
    //   88: new java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial <init> : ()V
    //   95: astore_1
    //   96: aload_1
    //   97: ldc 'The 'atlas' file could not be found: ''
    //   99: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   102: pop
    //   103: aload_1
    //   104: aload_2
    //   105: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: pop
    //   109: aload_1
    //   110: ldc '''
    //   112: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: pop
    //   116: new com/badlogic/gdx/utils/GdxRuntimeException
    //   119: dup
    //   120: aload_1
    //   121: invokevirtual toString : ()Ljava/lang/String;
    //   124: invokespecial <init> : (Ljava/lang/String;)V
    //   127: athrow
    //   128: new com/badlogic/gdx/utils/GdxRuntimeException
    //   131: dup
    //   132: ldc 'The map is missing the 'atlas' property'
    //   134: invokespecial <init> : (Ljava/lang/String;)V
    //   137: astore_1
    //   138: goto -> 143
    //   141: aload_1
    //   142: athrow
    //   143: goto -> 141 }
  
  private void setTextureFilters(Texture.TextureFilter paramTextureFilter1, Texture.TextureFilter paramTextureFilter2) {
    Iterator iterator = this.trackedTextures.iterator();
    while (iterator.hasNext())
      ((Texture)iterator.next()).setFilter(paramTextureFilter1, paramTextureFilter2); 
    this.trackedTextures.clear();
  }
  
  protected void addStaticTiles(FileHandle paramFileHandle1, ImageResolver paramImageResolver, TiledMapTileSet paramTiledMapTileSet, XmlReader.Element paramElement, Array<XmlReader.Element> paramArray, String paramString1, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, String paramString2, int paramInt6, int paramInt7, String paramString3, int paramInt8, int paramInt9, FileHandle paramFileHandle2) {
    TextureAtlas textureAtlas = this.atlasResolver.getAtlas();
    ObjectSet.ObjectSetIterator objectSetIterator = textureAtlas.getTextures().iterator();
    while (objectSetIterator.hasNext()) {
      Texture texture = (Texture)objectSetIterator.next();
      this.trackedTextures.add(texture);
    } 
    MapProperties mapProperties = paramTiledMapTileSet.getProperties();
    mapProperties.put("imagesource", paramString3);
    mapProperties.put("imagewidth", Integer.valueOf(paramInt8));
    mapProperties.put("imageheight", Integer.valueOf(paramInt9));
    mapProperties.put("tilewidth", Integer.valueOf(paramInt2));
    mapProperties.put("tileheight", Integer.valueOf(paramInt3));
    mapProperties.put("margin", Integer.valueOf(paramInt5));
    mapProperties.put("spacing", Integer.valueOf(paramInt4));
    if (paramString3 != null && paramString3.length() > 0) {
      paramInt2 = paramInt8 / paramInt2;
      paramInt3 = paramInt9 / paramInt3;
      for (TextureAtlas.AtlasRegion atlasRegion : textureAtlas.findRegions(paramString1)) {
        if (atlasRegion != null) {
          paramInt4 = paramInt1 + atlasRegion.index;
          if (paramInt4 >= paramInt1 && paramInt4 <= paramInt2 * paramInt3 + paramInt1 - 1)
            addStaticTiledMapTile(paramTiledMapTileSet, atlasRegion, paramInt4, paramInt6, paramInt7); 
        } 
      } 
    } 
    for (XmlReader.Element element : paramArray) {
      paramInt2 = paramInt1 + element.getIntAttribute("id", 0);
      if (paramTiledMapTileSet.getTile(paramInt2) == null) {
        element = element.getChildByName("image");
        if (element != null) {
          String str = element.getAttribute("source");
          str = str.substring(0, str.lastIndexOf('.'));
          TextureAtlas.AtlasRegion atlasRegion = textureAtlas.findRegion(str);
          if (atlasRegion != null) {
            addStaticTiledMapTile(paramTiledMapTileSet, atlasRegion, paramInt2, paramInt6, paramInt7);
            continue;
          } 
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("Tileset atlasRegion not found: ");
          stringBuilder.append(str);
          throw new GdxRuntimeException(stringBuilder.toString());
        } 
      } 
    } 
  }
  
  protected Array<AssetDescriptor> getDependencyAssetDescriptors(FileHandle paramFileHandle, TextureLoader.TextureParameter paramTextureParameter) {
    Array array = new Array();
    paramFileHandle = getAtlasFileHandle(paramFileHandle);
    if (paramFileHandle != null)
      array.add(new AssetDescriptor(paramFileHandle, TextureAtlas.class)); 
    return array;
  }
  
  public TiledMap load(String paramString) { return load(paramString, new AtlasTiledMapLoaderParameters()); }
  
  public TiledMap load(String paramString, AtlasTiledMapLoaderParameters paramAtlasTiledMapLoaderParameters) {
    FileHandle fileHandle = resolve(paramString);
    this.root = this.xml.parse(fileHandle);
    TextureAtlas textureAtlas = new TextureAtlas(getAtlasFileHandle(fileHandle));
    this.atlasResolver = new AtlasResolver.DirectAtlasResolver(textureAtlas);
    TiledMap tiledMap = loadTiledMap(fileHandle, paramAtlasTiledMapLoaderParameters, this.atlasResolver);
    tiledMap.setOwnedResources(new Array(new TextureAtlas[] { textureAtlas }));
    setTextureFilters(paramAtlasTiledMapLoaderParameters.textureMinFilter, paramAtlasTiledMapLoaderParameters.textureMagFilter);
    return tiledMap;
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, AtlasTiledMapLoaderParameters paramAtlasTiledMapLoaderParameters) {
    this.atlasResolver = new AtlasResolver.AssetManagerAtlasResolver(paramAssetManager, getAtlasFileHandle(paramFileHandle).path());
    this.map = loadTiledMap(paramFileHandle, paramAtlasTiledMapLoaderParameters, this.atlasResolver);
  }
  
  public TiledMap loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, AtlasTiledMapLoaderParameters paramAtlasTiledMapLoaderParameters) {
    if (paramAtlasTiledMapLoaderParameters != null)
      setTextureFilters(paramAtlasTiledMapLoaderParameters.textureMinFilter, paramAtlasTiledMapLoaderParameters.textureMagFilter); 
    return this.map;
  }
  
  private static interface AtlasResolver extends ImageResolver {
    TextureAtlas getAtlas();
    
    public static class AssetManagerAtlasResolver implements AtlasResolver {
      private final AssetManager assetManager;
      
      private final String atlasName;
      
      public AssetManagerAtlasResolver(AssetManager param2AssetManager, String param2String) {
        this.assetManager = param2AssetManager;
        this.atlasName = param2String;
      }
      
      public TextureAtlas getAtlas() { return (TextureAtlas)this.assetManager.get(this.atlasName, TextureAtlas.class); }
      
      public TextureRegion getImage(String param2String) { return getAtlas().findRegion(param2String); }
    }
    
    public static class DirectAtlasResolver implements AtlasResolver {
      private final TextureAtlas atlas;
      
      public DirectAtlasResolver(TextureAtlas param2TextureAtlas) { this.atlas = param2TextureAtlas; }
      
      public TextureAtlas getAtlas() { return this.atlas; }
      
      public TextureRegion getImage(String param2String) { return this.atlas.findRegion(param2String); }
    }
  }
  
  public static class AssetManagerAtlasResolver implements AtlasResolver {
    private final AssetManager assetManager;
    
    private final String atlasName;
    
    public AssetManagerAtlasResolver(AssetManager param1AssetManager, String param1String) {
      this.assetManager = param1AssetManager;
      this.atlasName = param1String;
    }
    
    public TextureAtlas getAtlas() { return (TextureAtlas)this.assetManager.get(this.atlasName, TextureAtlas.class); }
    
    public TextureRegion getImage(String param1String) { return getAtlas().findRegion(param1String); }
  }
  
  public static class DirectAtlasResolver implements AtlasResolver {
    private final TextureAtlas atlas;
    
    public DirectAtlasResolver(TextureAtlas param1TextureAtlas) { this.atlas = param1TextureAtlas; }
    
    public TextureAtlas getAtlas() { return this.atlas; }
    
    public TextureRegion getImage(String param1String) { return this.atlas.findRegion(param1String); }
  }
  
  public static class AtlasTiledMapLoaderParameters extends BaseTmxMapLoader.Parameters {
    public boolean forceTextureFilters = false;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/AtlasTmxMapLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */