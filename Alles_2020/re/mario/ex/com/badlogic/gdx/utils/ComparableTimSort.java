package com.badlogic.gdx.utils;

class ComparableTimSort {
  private static final boolean DEBUG = false;
  
  private static final int INITIAL_TMP_STORAGE_LENGTH = 256;
  
  private static final int MIN_GALLOP = 7;
  
  private static final int MIN_MERGE = 32;
  
  private Object[] a;
  
  private int minGallop = 7;
  
  private final int[] runBase;
  
  private final int[] runLen;
  
  private int stackSize = 0;
  
  private Object[] tmp;
  
  private int tmpCount;
  
  ComparableTimSort() {
    this.tmp = new Object[256];
    this.runBase = new int[40];
    this.runLen = new int[40];
  }
  
  private ComparableTimSort(Object[] paramArrayOfObject) {
    this.a = paramArrayOfObject;
    int i = paramArrayOfObject.length;
    if (i < 512) {
      c = i >>> 1;
    } else {
      c = 'Ā';
    } 
    this.tmp = new Object[c];
    if (i < 120) {
      c = '\005';
    } else if (i < 1542) {
      c = '\n';
    } else if (i < 119151) {
      c = '\023';
    } else {
      c = '(';
    } 
    this.runBase = new int[c];
    this.runLen = new int[c];
  }
  
  private static void binarySort(Object[] paramArrayOfObject, int paramInt1, int paramInt2, int paramInt3) { // Byte code:
    //   0: iload_3
    //   1: istore #4
    //   3: iload_3
    //   4: iload_1
    //   5: if_icmpne -> 13
    //   8: iload_3
    //   9: iconst_1
    //   10: iadd
    //   11: istore #4
    //   13: iload #4
    //   15: iload_2
    //   16: if_icmpge -> 138
    //   19: aload_0
    //   20: iload #4
    //   22: aaload
    //   23: checkcast java/lang/Comparable
    //   26: astore #5
    //   28: iload_1
    //   29: istore_3
    //   30: iload #4
    //   32: istore #6
    //   34: iload_3
    //   35: iload #6
    //   37: if_icmpge -> 77
    //   40: iload_3
    //   41: iload #6
    //   43: iadd
    //   44: iconst_1
    //   45: iushr
    //   46: istore #7
    //   48: aload #5
    //   50: aload_0
    //   51: iload #7
    //   53: aaload
    //   54: invokeinterface compareTo : (Ljava/lang/Object;)I
    //   59: ifge -> 69
    //   62: iload #7
    //   64: istore #6
    //   66: goto -> 34
    //   69: iload #7
    //   71: iconst_1
    //   72: iadd
    //   73: istore_3
    //   74: goto -> 34
    //   77: iload #4
    //   79: iload_3
    //   80: isub
    //   81: istore #6
    //   83: iload #6
    //   85: iconst_1
    //   86: if_icmpeq -> 119
    //   89: iload #6
    //   91: iconst_2
    //   92: if_icmpeq -> 109
    //   95: aload_0
    //   96: iload_3
    //   97: aload_0
    //   98: iload_3
    //   99: iconst_1
    //   100: iadd
    //   101: iload #6
    //   103: invokestatic arraycopy : (Ljava/lang/Object;ILjava/lang/Object;II)V
    //   106: goto -> 127
    //   109: aload_0
    //   110: iload_3
    //   111: iconst_2
    //   112: iadd
    //   113: aload_0
    //   114: iload_3
    //   115: iconst_1
    //   116: iadd
    //   117: aaload
    //   118: aastore
    //   119: aload_0
    //   120: iload_3
    //   121: iconst_1
    //   122: iadd
    //   123: aload_0
    //   124: iload_3
    //   125: aaload
    //   126: aastore
    //   127: aload_0
    //   128: iload_3
    //   129: aload #5
    //   131: aastore
    //   132: iload #4
    //   134: istore_3
    //   135: goto -> 8
    //   138: return }
  
  private static int countRunAndMakeAscending(Object[] paramArrayOfObject, int paramInt1, int paramInt2) {
    int i = paramInt1 + 1;
    if (i == paramInt2)
      return 1; 
    int j = i + 1;
    int k = j;
    if (((Comparable)paramArrayOfObject[i]).compareTo(paramArrayOfObject[paramInt1]) < 0) {
      for (k = j; k < paramInt2 && ((Comparable)paramArrayOfObject[k]).compareTo(paramArrayOfObject[k - 1]) < 0; k++);
      reverseRange(paramArrayOfObject, paramInt1, k);
      j = k;
    } else {
      while (true) {
        j = k;
        if (k < paramInt2) {
          j = k;
          if (((Comparable)paramArrayOfObject[k]).compareTo(paramArrayOfObject[k - 1]) >= 0) {
            k++;
            continue;
          } 
        } 
        break;
      } 
    } 
    return j - paramInt1;
  }
  
  private Object[] ensureCapacity(int paramInt) {
    this.tmpCount = Math.max(this.tmpCount, paramInt);
    if (this.tmp.length < paramInt) {
      int i = paramInt >> 1 | paramInt;
      i |= i >> 2;
      i |= i >> 4;
      i |= i >> 8;
      i = (i | i >> 16) + 1;
      if (i >= 0)
        paramInt = Math.min(i, this.a.length >>> 1); 
      this.tmp = new Object[paramInt];
    } 
    return this.tmp;
  }
  
  private static int gallopLeft(Comparable<Object> paramComparable, Object[] paramArrayOfObject, int paramInt1, int paramInt2, int paramInt3) {
    int i = paramInt1 + paramInt3;
    if (paramComparable.compareTo(paramArrayOfObject[i]) > 0) {
      int j = paramInt2 - paramInt3;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparable.compareTo(paramArrayOfObject[i + paramInt2]) > 0; paramInt2 = m) {
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
      paramInt2 = j + paramInt3;
      paramInt3 = k + paramInt3;
    } else {
      int j = paramInt3 + 1;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparable.compareTo(paramArrayOfObject[i - paramInt2]) <= 0; paramInt2 = m) {
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
      if (paramComparable.compareTo(paramArrayOfObject[paramInt1 + j]) > 0) {
        paramInt3 = j + 1;
        continue;
      } 
      paramInt2 = j;
    } 
    return paramInt2;
  }
  
  private static int gallopRight(Comparable<Object> paramComparable, Object[] paramArrayOfObject, int paramInt1, int paramInt2, int paramInt3) {
    int i = paramInt1 + paramInt3;
    if (paramComparable.compareTo(paramArrayOfObject[i]) < 0) {
      int j = paramInt3 + 1;
      int k = 0;
      for (paramInt2 = 1; paramInt2 < j && paramComparable.compareTo(paramArrayOfObject[i - paramInt2]) < 0; paramInt2 = m) {
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
      for (paramInt2 = 1; paramInt2 < j && paramComparable.compareTo(paramArrayOfObject[i + paramInt2]) >= 0; paramInt2 = m) {
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
      paramInt2 = paramInt3 + paramInt2;
      paramInt3 = k + paramInt3;
    } 
    while (++paramInt3 < paramInt2) {
      int j = (paramInt2 - paramInt3 >>> 1) + paramInt3;
      if (paramComparable.compareTo(paramArrayOfObject[paramInt1 + j]) < 0) {
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
    k = gallopRight((Comparable)arrayOfObject[m], arrayOfObject, i, j, 0);
    paramInt = i + k;
    j -= k;
    if (j == 0)
      return; 
    arrayOfObject = this.a;
    n = gallopLeft((Comparable)arrayOfObject[paramInt + j - 1], arrayOfObject, m, n, n - 1);
    if (n == 0)
      return; 
    if (j <= n) {
      mergeLo(paramInt, j, m, n);
    } else {
      mergeHi(paramInt, j, m, n);
    } 
  }
  
  private void mergeCollapse() {
    while (true) {
      int i = this.stackSize;
      if (i > 1) {
        int j = i - 2;
        if (j > 0) {
          int[] arrayOfInt1 = this.runLen;
          int k = j - 1;
          i = arrayOfInt1[k];
          int m = arrayOfInt1[j];
          int n = j + 1;
          if (i <= m + arrayOfInt1[n]) {
            i = j;
            if (arrayOfInt1[k] < arrayOfInt1[n])
              i = j - 1; 
            mergeAt(i);
            continue;
          } 
        } 
        int[] arrayOfInt = this.runLen;
        if (arrayOfInt[j] <= arrayOfInt[j + 1]) {
          mergeAt(j);
          continue;
        } 
      } 
      break;
    } 
  }
  
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
  
  private void mergeHi(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    Object[] arrayOfObject1 = this.a;
    Object[] arrayOfObject2 = ensureCapacity(paramInt4);
    System.arraycopy(arrayOfObject1, paramInt3, arrayOfObject2, 0, paramInt4);
    int i = paramInt1 + paramInt2 - 1;
    int j = paramInt4 - 1;
    paramInt3 = paramInt3 + paramInt4 - 1;
    int k = paramInt3 - 1;
    int m = i - 1;
    arrayOfObject1[paramInt3] = arrayOfObject1[i];
    i = paramInt2 - 1;
    if (i == 0) {
      System.arraycopy(arrayOfObject2, 0, arrayOfObject1, k - j, paramInt4);
      return;
    } 
    if (paramInt4 == 1) {
      paramInt1 = k - i;
      System.arraycopy(arrayOfObject1, m - i + 1, arrayOfObject1, paramInt1 + 1, i);
      arrayOfObject1[paramInt1] = arrayOfObject2[j];
      return;
    } 
    paramInt2 = this.minGallop;
    paramInt3 = paramInt4;
    paramInt4 = i;
    while (true) {
      byte b1 = 0;
      byte b2 = 0;
      i = paramInt3;
      int n = k;
      while (true) {
        int i4;
        int i3;
        byte b;
        int i2;
        int i1;
        if (((Comparable)arrayOfObject2[j]).compareTo(arrayOfObject1[m]) < 0) {
          k = n - 1;
          paramInt3 = m - 1;
          arrayOfObject1[n] = arrayOfObject1[m];
          i1 = b2 + true;
          m = paramInt4 - 1;
          if (m == 0) {
            paramInt1 = k;
            paramInt4 = paramInt3;
            paramInt3 = j;
            j = paramInt2;
            paramInt2 = i;
            break;
          } 
          paramInt4 = k;
          i2 = paramInt3;
          b = 0;
          k = j;
          paramInt3 = paramInt4;
          i3 = m;
          i4 = i;
        } else {
          i2 = n - 1;
          paramInt3 = j - 1;
          arrayOfObject1[n] = arrayOfObject2[j];
          b = b1 + true;
          if (--i == 1) {
            k = paramInt4;
            paramInt4 = m;
            paramInt1 = i2;
            continue;
          } 
          j = i2;
          k = paramInt3;
          i1 = 0;
          i4 = i;
          i3 = paramInt4;
          i2 = m;
          paramInt3 = j;
        } 
        b2 = i1;
        j = k;
        n = paramInt3;
        m = i2;
        paramInt4 = i3;
        b1 = b;
        i = i4;
        if ((i1 | b) >= paramInt2) {
          i = i4;
          j = paramInt2;
          m = i3;
          paramInt4 = i2;
          paramInt2 = paramInt3;
          while (true) {
            i1 = m - gallopRight((Comparable)arrayOfObject2[k], arrayOfObject1, paramInt1, m, m - 1);
            paramInt4 = paramInt2;
            paramInt2 = k;
            k = paramInt4;
            paramInt4 = i;
            i = paramInt3;
          } 
        } 
      } 
      continue;
    } 
  }
  
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
    paramInt1 = this.minGallop;
    paramInt4 = 0;
    paramInt3 = paramInt2;
    paramInt2 = i;
    while (true) {
      byte b = 0;
      int m = 0;
      int n = paramInt2;
      while (true) {
        int i5;
        int i4;
        int i3;
        int i2;
        int i1;
        if (((Comparable)arrayOfObject1[j]).compareTo(arrayOfObject2[paramInt4]) < 0) {
          i = n + 1;
          paramInt2 = j + 1;
          arrayOfObject1[n] = arrayOfObject1[j];
          j = m + true;
          if (--k == 0) {
            j = paramInt4;
            paramInt4 = i;
            continue;
          } 
          i1 = paramInt2;
          i2 = 0;
          paramInt2 = i;
          i3 = paramInt3;
          i = j;
          i4 = k;
          i5 = paramInt4;
        } else {
          i = n + 1;
          i1 = paramInt4 + 1;
          arrayOfObject1[n] = arrayOfObject2[paramInt4];
          i2 = b + true;
          if (--paramInt3 == 1) {
            paramInt2 = j;
            paramInt4 = i;
            j = i1;
            i = paramInt1;
            break;
          } 
          paramInt2 = i;
          i = 0;
          i5 = i1;
          i4 = k;
          i3 = paramInt3;
          i1 = j;
        } 
        n = paramInt2;
        j = i1;
        paramInt3 = i3;
        m = i;
        k = i4;
        paramInt4 = i5;
        b = i2;
        if ((i2 | i) >= paramInt1) {
          i = paramInt1;
          paramInt1 = i4;
          while (true) {
            i2 = gallopRight((Comparable)arrayOfObject1[i1], arrayOfObject2, i5, i3, 0);
            paramInt4 = paramInt2;
            paramInt3 = i3;
            j = i5;
            i1 = paramInt2;
            paramInt2 = k;
            i3 = paramInt3;
            i5 = paramInt4;
          } 
        } 
      } 
      continue;
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
  
  static void sort(Object[] paramArrayOfObject) { sort(paramArrayOfObject, 0, paramArrayOfObject.length); }
  
  static void sort(Object[] paramArrayOfObject, int paramInt1, int paramInt2) {
    rangeCheck(paramArrayOfObject.length, paramInt1, paramInt2);
    int i = paramInt2 - paramInt1;
    if (i < 2)
      return; 
    if (i < 32) {
      binarySort(paramArrayOfObject, paramInt1, paramInt2, countRunAndMakeAscending(paramArrayOfObject, paramInt1, paramInt2) + paramInt1);
      return;
    } 
    ComparableTimSort comparableTimSort;
    int j = (comparableTimSort = new ComparableTimSort(paramArrayOfObject)).minRunLength(i);
    int k = paramInt1;
    paramInt1 = i;
    do {
      int m = countRunAndMakeAscending(paramArrayOfObject, k, paramInt2);
      i = m;
      if (m < j) {
        if (paramInt1 <= j) {
          i = paramInt1;
        } else {
          i = j;
        } 
        binarySort(paramArrayOfObject, k, k + i, m + k);
      } 
      comparableTimSort.pushRun(k, i);
      comparableTimSort.mergeCollapse();
      k += i;
      i = paramInt1 - i;
      paramInt1 = i;
    } while (i != 0);
    comparableTimSort.mergeForceCollapse();
  }
  
  public void doSort(Object[] paramArrayOfObject, int paramInt1, int paramInt2) {
    int i = 0;
    this.stackSize = 0;
    rangeCheck(paramArrayOfObject.length, paramInt1, paramInt2);
    int j = paramInt2 - paramInt1;
    if (j < 2)
      return; 
    if (j < 32) {
      binarySort(paramArrayOfObject, paramInt1, paramInt2, countRunAndMakeAscending(paramArrayOfObject, paramInt1, paramInt2) + paramInt1);
      return;
    } 
    this.a = paramArrayOfObject;
    this.tmpCount = 0;
    int k = minRunLength(j);
    int m = paramInt1;
    paramInt1 = j;
    do {
      int n = countRunAndMakeAscending(paramArrayOfObject, m, paramInt2);
      j = n;
      if (n < k) {
        if (paramInt1 <= k) {
          j = paramInt1;
        } else {
          j = k;
        } 
        binarySort(paramArrayOfObject, m, m + j, n + m);
      } 
      pushRun(m, j);
      mergeCollapse();
      m += j;
      j = paramInt1 - j;
      paramInt1 = j;
    } while (j != 0);
    mergeForceCollapse();
    this.a = null;
    paramArrayOfObject = this.tmp;
    paramInt2 = this.tmpCount;
    for (paramInt1 = i; paramInt1 < paramInt2; paramInt1++)
      paramArrayOfObject[paramInt1] = null; 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/ComparableTimSort.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */