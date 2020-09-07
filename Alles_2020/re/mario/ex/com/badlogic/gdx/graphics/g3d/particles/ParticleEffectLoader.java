package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.io.IOException;
import java.util.Iterator;

public class ParticleEffectLoader extends AsynchronousAssetLoader<ParticleEffect, ParticleEffectLoader.ParticleEffectLoadParameter> {
  protected Array<ObjectMap.Entry<String, ResourceData<ParticleEffect>>> items = new Array();
  
  public ParticleEffectLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  private <T> T find(Array<?> paramArray, Class<T> paramClass) {
    for (Object object : paramArray) {
      if (ClassReflection.isAssignableFrom(paramClass, object.getClass()))
        return (T)object; 
    } 
    return null;
  }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, ParticleEffectLoadParameter paramParticleEffectLoadParameter) {
    ResourceData resourceData = (ResourceData)(new Json()).fromJson(ResourceData.class, paramFileHandle);
    synchronized (this.items) {
      ObjectMap.Entry entry = new ObjectMap.Entry();
      this();
      entry.key = paramString;
      entry.value = resourceData;
      this.items.add(entry);
      Array array2 = resourceData.getAssets();
      Array array1 = new Array();
      for (ResourceData.AssetData assetData : array2) {
        if (!resolve(assetData.filename).exists())
          assetData.filename = paramFileHandle.parent().child(Gdx.files.internal(assetData.filename).name()).path(); 
        if (assetData.type == ParticleEffect.class) {
          array1.add(new AssetDescriptor(assetData.filename, assetData.type, paramParticleEffectLoadParameter));
          continue;
        } 
        array1.add(new AssetDescriptor(assetData.filename, assetData.type));
      } 
      return array1;
    } 
  }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, ParticleEffectLoadParameter paramParticleEffectLoadParameter) {}
  
  public ParticleEffect loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, ParticleEffectLoadParameter paramParticleEffectLoadParameter) { // Byte code:
    //   0: aload_0
    //   1: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   4: astore_3
    //   5: aload_3
    //   6: monitorenter
    //   7: iconst_0
    //   8: istore #5
    //   10: iload #5
    //   12: aload_0
    //   13: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   16: getfield size : I
    //   19: if_icmpge -> 79
    //   22: aload_0
    //   23: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   26: iload #5
    //   28: invokevirtual get : (I)Ljava/lang/Object;
    //   31: checkcast com/badlogic/gdx/utils/ObjectMap$Entry
    //   34: astore #6
    //   36: aload #6
    //   38: getfield key : Ljava/lang/Object;
    //   41: checkcast java/lang/String
    //   44: aload_2
    //   45: invokevirtual equals : (Ljava/lang/Object;)Z
    //   48: ifeq -> 73
    //   51: aload #6
    //   53: getfield value : Ljava/lang/Object;
    //   56: checkcast com/badlogic/gdx/graphics/g3d/particles/ResourceData
    //   59: astore_2
    //   60: aload_0
    //   61: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   64: iload #5
    //   66: invokevirtual removeIndex : (I)Ljava/lang/Object;
    //   69: pop
    //   70: goto -> 81
    //   73: iinc #5, 1
    //   76: goto -> 10
    //   79: aconst_null
    //   80: astore_2
    //   81: aload_3
    //   82: monitorexit
    //   83: aload_2
    //   84: getfield resource : Ljava/lang/Object;
    //   87: checkcast com/badlogic/gdx/graphics/g3d/particles/ParticleEffect
    //   90: aload_1
    //   91: aload_2
    //   92: invokevirtual load : (Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    //   95: aload #4
    //   97: ifnull -> 160
    //   100: aload #4
    //   102: getfield batches : Lcom/badlogic/gdx/utils/Array;
    //   105: ifnull -> 145
    //   108: aload #4
    //   110: getfield batches : Lcom/badlogic/gdx/utils/Array;
    //   113: invokevirtual iterator : ()Ljava/util/Iterator;
    //   116: astore_3
    //   117: aload_3
    //   118: invokeinterface hasNext : ()Z
    //   123: ifeq -> 145
    //   126: aload_3
    //   127: invokeinterface next : ()Ljava/lang/Object;
    //   132: checkcast com/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch
    //   135: aload_1
    //   136: aload_2
    //   137: invokeinterface load : (Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    //   142: goto -> 117
    //   145: aload_2
    //   146: getfield resource : Ljava/lang/Object;
    //   149: checkcast com/badlogic/gdx/graphics/g3d/particles/ParticleEffect
    //   152: aload #4
    //   154: getfield batches : Lcom/badlogic/gdx/utils/Array;
    //   157: invokevirtual setBatch : (Lcom/badlogic/gdx/utils/Array;)V
    //   160: aload_2
    //   161: getfield resource : Ljava/lang/Object;
    //   164: checkcast com/badlogic/gdx/graphics/g3d/particles/ParticleEffect
    //   167: areturn
    //   168: astore_1
    //   169: aload_3
    //   170: monitorexit
    //   171: goto -> 176
    //   174: aload_1
    //   175: athrow
    //   176: goto -> 174
    // Exception table:
    //   from	to	target	type
    //   10	70	168	finally
    //   81	83	168	finally
    //   169	171	168	finally }
  
  public void save(ParticleEffect paramParticleEffect, ParticleEffectSaveParameter paramParticleEffectSaveParameter) throws IOException {
    ResourceData resourceData = new ResourceData(paramParticleEffect);
    paramParticleEffect.save(paramParticleEffectSaveParameter.manager, resourceData);
    if (paramParticleEffectSaveParameter.batches != null)
      for (ParticleBatch particleBatch : paramParticleEffectSaveParameter.batches) {
        boolean bool2;
        boolean bool1 = false;
        Iterator iterator = paramParticleEffect.getControllers().iterator();
        while (true) {
          bool2 = bool1;
          if (iterator.hasNext()) {
            if (((ParticleController)iterator.next()).renderer.isCompatible(particleBatch)) {
              bool2 = true;
              break;
            } 
            continue;
          } 
          break;
        } 
        if (bool2)
          particleBatch.save(paramParticleEffectSaveParameter.manager, resourceData); 
      }  
    (new Json()).toJson(resourceData, paramParticleEffectSaveParameter.file);
  }
  
  public static class ParticleEffectLoadParameter extends AssetLoaderParameters<ParticleEffect> {
    Array<ParticleBatch<?>> batches;
    
    public ParticleEffectLoadParameter(Array<ParticleBatch<?>> param1Array) { this.batches = param1Array; }
  }
  
  public static class ParticleEffectSaveParameter extends AssetLoaderParameters<ParticleEffect> {
    Array<ParticleBatch<?>> batches;
    
    FileHandle file;
    
    AssetManager manager;
    
    public ParticleEffectSaveParameter(FileHandle param1FileHandle, AssetManager param1AssetManager, Array<ParticleBatch<?>> param1Array) {
      this.batches = param1Array;
      this.file = param1FileHandle;
      this.manager = param1AssetManager;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleEffectLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */