package com.badlogic.gdx.utils;

import java.util.Comparator;

public class Select {
  private static Select instance;
  
  private QuickSelect quickSelect;
  
  private <T> int fastMax(T[] paramArrayOfT, Comparator<T> paramComparator, int paramInt) {
    byte b1 = 1;
    byte b2;
    for (b2 = 0; b1 < paramInt; b2 = b) {
      byte b = b2;
      if (paramComparator.compare(paramArrayOfT[b1], paramArrayOfT[b2]) > 0)
        b = b1; 
      b1++;
    } 
    return b2;
  }
  
  private <T> int fastMin(T[] paramArrayOfT, Comparator<T> paramComparator, int paramInt) {
    byte b1 = 1;
    byte b2;
    for (b2 = 0; b1 < paramInt; b2 = b) {
      byte b = b2;
      if (paramComparator.compare(paramArrayOfT[b1], paramArrayOfT[b2]) < 0)
        b = b1; 
      b1++;
    } 
    return b2;
  }
  
  public static Select instance() {
    if (instance == null)
      instance = new Select(); 
    return instance;
  }
  
  public <T> T select(T[] paramArrayOfT, Comparator<T> paramComparator, int paramInt1, int paramInt2) { return paramArrayOfT[selectIndex(paramArrayOfT, paramComparator, paramInt1, paramInt2)]; }
  
  public <T> int selectIndex(T[] paramArrayOfT, Comparator<T> paramComparator, int paramInt1, int paramInt2) { // Byte code:
    //   0: iload #4
    //   2: iconst_1
    //   3: if_icmplt -> 127
    //   6: iload_3
    //   7: iload #4
    //   9: if_icmpgt -> 80
    //   12: iload_3
    //   13: iconst_1
    //   14: if_icmpne -> 29
    //   17: aload_0
    //   18: aload_1
    //   19: aload_2
    //   20: iload #4
    //   22: invokespecial fastMin : ([Ljava/lang/Object;Ljava/util/Comparator;I)I
    //   25: istore_3
    //   26: goto -> 78
    //   29: iload_3
    //   30: iload #4
    //   32: if_icmpne -> 47
    //   35: aload_0
    //   36: aload_1
    //   37: aload_2
    //   38: iload #4
    //   40: invokespecial fastMax : ([Ljava/lang/Object;Ljava/util/Comparator;I)I
    //   43: istore_3
    //   44: goto -> 78
    //   47: aload_0
    //   48: getfield quickSelect : Lcom/badlogic/gdx/utils/QuickSelect;
    //   51: ifnonnull -> 65
    //   54: aload_0
    //   55: new com/badlogic/gdx/utils/QuickSelect
    //   58: dup
    //   59: invokespecial <init> : ()V
    //   62: putfield quickSelect : Lcom/badlogic/gdx/utils/QuickSelect;
    //   65: aload_0
    //   66: getfield quickSelect : Lcom/badlogic/gdx/utils/QuickSelect;
    //   69: aload_1
    //   70: aload_2
    //   71: iload_3
    //   72: iload #4
    //   74: invokevirtual select : ([Ljava/lang/Object;Ljava/util/Comparator;II)I
    //   77: istore_3
    //   78: iload_3
    //   79: ireturn
    //   80: new java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial <init> : ()V
    //   87: astore_1
    //   88: aload_1
    //   89: ldc 'Kth rank is larger than size. k: '
    //   91: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   94: pop
    //   95: aload_1
    //   96: iload_3
    //   97: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   100: pop
    //   101: aload_1
    //   102: ldc ', size: '
    //   104: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: pop
    //   108: aload_1
    //   109: iload #4
    //   111: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   114: pop
    //   115: new com/badlogic/gdx/utils/GdxRuntimeException
    //   118: dup
    //   119: aload_1
    //   120: invokevirtual toString : ()Ljava/lang/String;
    //   123: invokespecial <init> : (Ljava/lang/String;)V
    //   126: athrow
    //   127: new com/badlogic/gdx/utils/GdxRuntimeException
    //   130: dup
    //   131: ldc 'cannot select from empty array (size < 1)'
    //   133: invokespecial <init> : (Ljava/lang/String;)V
    //   136: athrow }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Select.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */