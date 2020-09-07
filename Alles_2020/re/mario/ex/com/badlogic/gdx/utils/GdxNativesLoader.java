package com.badlogic.gdx.utils;

public class GdxNativesLoader {
  public static boolean disableNativesLoading = false;
  
  private static boolean nativesLoaded;
  
  static  {
  
  }
  
  public static void load() { // Byte code:
    //   0: ldc com/badlogic/gdx/utils/GdxNativesLoader
    //   2: monitorenter
    //   3: getstatic com/badlogic/gdx/utils/GdxNativesLoader.nativesLoaded : Z
    //   6: istore_0
    //   7: iload_0
    //   8: ifeq -> 15
    //   11: ldc com/badlogic/gdx/utils/GdxNativesLoader
    //   13: monitorexit
    //   14: return
    //   15: iconst_1
    //   16: putstatic com/badlogic/gdx/utils/GdxNativesLoader.nativesLoaded : Z
    //   19: getstatic com/badlogic/gdx/utils/GdxNativesLoader.disableNativesLoading : Z
    //   22: istore_0
    //   23: iload_0
    //   24: ifeq -> 31
    //   27: ldc com/badlogic/gdx/utils/GdxNativesLoader
    //   29: monitorexit
    //   30: return
    //   31: new com/badlogic/gdx/utils/SharedLibraryLoader
    //   34: astore_1
    //   35: aload_1
    //   36: invokespecial <init> : ()V
    //   39: aload_1
    //   40: ldc 'gdx'
    //   42: invokevirtual load : (Ljava/lang/String;)V
    //   45: ldc com/badlogic/gdx/utils/GdxNativesLoader
    //   47: monitorexit
    //   48: return
    //   49: astore_1
    //   50: ldc com/badlogic/gdx/utils/GdxNativesLoader
    //   52: monitorexit
    //   53: aload_1
    //   54: athrow
    // Exception table:
    //   from	to	target	type
    //   3	7	49	finally
    //   15	23	49	finally
    //   31	45	49	finally }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/GdxNativesLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */