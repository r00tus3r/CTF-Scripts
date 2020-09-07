package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile;
import com.badlogic.gdx.maps.tiled.tiles.StaticTiledMapTile;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.XmlReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.StringTokenizer;

public class TideMapLoader extends SynchronousAssetLoader<TiledMap, TideMapLoader.Parameters> {
  private XmlReader.Element root;
  
  private XmlReader xml = new XmlReader();
  
  public TideMapLoader() { super(new InternalFileHandleResolver()); }
  
  public TideMapLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  private static FileHandle getRelativeFileHandle(FileHandle paramFileHandle, String paramString) {
    StringTokenizer stringTokenizer = new StringTokenizer(paramString, "\\/");
    for (paramFileHandle = paramFileHandle.parent(); stringTokenizer.hasMoreElements(); paramFileHandle = paramFileHandle.child(str)) {
      String str = stringTokenizer.nextToken();
      if (str.equals("..")) {
        paramFileHandle = paramFileHandle.parent();
        continue;
      } 
    } 
    return paramFileHandle;
  }
  
  private void loadLayer(TiledMap paramTiledMap, XmlReader.Element paramElement) {
    if (paramElement.getName().equals("Layer")) {
      String str1 = paramElement.getAttribute("Id");
      String str2 = paramElement.getAttribute("Visible");
      XmlReader.Element element = paramElement.getChildByName("Dimensions");
      String str4 = element.getAttribute("LayerSize");
      String str3 = element.getAttribute("TileSize");
      String[] arrayOfString = str4.split(" x ");
      int i = Integer.parseInt(arrayOfString[0]);
      int j = Integer.parseInt(arrayOfString[1]);
      arrayOfString = str3.split(" x ");
      TiledMapTileLayer tiledMapTileLayer = new TiledMapTileLayer(i, j, Integer.parseInt(arrayOfString[0]), Integer.parseInt(arrayOfString[1]));
      tiledMapTileLayer.setName(str1);
      tiledMapTileLayer.setVisible(str2.equalsIgnoreCase("True"));
      Array array = paramElement.getChildByName("TileArray").getChildrenByName("Row");
      TiledMapTileSets tiledMapTileSets = paramTiledMap.getTileSets();
      int k = array.size;
      str1 = null;
      int m = 0;
      i = 0;
      while (m < k) {
        XmlReader.Element element1 = (XmlReader.Element)array.get(m);
        int n = k - 1 - m;
        int i1 = element1.getChildCount();
        byte b = 0;
        j = 0;
        while (b < i1) {
          TiledMapTileSet tiledMapTileSet;
          XmlReader.Element element2 = element1.getChild(b);
          String str = element2.getName();
          if (str.equals("TileSheet")) {
            tiledMapTileSet = tiledMapTileSets.getTileSet(element2.getAttribute("Ref"));
            i = ((Integer)tiledMapTileSet.getProperties().get("firstgid", Integer.class)).intValue();
          } else if (str.equals("Null")) {
            j += element2.getIntAttribute("Count");
          } else {
            TiledMapTileLayer.Cell cell;
            if (str.equals("Static")) {
              cell = new TiledMapTileLayer.Cell();
              cell.setTile(tiledMapTileSet.getTile(element2.getIntAttribute("Index") + i));
              tiledMapTileLayer.setCell(j, n, cell);
              j++;
            } else if (cell.equals("Animated")) {
              int i2 = element2.getInt("Interval");
              element2 = element2.getChildByName("Frames");
              Array array1 = new Array();
              int i3 = element2.getChildCount();
              byte b1 = 0;
              while (b1 < i3) {
                int i4;
                TiledMapTileSet tiledMapTileSet1;
                XmlReader.Element element3 = element2.getChild(b1);
                String str5 = element3.getName();
                if (str5.equals("TileSheet")) {
                  tiledMapTileSet1 = tiledMapTileSets.getTileSet(element3.getAttribute("Ref"));
                  i4 = ((Integer)tiledMapTileSet1.getProperties().get("firstgid", Integer.class)).intValue();
                } else {
                  tiledMapTileSet1 = tiledMapTileSet;
                  i4 = i;
                  if (str5.equals("Static")) {
                    array1.add((StaticTiledMapTile)tiledMapTileSet.getTile(i + element3.getIntAttribute("Index")));
                    i4 = i;
                    tiledMapTileSet1 = tiledMapTileSet;
                  } 
                } 
                b1++;
                tiledMapTileSet = tiledMapTileSet1;
                i = i4;
              } 
              TiledMapTileLayer.Cell cell1 = new TiledMapTileLayer.Cell();
              cell1.setTile(new AnimatedTiledMapTile(i2 / 1000.0F, array1));
              tiledMapTileLayer.setCell(j, n, cell1);
              j++;
            } 
          } 
          b++;
        } 
        m++;
      } 
      paramElement = paramElement.getChildByName("Properties");
      if (paramElement != null)
        loadProperties(tiledMapTileLayer.getProperties(), paramElement); 
      paramTiledMap.getLayers().add(tiledMapTileLayer);
    } 
  }
  
  private TiledMap loadMap(XmlReader.Element paramElement, FileHandle paramFileHandle, ImageResolver paramImageResolver) {
    TiledMap tiledMap = new TiledMap();
    XmlReader.Element element = paramElement.getChildByName("Properties");
    if (element != null)
      loadProperties(tiledMap.getProperties(), element); 
    Iterator iterator2 = paramElement.getChildByName("TileSheets").getChildrenByName("TileSheet").iterator();
    while (iterator2.hasNext())
      loadTileSheet(tiledMap, (XmlReader.Element)iterator2.next(), paramFileHandle, paramImageResolver); 
    Iterator iterator1 = paramElement.getChildByName("Layers").getChildrenByName("Layer").iterator();
    while (iterator1.hasNext())
      loadLayer(tiledMap, (XmlReader.Element)iterator1.next()); 
    return tiledMap;
  }
  
  private void loadProperties(MapProperties paramMapProperties, XmlReader.Element paramElement) {
    if (paramElement.getName().equals("Properties"))
      for (XmlReader.Element element : paramElement.getChildrenByName("Property")) {
        String str1 = element.getAttribute("Key", null);
        String str3 = element.getAttribute("Type", null);
        String str2 = element.getText();
        if (str3.equals("Int32")) {
          paramMapProperties.put(str1, Integer.valueOf(Integer.parseInt(str2)));
          continue;
        } 
        if (str3.equals("String")) {
          paramMapProperties.put(str1, str2);
          continue;
        } 
        if (str3.equals("Boolean")) {
          paramMapProperties.put(str1, Boolean.valueOf(str2.equalsIgnoreCase("true")));
          continue;
        } 
        paramMapProperties.put(str1, str2);
      }  
  }
  
  private void loadTileSheet(TiledMap paramTiledMap, XmlReader.Element paramElement, FileHandle paramFileHandle, ImageResolver paramImageResolver) {
    if (paramElement.getName().equals("TileSheet")) {
      String str1 = paramElement.getAttribute("Id");
      paramElement.getChildByName("Description").getText();
      String str2 = paramElement.getChildByName("ImageSource").getText();
      XmlReader.Element element2 = paramElement.getChildByName("Alignment");
      String str3 = element2.getAttribute("SheetSize");
      String str4 = element2.getAttribute("TileSize");
      String str5 = element2.getAttribute("Margin");
      element2.getAttribute("Spacing");
      String[] arrayOfString1 = str3.split(" x ");
      Integer.parseInt(arrayOfString1[0]);
      int i = 1;
      Integer.parseInt(arrayOfString1[1]);
      String[] arrayOfString2 = str4.split(" x ");
      int j = Integer.parseInt(arrayOfString2[0]);
      int k = Integer.parseInt(arrayOfString2[1]);
      arrayOfString2 = str5.split(" x ");
      int m = Integer.parseInt(arrayOfString2[0]);
      int n = Integer.parseInt(arrayOfString2[1]);
      String[] arrayOfString3 = str5.split(" x ");
      int i1 = Integer.parseInt(arrayOfString3[0]);
      int i2 = Integer.parseInt(arrayOfString3[1]);
      TextureRegion textureRegion2 = paramImageResolver.getImage(getRelativeFileHandle(paramFileHandle, str2).path());
      TiledMapTileSets tiledMapTileSets = paramTiledMap.getTileSets();
      Iterator iterator = tiledMapTileSets.iterator();
      while (iterator.hasNext())
        i += ((TiledMapTileSet)iterator.next()).size(); 
      TiledMapTileSet tiledMapTileSet = new TiledMapTileSet();
      tiledMapTileSet.setName(str1);
      tiledMapTileSet.getProperties().put("firstgid", Integer.valueOf(i));
      int i3 = textureRegion2.getRegionWidth() - j;
      int i4 = textureRegion2.getRegionHeight() - k;
      int i5 = i;
      i = m;
      m = i4;
      TextureRegion textureRegion1 = textureRegion2;
      while (n <= m) {
        i4 = i;
        while (i4 <= i3) {
          StaticTiledMapTile staticTiledMapTile = new StaticTiledMapTile(new TextureRegion(textureRegion1, i4, n, j, k));
          staticTiledMapTile.setId(i5);
          int i6 = i5 + 1;
          tiledMapTileSet.putTile(i5, staticTiledMapTile);
          i4 += j + i1;
          i5 = i6;
        } 
        n += k + i2;
      } 
      XmlReader.Element element1 = paramElement.getChildByName("Properties");
      if (element1 != null)
        loadProperties(tiledMapTileSet.getProperties(), element1); 
      tiledMapTileSets.addTileSet(tiledMapTileSet);
    } 
  }
  
  private Array<FileHandle> loadTileSheets(XmlReader.Element paramElement, FileHandle paramFileHandle) throws IOException {
    Array array = new Array();
    Iterator iterator = paramElement.getChildByName("TileSheets").getChildrenByName("TileSheet").iterator();
    while (iterator.hasNext())
      array.add(getRelativeFileHandle(paramFileHandle, ((XmlReader.Element)iterator.next()).getChildByName("ImageSource").getText())); 
    return array;
  }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, Parameters paramParameters) {
    array = new Array();
    try {
      this.root = this.xml.parse(paramFileHandle);
      for (FileHandle fileHandle : loadTileSheets(this.root, paramFileHandle)) {
        AssetDescriptor assetDescriptor = new AssetDescriptor();
        this(fileHandle.path(), Texture.class);
        array.add(assetDescriptor);
      } 
      return array;
    } catch (IOException array) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Couldn't load tilemap '");
      stringBuilder.append(paramString);
      stringBuilder.append("'");
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString(), array);
      throw gdxRuntimeException;
    } 
  }
  
  public TiledMap load(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, Parameters paramParameters) {
    try {
      XmlReader.Element element = this.root;
      ImageResolver.AssetManagerImageResolver assetManagerImageResolver = new ImageResolver.AssetManagerImageResolver();
      this(paramAssetManager);
      return loadMap(element, paramFileHandle, assetManagerImageResolver);
    } catch (Exception paramFileHandle) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Couldn't load tilemap '");
      stringBuilder.append(paramString);
      stringBuilder.append("'");
      throw new GdxRuntimeException(stringBuilder.toString(), paramFileHandle);
    } 
  }
  
  public TiledMap load(String paramString) {
    try {
      FileHandle fileHandle = resolve(paramString);
      this.root = this.xml.parse(fileHandle);
      ObjectMap objectMap = new ObjectMap();
      this();
      for (FileHandle fileHandle1 : loadTileSheets(this.root, fileHandle)) {
        String str = fileHandle1.path();
        Texture texture = new Texture();
        this(fileHandle1);
        objectMap.put(str, texture);
      } 
      ImageResolver.DirectImageResolver directImageResolver = new ImageResolver.DirectImageResolver();
      this(objectMap);
      TiledMap tiledMap = loadMap(this.root, fileHandle, directImageResolver);
      tiledMap.setOwnedResources(objectMap.values().toArray());
      return tiledMap;
    } catch (IOException iOException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Couldn't load tilemap '");
      stringBuilder.append(paramString);
      stringBuilder.append("'");
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString(), iOException);
      throw gdxRuntimeException;
    } 
  }
  
  public static class Parameters extends AssetLoaderParameters<TiledMap> {}
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/tiled/TideMapLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */