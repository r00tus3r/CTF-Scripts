package com.badlogic.gdx.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.UUID;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class SharedLibraryLoader {
  public static String abi;
  
  public static boolean is64Bit;
  
  public static boolean isARM;
  
  public static boolean isAndroid;
  
  public static boolean isIos;
  
  public static boolean isLinux;
  
  public static boolean isMac;
  
  public static boolean isWindows = System.getProperty("os.name").contains("Windows");
  
  private static final HashSet<String> loadedLibraries;
  
  private String nativesJar;
  
  static  {
    isLinux = System.getProperty("os.name").contains("Linux");
    isMac = System.getProperty("os.name").contains("Mac");
    isIos = false;
    isAndroid = false;
    isARM = System.getProperty("os.arch").startsWith("arm");
    if (System.getProperty("os.arch").equals("amd64") || System.getProperty("os.arch").equals("x86_64")) {
      bool = true;
    } else {
      bool = false;
    } 
    is64Bit = bool;
    if (System.getProperty("sun.arch.abi") != null) {
      str = System.getProperty("sun.arch.abi");
    } else {
      str = "";
    } 
    abi = str;
    boolean bool = "iOS".equals(System.getProperty("moe.platform.name"));
    String str = System.getProperty("java.runtime.name");
    if (str != null && str.contains("Android Runtime")) {
      isAndroid = true;
      isWindows = false;
      isLinux = false;
      isMac = false;
      is64Bit = false;
    } 
    if (bool || (!isAndroid && !isWindows && !isLinux && !isMac)) {
      isIos = true;
      isAndroid = false;
      isWindows = false;
      isLinux = false;
      isMac = false;
      is64Bit = false;
    } 
    loadedLibraries = new HashSet();
  }
  
  public SharedLibraryLoader() {}
  
  public SharedLibraryLoader(String paramString) { this.nativesJar = paramString; }
  
  private boolean canExecute(File paramFile) {
    try {
      Method method = File.class.getMethod("canExecute", new Class[0]);
      if (((Boolean)method.invoke(paramFile, new Object[0])).booleanValue())
        return true; 
      File.class.getMethod("setExecutable", new Class[] { boolean.class, boolean.class }).invoke(paramFile, new Object[] { Boolean.valueOf(true), Boolean.valueOf(false) });
      return ((Boolean)method.invoke(paramFile, new Object[0])).booleanValue();
    } catch (Exception paramFile) {
      return false;
    } 
  }
  
  private boolean canWrite(File paramFile) {
    null = paramFile.getParentFile();
    if (paramFile.exists()) {
      if (!paramFile.canWrite() || !canExecute(paramFile))
        return false; 
      paramFile = new File(null, UUID.randomUUID().toString());
    } else {
      null.mkdirs();
      if (!null.isDirectory())
        return false; 
    } 
    try {
      FileOutputStream fileOutputStream = new FileOutputStream();
      this(paramFile);
      fileOutputStream.close();
      boolean bool = canExecute(paramFile);
      if (!bool)
        return false; 
      return true;
    } catch (Throwable null) {
      return false;
    } finally {
      paramFile.delete();
    } 
  }
  
  private File extractFile(String paramString1, String paramString2, File paramFile) throws IOException { // Byte code:
    //   0: aload_3
    //   1: invokevirtual exists : ()Z
    //   4: istore #4
    //   6: aconst_null
    //   7: astore #5
    //   9: aconst_null
    //   10: astore #6
    //   12: iload #4
    //   14: ifeq -> 39
    //   17: new java/io/FileInputStream
    //   20: astore #7
    //   22: aload #7
    //   24: aload_3
    //   25: invokespecial <init> : (Ljava/io/File;)V
    //   28: aload_0
    //   29: aload #7
    //   31: invokevirtual crc : (Ljava/io/InputStream;)Ljava/lang/String;
    //   34: astore #7
    //   36: goto -> 42
    //   39: aconst_null
    //   40: astore #7
    //   42: aload #7
    //   44: ifnull -> 56
    //   47: aload #7
    //   49: aload_2
    //   50: invokevirtual equals : (Ljava/lang/Object;)Z
    //   53: ifne -> 111
    //   56: aload_0
    //   57: aload_1
    //   58: invokespecial readFile : (Ljava/lang/String;)Ljava/io/InputStream;
    //   61: astore_2
    //   62: aload_3
    //   63: invokevirtual getParentFile : ()Ljava/io/File;
    //   66: invokevirtual mkdirs : ()Z
    //   69: pop
    //   70: new java/io/FileOutputStream
    //   73: astore #7
    //   75: aload #7
    //   77: aload_3
    //   78: invokespecial <init> : (Ljava/io/File;)V
    //   81: sipush #4096
    //   84: newarray byte
    //   86: astore #5
    //   88: aload_2
    //   89: aload #5
    //   91: invokevirtual read : ([B)I
    //   94: istore #8
    //   96: iload #8
    //   98: iconst_m1
    //   99: if_icmpne -> 113
    //   102: aload_2
    //   103: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   106: aload #7
    //   108: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   111: aload_3
    //   112: areturn
    //   113: aload #7
    //   115: aload #5
    //   117: iconst_0
    //   118: iload #8
    //   120: invokevirtual write : ([BII)V
    //   123: goto -> 88
    //   126: astore_1
    //   127: goto -> 232
    //   130: astore #5
    //   132: goto -> 168
    //   135: astore_1
    //   136: aconst_null
    //   137: astore #7
    //   139: goto -> 232
    //   142: astore #5
    //   144: aconst_null
    //   145: astore #7
    //   147: goto -> 168
    //   150: astore_1
    //   151: aconst_null
    //   152: astore #7
    //   154: aload #5
    //   156: astore_2
    //   157: goto -> 232
    //   160: astore #5
    //   162: aconst_null
    //   163: astore #7
    //   165: aload #6
    //   167: astore_2
    //   168: new com/badlogic/gdx/utils/GdxRuntimeException
    //   171: astore #9
    //   173: new java/lang/StringBuilder
    //   176: astore #6
    //   178: aload #6
    //   180: invokespecial <init> : ()V
    //   183: aload #6
    //   185: ldc 'Error extracting file: '
    //   187: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: pop
    //   191: aload #6
    //   193: aload_1
    //   194: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   197: pop
    //   198: aload #6
    //   200: ldc '\\nTo: '
    //   202: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   205: pop
    //   206: aload #6
    //   208: aload_3
    //   209: invokevirtual getAbsolutePath : ()Ljava/lang/String;
    //   212: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   215: pop
    //   216: aload #9
    //   218: aload #6
    //   220: invokevirtual toString : ()Ljava/lang/String;
    //   223: aload #5
    //   225: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   228: aload #9
    //   230: athrow
    //   231: astore_1
    //   232: aload_2
    //   233: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   236: aload #7
    //   238: invokestatic closeQuietly : (Ljava/io/Closeable;)V
    //   241: goto -> 246
    //   244: aload_1
    //   245: athrow
    //   246: goto -> 244
    //   249: astore #7
    //   251: goto -> 39
    // Exception table:
    //   from	to	target	type
    //   17	36	249	java/io/FileNotFoundException
    //   56	62	160	java/io/IOException
    //   56	62	150	finally
    //   62	81	142	java/io/IOException
    //   62	81	135	finally
    //   81	88	130	java/io/IOException
    //   81	88	126	finally
    //   88	96	130	java/io/IOException
    //   88	96	126	finally
    //   113	123	130	java/io/IOException
    //   113	123	126	finally
    //   168	231	231	finally }
  
  private File getExtractedFile(String paramString1, String paramString2) {
    java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
    stringBuilder1.append(System.getProperty("java.io.tmpdir"));
    stringBuilder1.append("/libgdx");
    stringBuilder1.append(System.getProperty("user.name"));
    stringBuilder1.append("/");
    stringBuilder1.append(paramString1);
    File file2 = new File(stringBuilder1.toString(), paramString2);
    if (canWrite(file2))
      return file2; 
    try {
      File file = File.createTempFile(paramString1, null);
      if (file.delete()) {
        File file4 = new File();
        this(file, paramString2);
        boolean bool = canWrite(file4);
        if (bool)
          return file4; 
      } 
    } catch (IOException iOException) {}
    java.lang.StringBuilder stringBuilder3 = new java.lang.StringBuilder();
    stringBuilder3.append(System.getProperty("user.home"));
    stringBuilder3.append("/.libgdx/");
    stringBuilder3.append(paramString1);
    File file3 = new File(stringBuilder3.toString(), paramString2);
    if (canWrite(file3))
      return file3; 
    java.lang.StringBuilder stringBuilder2 = new java.lang.StringBuilder();
    stringBuilder2.append(".temp/");
    stringBuilder2.append(paramString1);
    File file1 = new File(stringBuilder2.toString(), paramString2);
    return canWrite(file1) ? file1 : ((System.getenv("APP_SANDBOX_CONTAINER_ID") != null) ? file2 : null);
  }
  
  public static boolean isLoaded(String paramString) { // Byte code:
    //   0: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   2: monitorenter
    //   3: getstatic com/badlogic/gdx/utils/SharedLibraryLoader.loadedLibraries : Ljava/util/HashSet;
    //   6: aload_0
    //   7: invokevirtual contains : (Ljava/lang/Object;)Z
    //   10: istore_1
    //   11: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   13: monitorexit
    //   14: iload_1
    //   15: ireturn
    //   16: astore_0
    //   17: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   19: monitorexit
    //   20: aload_0
    //   21: athrow
    // Exception table:
    //   from	to	target	type
    //   3	11	16	finally }
  
  private Throwable loadFile(String paramString1, String paramString2, File paramFile) {
    try {
      System.load(extractFile(paramString1, paramString2, paramFile).getAbsolutePath());
      return null;
    } catch (Throwable paramString1) {
      return null;
    } 
  }
  
  private void loadFile(String paramString) {
    String str1 = crc(readFile(paramString));
    String str2 = (new File(paramString)).getName();
    java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
    stringBuilder1.append(System.getProperty("java.io.tmpdir"));
    stringBuilder1.append("/libgdx");
    stringBuilder1.append(System.getProperty("user.name"));
    stringBuilder1.append("/");
    stringBuilder1.append(str1);
    Throwable throwable = loadFile(paramString, str1, new File(stringBuilder1.toString(), str2));
    if (throwable == null)
      return; 
    try {
      File file1 = File.createTempFile(str1, null);
      if (file1.delete()) {
        Throwable throwable1 = loadFile(paramString, str1, file1);
        if (throwable1 == null)
          return; 
      } 
    } catch (Throwable throwable1) {}
    java.lang.StringBuilder stringBuilder2 = new java.lang.StringBuilder();
    stringBuilder2.append(System.getProperty("user.home"));
    stringBuilder2.append("/.libgdx/");
    stringBuilder2.append(str1);
    if (loadFile(paramString, str1, new File(stringBuilder2.toString(), str2)) == null)
      return; 
    stringBuilder2 = new java.lang.StringBuilder();
    stringBuilder2.append(".temp/");
    stringBuilder2.append(str1);
    if (loadFile(paramString, str1, new File(stringBuilder2.toString(), str2)) == null)
      return; 
    File file = new File(System.getProperty("java.library.path"), paramString);
    if (file.exists()) {
      System.load(file.getAbsolutePath());
      return;
    } 
    throw new GdxRuntimeException(throwable);
  }
  
  private InputStream readFile(String paramString) {
    String str = this.nativesJar;
    if (str == null) {
      java.lang.StringBuilder stringBuilder2 = new java.lang.StringBuilder();
      stringBuilder2.append("/");
      stringBuilder2.append(paramString);
      InputStream inputStream = SharedLibraryLoader.class.getResourceAsStream(stringBuilder2.toString());
      if (inputStream != null)
        return inputStream; 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("Unable to read file for extraction: ");
      stringBuilder1.append(paramString);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    try {
      ZipFile zipFile = new ZipFile();
      this(str);
      ZipEntry zipEntry = zipFile.getEntry(paramString);
      if (zipEntry != null)
        return zipFile.getInputStream(zipEntry); 
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      this();
      stringBuilder.append("Couldn't find '");
      stringBuilder.append(paramString);
      stringBuilder.append("' in JAR: ");
      stringBuilder.append(this.nativesJar);
      this(stringBuilder.toString());
      throw gdxRuntimeException;
    } catch (IOException iOException) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("Error reading '");
      stringBuilder.append(paramString);
      stringBuilder.append("' in JAR: ");
      stringBuilder.append(this.nativesJar);
      throw new GdxRuntimeException(stringBuilder.toString(), iOException);
    } 
  }
  
  public static void setLoaded(String paramString) { // Byte code:
    //   0: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   2: monitorenter
    //   3: getstatic com/badlogic/gdx/utils/SharedLibraryLoader.loadedLibraries : Ljava/util/HashSet;
    //   6: aload_0
    //   7: invokevirtual add : (Ljava/lang/Object;)Z
    //   10: pop
    //   11: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   13: monitorexit
    //   14: return
    //   15: astore_0
    //   16: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   18: monitorexit
    //   19: aload_0
    //   20: athrow
    // Exception table:
    //   from	to	target	type
    //   3	11	15	finally }
  
  public String crc(InputStream paramInputStream) {
    if (paramInputStream != null) {
      null = new CRC32();
      arrayOfByte = new byte[4096];
      try {
        while (true) {
          int i = paramInputStream.read(arrayOfByte);
          if (i == -1)
            break; 
          null.update(arrayOfByte, 0, i);
        } 
      } catch (Exception arrayOfByte) {
      
      } finally {
        StreamUtils.closeQuietly(paramInputStream);
      } 
      StreamUtils.closeQuietly(paramInputStream);
      return Long.toString(SYNTHETIC_LOCAL_VARIABLE_2.getValue(), 16);
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("input cannot be null.");
    throw illegalArgumentException;
  }
  
  public File extractFile(String paramString1, String paramString2) {
    try {
      String str1 = crc(readFile(paramString1));
      String str2 = paramString2;
      if (paramString2 == null)
        str2 = str1; 
      GdxRuntimeException gdxRuntimeException = new File();
      this(paramString1);
      File file = getExtractedFile(str2, gdxRuntimeException.getName());
      gdxRuntimeException = file;
      if (file == null) {
        String str = UUID.randomUUID().toString();
        gdxRuntimeException = new File();
        this(paramString1);
        gdxRuntimeException = getExtractedFile(str, gdxRuntimeException.getName());
        if (gdxRuntimeException == null) {
          gdxRuntimeException = new GdxRuntimeException();
          this("Unable to find writable path to extract file. Is the user home directory writable?");
          throw gdxRuntimeException;
        } 
      } 
      return extractFile(paramString1, str1, gdxRuntimeException);
    } catch (RuntimeException paramString2) {
      File file = new File(System.getProperty("java.library.path"), paramString1);
      if (file.exists())
        return file; 
      throw paramString2;
    } 
  }
  
  public void extractFileTo(String paramString, File paramFile) throws IOException { extractFile(paramString, crc(readFile(paramString)), new File(paramFile, (new File(paramString)).getName())); }
  
  public void load(String paramString) { // Byte code:
    //   0: getstatic com/badlogic/gdx/utils/SharedLibraryLoader.isIos : Z
    //   3: ifeq -> 7
    //   6: return
    //   7: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   9: monitorenter
    //   10: aload_1
    //   11: invokestatic isLoaded : (Ljava/lang/String;)Z
    //   14: ifeq -> 21
    //   17: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   19: monitorexit
    //   20: return
    //   21: aload_0
    //   22: aload_1
    //   23: invokevirtual mapLibraryName : (Ljava/lang/String;)Ljava/lang/String;
    //   26: astore_2
    //   27: getstatic com/badlogic/gdx/utils/SharedLibraryLoader.isAndroid : Z
    //   30: ifeq -> 40
    //   33: aload_2
    //   34: invokestatic loadLibrary : (Ljava/lang/String;)V
    //   37: goto -> 45
    //   40: aload_0
    //   41: aload_2
    //   42: invokespecial loadFile : (Ljava/lang/String;)V
    //   45: aload_1
    //   46: invokestatic setLoaded : (Ljava/lang/String;)V
    //   49: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   51: monitorexit
    //   52: return
    //   53: astore_3
    //   54: new com/badlogic/gdx/utils/GdxRuntimeException
    //   57: astore #4
    //   59: new java/lang/StringBuilder
    //   62: astore #5
    //   64: aload #5
    //   66: invokespecial <init> : ()V
    //   69: aload #5
    //   71: ldc_w 'Couldn't load shared library ''
    //   74: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: pop
    //   78: aload #5
    //   80: aload_2
    //   81: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: pop
    //   85: aload #5
    //   87: ldc_w '' for target: '
    //   90: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: pop
    //   94: aload #5
    //   96: ldc 'os.name'
    //   98: invokestatic getProperty : (Ljava/lang/String;)Ljava/lang/String;
    //   101: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: pop
    //   105: getstatic com/badlogic/gdx/utils/SharedLibraryLoader.is64Bit : Z
    //   108: ifeq -> 118
    //   111: ldc_w ', 64-bit'
    //   114: astore_1
    //   115: goto -> 122
    //   118: ldc_w ', 32-bit'
    //   121: astore_1
    //   122: aload #5
    //   124: aload_1
    //   125: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   128: pop
    //   129: aload #4
    //   131: aload #5
    //   133: invokevirtual toString : ()Ljava/lang/String;
    //   136: aload_3
    //   137: invokespecial <init> : (Ljava/lang/String;Ljava/lang/Throwable;)V
    //   140: aload #4
    //   142: athrow
    //   143: astore_1
    //   144: ldc com/badlogic/gdx/utils/SharedLibraryLoader
    //   146: monitorexit
    //   147: aload_1
    //   148: athrow
    // Exception table:
    //   from	to	target	type
    //   10	20	143	finally
    //   21	27	143	finally
    //   27	37	53	java/lang/Throwable
    //   27	37	143	finally
    //   40	45	53	java/lang/Throwable
    //   40	45	143	finally
    //   45	49	53	java/lang/Throwable
    //   45	49	143	finally
    //   49	52	143	finally
    //   54	111	143	finally
    //   122	143	143	finally
    //   144	147	143	finally }
  
  public String mapLibraryName(String paramString) {
    if (isWindows) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append(paramString);
      if (is64Bit) {
        paramString = "64.dll";
      } else {
        paramString = ".dll";
      } 
      stringBuilder.append(paramString);
      return stringBuilder.toString();
    } 
    if (isLinux) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("lib");
      stringBuilder.append(paramString);
      if (isARM) {
        java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
        stringBuilder1.append("arm");
        stringBuilder1.append(abi);
        String str1 = stringBuilder1.toString();
      } else {
        paramString = "";
      } 
      stringBuilder.append(paramString);
      if (is64Bit) {
        paramString = "64.so";
      } else {
        paramString = ".so";
      } 
      stringBuilder.append(paramString);
      return stringBuilder.toString();
    } 
    String str = paramString;
    if (isMac) {
      java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
      stringBuilder.append("lib");
      stringBuilder.append(paramString);
      if (is64Bit) {
        paramString = "64.dylib";
      } else {
        paramString = ".dylib";
      } 
      stringBuilder.append(paramString);
      str = stringBuilder.toString();
    } 
    return str;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/SharedLibraryLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */