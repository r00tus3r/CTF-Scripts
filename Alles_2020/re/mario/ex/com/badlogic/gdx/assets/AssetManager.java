package com.badlogic.gdx.assets;

import com.badlogic.gdx.assets.loaders.AssetLoader;
import com.badlogic.gdx.assets.loaders.BitmapFontLoader;
import com.badlogic.gdx.assets.loaders.CubemapLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.I18NBundleLoader;
import com.badlogic.gdx.assets.loaders.MusicLoader;
import com.badlogic.gdx.assets.loaders.ParticleEffectLoader;
import com.badlogic.gdx.assets.loaders.PixmapLoader;
import com.badlogic.gdx.assets.loaders.ShaderProgramLoader;
import com.badlogic.gdx.assets.loaders.SkinLoader;
import com.badlogic.gdx.assets.loaders.SoundLoader;
import com.badlogic.gdx.assets.loaders.TextureAtlasLoader;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.graphics.g2d.PolygonRegionLoader;
import com.badlogic.gdx.graphics.g3d.loader.G3dModelLoader;
import com.badlogic.gdx.graphics.g3d.loader.ObjLoader;
import com.badlogic.gdx.graphics.g3d.particles.ParticleEffectLoader;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.JsonReader;
import com.badlogic.gdx.utils.Logger;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.TimeUtils;
import com.badlogic.gdx.utils.UBJsonReader;
import com.badlogic.gdx.utils.async.AsyncExecutor;
import com.badlogic.gdx.utils.async.ThreadUtils;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.util.Iterator;
import java.util.Stack;

public class AssetManager implements Disposable {
  final ObjectMap<String, Array<String>> assetDependencies = new ObjectMap();
  
  final ObjectMap<String, Class> assetTypes = new ObjectMap();
  
  final ObjectMap<Class, ObjectMap<String, RefCountedContainer>> assets = new ObjectMap();
  
  final AsyncExecutor executor;
  
  final ObjectSet<String> injected = new ObjectSet();
  
  AssetErrorListener listener = null;
  
  final Array<AssetDescriptor> loadQueue = new Array();
  
  int loaded = 0;
  
  final ObjectMap<Class, ObjectMap<String, AssetLoader>> loaders = new ObjectMap();
  
  Logger log = new Logger("AssetManager", false);
  
  int peakTasks = 0;
  
  final FileHandleResolver resolver;
  
  final Stack<AssetLoadingTask> tasks = new Stack();
  
  int toLoad = 0;
  
  public AssetManager() { this(new InternalFileHandleResolver()); }
  
  public AssetManager(FileHandleResolver paramFileHandleResolver) { this(paramFileHandleResolver, true); }
  
  public AssetManager(FileHandleResolver paramFileHandleResolver, boolean paramBoolean) {
    this.resolver = paramFileHandleResolver;
    if (paramBoolean) {
      setLoader(com.badlogic.gdx.graphics.g2d.BitmapFont.class, new BitmapFontLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.audio.Music.class, new MusicLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.Pixmap.class, new PixmapLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.audio.Sound.class, new SoundLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g2d.TextureAtlas.class, new TextureAtlasLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.Texture.class, new TextureLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.scenes.scene2d.ui.Skin.class, new SkinLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g2d.ParticleEffect.class, new ParticleEffectLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g3d.particles.ParticleEffect.class, new ParticleEffectLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g2d.PolygonRegion.class, new PolygonRegionLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.utils.I18NBundle.class, new I18NBundleLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g3d.Model.class, ".g3dj", new G3dModelLoader(new JsonReader(), paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g3d.Model.class, ".g3db", new G3dModelLoader(new UBJsonReader(), paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.g3d.Model.class, ".obj", new ObjLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.glutils.ShaderProgram.class, new ShaderProgramLoader(paramFileHandleResolver));
      setLoader(com.badlogic.gdx.graphics.Cubemap.class, new CubemapLoader(paramFileHandleResolver));
    } 
    this.executor = new AsyncExecutor(true, "AssetManager");
  }
  
  private void addTask(AssetDescriptor paramAssetDescriptor) {
    AssetLoader assetLoader = getLoader(paramAssetDescriptor.type, paramAssetDescriptor.fileName);
    if (assetLoader != null) {
      this.tasks.push(new AssetLoadingTask(this, paramAssetDescriptor, assetLoader, this.executor));
      this.peakTasks++;
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("No loader for type: ");
    stringBuilder.append(ClassReflection.getSimpleName(paramAssetDescriptor.type));
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  private void handleTaskError(Throwable paramThrowable) {
    this.log.error("Error loading asset.", paramThrowable);
    if (!this.tasks.isEmpty()) {
      AssetLoadingTask assetLoadingTask = (AssetLoadingTask)this.tasks.pop();
      AssetDescriptor assetDescriptor = assetLoadingTask.assetDesc;
      if (assetLoadingTask.dependenciesLoaded && assetLoadingTask.dependencies != null) {
        Iterator iterator = assetLoadingTask.dependencies.iterator();
        while (iterator.hasNext())
          unload(((AssetDescriptor)iterator.next()).fileName); 
      } 
      this.tasks.clear();
      AssetErrorListener assetErrorListener = this.listener;
      if (assetErrorListener != null) {
        assetErrorListener.error(assetDescriptor, paramThrowable);
        return;
      } 
      throw new GdxRuntimeException(paramThrowable);
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(paramThrowable);
    throw gdxRuntimeException;
  }
  
  private void incrementRefCountedDependencies(String paramString) {
    Array array = (Array)this.assetDependencies.get(paramString);
    if (array == null)
      return; 
    for (String str : array) {
      Class clazz = (Class)this.assetTypes.get(str);
      ((RefCountedContainer)((ObjectMap)this.assets.get(clazz)).get(str)).incRefCount();
      incrementRefCountedDependencies(str);
    } 
  }
  
  private void injectDependency(String paramString, AssetDescriptor paramAssetDescriptor) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast com/badlogic/gdx/utils/Array
    //   13: astore_3
    //   14: aload_3
    //   15: astore #4
    //   17: aload_3
    //   18: ifnonnull -> 42
    //   21: new com/badlogic/gdx/utils/Array
    //   24: astore #4
    //   26: aload #4
    //   28: invokespecial <init> : ()V
    //   31: aload_0
    //   32: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   35: aload_1
    //   36: aload #4
    //   38: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   41: pop
    //   42: aload #4
    //   44: aload_2
    //   45: getfield fileName : Ljava/lang/String;
    //   48: invokevirtual add : (Ljava/lang/Object;)V
    //   51: aload_0
    //   52: aload_2
    //   53: getfield fileName : Ljava/lang/String;
    //   56: invokevirtual isLoaded : (Ljava/lang/String;)Z
    //   59: ifeq -> 152
    //   62: aload_0
    //   63: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   66: astore_1
    //   67: new java/lang/StringBuilder
    //   70: astore #4
    //   72: aload #4
    //   74: invokespecial <init> : ()V
    //   77: aload #4
    //   79: ldc_w 'Dependency already loaded: '
    //   82: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: pop
    //   86: aload #4
    //   88: aload_2
    //   89: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   92: pop
    //   93: aload_1
    //   94: aload #4
    //   96: invokevirtual toString : ()Ljava/lang/String;
    //   99: invokevirtual debug : (Ljava/lang/String;)V
    //   102: aload_0
    //   103: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   106: aload_2
    //   107: getfield fileName : Ljava/lang/String;
    //   110: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   113: checkcast java/lang/Class
    //   116: astore_1
    //   117: aload_0
    //   118: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   121: aload_1
    //   122: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   125: checkcast com/badlogic/gdx/utils/ObjectMap
    //   128: aload_2
    //   129: getfield fileName : Ljava/lang/String;
    //   132: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   135: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   138: invokevirtual incRefCount : ()V
    //   141: aload_0
    //   142: aload_2
    //   143: getfield fileName : Ljava/lang/String;
    //   146: invokespecial incrementRefCountedDependencies : (Ljava/lang/String;)V
    //   149: goto -> 194
    //   152: aload_0
    //   153: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   156: astore #4
    //   158: new java/lang/StringBuilder
    //   161: astore_1
    //   162: aload_1
    //   163: invokespecial <init> : ()V
    //   166: aload_1
    //   167: ldc_w 'Loading dependency: '
    //   170: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   173: pop
    //   174: aload_1
    //   175: aload_2
    //   176: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   179: pop
    //   180: aload #4
    //   182: aload_1
    //   183: invokevirtual toString : ()Ljava/lang/String;
    //   186: invokevirtual info : (Ljava/lang/String;)V
    //   189: aload_0
    //   190: aload_2
    //   191: invokespecial addTask : (Lcom/badlogic/gdx/assets/AssetDescriptor;)V
    //   194: aload_0
    //   195: monitorexit
    //   196: return
    //   197: astore_1
    //   198: aload_0
    //   199: monitorexit
    //   200: aload_1
    //   201: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	197	finally
    //   21	42	197	finally
    //   42	149	197	finally
    //   152	194	197	finally }
  
  private void nextTask() {
    AssetDescriptor assetDescriptor = (AssetDescriptor)this.loadQueue.removeIndex(0);
    if (isLoaded(assetDescriptor.fileName)) {
      Logger logger = this.log;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Already loaded: ");
      stringBuilder.append(assetDescriptor);
      logger.debug(stringBuilder.toString());
      Class clazz = (Class)this.assetTypes.get(assetDescriptor.fileName);
      ((RefCountedContainer)((ObjectMap)this.assets.get(clazz)).get(assetDescriptor.fileName)).incRefCount();
      incrementRefCountedDependencies(assetDescriptor.fileName);
      if (assetDescriptor.params != null && assetDescriptor.params.loadedCallback != null)
        assetDescriptor.params.loadedCallback.finishedLoading(this, assetDescriptor.fileName, assetDescriptor.type); 
      this.loaded++;
    } else {
      Logger logger = this.log;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Loading: ");
      stringBuilder.append(assetDescriptor);
      logger.info(stringBuilder.toString());
      addTask(assetDescriptor);
    } 
  }
  
  private boolean updateTask() { // Byte code:
    //   0: aload_0
    //   1: getfield tasks : Ljava/util/Stack;
    //   4: invokevirtual peek : ()Ljava/lang/Object;
    //   7: checkcast com/badlogic/gdx/assets/AssetLoadingTask
    //   10: astore_1
    //   11: aload_1
    //   12: getfield cancel : Z
    //   15: ifne -> 52
    //   18: aload_1
    //   19: invokevirtual update : ()Z
    //   22: istore_2
    //   23: iload_2
    //   24: ifeq -> 30
    //   27: goto -> 52
    //   30: iconst_0
    //   31: istore_3
    //   32: goto -> 54
    //   35: astore #4
    //   37: aload_1
    //   38: iconst_1
    //   39: putfield cancel : Z
    //   42: aload_0
    //   43: aload_1
    //   44: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   47: aload #4
    //   49: invokevirtual taskFailed : (Lcom/badlogic/gdx/assets/AssetDescriptor;Ljava/lang/RuntimeException;)V
    //   52: iconst_1
    //   53: istore_3
    //   54: iload_3
    //   55: ifeq -> 254
    //   58: aload_0
    //   59: getfield tasks : Ljava/util/Stack;
    //   62: invokevirtual size : ()I
    //   65: iconst_1
    //   66: if_icmpne -> 84
    //   69: aload_0
    //   70: aload_0
    //   71: getfield loaded : I
    //   74: iconst_1
    //   75: iadd
    //   76: putfield loaded : I
    //   79: aload_0
    //   80: iconst_0
    //   81: putfield peakTasks : I
    //   84: aload_0
    //   85: getfield tasks : Ljava/util/Stack;
    //   88: invokevirtual pop : ()Ljava/lang/Object;
    //   91: pop
    //   92: aload_1
    //   93: getfield cancel : Z
    //   96: ifeq -> 101
    //   99: iconst_1
    //   100: ireturn
    //   101: aload_0
    //   102: aload_1
    //   103: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   106: getfield fileName : Ljava/lang/String;
    //   109: aload_1
    //   110: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   113: getfield type : Ljava/lang/Class;
    //   116: aload_1
    //   117: invokevirtual getAsset : ()Ljava/lang/Object;
    //   120: invokevirtual addAsset : (Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    //   123: aload_1
    //   124: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   127: getfield params : Lcom/badlogic/gdx/assets/AssetLoaderParameters;
    //   130: ifnull -> 176
    //   133: aload_1
    //   134: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   137: getfield params : Lcom/badlogic/gdx/assets/AssetLoaderParameters;
    //   140: getfield loadedCallback : Lcom/badlogic/gdx/assets/AssetLoaderParameters$LoadedCallback;
    //   143: ifnull -> 176
    //   146: aload_1
    //   147: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   150: getfield params : Lcom/badlogic/gdx/assets/AssetLoaderParameters;
    //   153: getfield loadedCallback : Lcom/badlogic/gdx/assets/AssetLoaderParameters$LoadedCallback;
    //   156: aload_0
    //   157: aload_1
    //   158: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   161: getfield fileName : Ljava/lang/String;
    //   164: aload_1
    //   165: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   168: getfield type : Ljava/lang/Class;
    //   171: invokeinterface finishedLoading : (Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Ljava/lang/Class;)V
    //   176: invokestatic nanoTime : ()J
    //   179: lstore #5
    //   181: aload_0
    //   182: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   185: astore #4
    //   187: new java/lang/StringBuilder
    //   190: dup
    //   191: invokespecial <init> : ()V
    //   194: astore #7
    //   196: aload #7
    //   198: ldc_w 'Loaded: '
    //   201: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   204: pop
    //   205: aload #7
    //   207: lload #5
    //   209: aload_1
    //   210: getfield startTime : J
    //   213: lsub
    //   214: l2f
    //   215: ldc_w 1000000.0
    //   218: fdiv
    //   219: invokevirtual append : (F)Ljava/lang/StringBuilder;
    //   222: pop
    //   223: aload #7
    //   225: ldc_w 'ms '
    //   228: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   231: pop
    //   232: aload #7
    //   234: aload_1
    //   235: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   238: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   241: pop
    //   242: aload #4
    //   244: aload #7
    //   246: invokevirtual toString : ()Ljava/lang/String;
    //   249: invokevirtual debug : (Ljava/lang/String;)V
    //   252: iconst_1
    //   253: ireturn
    //   254: iconst_0
    //   255: ireturn
    // Exception table:
    //   from	to	target	type
    //   11	23	35	java/lang/RuntimeException }
  
  protected <T> void addAsset(String paramString, Class<T> paramClass, T paramT) {
    this.assetTypes.put(paramString, paramClass);
    ObjectMap objectMap1 = (ObjectMap)this.assets.get(paramClass);
    ObjectMap objectMap2 = objectMap1;
    if (objectMap1 == null) {
      objectMap2 = new ObjectMap();
      this.assets.put(paramClass, objectMap2);
    } 
    objectMap2.put(paramString, new RefCountedContainer(paramT));
  }
  
  public void clear() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   6: invokevirtual clear : ()V
    //   9: aload_0
    //   10: invokevirtual update : ()Z
    //   13: ifne -> 19
    //   16: goto -> 9
    //   19: new com/badlogic/gdx/utils/ObjectIntMap
    //   22: astore_1
    //   23: aload_1
    //   24: invokespecial <init> : ()V
    //   27: aload_0
    //   28: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   31: getfield size : I
    //   34: ifle -> 218
    //   37: aload_1
    //   38: invokevirtual clear : ()V
    //   41: aload_0
    //   42: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   45: invokevirtual keys : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   48: invokevirtual toArray : ()Lcom/badlogic/gdx/utils/Array;
    //   51: astore_2
    //   52: aload_2
    //   53: invokevirtual iterator : ()Ljava/util/Iterator;
    //   56: astore_3
    //   57: aload_3
    //   58: invokeinterface hasNext : ()Z
    //   63: ifeq -> 83
    //   66: aload_1
    //   67: aload_3
    //   68: invokeinterface next : ()Ljava/lang/Object;
    //   73: checkcast java/lang/String
    //   76: iconst_0
    //   77: invokevirtual put : (Ljava/lang/Object;I)V
    //   80: goto -> 57
    //   83: aload_2
    //   84: invokevirtual iterator : ()Ljava/util/Iterator;
    //   87: astore_3
    //   88: aload_3
    //   89: invokeinterface hasNext : ()Z
    //   94: ifeq -> 177
    //   97: aload_3
    //   98: invokeinterface next : ()Ljava/lang/Object;
    //   103: checkcast java/lang/String
    //   106: astore #4
    //   108: aload_0
    //   109: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   112: aload #4
    //   114: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   117: checkcast com/badlogic/gdx/utils/Array
    //   120: astore #4
    //   122: aload #4
    //   124: ifnonnull -> 130
    //   127: goto -> 88
    //   130: aload #4
    //   132: invokevirtual iterator : ()Ljava/util/Iterator;
    //   135: astore #4
    //   137: aload #4
    //   139: invokeinterface hasNext : ()Z
    //   144: ifeq -> 88
    //   147: aload #4
    //   149: invokeinterface next : ()Ljava/lang/Object;
    //   154: checkcast java/lang/String
    //   157: astore #5
    //   159: aload_1
    //   160: aload #5
    //   162: aload_1
    //   163: aload #5
    //   165: iconst_0
    //   166: invokevirtual get : (Ljava/lang/Object;I)I
    //   169: iconst_1
    //   170: iadd
    //   171: invokevirtual put : (Ljava/lang/Object;I)V
    //   174: goto -> 137
    //   177: aload_2
    //   178: invokevirtual iterator : ()Ljava/util/Iterator;
    //   181: astore_2
    //   182: aload_2
    //   183: invokeinterface hasNext : ()Z
    //   188: ifeq -> 27
    //   191: aload_2
    //   192: invokeinterface next : ()Ljava/lang/Object;
    //   197: checkcast java/lang/String
    //   200: astore_3
    //   201: aload_1
    //   202: aload_3
    //   203: iconst_0
    //   204: invokevirtual get : (Ljava/lang/Object;I)I
    //   207: ifne -> 182
    //   210: aload_0
    //   211: aload_3
    //   212: invokevirtual unload : (Ljava/lang/String;)V
    //   215: goto -> 182
    //   218: aload_0
    //   219: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   222: invokevirtual clear : ()V
    //   225: aload_0
    //   226: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   229: invokevirtual clear : ()V
    //   232: aload_0
    //   233: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   236: invokevirtual clear : ()V
    //   239: aload_0
    //   240: iconst_0
    //   241: putfield loaded : I
    //   244: aload_0
    //   245: iconst_0
    //   246: putfield toLoad : I
    //   249: aload_0
    //   250: iconst_0
    //   251: putfield peakTasks : I
    //   254: aload_0
    //   255: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   258: invokevirtual clear : ()V
    //   261: aload_0
    //   262: getfield tasks : Ljava/util/Stack;
    //   265: invokevirtual clear : ()V
    //   268: aload_0
    //   269: monitorexit
    //   270: return
    //   271: astore_1
    //   272: aload_0
    //   273: monitorexit
    //   274: goto -> 279
    //   277: aload_1
    //   278: athrow
    //   279: goto -> 277
    // Exception table:
    //   from	to	target	type
    //   2	9	271	finally
    //   9	16	271	finally
    //   19	27	271	finally
    //   27	57	271	finally
    //   57	80	271	finally
    //   83	88	271	finally
    //   88	122	271	finally
    //   130	137	271	finally
    //   137	174	271	finally
    //   177	182	271	finally
    //   182	215	271	finally
    //   218	268	271	finally }
  
  public boolean contains(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield tasks : Ljava/util/Stack;
    //   6: invokevirtual size : ()I
    //   9: ifle -> 41
    //   12: aload_0
    //   13: getfield tasks : Ljava/util/Stack;
    //   16: invokevirtual firstElement : ()Ljava/lang/Object;
    //   19: checkcast com/badlogic/gdx/assets/AssetLoadingTask
    //   22: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   25: getfield fileName : Ljava/lang/String;
    //   28: aload_1
    //   29: invokevirtual equals : (Ljava/lang/Object;)Z
    //   32: istore_2
    //   33: iload_2
    //   34: ifeq -> 41
    //   37: aload_0
    //   38: monitorexit
    //   39: iconst_1
    //   40: ireturn
    //   41: iconst_0
    //   42: istore_3
    //   43: iload_3
    //   44: aload_0
    //   45: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   48: getfield size : I
    //   51: if_icmpge -> 87
    //   54: aload_0
    //   55: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   58: iload_3
    //   59: invokevirtual get : (I)Ljava/lang/Object;
    //   62: checkcast com/badlogic/gdx/assets/AssetDescriptor
    //   65: getfield fileName : Ljava/lang/String;
    //   68: aload_1
    //   69: invokevirtual equals : (Ljava/lang/Object;)Z
    //   72: istore_2
    //   73: iload_2
    //   74: ifeq -> 81
    //   77: aload_0
    //   78: monitorexit
    //   79: iconst_1
    //   80: ireturn
    //   81: iinc #3, 1
    //   84: goto -> 43
    //   87: aload_0
    //   88: aload_1
    //   89: invokevirtual isLoaded : (Ljava/lang/String;)Z
    //   92: istore_2
    //   93: aload_0
    //   94: monitorexit
    //   95: iload_2
    //   96: ireturn
    //   97: astore_1
    //   98: aload_0
    //   99: monitorexit
    //   100: goto -> 105
    //   103: aload_1
    //   104: athrow
    //   105: goto -> 103
    // Exception table:
    //   from	to	target	type
    //   2	33	97	finally
    //   43	73	97	finally
    //   87	93	97	finally }
  
  public boolean contains(String paramString, Class paramClass) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield tasks : Ljava/util/Stack;
    //   6: invokevirtual size : ()I
    //   9: ifle -> 53
    //   12: aload_0
    //   13: getfield tasks : Ljava/util/Stack;
    //   16: invokevirtual firstElement : ()Ljava/lang/Object;
    //   19: checkcast com/badlogic/gdx/assets/AssetLoadingTask
    //   22: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   25: astore_3
    //   26: aload_3
    //   27: getfield type : Ljava/lang/Class;
    //   30: aload_2
    //   31: if_acmpne -> 53
    //   34: aload_3
    //   35: getfield fileName : Ljava/lang/String;
    //   38: aload_1
    //   39: invokevirtual equals : (Ljava/lang/Object;)Z
    //   42: istore #4
    //   44: iload #4
    //   46: ifeq -> 53
    //   49: aload_0
    //   50: monitorexit
    //   51: iconst_1
    //   52: ireturn
    //   53: iconst_0
    //   54: istore #5
    //   56: iload #5
    //   58: aload_0
    //   59: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   62: getfield size : I
    //   65: if_icmpge -> 114
    //   68: aload_0
    //   69: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   72: iload #5
    //   74: invokevirtual get : (I)Ljava/lang/Object;
    //   77: checkcast com/badlogic/gdx/assets/AssetDescriptor
    //   80: astore_3
    //   81: aload_3
    //   82: getfield type : Ljava/lang/Class;
    //   85: aload_2
    //   86: if_acmpne -> 108
    //   89: aload_3
    //   90: getfield fileName : Ljava/lang/String;
    //   93: aload_1
    //   94: invokevirtual equals : (Ljava/lang/Object;)Z
    //   97: istore #4
    //   99: iload #4
    //   101: ifeq -> 108
    //   104: aload_0
    //   105: monitorexit
    //   106: iconst_1
    //   107: ireturn
    //   108: iinc #5, 1
    //   111: goto -> 56
    //   114: aload_0
    //   115: aload_1
    //   116: aload_2
    //   117: invokevirtual isLoaded : (Ljava/lang/String;Ljava/lang/Class;)Z
    //   120: istore #4
    //   122: aload_0
    //   123: monitorexit
    //   124: iload #4
    //   126: ireturn
    //   127: astore_1
    //   128: aload_0
    //   129: monitorexit
    //   130: goto -> 135
    //   133: aload_1
    //   134: athrow
    //   135: goto -> 133
    // Exception table:
    //   from	to	target	type
    //   2	44	127	finally
    //   56	99	127	finally
    //   114	122	127	finally }
  
  public <T> boolean containsAsset(T paramT) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual getClass : ()Ljava/lang/Class;
    //   10: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   13: checkcast com/badlogic/gdx/utils/ObjectMap
    //   16: astore_2
    //   17: aload_2
    //   18: ifnonnull -> 25
    //   21: aload_0
    //   22: monitorexit
    //   23: iconst_0
    //   24: ireturn
    //   25: aload_2
    //   26: invokevirtual keys : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   29: invokevirtual iterator : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   32: astore_3
    //   33: aload_3
    //   34: invokeinterface hasNext : ()Z
    //   39: ifeq -> 88
    //   42: aload_2
    //   43: aload_3
    //   44: invokeinterface next : ()Ljava/lang/Object;
    //   49: checkcast java/lang/String
    //   52: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   55: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   58: ldc java/lang/Object
    //   60: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   63: astore #4
    //   65: aload #4
    //   67: aload_1
    //   68: if_acmpeq -> 84
    //   71: aload_1
    //   72: aload #4
    //   74: invokevirtual equals : (Ljava/lang/Object;)Z
    //   77: istore #5
    //   79: iload #5
    //   81: ifeq -> 33
    //   84: aload_0
    //   85: monitorexit
    //   86: iconst_1
    //   87: ireturn
    //   88: aload_0
    //   89: monitorexit
    //   90: iconst_0
    //   91: ireturn
    //   92: astore_1
    //   93: aload_0
    //   94: monitorexit
    //   95: goto -> 100
    //   98: aload_1
    //   99: athrow
    //   100: goto -> 98
    // Exception table:
    //   from	to	target	type
    //   2	17	92	finally
    //   25	33	92	finally
    //   33	65	92	finally
    //   71	79	92	finally }
  
  public void dispose() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   6: ldc_w 'Disposing.'
    //   9: invokevirtual debug : (Ljava/lang/String;)V
    //   12: aload_0
    //   13: invokevirtual clear : ()V
    //   16: aload_0
    //   17: getfield executor : Lcom/badlogic/gdx/utils/async/AsyncExecutor;
    //   20: invokevirtual dispose : ()V
    //   23: aload_0
    //   24: monitorexit
    //   25: return
    //   26: astore_1
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_1
    //   30: athrow
    // Exception table:
    //   from	to	target	type
    //   2	23	26	finally }
  
  public void finishLoading() {
    this.log.debug("Waiting for loading to complete...");
    while (!update())
      ThreadUtils.yield(); 
    this.log.debug("Loading complete.");
  }
  
  public <T> T finishLoadingAsset(AssetDescriptor paramAssetDescriptor) { return (T)finishLoadingAsset(paramAssetDescriptor.fileName); }
  
  public <T> T finishLoadingAsset(String paramString) { // Byte code:
    //   0: aload_0
    //   1: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   4: astore_2
    //   5: new java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial <init> : ()V
    //   12: astore_3
    //   13: aload_3
    //   14: ldc_w 'Waiting for asset to be loaded: '
    //   17: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   20: pop
    //   21: aload_3
    //   22: aload_1
    //   23: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   26: pop
    //   27: aload_2
    //   28: aload_3
    //   29: invokevirtual toString : ()Ljava/lang/String;
    //   32: invokevirtual debug : (Ljava/lang/String;)V
    //   35: aload_0
    //   36: monitorenter
    //   37: aload_0
    //   38: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   41: aload_1
    //   42: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   45: checkcast java/lang/Class
    //   48: astore_3
    //   49: aload_3
    //   50: ifnull -> 134
    //   53: aload_0
    //   54: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   57: aload_3
    //   58: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   61: checkcast com/badlogic/gdx/utils/ObjectMap
    //   64: astore_2
    //   65: aload_2
    //   66: ifnull -> 134
    //   69: aload_2
    //   70: aload_1
    //   71: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   74: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   77: astore_2
    //   78: aload_2
    //   79: ifnull -> 134
    //   82: aload_2
    //   83: aload_3
    //   84: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   87: astore #4
    //   89: aload #4
    //   91: ifnull -> 134
    //   94: aload_0
    //   95: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   98: astore_3
    //   99: new java/lang/StringBuilder
    //   102: astore_2
    //   103: aload_2
    //   104: invokespecial <init> : ()V
    //   107: aload_2
    //   108: ldc_w 'Asset loaded: '
    //   111: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   114: pop
    //   115: aload_2
    //   116: aload_1
    //   117: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   120: pop
    //   121: aload_3
    //   122: aload_2
    //   123: invokevirtual toString : ()Ljava/lang/String;
    //   126: invokevirtual debug : (Ljava/lang/String;)V
    //   129: aload_0
    //   130: monitorexit
    //   131: aload #4
    //   133: areturn
    //   134: aload_0
    //   135: invokevirtual update : ()Z
    //   138: pop
    //   139: aload_0
    //   140: monitorexit
    //   141: invokestatic yield : ()V
    //   144: goto -> 35
    //   147: astore_1
    //   148: aload_0
    //   149: monitorexit
    //   150: goto -> 155
    //   153: aload_1
    //   154: athrow
    //   155: goto -> 153
    // Exception table:
    //   from	to	target	type
    //   37	49	147	finally
    //   53	65	147	finally
    //   69	78	147	finally
    //   82	89	147	finally
    //   94	131	147	finally
    //   134	141	147	finally
    //   148	150	147	finally }
  
  public <T> T get(AssetDescriptor<T> paramAssetDescriptor) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: getfield fileName : Ljava/lang/String;
    //   7: aload_1
    //   8: getfield type : Ljava/lang/Class;
    //   11: invokevirtual get : (Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    //   14: astore_1
    //   15: aload_0
    //   16: monitorexit
    //   17: aload_1
    //   18: areturn
    //   19: astore_1
    //   20: aload_0
    //   21: monitorexit
    //   22: aload_1
    //   23: athrow
    // Exception table:
    //   from	to	target	type
    //   2	15	19	finally }
  
  public <T> T get(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast java/lang/Class
    //   13: astore_2
    //   14: aload_2
    //   15: ifnull -> 169
    //   18: aload_0
    //   19: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   22: aload_2
    //   23: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   26: checkcast com/badlogic/gdx/utils/ObjectMap
    //   29: astore_3
    //   30: aload_3
    //   31: ifnull -> 133
    //   34: aload_3
    //   35: aload_1
    //   36: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   39: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   42: astore_3
    //   43: aload_3
    //   44: ifnull -> 97
    //   47: aload_3
    //   48: aload_2
    //   49: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   52: astore_2
    //   53: aload_2
    //   54: ifnull -> 61
    //   57: aload_0
    //   58: monitorexit
    //   59: aload_2
    //   60: areturn
    //   61: new com/badlogic/gdx/utils/GdxRuntimeException
    //   64: astore_2
    //   65: new java/lang/StringBuilder
    //   68: astore_3
    //   69: aload_3
    //   70: invokespecial <init> : ()V
    //   73: aload_3
    //   74: ldc_w 'Asset not loaded: '
    //   77: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: pop
    //   81: aload_3
    //   82: aload_1
    //   83: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   86: pop
    //   87: aload_2
    //   88: aload_3
    //   89: invokevirtual toString : ()Ljava/lang/String;
    //   92: invokespecial <init> : (Ljava/lang/String;)V
    //   95: aload_2
    //   96: athrow
    //   97: new com/badlogic/gdx/utils/GdxRuntimeException
    //   100: astore_3
    //   101: new java/lang/StringBuilder
    //   104: astore_2
    //   105: aload_2
    //   106: invokespecial <init> : ()V
    //   109: aload_2
    //   110: ldc_w 'Asset not loaded: '
    //   113: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   116: pop
    //   117: aload_2
    //   118: aload_1
    //   119: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   122: pop
    //   123: aload_3
    //   124: aload_2
    //   125: invokevirtual toString : ()Ljava/lang/String;
    //   128: invokespecial <init> : (Ljava/lang/String;)V
    //   131: aload_3
    //   132: athrow
    //   133: new com/badlogic/gdx/utils/GdxRuntimeException
    //   136: astore_3
    //   137: new java/lang/StringBuilder
    //   140: astore_2
    //   141: aload_2
    //   142: invokespecial <init> : ()V
    //   145: aload_2
    //   146: ldc_w 'Asset not loaded: '
    //   149: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: pop
    //   153: aload_2
    //   154: aload_1
    //   155: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   158: pop
    //   159: aload_3
    //   160: aload_2
    //   161: invokevirtual toString : ()Ljava/lang/String;
    //   164: invokespecial <init> : (Ljava/lang/String;)V
    //   167: aload_3
    //   168: athrow
    //   169: new com/badlogic/gdx/utils/GdxRuntimeException
    //   172: astore_2
    //   173: new java/lang/StringBuilder
    //   176: astore_3
    //   177: aload_3
    //   178: invokespecial <init> : ()V
    //   181: aload_3
    //   182: ldc_w 'Asset not loaded: '
    //   185: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   188: pop
    //   189: aload_3
    //   190: aload_1
    //   191: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: pop
    //   195: aload_2
    //   196: aload_3
    //   197: invokevirtual toString : ()Ljava/lang/String;
    //   200: invokespecial <init> : (Ljava/lang/String;)V
    //   203: aload_2
    //   204: athrow
    //   205: astore_1
    //   206: aload_0
    //   207: monitorexit
    //   208: aload_1
    //   209: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	205	finally
    //   18	30	205	finally
    //   34	43	205	finally
    //   47	53	205	finally
    //   61	97	205	finally
    //   97	133	205	finally
    //   133	169	205	finally
    //   169	205	205	finally }
  
  public <T> T get(String paramString, Class<T> paramClass) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_2
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast com/badlogic/gdx/utils/ObjectMap
    //   13: astore_3
    //   14: aload_3
    //   15: ifnull -> 117
    //   18: aload_3
    //   19: aload_1
    //   20: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   23: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   26: astore_3
    //   27: aload_3
    //   28: ifnull -> 81
    //   31: aload_3
    //   32: aload_2
    //   33: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   36: astore_2
    //   37: aload_2
    //   38: ifnull -> 45
    //   41: aload_0
    //   42: monitorexit
    //   43: aload_2
    //   44: areturn
    //   45: new com/badlogic/gdx/utils/GdxRuntimeException
    //   48: astore_2
    //   49: new java/lang/StringBuilder
    //   52: astore_3
    //   53: aload_3
    //   54: invokespecial <init> : ()V
    //   57: aload_3
    //   58: ldc_w 'Asset not loaded: '
    //   61: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   64: pop
    //   65: aload_3
    //   66: aload_1
    //   67: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   70: pop
    //   71: aload_2
    //   72: aload_3
    //   73: invokevirtual toString : ()Ljava/lang/String;
    //   76: invokespecial <init> : (Ljava/lang/String;)V
    //   79: aload_2
    //   80: athrow
    //   81: new com/badlogic/gdx/utils/GdxRuntimeException
    //   84: astore_3
    //   85: new java/lang/StringBuilder
    //   88: astore_2
    //   89: aload_2
    //   90: invokespecial <init> : ()V
    //   93: aload_2
    //   94: ldc_w 'Asset not loaded: '
    //   97: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: pop
    //   101: aload_2
    //   102: aload_1
    //   103: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: pop
    //   107: aload_3
    //   108: aload_2
    //   109: invokevirtual toString : ()Ljava/lang/String;
    //   112: invokespecial <init> : (Ljava/lang/String;)V
    //   115: aload_3
    //   116: athrow
    //   117: new com/badlogic/gdx/utils/GdxRuntimeException
    //   120: astore_2
    //   121: new java/lang/StringBuilder
    //   124: astore_3
    //   125: aload_3
    //   126: invokespecial <init> : ()V
    //   129: aload_3
    //   130: ldc_w 'Asset not loaded: '
    //   133: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   136: pop
    //   137: aload_3
    //   138: aload_1
    //   139: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: pop
    //   143: aload_2
    //   144: aload_3
    //   145: invokevirtual toString : ()Ljava/lang/String;
    //   148: invokespecial <init> : (Ljava/lang/String;)V
    //   151: aload_2
    //   152: athrow
    //   153: astore_1
    //   154: aload_0
    //   155: monitorexit
    //   156: aload_1
    //   157: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	153	finally
    //   18	27	153	finally
    //   31	37	153	finally
    //   45	81	153	finally
    //   81	117	153	finally
    //   117	153	153	finally }
  
  public <T> Array<T> getAll(Class<T> paramClass, Array<T> paramArray) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast com/badlogic/gdx/utils/ObjectMap
    //   13: astore_3
    //   14: aload_3
    //   15: ifnull -> 61
    //   18: aload_3
    //   19: invokevirtual entries : ()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    //   22: invokevirtual iterator : ()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    //   25: astore_3
    //   26: aload_3
    //   27: invokeinterface hasNext : ()Z
    //   32: ifeq -> 61
    //   35: aload_2
    //   36: aload_3
    //   37: invokeinterface next : ()Ljava/lang/Object;
    //   42: checkcast com/badlogic/gdx/utils/ObjectMap$Entry
    //   45: getfield value : Ljava/lang/Object;
    //   48: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   51: aload_1
    //   52: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   55: invokevirtual add : (Ljava/lang/Object;)V
    //   58: goto -> 26
    //   61: aload_0
    //   62: monitorexit
    //   63: aload_2
    //   64: areturn
    //   65: astore_1
    //   66: aload_0
    //   67: monitorexit
    //   68: goto -> 73
    //   71: aload_1
    //   72: athrow
    //   73: goto -> 71
    // Exception table:
    //   from	to	target	type
    //   2	14	65	finally
    //   18	26	65	finally
    //   26	58	65	finally }
  
  public <T> String getAssetFileName(T paramT) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: invokevirtual keys : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   9: invokevirtual iterator : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   12: astore_2
    //   13: aload_2
    //   14: invokeinterface hasNext : ()Z
    //   19: ifeq -> 115
    //   22: aload_2
    //   23: invokeinterface next : ()Ljava/lang/Object;
    //   28: checkcast java/lang/Class
    //   31: astore_3
    //   32: aload_0
    //   33: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   36: aload_3
    //   37: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   40: checkcast com/badlogic/gdx/utils/ObjectMap
    //   43: astore_3
    //   44: aload_3
    //   45: invokevirtual keys : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   48: invokevirtual iterator : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   51: astore #4
    //   53: aload #4
    //   55: invokeinterface hasNext : ()Z
    //   60: ifeq -> 13
    //   63: aload #4
    //   65: invokeinterface next : ()Ljava/lang/Object;
    //   70: checkcast java/lang/String
    //   73: astore #5
    //   75: aload_3
    //   76: aload #5
    //   78: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   81: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   84: ldc java/lang/Object
    //   86: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   89: astore #6
    //   91: aload #6
    //   93: aload_1
    //   94: if_acmpeq -> 110
    //   97: aload_1
    //   98: aload #6
    //   100: invokevirtual equals : (Ljava/lang/Object;)Z
    //   103: istore #7
    //   105: iload #7
    //   107: ifeq -> 53
    //   110: aload_0
    //   111: monitorexit
    //   112: aload #5
    //   114: areturn
    //   115: aload_0
    //   116: monitorexit
    //   117: aconst_null
    //   118: areturn
    //   119: astore_1
    //   120: aload_0
    //   121: monitorexit
    //   122: goto -> 127
    //   125: aload_1
    //   126: athrow
    //   127: goto -> 125
    // Exception table:
    //   from	to	target	type
    //   2	13	119	finally
    //   13	53	119	finally
    //   53	91	119	finally
    //   97	105	119	finally }
  
  public Array<String> getAssetNames() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: invokevirtual keys : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   9: invokevirtual toArray : ()Lcom/badlogic/gdx/utils/Array;
    //   12: astore_1
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_1
    //   16: areturn
    //   17: astore_1
    //   18: aload_0
    //   19: monitorexit
    //   20: aload_1
    //   21: athrow
    // Exception table:
    //   from	to	target	type
    //   2	13	17	finally }
  
  public Class getAssetType(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast java/lang/Class
    //   13: astore_1
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_1
    //   17: areturn
    //   18: astore_1
    //   19: aload_0
    //   20: monitorexit
    //   21: aload_1
    //   22: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	18	finally }
  
  public Array<String> getDependencies(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast com/badlogic/gdx/utils/Array
    //   13: astore_1
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_1
    //   17: areturn
    //   18: astore_1
    //   19: aload_0
    //   20: monitorexit
    //   21: aload_1
    //   22: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	18	finally }
  
  public String getDiagnostics() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new java/lang/StringBuilder
    //   5: astore_1
    //   6: aload_1
    //   7: sipush #256
    //   10: invokespecial <init> : (I)V
    //   13: aload_0
    //   14: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   17: invokevirtual keys : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   20: invokevirtual iterator : ()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    //   23: astore_2
    //   24: aload_2
    //   25: invokeinterface hasNext : ()Z
    //   30: ifeq -> 211
    //   33: aload_2
    //   34: invokeinterface next : ()Ljava/lang/Object;
    //   39: checkcast java/lang/String
    //   42: astore_3
    //   43: aload_1
    //   44: invokevirtual length : ()I
    //   47: ifle -> 58
    //   50: aload_1
    //   51: ldc_w '\\n'
    //   54: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: pop
    //   58: aload_1
    //   59: aload_3
    //   60: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: pop
    //   64: aload_1
    //   65: ldc_w ', '
    //   68: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: pop
    //   72: aload_0
    //   73: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   76: aload_3
    //   77: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   80: checkcast java/lang/Class
    //   83: astore #4
    //   85: aload_0
    //   86: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   89: aload #4
    //   91: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   94: checkcast com/badlogic/gdx/utils/ObjectMap
    //   97: aload_3
    //   98: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   101: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   104: astore #5
    //   106: aload_0
    //   107: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   110: aload_3
    //   111: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   114: checkcast com/badlogic/gdx/utils/Array
    //   117: astore_3
    //   118: aload_1
    //   119: aload #4
    //   121: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   124: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: pop
    //   128: aload_1
    //   129: ldc_w ', refs: '
    //   132: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: pop
    //   136: aload_1
    //   137: aload #5
    //   139: invokevirtual getRefCount : ()I
    //   142: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   145: pop
    //   146: aload_3
    //   147: ifnull -> 24
    //   150: aload_1
    //   151: ldc_w ', deps: ['
    //   154: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   157: pop
    //   158: aload_3
    //   159: invokevirtual iterator : ()Ljava/util/Iterator;
    //   162: astore #5
    //   164: aload #5
    //   166: invokeinterface hasNext : ()Z
    //   171: ifeq -> 200
    //   174: aload_1
    //   175: aload #5
    //   177: invokeinterface next : ()Ljava/lang/Object;
    //   182: checkcast java/lang/String
    //   185: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   188: pop
    //   189: aload_1
    //   190: ldc_w ','
    //   193: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: pop
    //   197: goto -> 164
    //   200: aload_1
    //   201: ldc_w ']'
    //   204: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: pop
    //   208: goto -> 24
    //   211: aload_1
    //   212: invokevirtual toString : ()Ljava/lang/String;
    //   215: astore_2
    //   216: aload_0
    //   217: monitorexit
    //   218: aload_2
    //   219: areturn
    //   220: astore_2
    //   221: aload_0
    //   222: monitorexit
    //   223: goto -> 228
    //   226: aload_2
    //   227: athrow
    //   228: goto -> 226
    // Exception table:
    //   from	to	target	type
    //   2	24	220	finally
    //   24	58	220	finally
    //   58	146	220	finally
    //   150	164	220	finally
    //   164	197	220	finally
    //   200	208	220	finally
    //   211	216	220	finally }
  
  public FileHandleResolver getFileHandleResolver() { return this.resolver; }
  
  public int getLoadedAssets() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: getfield size : I
    //   9: istore_1
    //   10: aload_0
    //   11: monitorexit
    //   12: iload_1
    //   13: ireturn
    //   14: astore_2
    //   15: aload_0
    //   16: monitorexit
    //   17: aload_2
    //   18: athrow
    // Exception table:
    //   from	to	target	type
    //   2	10	14	finally }
  
  public <T> AssetLoader getLoader(Class<T> paramClass) { return getLoader(paramClass, null); }
  
  public <T> AssetLoader getLoader(Class<T> paramClass, String paramString) {
    ObjectMap objectMap = (ObjectMap)this.loaders.get(paramClass);
    ObjectMap.Entries entries = null;
    paramClass = null;
    ObjectMap.Entry entry = entries;
    if (objectMap != null)
      if (objectMap.size < 1) {
        entry = entries;
      } else {
        if (paramString == null)
          return (AssetLoader)objectMap.get(""); 
        int i = -1;
        entries = objectMap.entries().iterator();
        while (true) {
          entry = paramClass;
          if (entries.hasNext()) {
            entry = (ObjectMap.Entry)entries.next();
            if (((String)entry.key).length() > i && paramString.endsWith((String)entry.key)) {
              AssetLoader assetLoader = (AssetLoader)entry.value;
              i = ((String)entry.key).length();
            } 
            continue;
          } 
          break;
        } 
      }  
    return entry;
  }
  
  public Logger getLogger() { return this.log; }
  
  public float getProgress() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield toLoad : I
    //   6: istore_1
    //   7: iload_1
    //   8: ifne -> 15
    //   11: aload_0
    //   12: monitorexit
    //   13: fconst_1
    //   14: freturn
    //   15: aload_0
    //   16: getfield loaded : I
    //   19: i2f
    //   20: fstore_2
    //   21: fload_2
    //   22: fstore_3
    //   23: aload_0
    //   24: getfield peakTasks : I
    //   27: ifle -> 52
    //   30: fload_2
    //   31: aload_0
    //   32: getfield peakTasks : I
    //   35: aload_0
    //   36: getfield tasks : Ljava/util/Stack;
    //   39: invokevirtual size : ()I
    //   42: isub
    //   43: i2f
    //   44: aload_0
    //   45: getfield peakTasks : I
    //   48: i2f
    //   49: fdiv
    //   50: fadd
    //   51: fstore_3
    //   52: fconst_1
    //   53: fload_3
    //   54: aload_0
    //   55: getfield toLoad : I
    //   58: i2f
    //   59: fdiv
    //   60: invokestatic min : (FF)F
    //   63: fstore_3
    //   64: aload_0
    //   65: monitorexit
    //   66: fload_3
    //   67: freturn
    //   68: astore #4
    //   70: aload_0
    //   71: monitorexit
    //   72: aload #4
    //   74: athrow
    // Exception table:
    //   from	to	target	type
    //   2	7	68	finally
    //   15	21	68	finally
    //   23	52	68	finally
    //   52	64	68	finally }
  
  public int getQueuedAssets() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   6: getfield size : I
    //   9: istore_1
    //   10: aload_0
    //   11: getfield tasks : Ljava/util/Stack;
    //   14: invokevirtual size : ()I
    //   17: istore_2
    //   18: aload_0
    //   19: monitorexit
    //   20: iload_1
    //   21: iload_2
    //   22: iadd
    //   23: ireturn
    //   24: astore_3
    //   25: aload_0
    //   26: monitorexit
    //   27: aload_3
    //   28: athrow
    // Exception table:
    //   from	to	target	type
    //   2	18	24	finally }
  
  public int getReferenceCount(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast java/lang/Class
    //   13: astore_2
    //   14: aload_2
    //   15: ifnull -> 44
    //   18: aload_0
    //   19: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   22: aload_2
    //   23: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   26: checkcast com/badlogic/gdx/utils/ObjectMap
    //   29: aload_1
    //   30: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   33: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   36: invokevirtual getRefCount : ()I
    //   39: istore_3
    //   40: aload_0
    //   41: monitorexit
    //   42: iload_3
    //   43: ireturn
    //   44: new com/badlogic/gdx/utils/GdxRuntimeException
    //   47: astore_2
    //   48: new java/lang/StringBuilder
    //   51: astore #4
    //   53: aload #4
    //   55: invokespecial <init> : ()V
    //   58: aload #4
    //   60: ldc_w 'Asset not loaded: '
    //   63: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   66: pop
    //   67: aload #4
    //   69: aload_1
    //   70: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   73: pop
    //   74: aload_2
    //   75: aload #4
    //   77: invokevirtual toString : ()Ljava/lang/String;
    //   80: invokespecial <init> : (Ljava/lang/String;)V
    //   83: aload_2
    //   84: athrow
    //   85: astore_1
    //   86: aload_0
    //   87: monitorexit
    //   88: aload_1
    //   89: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	85	finally
    //   18	40	85	finally
    //   44	85	85	finally }
  
  void injectDependencies(String paramString, Array<AssetDescriptor> paramArray) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield injected : Lcom/badlogic/gdx/utils/ObjectSet;
    //   6: astore_3
    //   7: aload_2
    //   8: invokevirtual iterator : ()Ljava/util/Iterator;
    //   11: astore #4
    //   13: aload #4
    //   15: invokeinterface hasNext : ()Z
    //   20: ifeq -> 66
    //   23: aload #4
    //   25: invokeinterface next : ()Ljava/lang/Object;
    //   30: checkcast com/badlogic/gdx/assets/AssetDescriptor
    //   33: astore_2
    //   34: aload_3
    //   35: aload_2
    //   36: getfield fileName : Ljava/lang/String;
    //   39: invokevirtual contains : (Ljava/lang/Object;)Z
    //   42: ifeq -> 48
    //   45: goto -> 13
    //   48: aload_3
    //   49: aload_2
    //   50: getfield fileName : Ljava/lang/String;
    //   53: invokevirtual add : (Ljava/lang/Object;)Z
    //   56: pop
    //   57: aload_0
    //   58: aload_1
    //   59: aload_2
    //   60: invokespecial injectDependency : (Ljava/lang/String;Lcom/badlogic/gdx/assets/AssetDescriptor;)V
    //   63: goto -> 13
    //   66: aload_3
    //   67: bipush #32
    //   69: invokevirtual clear : (I)V
    //   72: aload_0
    //   73: monitorexit
    //   74: return
    //   75: astore_1
    //   76: aload_0
    //   77: monitorexit
    //   78: goto -> 83
    //   81: aload_1
    //   82: athrow
    //   83: goto -> 81
    // Exception table:
    //   from	to	target	type
    //   2	13	75	finally
    //   13	45	75	finally
    //   48	63	75	finally
    //   66	72	75	finally }
  
  public boolean isFinished() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   6: getfield size : I
    //   9: ifne -> 29
    //   12: aload_0
    //   13: getfield tasks : Ljava/util/Stack;
    //   16: invokevirtual size : ()I
    //   19: istore_1
    //   20: iload_1
    //   21: ifne -> 29
    //   24: iconst_1
    //   25: istore_2
    //   26: goto -> 31
    //   29: iconst_0
    //   30: istore_2
    //   31: aload_0
    //   32: monitorexit
    //   33: iload_2
    //   34: ireturn
    //   35: astore_3
    //   36: aload_0
    //   37: monitorexit
    //   38: aload_3
    //   39: athrow
    // Exception table:
    //   from	to	target	type
    //   2	20	35	finally }
  
  public boolean isLoaded(AssetDescriptor paramAssetDescriptor) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: getfield fileName : Ljava/lang/String;
    //   7: invokevirtual isLoaded : (Ljava/lang/String;)Z
    //   10: istore_2
    //   11: aload_0
    //   12: monitorexit
    //   13: iload_2
    //   14: ireturn
    //   15: astore_1
    //   16: aload_0
    //   17: monitorexit
    //   18: aload_1
    //   19: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	15	finally }
  
  public boolean isLoaded(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: ifnonnull -> 10
    //   6: aload_0
    //   7: monitorexit
    //   8: iconst_0
    //   9: ireturn
    //   10: aload_0
    //   11: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   14: aload_1
    //   15: invokevirtual containsKey : (Ljava/lang/Object;)Z
    //   18: istore_2
    //   19: aload_0
    //   20: monitorexit
    //   21: iload_2
    //   22: ireturn
    //   23: astore_1
    //   24: aload_0
    //   25: monitorexit
    //   26: aload_1
    //   27: athrow
    // Exception table:
    //   from	to	target	type
    //   10	19	23	finally }
  
  public boolean isLoaded(String paramString, Class paramClass) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_2
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast com/badlogic/gdx/utils/ObjectMap
    //   13: astore_3
    //   14: iconst_0
    //   15: istore #4
    //   17: aload_3
    //   18: ifnonnull -> 25
    //   21: aload_0
    //   22: monitorexit
    //   23: iconst_0
    //   24: ireturn
    //   25: aload_3
    //   26: aload_1
    //   27: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   30: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   33: astore_1
    //   34: aload_1
    //   35: ifnonnull -> 42
    //   38: aload_0
    //   39: monitorexit
    //   40: iconst_0
    //   41: ireturn
    //   42: aload_1
    //   43: aload_2
    //   44: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   47: astore_1
    //   48: aload_1
    //   49: ifnull -> 55
    //   52: iconst_1
    //   53: istore #4
    //   55: aload_0
    //   56: monitorexit
    //   57: iload #4
    //   59: ireturn
    //   60: astore_1
    //   61: aload_0
    //   62: monitorexit
    //   63: aload_1
    //   64: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	60	finally
    //   25	34	60	finally
    //   42	48	60	finally }
  
  public void load(AssetDescriptor paramAssetDescriptor) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: getfield fileName : Ljava/lang/String;
    //   7: aload_1
    //   8: getfield type : Ljava/lang/Class;
    //   11: aload_1
    //   12: getfield params : Lcom/badlogic/gdx/assets/AssetLoaderParameters;
    //   15: invokevirtual load : (Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    //   18: aload_0
    //   19: monitorexit
    //   20: return
    //   21: astore_1
    //   22: aload_0
    //   23: monitorexit
    //   24: aload_1
    //   25: athrow
    // Exception table:
    //   from	to	target	type
    //   2	18	21	finally }
  
  public <T> void load(String paramString, Class<T> paramClass) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: aload_2
    //   5: aconst_null
    //   6: invokevirtual load : (Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: astore_1
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_1
    //   16: athrow
    // Exception table:
    //   from	to	target	type
    //   2	9	12	finally }
  
  public <T> void load(String paramString, Class<T> paramClass, AssetLoaderParameters<T> paramAssetLoaderParameters) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_2
    //   4: aload_1
    //   5: invokevirtual getLoader : (Ljava/lang/Class;Ljava/lang/String;)Lcom/badlogic/gdx/assets/loaders/AssetLoader;
    //   8: ifnull -> 545
    //   11: aload_0
    //   12: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   15: getfield size : I
    //   18: istore #4
    //   20: iconst_0
    //   21: istore #5
    //   23: iload #4
    //   25: ifne -> 43
    //   28: aload_0
    //   29: iconst_0
    //   30: putfield loaded : I
    //   33: aload_0
    //   34: iconst_0
    //   35: putfield toLoad : I
    //   38: aload_0
    //   39: iconst_0
    //   40: putfield peakTasks : I
    //   43: iconst_0
    //   44: istore #4
    //   46: iload #5
    //   48: istore #6
    //   50: iload #4
    //   52: aload_0
    //   53: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   56: getfield size : I
    //   59: if_icmpge -> 201
    //   62: aload_0
    //   63: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   66: iload #4
    //   68: invokevirtual get : (I)Ljava/lang/Object;
    //   71: checkcast com/badlogic/gdx/assets/AssetDescriptor
    //   74: astore #7
    //   76: aload #7
    //   78: getfield fileName : Ljava/lang/String;
    //   81: aload_1
    //   82: invokevirtual equals : (Ljava/lang/Object;)Z
    //   85: ifeq -> 195
    //   88: aload #7
    //   90: getfield type : Ljava/lang/Class;
    //   93: aload_2
    //   94: invokevirtual equals : (Ljava/lang/Object;)Z
    //   97: ifeq -> 103
    //   100: goto -> 195
    //   103: new com/badlogic/gdx/utils/GdxRuntimeException
    //   106: astore_3
    //   107: new java/lang/StringBuilder
    //   110: astore #8
    //   112: aload #8
    //   114: invokespecial <init> : ()V
    //   117: aload #8
    //   119: ldc_w 'Asset with name ''
    //   122: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: pop
    //   126: aload #8
    //   128: aload_1
    //   129: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   132: pop
    //   133: aload #8
    //   135: ldc_w '' already in preload queue, but has different type (expected: '
    //   138: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   141: pop
    //   142: aload #8
    //   144: aload_2
    //   145: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   148: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   151: pop
    //   152: aload #8
    //   154: ldc_w ', found: '
    //   157: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: pop
    //   161: aload #8
    //   163: aload #7
    //   165: getfield type : Ljava/lang/Class;
    //   168: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   171: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   174: pop
    //   175: aload #8
    //   177: ldc_w ')'
    //   180: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: pop
    //   184: aload_3
    //   185: aload #8
    //   187: invokevirtual toString : ()Ljava/lang/String;
    //   190: invokespecial <init> : (Ljava/lang/String;)V
    //   193: aload_3
    //   194: athrow
    //   195: iinc #4, 1
    //   198: goto -> 46
    //   201: iload #6
    //   203: aload_0
    //   204: getfield tasks : Ljava/util/Stack;
    //   207: invokevirtual size : ()I
    //   210: if_icmpge -> 355
    //   213: aload_0
    //   214: getfield tasks : Ljava/util/Stack;
    //   217: iload #6
    //   219: invokevirtual get : (I)Ljava/lang/Object;
    //   222: checkcast com/badlogic/gdx/assets/AssetLoadingTask
    //   225: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   228: astore #7
    //   230: aload #7
    //   232: getfield fileName : Ljava/lang/String;
    //   235: aload_1
    //   236: invokevirtual equals : (Ljava/lang/Object;)Z
    //   239: ifeq -> 349
    //   242: aload #7
    //   244: getfield type : Ljava/lang/Class;
    //   247: aload_2
    //   248: invokevirtual equals : (Ljava/lang/Object;)Z
    //   251: ifeq -> 257
    //   254: goto -> 349
    //   257: new com/badlogic/gdx/utils/GdxRuntimeException
    //   260: astore_3
    //   261: new java/lang/StringBuilder
    //   264: astore #8
    //   266: aload #8
    //   268: invokespecial <init> : ()V
    //   271: aload #8
    //   273: ldc_w 'Asset with name ''
    //   276: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   279: pop
    //   280: aload #8
    //   282: aload_1
    //   283: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   286: pop
    //   287: aload #8
    //   289: ldc_w '' already in task list, but has different type (expected: '
    //   292: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   295: pop
    //   296: aload #8
    //   298: aload_2
    //   299: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   302: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   305: pop
    //   306: aload #8
    //   308: ldc_w ', found: '
    //   311: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   314: pop
    //   315: aload #8
    //   317: aload #7
    //   319: getfield type : Ljava/lang/Class;
    //   322: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   325: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   328: pop
    //   329: aload #8
    //   331: ldc_w ')'
    //   334: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   337: pop
    //   338: aload_3
    //   339: aload #8
    //   341: invokevirtual toString : ()Ljava/lang/String;
    //   344: invokespecial <init> : (Ljava/lang/String;)V
    //   347: aload_3
    //   348: athrow
    //   349: iinc #6, 1
    //   352: goto -> 201
    //   355: aload_0
    //   356: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   359: aload_1
    //   360: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   363: checkcast java/lang/Class
    //   366: astore #7
    //   368: aload #7
    //   370: ifnull -> 474
    //   373: aload #7
    //   375: aload_2
    //   376: invokevirtual equals : (Ljava/lang/Object;)Z
    //   379: ifeq -> 385
    //   382: goto -> 474
    //   385: new com/badlogic/gdx/utils/GdxRuntimeException
    //   388: astore_3
    //   389: new java/lang/StringBuilder
    //   392: astore #8
    //   394: aload #8
    //   396: invokespecial <init> : ()V
    //   399: aload #8
    //   401: ldc_w 'Asset with name ''
    //   404: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   407: pop
    //   408: aload #8
    //   410: aload_1
    //   411: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   414: pop
    //   415: aload #8
    //   417: ldc_w '' already loaded, but has different type (expected: '
    //   420: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   423: pop
    //   424: aload #8
    //   426: aload_2
    //   427: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   430: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   433: pop
    //   434: aload #8
    //   436: ldc_w ', found: '
    //   439: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   442: pop
    //   443: aload #8
    //   445: aload #7
    //   447: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   450: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   453: pop
    //   454: aload #8
    //   456: ldc_w ')'
    //   459: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   462: pop
    //   463: aload_3
    //   464: aload #8
    //   466: invokevirtual toString : ()Ljava/lang/String;
    //   469: invokespecial <init> : (Ljava/lang/String;)V
    //   472: aload_3
    //   473: athrow
    //   474: aload_0
    //   475: aload_0
    //   476: getfield toLoad : I
    //   479: iconst_1
    //   480: iadd
    //   481: putfield toLoad : I
    //   484: new com/badlogic/gdx/assets/AssetDescriptor
    //   487: astore #7
    //   489: aload #7
    //   491: aload_1
    //   492: aload_2
    //   493: aload_3
    //   494: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    //   497: aload_0
    //   498: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   501: aload #7
    //   503: invokevirtual add : (Ljava/lang/Object;)V
    //   506: aload_0
    //   507: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   510: astore_2
    //   511: new java/lang/StringBuilder
    //   514: astore_1
    //   515: aload_1
    //   516: invokespecial <init> : ()V
    //   519: aload_1
    //   520: ldc_w 'Queued: '
    //   523: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   526: pop
    //   527: aload_1
    //   528: aload #7
    //   530: invokevirtual append : (Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   533: pop
    //   534: aload_2
    //   535: aload_1
    //   536: invokevirtual toString : ()Ljava/lang/String;
    //   539: invokevirtual debug : (Ljava/lang/String;)V
    //   542: aload_0
    //   543: monitorexit
    //   544: return
    //   545: new com/badlogic/gdx/utils/GdxRuntimeException
    //   548: astore_3
    //   549: new java/lang/StringBuilder
    //   552: astore_1
    //   553: aload_1
    //   554: invokespecial <init> : ()V
    //   557: aload_1
    //   558: ldc 'No loader for type: '
    //   560: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   563: pop
    //   564: aload_1
    //   565: aload_2
    //   566: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   569: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   572: pop
    //   573: aload_3
    //   574: aload_1
    //   575: invokevirtual toString : ()Ljava/lang/String;
    //   578: invokespecial <init> : (Ljava/lang/String;)V
    //   581: aload_3
    //   582: athrow
    //   583: astore_1
    //   584: aload_0
    //   585: monitorexit
    //   586: goto -> 591
    //   589: aload_1
    //   590: athrow
    //   591: goto -> 589
    // Exception table:
    //   from	to	target	type
    //   2	20	583	finally
    //   28	43	583	finally
    //   50	100	583	finally
    //   103	195	583	finally
    //   201	254	583	finally
    //   257	349	583	finally
    //   355	368	583	finally
    //   373	382	583	finally
    //   385	474	583	finally
    //   474	542	583	finally
    //   545	583	583	finally }
  
  public void setErrorListener(AssetErrorListener paramAssetErrorListener) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: putfield listener : Lcom/badlogic/gdx/assets/AssetErrorListener;
    //   7: aload_0
    //   8: monitorexit
    //   9: return
    //   10: astore_1
    //   11: aload_0
    //   12: monitorexit
    //   13: aload_1
    //   14: athrow
    // Exception table:
    //   from	to	target	type
    //   2	7	10	finally }
  
  public <T, P extends AssetLoaderParameters<T>> void setLoader(Class<T> paramClass, AssetLoader<T, P> paramAssetLoader) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: aconst_null
    //   5: aload_2
    //   6: invokevirtual setLoader : (Ljava/lang/Class;Ljava/lang/String;Lcom/badlogic/gdx/assets/loaders/AssetLoader;)V
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: astore_1
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_1
    //   16: athrow
    // Exception table:
    //   from	to	target	type
    //   2	9	12	finally }
  
  public <T, P extends AssetLoaderParameters<T>> void setLoader(Class<T> paramClass, String paramString, AssetLoader<T, P> paramAssetLoader) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: ifnull -> 158
    //   6: aload_3
    //   7: ifnull -> 145
    //   10: aload_0
    //   11: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   14: astore #4
    //   16: new java/lang/StringBuilder
    //   19: astore #5
    //   21: aload #5
    //   23: invokespecial <init> : ()V
    //   26: aload #5
    //   28: ldc_w 'Loader set: '
    //   31: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   34: pop
    //   35: aload #5
    //   37: aload_1
    //   38: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   41: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: pop
    //   45: aload #5
    //   47: ldc_w ' -> '
    //   50: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: pop
    //   54: aload #5
    //   56: aload_3
    //   57: invokevirtual getClass : ()Ljava/lang/Class;
    //   60: invokestatic getSimpleName : (Ljava/lang/Class;)Ljava/lang/String;
    //   63: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   66: pop
    //   67: aload #4
    //   69: aload #5
    //   71: invokevirtual toString : ()Ljava/lang/String;
    //   74: invokevirtual debug : (Ljava/lang/String;)V
    //   77: aload_0
    //   78: getfield loaders : Lcom/badlogic/gdx/utils/ObjectMap;
    //   81: aload_1
    //   82: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   85: checkcast com/badlogic/gdx/utils/ObjectMap
    //   88: astore #5
    //   90: aload #5
    //   92: astore #4
    //   94: aload #5
    //   96: ifnonnull -> 124
    //   99: aload_0
    //   100: getfield loaders : Lcom/badlogic/gdx/utils/ObjectMap;
    //   103: astore #5
    //   105: new com/badlogic/gdx/utils/ObjectMap
    //   108: astore #4
    //   110: aload #4
    //   112: invokespecial <init> : ()V
    //   115: aload #5
    //   117: aload_1
    //   118: aload #4
    //   120: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   123: pop
    //   124: aload_2
    //   125: astore_1
    //   126: aload_2
    //   127: ifnonnull -> 134
    //   130: ldc_w ''
    //   133: astore_1
    //   134: aload #4
    //   136: aload_1
    //   137: aload_3
    //   138: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   141: pop
    //   142: aload_0
    //   143: monitorexit
    //   144: return
    //   145: new java/lang/IllegalArgumentException
    //   148: astore_1
    //   149: aload_1
    //   150: ldc_w 'loader cannot be null.'
    //   153: invokespecial <init> : (Ljava/lang/String;)V
    //   156: aload_1
    //   157: athrow
    //   158: new java/lang/IllegalArgumentException
    //   161: astore_1
    //   162: aload_1
    //   163: ldc_w 'type cannot be null.'
    //   166: invokespecial <init> : (Ljava/lang/String;)V
    //   169: aload_1
    //   170: athrow
    //   171: astore_1
    //   172: aload_0
    //   173: monitorexit
    //   174: aload_1
    //   175: athrow
    // Exception table:
    //   from	to	target	type
    //   10	90	171	finally
    //   99	124	171	finally
    //   134	142	171	finally
    //   145	158	171	finally
    //   158	171	171	finally }
  
  public void setLogger(Logger paramLogger) { this.log = paramLogger; }
  
  public void setReferenceCount(String paramString, int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast java/lang/Class
    //   13: astore_3
    //   14: aload_3
    //   15: ifnull -> 43
    //   18: aload_0
    //   19: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   22: aload_3
    //   23: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   26: checkcast com/badlogic/gdx/utils/ObjectMap
    //   29: aload_1
    //   30: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   33: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   36: iload_2
    //   37: invokevirtual setRefCount : (I)V
    //   40: aload_0
    //   41: monitorexit
    //   42: return
    //   43: new com/badlogic/gdx/utils/GdxRuntimeException
    //   46: astore #4
    //   48: new java/lang/StringBuilder
    //   51: astore_3
    //   52: aload_3
    //   53: invokespecial <init> : ()V
    //   56: aload_3
    //   57: ldc_w 'Asset not loaded: '
    //   60: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: pop
    //   64: aload_3
    //   65: aload_1
    //   66: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   69: pop
    //   70: aload #4
    //   72: aload_3
    //   73: invokevirtual toString : ()Ljava/lang/String;
    //   76: invokespecial <init> : (Ljava/lang/String;)V
    //   79: aload #4
    //   81: athrow
    //   82: astore_1
    //   83: aload_0
    //   84: monitorexit
    //   85: aload_1
    //   86: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	82	finally
    //   18	40	82	finally
    //   43	82	82	finally }
  
  protected void taskFailed(AssetDescriptor paramAssetDescriptor, RuntimeException paramRuntimeException) { throw paramRuntimeException; }
  
  public void unload(String paramString) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield tasks : Ljava/util/Stack;
    //   6: invokevirtual size : ()I
    //   9: ifle -> 80
    //   12: aload_0
    //   13: getfield tasks : Ljava/util/Stack;
    //   16: invokevirtual firstElement : ()Ljava/lang/Object;
    //   19: checkcast com/badlogic/gdx/assets/AssetLoadingTask
    //   22: astore_2
    //   23: aload_2
    //   24: getfield assetDesc : Lcom/badlogic/gdx/assets/AssetDescriptor;
    //   27: getfield fileName : Ljava/lang/String;
    //   30: aload_1
    //   31: invokevirtual equals : (Ljava/lang/Object;)Z
    //   34: ifeq -> 80
    //   37: aload_2
    //   38: iconst_1
    //   39: putfield cancel : Z
    //   42: aload_0
    //   43: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   46: astore_2
    //   47: new java/lang/StringBuilder
    //   50: astore_3
    //   51: aload_3
    //   52: invokespecial <init> : ()V
    //   55: aload_3
    //   56: ldc_w 'Unload (from tasks): '
    //   59: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   62: pop
    //   63: aload_3
    //   64: aload_1
    //   65: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   68: pop
    //   69: aload_2
    //   70: aload_3
    //   71: invokevirtual toString : ()Ljava/lang/String;
    //   74: invokevirtual info : (Ljava/lang/String;)V
    //   77: aload_0
    //   78: monitorexit
    //   79: return
    //   80: iconst_0
    //   81: istore #4
    //   83: iload #4
    //   85: aload_0
    //   86: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   89: getfield size : I
    //   92: if_icmpge -> 126
    //   95: aload_0
    //   96: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   99: iload #4
    //   101: invokevirtual get : (I)Ljava/lang/Object;
    //   104: checkcast com/badlogic/gdx/assets/AssetDescriptor
    //   107: getfield fileName : Ljava/lang/String;
    //   110: aload_1
    //   111: invokevirtual equals : (Ljava/lang/Object;)Z
    //   114: ifeq -> 120
    //   117: goto -> 129
    //   120: iinc #4, 1
    //   123: goto -> 83
    //   126: iconst_m1
    //   127: istore #4
    //   129: iload #4
    //   131: iconst_m1
    //   132: if_icmpeq -> 193
    //   135: aload_0
    //   136: aload_0
    //   137: getfield toLoad : I
    //   140: iconst_1
    //   141: isub
    //   142: putfield toLoad : I
    //   145: aload_0
    //   146: getfield loadQueue : Lcom/badlogic/gdx/utils/Array;
    //   149: iload #4
    //   151: invokevirtual removeIndex : (I)Ljava/lang/Object;
    //   154: pop
    //   155: aload_0
    //   156: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   159: astore_2
    //   160: new java/lang/StringBuilder
    //   163: astore_3
    //   164: aload_3
    //   165: invokespecial <init> : ()V
    //   168: aload_3
    //   169: ldc_w 'Unload (from queue): '
    //   172: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: pop
    //   176: aload_3
    //   177: aload_1
    //   178: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   181: pop
    //   182: aload_2
    //   183: aload_3
    //   184: invokevirtual toString : ()Ljava/lang/String;
    //   187: invokevirtual info : (Ljava/lang/String;)V
    //   190: aload_0
    //   191: monitorexit
    //   192: return
    //   193: aload_0
    //   194: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   197: aload_1
    //   198: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   201: checkcast java/lang/Class
    //   204: astore #5
    //   206: aload #5
    //   208: ifnull -> 452
    //   211: aload_0
    //   212: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   215: aload #5
    //   217: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   220: checkcast com/badlogic/gdx/utils/ObjectMap
    //   223: aload_1
    //   224: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   227: checkcast com/badlogic/gdx/assets/RefCountedContainer
    //   230: astore_2
    //   231: aload_2
    //   232: invokevirtual decRefCount : ()V
    //   235: aload_2
    //   236: invokevirtual getRefCount : ()I
    //   239: ifgt -> 337
    //   242: aload_0
    //   243: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   246: astore_3
    //   247: new java/lang/StringBuilder
    //   250: astore #6
    //   252: aload #6
    //   254: invokespecial <init> : ()V
    //   257: aload #6
    //   259: ldc_w 'Unload (dispose): '
    //   262: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   265: pop
    //   266: aload #6
    //   268: aload_1
    //   269: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   272: pop
    //   273: aload_3
    //   274: aload #6
    //   276: invokevirtual toString : ()Ljava/lang/String;
    //   279: invokevirtual info : (Ljava/lang/String;)V
    //   282: aload_2
    //   283: ldc java/lang/Object
    //   285: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   288: instanceof com/badlogic/gdx/utils/Disposable
    //   291: ifeq -> 308
    //   294: aload_2
    //   295: ldc java/lang/Object
    //   297: invokevirtual getObject : (Ljava/lang/Class;)Ljava/lang/Object;
    //   300: checkcast com/badlogic/gdx/utils/Disposable
    //   303: invokeinterface dispose : ()V
    //   308: aload_0
    //   309: getfield assetTypes : Lcom/badlogic/gdx/utils/ObjectMap;
    //   312: aload_1
    //   313: invokevirtual remove : (Ljava/lang/Object;)Ljava/lang/Object;
    //   316: pop
    //   317: aload_0
    //   318: getfield assets : Lcom/badlogic/gdx/utils/ObjectMap;
    //   321: aload #5
    //   323: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   326: checkcast com/badlogic/gdx/utils/ObjectMap
    //   329: aload_1
    //   330: invokevirtual remove : (Ljava/lang/Object;)Ljava/lang/Object;
    //   333: pop
    //   334: goto -> 374
    //   337: aload_0
    //   338: getfield log : Lcom/badlogic/gdx/utils/Logger;
    //   341: astore #5
    //   343: new java/lang/StringBuilder
    //   346: astore_3
    //   347: aload_3
    //   348: invokespecial <init> : ()V
    //   351: aload_3
    //   352: ldc_w 'Unload (decrement): '
    //   355: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   358: pop
    //   359: aload_3
    //   360: aload_1
    //   361: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   364: pop
    //   365: aload #5
    //   367: aload_3
    //   368: invokevirtual toString : ()Ljava/lang/String;
    //   371: invokevirtual info : (Ljava/lang/String;)V
    //   374: aload_0
    //   375: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   378: aload_1
    //   379: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   382: checkcast com/badlogic/gdx/utils/Array
    //   385: astore_3
    //   386: aload_3
    //   387: ifnull -> 433
    //   390: aload_3
    //   391: invokevirtual iterator : ()Ljava/util/Iterator;
    //   394: astore #5
    //   396: aload #5
    //   398: invokeinterface hasNext : ()Z
    //   403: ifeq -> 433
    //   406: aload #5
    //   408: invokeinterface next : ()Ljava/lang/Object;
    //   413: checkcast java/lang/String
    //   416: astore_3
    //   417: aload_0
    //   418: aload_3
    //   419: invokevirtual isLoaded : (Ljava/lang/String;)Z
    //   422: ifeq -> 396
    //   425: aload_0
    //   426: aload_3
    //   427: invokevirtual unload : (Ljava/lang/String;)V
    //   430: goto -> 396
    //   433: aload_2
    //   434: invokevirtual getRefCount : ()I
    //   437: ifgt -> 449
    //   440: aload_0
    //   441: getfield assetDependencies : Lcom/badlogic/gdx/utils/ObjectMap;
    //   444: aload_1
    //   445: invokevirtual remove : (Ljava/lang/Object;)Ljava/lang/Object;
    //   448: pop
    //   449: aload_0
    //   450: monitorexit
    //   451: return
    //   452: new com/badlogic/gdx/utils/GdxRuntimeException
    //   455: astore_3
    //   456: new java/lang/StringBuilder
    //   459: astore_2
    //   460: aload_2
    //   461: invokespecial <init> : ()V
    //   464: aload_2
    //   465: ldc_w 'Asset not loaded: '
    //   468: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   471: pop
    //   472: aload_2
    //   473: aload_1
    //   474: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   477: pop
    //   478: aload_3
    //   479: aload_2
    //   480: invokevirtual toString : ()Ljava/lang/String;
    //   483: invokespecial <init> : (Ljava/lang/String;)V
    //   486: aload_3
    //   487: athrow
    //   488: astore_1
    //   489: aload_0
    //   490: monitorexit
    //   491: goto -> 496
    //   494: aload_1
    //   495: athrow
    //   496: goto -> 494
    // Exception table:
    //   from	to	target	type
    //   2	77	488	finally
    //   83	117	488	finally
    //   135	190	488	finally
    //   193	206	488	finally
    //   211	308	488	finally
    //   308	334	488	finally
    //   337	374	488	finally
    //   374	386	488	finally
    //   390	396	488	finally
    //   396	430	488	finally
    //   433	449	488	finally
    //   452	488	488	finally }
  
  public boolean update() {
    String str;
    /* monitor enter ThisExpression{ObjectType{com/badlogic/gdx/assets/AssetManager}} */
    boolean bool = false;
    byte b = 0;
    try {
      if (this.tasks.size() == 0) {
        while (this.loadQueue.size != 0 && this.tasks.size() == 0)
          nextTask(); 
        int j = this.tasks.size();
        if (j == 0) {
          /* monitor exit ThisExpression{ObjectType{com/badlogic/gdx/assets/AssetManager}} */
          return true;
        } 
      } 
      int i = b;
      if (updateTask()) {
        i = b;
        if (this.loadQueue.size == 0) {
          int j = this.tasks.size();
          i = b;
          if (j == 0)
            i = 1; 
        } 
      } 
      /* monitor exit ThisExpression{ObjectType{com/badlogic/gdx/assets/AssetManager}} */
      return i;
    } catch (Throwable null) {
      handleTaskError(str);
      int i = this.loadQueue.size;
      boolean bool1 = bool;
      if (i == 0)
        bool1 = true; 
      /* monitor exit ThisExpression{ObjectType{com/badlogic/gdx/assets/AssetManager}} */
      return bool1;
    } finally {}
    /* monitor exit ThisExpression{ObjectType{com/badlogic/gdx/assets/AssetManager}} */
    throw str;
  }
  
  public boolean update(int paramInt) {
    boolean bool;
    long l1 = TimeUtils.millis();
    long l2 = paramInt;
    while (true) {
      bool = update();
      if (bool || TimeUtils.millis() > l1 + l2)
        break; 
      ThreadUtils.yield();
    } 
    return bool;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/AssetManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */