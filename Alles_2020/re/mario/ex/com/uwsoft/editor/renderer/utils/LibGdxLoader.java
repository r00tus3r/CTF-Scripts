package com.uwsoft.editor.renderer.utils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.PixmapPacker;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.brashmonkey.spriter.Data;
import com.brashmonkey.spriter.FileReference;
import com.brashmonkey.spriter.Loader;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class LibGdxLoader extends Loader<Sprite> implements Disposable {
  public static int standardAtlasHeight = 2048;
  
  public static int standardAtlasWidth = 2048;
  
  private int atlasHeight;
  
  private int atlasWidth;
  
  private boolean pack = true;
  
  private PixmapPacker packer;
  
  private HashMap<FileReference, Pixmap> pixmaps;
  
  private HashMap<Pixmap, Boolean> pixmapsToDispose;
  
  static  {
  
  }
  
  public LibGdxLoader(Data paramData) { this(paramData, true); }
  
  public LibGdxLoader(Data paramData, int paramInt1, int paramInt2) {
    super(paramData);
    this.atlasWidth = paramInt1;
    this.atlasHeight = paramInt2;
    this.pixmaps = new HashMap();
    this.pixmapsToDispose = new HashMap();
  }
  
  public LibGdxLoader(Data paramData, boolean paramBoolean) {
    this(paramData, standardAtlasWidth, standardAtlasHeight);
    this.pack = paramBoolean;
  }
  
  private void disposeNonPackedTextures() {
    Iterator iterator = this.resources.entrySet().iterator();
    while (iterator.hasNext())
      ((Sprite)((Map.Entry)iterator.next()).getValue()).getTexture().dispose(); 
  }
  
  protected void createSprite(FileReference paramFileReference, Pixmap paramPixmap) {
    Texture texture = new Texture(paramPixmap);
    texture.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
    TextureRegion textureRegion = new TextureRegion(texture, (int)(this.data.getFile(paramFileReference.folder, paramFileReference.file)).size.width, (int)(this.data.getFile(paramFileReference.folder, paramFileReference.file)).size.height);
    this.resources.put(paramFileReference, new Sprite(textureRegion));
    this.pixmapsToDispose.put(paramPixmap, Boolean.valueOf(true));
  }
  
  public void dispose() { // Byte code:
    //   0: aload_0
    //   1: getfield pack : Z
    //   4: ifeq -> 23
    //   7: aload_0
    //   8: getfield packer : Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;
    //   11: astore_1
    //   12: aload_1
    //   13: ifnull -> 23
    //   16: aload_1
    //   17: invokevirtual dispose : ()V
    //   20: goto -> 27
    //   23: aload_0
    //   24: invokespecial disposeNonPackedTextures : ()V
    //   27: aload_0
    //   28: invokespecial dispose : ()V
    //   31: return }
  
  protected void disposePixmaps() {
    Pixmap[] arrayOfPixmap = new Pixmap[this.pixmapsToDispose.size()];
    this.pixmapsToDispose.keySet().toArray(arrayOfPixmap);
    int i = arrayOfPixmap.length;
    for (byte b = 0; b < i; b++) {
      pixmap = arrayOfPixmap[b];
      try {
        while (((Boolean)this.pixmapsToDispose.get(pixmap)).booleanValue()) {
          pixmap.dispose();
          this.pixmapsToDispose.put(pixmap, Boolean.valueOf(false));
        } 
      } catch (GdxRuntimeException pixmap) {
        System.err.println("Pixmap was already disposed!");
      } 
    } 
    this.pixmapsToDispose.clear();
  }
  
  protected void finishLoading() {
    for (FileReference fileReference : this.resources.keySet()) {
      Pixmap pixmap = (Pixmap)this.pixmaps.get(fileReference);
      this.pixmapsToDispose.put(pixmap, Boolean.valueOf(false));
      createSprite(fileReference, pixmap);
      PixmapPacker pixmapPacker = this.packer;
      if (pixmapPacker != null)
        pixmapPacker.pack((this.data.getFile(fileReference)).name, pixmap); 
    } 
    if (this.pack)
      generatePackedSprites(); 
    disposePixmaps();
  }
  
  protected void generatePackedSprites() {
    PixmapPacker pixmapPacker = this.packer;
    if (pixmapPacker == null)
      return; 
    TextureAtlas textureAtlas = pixmapPacker.generateTextureAtlas(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear, false);
    Set set = this.resources.keySet();
    disposeNonPackedTextures();
    for (FileReference fileReference : set) {
      TextureAtlas.AtlasRegion atlasRegion = textureAtlas.findRegion((this.data.getFile(fileReference)).name);
      atlasRegion.setRegionWidth((int)(this.data.getFile(fileReference)).size.width);
      atlasRegion.setRegionHeight((int)(this.data.getFile(fileReference)).size.height);
      this.resources.put(fileReference, new Sprite(atlasRegion));
    } 
  }
  
  protected Sprite loadResource(FileReference paramFileReference) {
    FileHandle fileHandle = (new File((this.data.getFile(paramFileReference)).name)).getName();
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(this.root);
    stringBuilder2.append("/");
    stringBuilder2.append(fileHandle);
    String str = stringBuilder2.toString();
    if (null.$SwitchMap$com$badlogic$gdx$Application$ApplicationType[Gdx.app.getType().ordinal()] != 1) {
      FileHandle fileHandle1 = Gdx.files.internal(str);
    } else {
      fileHandle = Gdx.files.absolute(str);
    } 
    if (fileHandle.exists()) {
      if (this.packer == null && this.pack)
        this.packer = new PixmapPacker(this.atlasWidth, this.atlasHeight, Pixmap.Format.RGBA8888, 2, true); 
      Pixmap pixmap = new Pixmap(fileHandle);
      this.pixmaps.put(paramFileReference, pixmap);
      return null;
    } 
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append("Could not find file handle ");
    stringBuilder1.append(str);
    stringBuilder1.append("! Please check your paths.");
    throw new GdxRuntimeException(stringBuilder1.toString());
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/utils/LibGdxLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */