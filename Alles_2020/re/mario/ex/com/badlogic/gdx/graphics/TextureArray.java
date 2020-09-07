package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.HashMap;
import java.util.Map;

public class TextureArray extends GLTexture {
  static final Map<Application, Array<TextureArray>> managedTextureArrays = new HashMap();
  
  private TextureArrayData data;
  
  public TextureArray(TextureArrayData paramTextureArrayData) {
    super(35866, Gdx.gl.glGenTexture());
    if (Gdx.gl30 != null) {
      load(paramTextureArrayData);
      if (paramTextureArrayData.isManaged())
        addManagedTexture(Gdx.app, this); 
      return;
    } 
    throw new GdxRuntimeException("TextureArray requires a device running with GLES 3.0 compatibilty");
  }
  
  public TextureArray(boolean paramBoolean, Pixmap.Format paramFormat, FileHandle... paramVarArgs) { this(TextureArrayData.Factory.loadFromFiles(paramFormat, paramBoolean, paramVarArgs)); }
  
  public TextureArray(boolean paramBoolean, FileHandle... paramVarArgs) { this(paramBoolean, Pixmap.Format.RGBA8888, paramVarArgs); }
  
  public TextureArray(FileHandle... paramVarArgs) { this(false, paramVarArgs); }
  
  public TextureArray(String... paramVarArgs) { this(getInternalHandles(paramVarArgs)); }
  
  private static void addManagedTexture(Application paramApplication, TextureArray paramTextureArray) {
    Array array1 = (Array)managedTextureArrays.get(paramApplication);
    Array array2 = array1;
    if (array1 == null)
      array2 = new Array(); 
    array2.add(paramTextureArray);
    managedTextureArrays.put(paramApplication, array2);
  }
  
  public static void clearAllTextureArrays(Application paramApplication) { managedTextureArrays.remove(paramApplication); }
  
  private static FileHandle[] getInternalHandles(String... paramVarArgs) {
    FileHandle[] arrayOfFileHandle = new FileHandle[paramVarArgs.length];
    for (byte b = 0; b < paramVarArgs.length; b++)
      arrayOfFileHandle[b] = Gdx.files.internal(paramVarArgs[b]); 
    return arrayOfFileHandle;
  }
  
  public static String getManagedStatus() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Managed TextureArrays/app: { ");
    for (Application application : managedTextureArrays.keySet()) {
      stringBuilder.append(((Array)managedTextureArrays.get(application)).size);
      stringBuilder.append(" ");
    } 
    stringBuilder.append("}");
    return stringBuilder.toString();
  }
  
  public static int getNumManagedTextureArrays() { return ((Array)managedTextureArrays.get(Gdx.app)).size; }
  
  public static void invalidateAllTextureArrays(Application paramApplication) {
    Array array = (Array)managedTextureArrays.get(paramApplication);
    if (array == null)
      return; 
    for (byte b = 0; b < array.size; b++)
      ((TextureArray)array.get(b)).reload(); 
  }
  
  private void load(TextureArrayData paramTextureArrayData) {
    if (this.data == null || paramTextureArrayData.isManaged() == this.data.isManaged()) {
      this.data = paramTextureArrayData;
      bind();
      Gdx.gl30.glTexImage3D(35866, 0, paramTextureArrayData.getInternalFormat(), paramTextureArrayData.getWidth(), paramTextureArrayData.getHeight(), paramTextureArrayData.getDepth(), 0, paramTextureArrayData.getInternalFormat(), paramTextureArrayData.getGLType(), null);
      if (!paramTextureArrayData.isPrepared())
        paramTextureArrayData.prepare(); 
      paramTextureArrayData.consumeTextureArrayData();
      setFilter(this.minFilter, this.magFilter);
      setWrap(this.uWrap, this.vWrap);
      Gdx.gl.glBindTexture(this.glTarget, 0);
      return;
    } 
    throw new GdxRuntimeException("New data must have the same managed status as the old data");
  }
  
  public int getDepth() { return this.data.getDepth(); }
  
  public int getHeight() { return this.data.getHeight(); }
  
  public int getWidth() { return this.data.getWidth(); }
  
  public boolean isManaged() { return this.data.isManaged(); }
  
  protected void reload() {
    if (isManaged()) {
      this.glHandle = Gdx.gl.glGenTexture();
      load(this.data);
      return;
    } 
    throw new GdxRuntimeException("Tried to reload an unmanaged TextureArray");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/TextureArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */