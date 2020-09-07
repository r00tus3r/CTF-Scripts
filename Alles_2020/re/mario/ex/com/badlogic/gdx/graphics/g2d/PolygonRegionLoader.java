package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.math.EarClippingTriangulator;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedReader;
import java.io.IOException;

public class PolygonRegionLoader extends SynchronousAssetLoader<PolygonRegion, PolygonRegionLoader.PolygonRegionParameters> {
  private PolygonRegionParameters defaultParameters = new PolygonRegionParameters();
  
  private EarClippingTriangulator triangulator = new EarClippingTriangulator();
  
  public PolygonRegionLoader() { this(new InternalFileHandleResolver()); }
  
  public PolygonRegionLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, PolygonRegionParameters paramPolygonRegionParameters) { // Byte code:
    //   0: aload_3
    //   1: astore #4
    //   3: aload_3
    //   4: ifnonnull -> 13
    //   7: aload_0
    //   8: getfield defaultParameters : Lcom/badlogic/gdx/graphics/g2d/PolygonRegionLoader$PolygonRegionParameters;
    //   11: astore #4
    //   13: aload_2
    //   14: aload #4
    //   16: getfield readerBuffer : I
    //   19: invokevirtual reader : (I)Ljava/io/BufferedReader;
    //   22: astore #5
    //   24: aload #5
    //   26: invokevirtual readLine : ()Ljava/lang/String;
    //   29: astore_3
    //   30: aload_3
    //   31: ifnull -> 62
    //   34: aload_3
    //   35: aload #4
    //   37: getfield texturePrefix : Ljava/lang/String;
    //   40: invokevirtual startsWith : (Ljava/lang/String;)Z
    //   43: ifeq -> 24
    //   46: aload_3
    //   47: aload #4
    //   49: getfield texturePrefix : Ljava/lang/String;
    //   52: invokevirtual length : ()I
    //   55: invokevirtual substring : (I)Ljava/lang/String;
    //   58: astore_3
    //   59: goto -> 64
    //   62: aconst_null
    //   63: astore_3
    //   64: aload #5
    //   66: invokevirtual close : ()V
    //   69: aload_3
    //   70: astore_1
    //   71: aload_3
    //   72: ifnonnull -> 178
    //   75: aload_3
    //   76: astore_1
    //   77: aload #4
    //   79: getfield textureExtensions : [Ljava/lang/String;
    //   82: ifnull -> 178
    //   85: aload #4
    //   87: getfield textureExtensions : [Ljava/lang/String;
    //   90: astore #4
    //   92: aload #4
    //   94: arraylength
    //   95: istore #6
    //   97: iconst_0
    //   98: istore #7
    //   100: aload_3
    //   101: astore_1
    //   102: iload #7
    //   104: iload #6
    //   106: if_icmpge -> 178
    //   109: aload #4
    //   111: iload #7
    //   113: aaload
    //   114: astore #5
    //   116: aload_2
    //   117: invokevirtual nameWithoutExtension : ()Ljava/lang/String;
    //   120: astore_1
    //   121: new java/lang/StringBuilder
    //   124: dup
    //   125: invokespecial <init> : ()V
    //   128: astore #8
    //   130: aload #8
    //   132: ldc '.'
    //   134: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   137: pop
    //   138: aload #8
    //   140: aload #5
    //   142: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   145: pop
    //   146: aload_2
    //   147: aload_1
    //   148: aload #8
    //   150: invokevirtual toString : ()Ljava/lang/String;
    //   153: invokevirtual concat : (Ljava/lang/String;)Ljava/lang/String;
    //   156: invokevirtual sibling : (Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    //   159: astore_1
    //   160: aload_1
    //   161: invokevirtual exists : ()Z
    //   164: ifeq -> 172
    //   167: aload_1
    //   168: invokevirtual name : ()Ljava/lang/String;
    //   171: astore_3
    //   172: iinc #7, 1
    //   175: goto -> 100
    //   178: aload_1
    //   179: ifnull -> 211
    //   182: new com/badlogic/gdx/utils/Array
    //   185: dup
    //   186: iconst_1
    //   187: invokespecial <init> : (I)V
    //   190: astore_3
    //   191: aload_3
    //   192: new com/badlogic/gdx/assets/AssetDescriptor
    //   195: dup
    //   196: aload_2
    //   197: aload_1
    //   198: invokevirtual sibling : (Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    //   201: ldc com/badlogic/gdx/graphics/Texture
    //   203: invokespecial <init> : (Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/Class;)V
    //   206: invokevirtual add : (Ljava/lang/Object;)V
    //   209: aload_3
    //   210: areturn
    //   211: aconst_null
    //   212: areturn
    //   213: astore_3
    //   214: new java/lang/StringBuilder
    //   217: dup
    //   218: invokespecial <init> : ()V
    //   221: astore_2
    //   222: aload_2
    //   223: ldc 'Error reading '
    //   225: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: pop
    //   229: aload_2
    //   230: aload_1
    //   231: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   234: pop
    //   235: new com/badlogic/gdx/utils/GdxRuntimeException
    //   238: dup
    //   239: aload_2
    //   240: invokevirtual toString : ()Ljava/lang/String;
    //   243: aload_3
    //   244: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   247: astore_1
    //   248: goto -> 253
    //   251: aload_1
    //   252: athrow
    //   253: goto -> 251
    // Exception table:
    //   from	to	target	type
    //   13	24	213	java/io/IOException
    //   24	30	213	java/io/IOException
    //   34	59	213	java/io/IOException
    //   64	69	213	java/io/IOException }
  
  public PolygonRegion load(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, PolygonRegionParameters paramPolygonRegionParameters) { return load(new TextureRegion((Texture)paramAssetManager.get((String)paramAssetManager.getDependencies(paramString).first())), paramFileHandle); }
  
  public PolygonRegion load(TextureRegion paramTextureRegion, FileHandle paramFileHandle) {
    BufferedReader bufferedReader = paramFileHandle.reader(256);
    try {
      while (true) {
        String str = bufferedReader.readLine();
        if (str != null) {
          if (str.startsWith("s")) {
            String[] arrayOfString = str.substring(1).trim().split(",");
            float[] arrayOfFloat = new float[arrayOfString.length];
            byte b = 0;
            int i = arrayOfFloat.length;
            while (b < i) {
              arrayOfFloat[b] = Float.parseFloat(arrayOfString[b]);
              b++;
            } 
            PolygonRegion polygonRegion = new PolygonRegion(paramTextureRegion, arrayOfFloat, this.triangulator.computeTriangles(arrayOfFloat).toArray());
            StreamUtils.closeQuietly(bufferedReader);
            return polygonRegion;
          } 
          continue;
        } 
        break;
      } 
      StreamUtils.closeQuietly(bufferedReader);
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Polygon shape not found: ");
      stringBuilder.append(paramFileHandle);
      throw new GdxRuntimeException(stringBuilder.toString());
    } catch (IOException iOException) {
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      StringBuilder stringBuilder = new StringBuilder();
      this();
      stringBuilder.append("Error reading polygon shape file: ");
      stringBuilder.append(paramFileHandle);
      this(stringBuilder.toString(), iOException);
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(bufferedReader);
    throw paramTextureRegion;
  }
  
  public static class PolygonRegionParameters extends AssetLoaderParameters<PolygonRegion> {
    public int readerBuffer = 1024;
    
    public String[] textureExtensions = { 
        "png", "PNG", "jpeg", "JPEG", "jpg", "JPG", "cim", "CIM", "etc1", "ETC1", 
        "ktx", "KTX", "zktx", "ZKTX" };
    
    public String texturePrefix = "i ";
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PolygonRegionLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */