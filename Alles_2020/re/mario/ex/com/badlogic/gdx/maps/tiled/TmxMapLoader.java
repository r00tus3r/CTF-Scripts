package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.XmlReader;
import java.util.Iterator;

public class TmxMapLoader extends BaseTmxMapLoader<TmxMapLoader.Parameters> {
  public TmxMapLoader() { super(new InternalFileHandleResolver()); }
  
  public TmxMapLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  private Array<FileHandle> getDependencyFileHandles(FileHandle paramFileHandle) {
    Array array = new Array();
    for (FileHandle fileHandle : this.root.getChildrenByName("tileset")) {
      String str = fileHandle.getAttribute("source", null);
      if (str != null) {
        fileHandle = getRelativeFileHandle(paramFileHandle, str);
        XmlReader.Element element = this.xml.parse(fileHandle);
        if (element.getChildByName("image") != null) {
          array.add(getRelativeFileHandle(fileHandle, element.getChildByName("image").getAttribute("source")));
          continue;
        } 
        Iterator iterator2 = element.getChildrenByName("tile").iterator();
        while (iterator2.hasNext())
          array.add(getRelativeFileHandle(fileHandle, ((XmlReader.Element)iterator2.next()).getChildByName("image").getAttribute("source"))); 
        continue;
      } 
      if (fileHandle.getChildByName("image") != null) {
        array.add(getRelativeFileHandle(paramFileHandle, fileHandle.getChildByName("image").getAttribute("source")));
        continue;
      } 
      Iterator iterator1 = fileHandle.getChildrenByName("tile").iterator();
      while (iterator1.hasNext())
        array.add(getRelativeFileHandle(paramFileHandle, ((XmlReader.Element)iterator1.next()).getChildByName("image").getAttribute("source"))); 
    } 
    Iterator iterator = this.root.getChildrenByName("imagelayer").iterator();
    while (iterator.hasNext()) {
      String str = ((XmlReader.Element)iterator.next()).getChildByName("image").getAttribute("source", null);
      if (str != null)
        array.add(getRelativeFileHandle(paramFileHandle, str)); 
    } 
    return array;
  }
  
  protected void addStaticTiles(FileHandle paramFileHandle1, ImageResolver paramImageResolver, TiledMapTileSet paramTiledMapTileSet, XmlReader.Element paramElement, Array<XmlReader.Element> paramArray, String paramString1, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, String paramString2, int paramInt6, int paramInt7, String paramString3, int paramInt8, int paramInt9, FileHandle paramFileHandle2) {
    TextureRegion textureRegion;
    MapProperties mapProperties = paramTiledMapTileSet.getProperties();
    if (paramFileHandle2 != null) {
      textureRegion = paramImageResolver.getImage(paramFileHandle2.path());
      mapProperties.put("imagesource", paramString3);
      mapProperties.put("imagewidth", Integer.valueOf(paramInt8));
      mapProperties.put("imageheight", Integer.valueOf(paramInt9));
      mapProperties.put("tilewidth", Integer.valueOf(paramInt2));
      mapProperties.put("tileheight", Integer.valueOf(paramInt3));
      mapProperties.put("margin", Integer.valueOf(paramInt5));
      mapProperties.put("spacing", Integer.valueOf(paramInt4));
      int i = textureRegion.getRegionWidth();
      int j = textureRegion.getRegionHeight();
      for (paramInt8 = paramInt5; paramInt8 <= j - paramInt3; paramInt8 += paramInt3 + paramInt4) {
        paramInt9 = paramInt5;
        while (paramInt9 <= i - paramInt2) {
          addStaticTiledMapTile(paramTiledMapTileSet, new TextureRegion(textureRegion, paramInt9, paramInt8, paramInt2, paramInt3), paramInt1, paramInt6, paramInt7);
          paramInt9 += paramInt2 + paramInt4;
          paramInt1++;
        } 
      } 
    } else {
      Iterator iterator = paramArray.iterator();
      FileHandle fileHandle = paramFileHandle2;
      while (iterator.hasNext()) {
        FileHandle fileHandle1;
        XmlReader.Element element1 = (XmlReader.Element)iterator.next();
        XmlReader.Element element2 = element1.getChildByName("image");
        if (element2 != null) {
          fileHandle1 = element2.getAttribute("source");
          if (paramString2 != null) {
            fileHandle1 = getRelativeFileHandle(getRelativeFileHandle(textureRegion, paramString2), fileHandle1);
          } else {
            fileHandle1 = getRelativeFileHandle(textureRegion, fileHandle1);
          } 
        } 
        addStaticTiledMapTile(paramTiledMapTileSet, paramImageResolver.getImage(fileHandle1.path()), paramInt1 + element1.getIntAttribute("id"), paramInt6, paramInt7);
      } 
    } 
  }
  
  protected Array<AssetDescriptor> getDependencyAssetDescriptors(FileHandle paramFileHandle, TextureLoader.TextureParameter paramTextureParameter) {
    Array array = new Array();
    Iterator iterator = getDependencyFileHandles(paramFileHandle).iterator();
    while (iterator.hasNext())
      array.add(new AssetDescriptor((FileHandle)iterator.next(), Texture.class, paramTextureParameter)); 
    return array;
  }
  
  public TiledMap load(String paramString) { return load(paramString, new Parameters()); }
  
  public TiledMap load(String paramString, Parameters paramParameters) {
    FileHandle fileHandle = resolve(paramString);
    this.root = this.xml.parse(fileHandle);
    ObjectMap objectMap = new ObjectMap();
    for (FileHandle fileHandle1 : getDependencyFileHandles(fileHandle)) {
      Texture texture = new Texture(fileHandle1, paramParameters.generateMipMaps);
      texture.setFilter(paramParameters.textureMinFilter, paramParameters.textureMagFilter);
      objectMap.put(fileHandle1.path(), texture);
    } 
    TiledMap tiledMap = loadTiledMap(fileHandle, paramParameters, new ImageResolver.DirectImageResolver(objectMap));
    tiledMap.setOwnedResources(objectMap.values().toArray());
    return tiledMap;
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, Parameters paramParameters) { this.map = loadTiledMap(paramFileHandle, paramParameters, new ImageResolver.AssetManagerImageResolver(paramAssetManager)); }
  
  public TiledMap loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, Parameters paramParameters) { return this.map; }
  
  public static class Parameters extends BaseTmxMapLoader.Parameters {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TmxMapLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */