package com.badlogic.gdx.utils;

import java.util.Arrays;
import java.util.Comparator;

class TimSort<T> extends Object {
  private static final boolean DEBUG = false;
  
  private static final int INITIAL_TMP_STORAGE_LENGTH = 256;
  
  private static final int MIN_GALLOP = 7;
  
  private static final int MIN_MERGE = 32;
  
  private T[] a;
  
  private Comparator<? super T> c;
  
  private int minGallop = 7;
  
  private final int[] runBase;
  
  private final int[] runLen;
  
  private int stackSize = 0;
  
  private T[] tmp;
  
  private int tmpCount;
  
  TimSort() {
    this.tmp = (Object[])new Object[256];
    this.runBase = new int[40];
    this.runLen = new int[40];
  }
  
  private TimSort(T[] paramArrayOfT, Comparator<? super T> paramComparator) {
    this.a = paramArrayOfT;
    this.c = paramComparator;
    int i = paramArrayOfT.length;
    if (i < 512) {
      c1 = i >>> 1;
    } else {
      c1 = 'Ā';
    } 
    this.tmp = (Object[])new Object[c1];
    if (i < 120) {
      c1 = '\005';
    } else if (i < 1542) {
      c1 = '\n';
    } else if (i < 119151) {
      c1 = '\023';
    } else {
      c1 = '(';
    } 
    this.runBase = new int[c1];
    this.runLen = new int[c1];
  }
  
  private static <T> void binarySort(T[] paramArrayOfT, int paramInt1, int paramInt2, int paramInt3, Comparator<? super T> paramComparator) { // Byte code:
    //   0: iload_3
    //   1: istore #5
    //   3: iload_3
    //   4: iload_1
    //   5: if_icmpne -> 13
    //   8: iload_3
    //   9: iconst_1
    //   10: iadd
    //   11: istore #5
    //   13: iload #5
    //   15: iload_2
    //   16: if_icmpge -> 137
    //   19: aload_0
    //   20: iload #5
    //   22: aaload
    //   23: astore #6
    //   25: iload_1
    //   26: istore_3
    //   27: iload #5
    //   29: istore #7
    //   31: iload_3
    //   32: iload #7
    //   34: if_icmpge -> 76
    //   37: iload_3
    //   38: iload #7
    //   40: iadd
    //   41: iconst_1
    //   42: iushr
    //   43: istore #8
    //   45: aload #4
    //   47: aload #6
    //   49: aload_0
    //   50: iload #8
    //   52: aaload
    //   53: invokeinterface compare : (Ljava/lang/Object;Ljava/lang/Object;)I
    //   58: ifge -> 68
    //   61: iload #8
    //   63: istore #7
    //   65: goto -> 31
    //   68: iload #8
    //   70: iconst_1
    //   71: iadd
    //   72: istore_3
    //   73: goto -> 31
    //   76: iload #5
    //   78: iload_3
    //   79: isub
    //   80: istore #7
    //   82: iload #7
    //   84: iconst_1
    //   85: if_icmpeq -> 118
    //   88: iload #7
    //   90: iconst_2
    //   91: if_icmpeq -> 108
    //   94: aload_0
    //   95: iload_3
    //   96: aload_0
    //   97: iload_3
    //   98: iconst_1
    //   99: iadd
    //   100: iload #7
    //   102: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   105: goto -> 126
    //   108: aload_0
    //   109: iload_3
    //   110: iconst_2
    //   111: iadd
    //   112: aload_0
    //   113: iload_3
    //   114: iconst_1
    //   115: iadd
    //   116: aaload
    //   117: aastore
    //   118: aload_0
    //   119: iload_3
    //   120: iconst_1
    //   121: iadd
    //   122: aload_0
    //   123: iload_3
    //   124: aaload
    //   125: aastore
    //   126: aload_0
    //   127: iload_3
    //   128: aload #6
    //   130: aastore
    //   131: iload #5
    //   133: istore_3
    //   134: goto -> 8
    //   137: return }
  
  private static <T> int countRunAndMakeAscending(T[] paramArrayOfT, int paramInt1, int paramInt2, Comparator<? super T> paramComparator) {
    int i = paramInt1 + 1;
    if (i == paramInt2)
      return 1; 
    int j = i + 1;
    int k = j;
    if (paramComparator.compare(paramArrayOfT[i], paramArrayOfT[paramInt1]) < 0) {
      for (k = j; k < paramInt2 && paramComparator.compare(paramArrayOfT[k], paramArrayOfT[k - 1]) < 0; k++);
      reverseRange(paramArrayOfT, paramInt1, k);
      j = k;
    } else {
      while (true) {
        j = k;
        if (k < paramInt2) {
          j = k;
          if (paramComparator.compare(paramArrayOfT[k], paramArrayOfT[k - 1]) >= 0) {
            k++;
            continue;
          } 
        } 
        break;
      } 
    } 
    return j - paramInt1;
  }
  
  private T[] ensureCapacity(int paramInt) {
    this.tmpCount = Math.max(this.tmpCount, paramInt);
    if (this.tmp.length < paramInt) {
      int i = paramInt >> 1 | paramInt;
      i |= i >> 2;
      i |= i >> 4;
      i |= i >> 8;
      i = (i | i >> 16) + 1;
      if (i >= 0)
        paramInt = Math.min(i, this.a.length >>> 1); 
      this.tmp = (Object[])new Object[paramInt];
    } 
    return (T[])this.tmp;
  }
  
  private static <T> int gallopLeft(T paramT, T[] paramArrayOfT, int paramInt1, int paramInt2, int paramInt3, Comparator<? super T> paramComparator) {
    int i = paramInt1 + paramInt3;
    if (paramComparator.compare(paramT, paramArrayOfT[i]) > 0) {
      int j = paramInt2 - paramInt3;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparator.compare(paramT, paramArrayOfT[i + paramInt2]) > 0; paramInt2 = m) {
        int m = (paramInt2 << 1) + 1;
        if (m <= 0) {
          k = paramInt2;
          paramInt2 = j;
          continue;
        } 
        k = paramInt2;
      } 
      if (paramInt2 > j)
        paramInt2 = j; 
      paramInt2 += paramInt3;
      paramInt3 = k + paramInt3;
    } else {
      int j = paramInt3 + 1;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparator.compare(paramT, paramArrayOfT[i - paramInt2]) <= 0; paramInt2 = m) {
        int m = (paramInt2 << 1) + 1;
        if (m <= 0) {
          k = paramInt2;
          paramInt2 = j;
          continue;
        } 
        k = paramInt2;
      } 
      if (paramInt2 > j)
        paramInt2 = j; 
      j = paramInt3 - paramInt2;
      paramInt2 = paramInt3 - k;
      paramInt3 = j;
    } 
    while (++paramInt3 < paramInt2) {
      int j = (paramInt2 - paramInt3 >>> 1) + paramInt3;
      if (paramComparator.compare(paramT, paramArrayOfT[paramInt1 + j]) > 0) {
        paramInt3 = j + 1;
        continue;
      } 
      paramInt2 = j;
    } 
    return paramInt2;
  }
  
  private static <T> int gallopRight(T paramT, T[] paramArrayOfT, int paramInt1, int paramInt2, int paramInt3, Comparator<? super T> paramComparator) {
    int i = paramInt1 + paramInt3;
    if (paramComparator.compare(paramT, paramArrayOfT[i]) < 0) {
      int j = paramInt3 + 1;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparator.compare(paramT, paramArrayOfT[i - paramInt2]) < 0; paramInt2 = m) {
        int m = (paramInt2 << 1) + 1;
        if (m <= 0) {
          k = paramInt2;
          paramInt2 = j;
          continue;
        } 
        k = paramInt2;
      } 
      if (paramInt2 > j)
        paramInt2 = j; 
      paramInt2 = paramInt3 - paramInt2;
      k = paramInt3 - k;
      paramInt3 = paramInt2;
      paramInt2 = k;
    } else {
      int j = paramInt2 - paramInt3;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparator.compare(paramT, paramArrayOfT[i + paramInt2]) >= 0; paramInt2 = m) {
        int m = (paramInt2 << 1) + 1;
        if (m <= 0) {
          k = paramInt2;
          paramInt2 = j;
          continue;
        } 
        k = paramInt2;
      } 
      if (paramInt2 <= j)
        j = paramInt2; 
      paramInt2 = paramInt3 + j;
      paramInt3 = k + paramInt3;
    } 
    while (++paramInt3 < paramInt2) {
      int j = (paramInt2 - paramInt3 >>> 1) + paramInt3;
      if (paramComparator.compare(paramT, paramArrayOfT[paramInt1 + j]) < 0) {
        paramInt2 = j;
        continue;
      } 
      paramInt3 = j + 1;
    } 
    return paramInt2;
  }
  
  private void mergeAt(int paramInt) {
    int[] arrayOfInt1 = this.runBase;
    int i = arrayOfInt1[paramInt];
    int[] arrayOfInt2 = this.runLen;
    int j = arrayOfInt2[paramInt];
    int k = paramInt + 1;
    int m = arrayOfInt1[k];
    int n = arrayOfInt2[k];
    arrayOfInt2[paramInt] = j + n;
    if (paramInt == this.stackSize - 3) {
      paramInt += 2;
      arrayOfInt1[k] = arrayOfInt1[paramInt];
      arrayOfInt2[k] = arrayOfInt2[paramInt];
    } 
    this.stackSize--;
    Object[] arrayOfObject = this.a;
    k = gallopRight(arrayOfObject[m], arrayOfObject, i, j, 0, this.c);
    paramInt = i + k;
    j -= k;
    if (j == 0)
      return; 
    arrayOfObject = this.a;
    n = gallopLeft(arrayOfObject[paramInt + j - 1], arrayOfObject, m, n, n - 1, this.c);
    if (n == 0)
      return; 
    if (j <= n) {
      mergeLo(paramInt, j, m, n);
    } else {
      mergeHi(paramInt, j, m, n);
    } 
  }
  
  private void mergeCollapse() { // Byte code:
    //   0: aload_0
    //   1: getfield stackSize : I
    //   4: istore_1
    //   5: iload_1
    //   6: iconst_1
    //   7: if_icmple -> 124
    //   10: iload_1
    //   11: iconst_2
    //   12: isub
    //   13: istore_2
    //   14: iload_2
    //   15: iconst_1
    //   16: if_icmplt -> 41
    //   19: aload_0
    //   20: getfield runLen : [I
    //   23: astore_3
    //   24: aload_3
    //   25: iload_2
    //   26: iconst_1
    //   27: isub
    //   28: iaload
    //   29: aload_3
    //   30: iload_2
    //   31: iaload
    //   32: aload_3
    //   33: iload_2
    //   34: iconst_1
    //   35: iadd
    //   36: iaload
    //   37: iadd
    //   38: if_icmple -> 68
    //   41: iload_2
    //   42: iconst_2
    //   43: if_icmplt -> 95
    //   46: aload_0
    //   47: getfield runLen : [I
    //   50: astore_3
    //   51: aload_3
    //   52: iload_2
    //   53: iconst_2
    //   54: isub
    //   55: iaload
    //   56: aload_3
    //   57: iload_2
    //   58: iaload
    //   59: aload_3
    //   60: iload_2
    //   61: iconst_1
    //   62: isub
    //   63: iaload
    //   64: iadd
    //   65: if_icmpgt -> 95
    //   68: aload_0
    //   69: getfield runLen : [I
    //   72: astore_3
    //   73: iload_2
    //   74: istore_1
    //   75: aload_3
    //   76: iload_2
    //   77: iconst_1
    //   78: isub
    //   79: iaload
    //   80: aload_3
    //   81: iload_2
    //   82: iconst_1
    //   83: iadd
    //   84: iaload
    //   85: if_icmpge -> 116
    //   88: iload_2
    //   89: iconst_1
    //   90: isub
    //   91: istore_1
    //   92: goto -> 116
    //   95: aload_0
    //   96: getfield runLen : [I
    //   99: astore_3
    //   100: iload_2
    //   101: istore_1
    //   102: aload_3
    //   103: iload_2
    //   104: iaload
    //   105: aload_3
    //   106: iload_2
    //   107: iconst_1
    //   108: iadd
    //   109: iaload
    //   110: if_icmple -> 116
    //   113: goto -> 124
    //   116: aload_0
    //   117: iload_1
    //   118: invokespecial mergeAt : (I)V
    //   121: goto -> 0
    //   124: return }
  
  private void mergeForceCollapse() {
    while (true) {
      int i = this.stackSize;
      if (i > 1) {
        int j = i - 2;
        i = j;
        if (j > 0) {
          int[] arrayOfInt = this.runLen;
          i = j;
          if (arrayOfInt[j - 1] < arrayOfInt[j + 1])
            i = j - 1; 
        } 
        mergeAt(i);
        continue;
      } 
      break;
    } 
  }
  
  private void mergeHi(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { // Byte code:
    //   0: aload_0
    //   1: getfield a : [Ljava/lang/Object;
    //   4: astore #5
    //   6: aload_0
    //   7: iload #4
    //   9: invokespecial ensureCapacity : (I)[Ljava/lang/Object;
    //   12: astore #6
    //   14: aload #5
    //   16: iload_3
    //   17: aload #6
    //   19: iconst_0
    //   20: iload #4
    //   22: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   25: iload_1
    //   26: iload_2
    //   27: iadd
    //   28: iconst_1
    //   29: isub
    //   30: istore #7
    //   32: iload #4
    //   34: iconst_1
    //   35: isub
    //   36: istore #8
    //   38: iload_3
    //   39: iload #4
    //   41: iadd
    //   42: iconst_1
    //   43: isub
    //   44: istore #9
    //   46: iload #9
    //   48: iconst_1
    //   49: isub
    //   50: istore_3
    //   51: iload #7
    //   53: iconst_1
    //   54: isub
    //   55: istore #10
    //   57: aload #5
    //   59: iload #9
    //   61: aload #5
    //   63: iload #7
    //   65: aaload
    //   66: aastore
    //   67: iload_2
    //   68: iconst_1
    //   69: isub
    //   70: istore #7
    //   72: iload #7
    //   74: ifne -> 92
    //   77: aload #6
    //   79: iconst_0
    //   80: aload #5
    //   82: iload_3
    //   83: iload #8
    //   85: isub
    //   86: iload #4
    //   88: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   91: return
    //   92: iload #4
    //   94: iconst_1
    //   95: if_icmpne -> 132
    //   98: iload_3
    //   99: iload #7
    //   101: isub
    //   102: istore_1
    //   103: aload #5
    //   105: iload #10
    //   107: iload #7
    //   109: isub
    //   110: iconst_1
    //   111: iadd
    //   112: aload #5
    //   114: iload_1
    //   115: iconst_1
    //   116: iadd
    //   117: iload #7
    //   119: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   122: aload #5
    //   124: iload_1
    //   125: aload #6
    //   127: iload #8
    //   129: aaload
    //   130: aastore
    //   131: return
    //   132: aload_0
    //   133: getfield c : Ljava/util/Comparator;
    //   136: astore #11
    //   138: aload_0
    //   139: getfield minGallop : I
    //   142: istore_2
    //   143: iconst_0
    //   144: istore #12
    //   146: iconst_0
    //   147: istore #13
    //   149: iload #7
    //   151: istore #9
    //   153: iload_3
    //   154: istore #14
    //   156: aload #11
    //   158: aload #6
    //   160: iload #8
    //   162: aaload
    //   163: aload #5
    //   165: iload #10
    //   167: aaload
    //   168: invokeinterface compare : (Ljava/lang/Object;Ljava/lang/Object;)I
    //   173: ifge -> 262
    //   176: iload #14
    //   178: iconst_1
    //   179: isub
    //   180: istore #15
    //   182: iload #10
    //   184: iconst_1
    //   185: isub
    //   186: istore_3
    //   187: aload #5
    //   189: iload #14
    //   191: aload #5
    //   193: iload #10
    //   195: aaload
    //   196: aastore
    //   197: iload #13
    //   199: iconst_1
    //   200: iadd
    //   201: istore #16
    //   203: iload #9
    //   205: iconst_1
    //   206: isub
    //   207: istore #7
    //   209: iload #7
    //   211: ifne -> 238
    //   214: iload_3
    //   215: istore #10
    //   217: iload #15
    //   219: istore_1
    //   220: iload #4
    //   222: istore_3
    //   223: iload #8
    //   225: istore #4
    //   227: iload #7
    //   229: istore #9
    //   231: iload #10
    //   233: istore #7
    //   235: goto -> 684
    //   238: iload #15
    //   240: istore #9
    //   242: iload_3
    //   243: istore #15
    //   245: iconst_0
    //   246: istore #17
    //   248: iload #4
    //   250: istore #18
    //   252: iload #8
    //   254: istore #19
    //   256: iload #9
    //   258: istore_3
    //   259: goto -> 338
    //   262: iload #14
    //   264: iconst_1
    //   265: isub
    //   266: istore #7
    //   268: iload #8
    //   270: iconst_1
    //   271: isub
    //   272: istore_3
    //   273: aload #5
    //   275: iload #14
    //   277: aload #6
    //   279: iload #8
    //   281: aaload
    //   282: aastore
    //   283: iload #12
    //   285: iconst_1
    //   286: iadd
    //   287: istore #17
    //   289: iload #4
    //   291: iconst_1
    //   292: isub
    //   293: istore #18
    //   295: iload #18
    //   297: iconst_1
    //   298: if_icmpne -> 317
    //   301: iload #7
    //   303: istore_1
    //   304: iload_3
    //   305: istore #4
    //   307: iload #18
    //   309: istore_3
    //   310: iload #10
    //   312: istore #7
    //   314: goto -> 684
    //   317: iload #7
    //   319: istore #4
    //   321: iload_3
    //   322: istore #19
    //   324: iconst_0
    //   325: istore #16
    //   327: iload #9
    //   329: istore #7
    //   331: iload #10
    //   333: istore #15
    //   335: iload #4
    //   337: istore_3
    //   338: iload #17
    //   340: istore #12
    //   342: iload #18
    //   344: istore #4
    //   346: iload #19
    //   348: istore #8
    //   350: iload_3
    //   351: istore #14
    //   353: iload #15
    //   355: istore #10
    //   357: iload #16
    //   359: istore #13
    //   361: iload #7
    //   363: istore #9
    //   365: iload #16
    //   367: iload #17
    //   369: ior
    //   370: iload_2
    //   371: if_icmplt -> 156
    //   374: iload #15
    //   376: istore #8
    //   378: iload_2
    //   379: istore #4
    //   381: iload #18
    //   383: istore_2
    //   384: iload_3
    //   385: istore #15
    //   387: iload #7
    //   389: istore #10
    //   391: iload #19
    //   393: istore_3
    //   394: iload #10
    //   396: aload #6
    //   398: iload_3
    //   399: aaload
    //   400: aload #5
    //   402: iload_1
    //   403: iload #10
    //   405: iload #10
    //   407: iconst_1
    //   408: isub
    //   409: aload #11
    //   411: invokestatic gallopRight : (Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I
    //   414: isub
    //   415: istore #16
    //   417: iload #10
    //   419: istore #9
    //   421: iload #15
    //   423: istore #19
    //   425: iload #8
    //   427: istore #7
    //   429: iload #16
    //   431: ifeq -> 499
    //   434: iload #15
    //   436: iload #16
    //   438: isub
    //   439: istore #15
    //   441: iload #8
    //   443: iload #16
    //   445: isub
    //   446: istore #7
    //   448: iload #10
    //   450: iload #16
    //   452: isub
    //   453: istore #9
    //   455: aload #5
    //   457: iload #7
    //   459: iconst_1
    //   460: iadd
    //   461: aload #5
    //   463: iload #15
    //   465: iconst_1
    //   466: iadd
    //   467: iload #16
    //   469: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   472: iload #9
    //   474: ifne -> 495
    //   477: iload #15
    //   479: istore_1
    //   480: iload_3
    //   481: istore #10
    //   483: iload_2
    //   484: istore_3
    //   485: iload #4
    //   487: istore_2
    //   488: iload #10
    //   490: istore #4
    //   492: goto -> 684
    //   495: iload #15
    //   497: istore #19
    //   499: iload #19
    //   501: iconst_1
    //   502: isub
    //   503: istore #8
    //   505: iload_3
    //   506: iconst_1
    //   507: isub
    //   508: istore #10
    //   510: aload #5
    //   512: iload #19
    //   514: aload #6
    //   516: iload_3
    //   517: aaload
    //   518: aastore
    //   519: iload_2
    //   520: iconst_1
    //   521: isub
    //   522: istore_3
    //   523: iload_3
    //   524: iconst_1
    //   525: if_icmpne -> 541
    //   528: iload #4
    //   530: istore_2
    //   531: iload #8
    //   533: istore_1
    //   534: iload #10
    //   536: istore #4
    //   538: goto -> 684
    //   541: iload_3
    //   542: aload #5
    //   544: iload #7
    //   546: aaload
    //   547: aload #6
    //   549: iconst_0
    //   550: iload_3
    //   551: iload_3
    //   552: iconst_1
    //   553: isub
    //   554: aload #11
    //   556: invokestatic gallopLeft : (Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I
    //   559: isub
    //   560: istore #19
    //   562: iload #19
    //   564: ifeq -> 628
    //   567: iload #8
    //   569: iload #19
    //   571: isub
    //   572: istore #15
    //   574: iload #10
    //   576: iload #19
    //   578: isub
    //   579: istore_2
    //   580: iload_3
    //   581: iload #19
    //   583: isub
    //   584: istore #10
    //   586: aload #6
    //   588: iload_2
    //   589: iconst_1
    //   590: iadd
    //   591: aload #5
    //   593: iload #15
    //   595: iconst_1
    //   596: iadd
    //   597: iload #19
    //   599: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   602: iload #10
    //   604: iconst_1
    //   605: if_icmpgt -> 620
    //   608: iload #15
    //   610: istore_1
    //   611: iload #10
    //   613: istore_3
    //   614: iload_2
    //   615: istore #10
    //   617: goto -> 485
    //   620: iload_2
    //   621: istore_3
    //   622: iload #10
    //   624: istore_2
    //   625: goto -> 637
    //   628: iload_3
    //   629: istore_2
    //   630: iload #10
    //   632: istore_3
    //   633: iload #8
    //   635: istore #15
    //   637: iload #15
    //   639: iconst_1
    //   640: isub
    //   641: istore #8
    //   643: iload #7
    //   645: iconst_1
    //   646: isub
    //   647: istore #10
    //   649: aload #5
    //   651: iload #15
    //   653: aload #5
    //   655: iload #7
    //   657: aaload
    //   658: aastore
    //   659: iload #9
    //   661: iconst_1
    //   662: isub
    //   663: istore #7
    //   665: iload #7
    //   667: ifne -> 771
    //   670: iload #8
    //   672: istore_1
    //   673: iload #7
    //   675: istore #9
    //   677: iload #10
    //   679: istore #7
    //   681: goto -> 480
    //   684: iload_2
    //   685: istore #10
    //   687: iload_2
    //   688: iconst_1
    //   689: if_icmpge -> 695
    //   692: iconst_1
    //   693: istore #10
    //   695: aload_0
    //   696: iload #10
    //   698: putfield minGallop : I
    //   701: iload_3
    //   702: iconst_1
    //   703: if_icmpne -> 742
    //   706: iload_1
    //   707: iload #9
    //   709: isub
    //   710: istore_1
    //   711: aload #5
    //   713: iload #7
    //   715: iload #9
    //   717: isub
    //   718: iconst_1
    //   719: iadd
    //   720: aload #5
    //   722: iload_1
    //   723: iconst_1
    //   724: iadd
    //   725: iload #9
    //   727: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   730: aload #5
    //   732: iload_1
    //   733: aload #6
    //   735: iload #4
    //   737: aaload
    //   738: aastore
    //   739: goto -> 760
    //   742: iload_3
    //   743: ifeq -> 761
    //   746: aload #6
    //   748: iconst_0
    //   749: aload #5
    //   751: iload_1
    //   752: iload_3
    //   753: iconst_1
    //   754: isub
    //   755: isub
    //   756: iload_3
    //   757: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   760: return
    //   761: new java/lang/IllegalArgumentException
    //   764: dup
    //   765: ldc 'Comparison method violates its general contract!'
    //   767: invokespecial <init> : (Ljava/lang/String;)V
    //   770: athrow
    //   771: iinc #4, -1
    //   774: iload #16
    //   776: bipush #7
    //   778: if_icmplt -> 787
    //   781: iconst_1
    //   782: istore #9
    //   784: goto -> 790
    //   787: iconst_0
    //   788: istore #9
    //   790: iload #19
    //   792: bipush #7
    //   794: if_icmplt -> 803
    //   797: iconst_1
    //   798: istore #15
    //   800: goto -> 806
    //   803: iconst_0
    //   804: istore #15
    //   806: iload #15
    //   808: iload #9
    //   810: ior
    //   811: ifne -> 851
    //   814: iload #4
    //   816: istore #15
    //   818: iload #4
    //   820: ifge -> 826
    //   823: iconst_0
    //   824: istore #15
    //   826: iload #8
    //   828: istore #9
    //   830: iload #15
    //   832: iconst_2
    //   833: iadd
    //   834: istore #8
    //   836: iload_2
    //   837: istore #4
    //   839: iload #8
    //   841: istore_2
    //   842: iload_3
    //   843: istore #8
    //   845: iload #9
    //   847: istore_3
    //   848: goto -> 143
    //   851: iload #10
    //   853: istore #9
    //   855: iload #7
    //   857: istore #10
    //   859: iload #8
    //   861: istore #15
    //   863: iload #9
    //   865: istore #8
    //   867: goto -> 394 }
  
  private void mergeLo(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    Object[] arrayOfObject1 = this.a;
    Object[] arrayOfObject2 = ensureCapacity(paramInt2);
    System.arraycopy(arrayOfObject1, paramInt1, arrayOfObject2, 0, paramInt2);
    int i = paramInt1 + 1;
    int j = paramInt3 + 1;
    arrayOfObject1[paramInt1] = arrayOfObject1[paramInt3];
    int k = paramInt4 - 1;
    if (k == 0) {
      System.arraycopy(arrayOfObject2, 0, arrayOfObject1, i, paramInt2);
      return;
    } 
    if (paramInt2 == 1) {
      System.arraycopy(arrayOfObject1, j, arrayOfObject1, i, k);
      arrayOfObject1[i + k] = arrayOfObject2[0];
      return;
    } 
    Comparator comparator = this.c;
    paramInt1 = this.minGallop;
    paramInt4 = 0;
    paramInt3 = j;
    j = paramInt2;
    paramInt2 = k;
    while (true) {
      int m = 0;
      int n = 0;
      int i1 = i;
      while (true) {
        m = i1;
        i1 = paramInt2;
        n = k;
        paramInt2 = i;
      } 
      break;
    } 
  }
  
  private static int minRunLength(int paramInt) {
    int i = 0;
    while (paramInt >= 32) {
      i |= paramInt & true;
      paramInt >>= 1;
    } 
    return paramInt + i;
  }
  
  private void pushRun(int paramInt1, int paramInt2) {
    int[] arrayOfInt = this.runBase;
    int i = this.stackSize;
    arrayOfInt[i] = paramInt1;
    this.runLen[i] = paramInt2;
    this.stackSize = i + 1;
  }
  
  private static void rangeCheck(int paramInt1, int paramInt2, int paramInt3) {
    if (paramInt2 <= paramInt3) {
      if (paramInt2 >= 0) {
        if (paramInt3 <= paramInt1)
          return; 
        throw new ArrayIndexOutOfBoundsException(paramInt3);
      } 
      throw new ArrayIndexOutOfBoundsException(paramInt2);
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("fromIndex(");
    stringBuilder.append(paramInt2);
    stringBuilder.append(") > toIndex(");
    stringBuilder.append(paramInt3);
    stringBuilder.append(")");
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  private static void reverseRange(Object[] paramArrayOfObject, int paramInt1, int paramInt2) {
    while (paramInt1 < --paramInt2) {
      Object object = paramArrayOfObject[paramInt1];
      paramArrayOfObject[paramInt1] = paramArrayOfObject[paramInt2];
      paramArrayOfObject[paramInt2] = object;
      paramInt2--;
      paramInt1++;
    } 
  }
  
  static <T> void sort(T[] paramArrayOfT, int paramInt1, int paramInt2, Comparator<? super T> paramComparator) {
    if (paramComparator == null) {
      Arrays.sort(paramArrayOfT, paramInt1, paramInt2);
      return;
    } 
    rangeCheck(paramArrayOfT.length, paramInt1, paramInt2);
    int i = paramInt2 - paramInt1;
    if (i < 2)
      return; 
    if (i < 32) {
      binarySort(paramArrayOfT, paramInt1, paramInt2, countRunAndMakeAscending(paramArrayOfT, paramInt1, paramInt2, paramComparator) + paramInt1, paramComparator);
      return;
    } 
    TimSort timSort;
    int j = (timSort = new TimSort(paramArrayOfT, paramComparator)).minRunLength(i);
    int k = paramInt1;
    paramInt1 = i;
    do {
      int m = countRunAndMakeAscending(paramArrayOfT, k, paramInt2, paramComparator);
      i = m;
      if (m < j) {
        if (paramInt1 <= j) {
          i = paramInt1;
        } else {
          i = j;
        } 
        binarySort(paramArrayOfT, k, k + i, m + k, paramComparator);
      } 
      timSort.pushRun(k, i);
      timSort.mergeCollapse();
      k += i;
      i = paramInt1 - i;
      paramInt1 = i;
    } while (i != 0);
    timSort.mergeForceCollapse();
  }
  
  static <T> void sort(T[] paramArrayOfT, Comparator<? super T> paramComparator) { sort(paramArrayOfT, 0, paramArrayOfT.length, paramComparator); }
  
  public void doSort(T[] paramArrayOfT, Comparator<T> paramComparator, int paramInt1, int paramInt2) {
    int i = 0;
    this.stackSize = 0;
    rangeCheck(paramArrayOfT.length, paramInt1, paramInt2);
    int j = paramInt2 - paramInt1;
    if (j < 2)
      return; 
    if (j < 32) {
      binarySort(paramArrayOfT, paramInt1, paramInt2, countRunAndMakeAscending(paramArrayOfT, paramInt1, paramInt2, paramComparator) + paramInt1, paramComparator);
      return;
    } 
    this.a = paramArrayOfT;
    this.c = paramComparator;
    this.tmpCount = 0;
    int k = minRunLength(j);
    int m = paramInt1;
    paramInt1 = j;
    do {
      int n = countRunAndMakeAscending(paramArrayOfT, m, paramInt2, paramComparator);
      j = n;
      if (n < k) {
        if (paramInt1 <= k) {
          j = paramInt1;
        } else {
          j = k;
        } 
        binarySort(paramArrayOfT, m, m + j, n + m, paramComparator);
      } 
      pushRun(m, j);
      mergeCollapse();
      m += j;
      j = paramInt1 - j;
      paramInt1 = j;
    } while (j != 0);
    mergeForceCollapse();
    this.a = null;
    this.c = null;
    paramArrayOfT = (T[])this.tmp;
    paramInt2 = this.tmpCount;
    for (paramInt1 = i; paramInt1 < paramInt2; paramInt1++)
      paramArrayOfT[paramInt1] = null; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/TimSort.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */