package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.model.data.ModelData;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.graphics.g3d.utils.TextureProvider;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ObjectMap;
import java.util.Iterator;

public abstract class ModelLoader<P extends ModelLoader.ModelParameters> extends AsynchronousAssetLoader<Model, P> {
  protected ModelParameters defaultParameters = new ModelParameters();
  
  protected Array<ObjectMap.Entry<String, ModelData>> items = new Array();
  
  public ModelLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, P paramP) {
    Array array = new Array();
    null = loadModelData(paramFileHandle, paramP);
    if (null == null)
      return array; 
    ObjectMap.Entry entry = new ObjectMap.Entry();
    entry.key = paramString;
    entry.value = null;
    synchronized (this.items) {
      this.items.add(entry);
      if (paramP != null) {
        null = paramP.textureParameter;
      } else {
        null = this.defaultParameters.textureParameter;
      } 
      Iterator iterator = null.materials.iterator();
      while (iterator.hasNext()) {
        paramP = (P)(ModelMaterial)iterator.next();
        if (paramP.textures != null) {
          paramP = (P)paramP.textures.iterator();
          while (paramP.hasNext())
            array.add(new AssetDescriptor(((ModelTexture)paramP.next()).fileName, Texture.class, null)); 
        } 
      } 
      return array;
    } 
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, P paramP) {}
  
  public Model loadModel(FileHandle paramFileHandle) { return loadModel(paramFileHandle, new TextureProvider.FileTextureProvider(), null); }
  
  public Model loadModel(FileHandle paramFileHandle, P paramP) { return loadModel(paramFileHandle, new TextureProvider.FileTextureProvider(), paramP); }
  
  public Model loadModel(FileHandle paramFileHandle, TextureProvider paramTextureProvider) { return loadModel(paramFileHandle, paramTextureProvider, null); }
  
  public Model loadModel(FileHandle paramFileHandle, TextureProvider paramTextureProvider, P paramP) {
    Model model = loadModelData(paramFileHandle, paramP);
    if (model == null) {
      model = null;
    } else {
      model = new Model(model, paramTextureProvider);
    } 
    return model;
  }
  
  public ModelData loadModelData(FileHandle paramFileHandle) { return loadModelData(paramFileHandle, null); }
  
  public abstract ModelData loadModelData(FileHandle paramFileHandle, P paramP);
  
  public Model loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, P paramP) { // Byte code:
    //   0: aload_0
    //   1: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   4: astore #4
    //   6: aload #4
    //   8: monitorenter
    //   9: iconst_0
    //   10: istore #5
    //   12: aconst_null
    //   13: astore_3
    //   14: iload #5
    //   16: aload_0
    //   17: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   20: getfield size : I
    //   23: if_icmpge -> 86
    //   26: aload_0
    //   27: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   30: iload #5
    //   32: invokevirtual get : (I)Ljava/lang/Object;
    //   35: checkcast com/badlogic/gdx/utils/ObjectMap$Entry
    //   38: getfield key : Ljava/lang/Object;
    //   41: checkcast java/lang/String
    //   44: aload_2
    //   45: invokevirtual equals : (Ljava/lang/Object;)Z
    //   48: ifeq -> 80
    //   51: aload_0
    //   52: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   55: iload #5
    //   57: invokevirtual get : (I)Ljava/lang/Object;
    //   60: checkcast com/badlogic/gdx/utils/ObjectMap$Entry
    //   63: getfield value : Ljava/lang/Object;
    //   66: checkcast com/badlogic/gdx/graphics/g3d/model/data/ModelData
    //   69: astore_3
    //   70: aload_0
    //   71: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   74: iload #5
    //   76: invokevirtual removeIndex : (I)Ljava/lang/Object;
    //   79: pop
    //   80: iinc #5, 1
    //   83: goto -> 14
    //   86: aload #4
    //   88: monitorexit
    //   89: aload_3
    //   90: ifnonnull -> 95
    //   93: aconst_null
    //   94: areturn
    //   95: new com/badlogic/gdx/graphics/g3d/Model
    //   98: dup
    //   99: aload_3
    //   100: new com/badlogic/gdx/graphics/g3d/utils/TextureProvider$AssetTextureProvider
    //   103: dup
    //   104: aload_1
    //   105: invokespecial <init> : (Lcom/badlogic/gdx/assets/AssetManager;)V
    //   108: invokespecial <init> : (Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V
    //   111: astore_1
    //   112: aload_1
    //   113: invokevirtual getManagedDisposables : ()Ljava/lang/Iterable;
    //   116: invokeinterface iterator : ()Ljava/util/Iterator;
    //   121: astore_2
    //   122: aload_2
    //   123: invokeinterface hasNext : ()Z
    //   128: ifeq -> 155
    //   131: aload_2
    //   132: invokeinterface next : ()Ljava/lang/Object;
    //   137: checkcast com/badlogic/gdx/utils/Disposable
    //   140: instanceof com/badlogic/gdx/graphics/Texture
    //   143: ifeq -> 122
    //   146: aload_2
    //   147: invokeinterface remove : ()V
    //   152: goto -> 122
    //   155: aload_1
    //   156: areturn
    //   157: astore_1
    //   158: aload #4
    //   160: monitorexit
    //   161: goto -> 166
    //   164: aload_1
    //   165: athrow
    //   166: goto -> 164
    // Exception table:
    //   from	to	target	type
    //   14	26	157	finally
    //   26	80	157	finally
    //   86	89	157	finally
    //   158	161	157	finally }
  
  public static class ModelParameters extends AssetLoaderParameters<Model> {
    public TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
    
    public ModelParameters() {
      TextureLoader.TextureParameter textureParameter1 = this.textureParameter;
      Texture.TextureFilter textureFilter = Texture.TextureFilter.Linear;
      textureParameter1.magFilter = textureFilter;
      textureParameter1.minFilter = textureFilter;
      textureParameter1 = this.textureParameter;
      Texture.TextureWrap textureWrap = Texture.TextureWrap.Repeat;
      textureParameter1.wrapV = textureWrap;
      textureParameter1.wrapU = textureWrap;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/ModelLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */