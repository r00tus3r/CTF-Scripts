package com.badlogic.gdx.utils.compression.lz;

import java.io.IOException;

public class BinTree extends InWindow {
  private static final int[] CrcTable = new int[256];
  
  static final int kBT2HashSize = 65536;
  
  static final int kEmptyHashValue = 0;
  
  static final int kHash2Size = 1024;
  
  static final int kHash3Offset = 1024;
  
  static final int kHash3Size = 65536;
  
  static final int kMaxValForNormalize = 1073741823;
  
  static final int kStartMaxLen = 1;
  
  boolean HASH_ARRAY = true;
  
  int _cutValue = 255;
  
  int _cyclicBufferPos;
  
  int _cyclicBufferSize = 0;
  
  int[] _hash;
  
  int _hashMask;
  
  int _hashSizeSum = 0;
  
  int _matchMaxLen;
  
  int[] _son;
  
  int kFixHashSize = 66560;
  
  int kMinMatchCheck = 4;
  
  int kNumHashDirectBytes = 0;
  
  static  {
    for (byte b = 0; b < 'Ā'; b++) {
      int i = b;
      for (byte b1 = 0; b1 < 8; b1++) {
        if (i & true) {
          i = i >>> true ^ 0xEDB88320;
        } else {
          i >>>= 1;
        } 
      } 
      CrcTable[b] = i;
    } 
  }
  
  public boolean Create(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    if (paramInt1 > 1073741567)
      return false; 
    this._cutValue = (paramInt3 >> 1) + 16;
    paramInt2 += paramInt1;
    Create(paramInt2, paramInt4 + paramInt3, (paramInt2 + paramInt3 + paramInt4) / 2 + 256);
    this._matchMaxLen = paramInt3;
    paramInt2 = paramInt1 + 1;
    if (this._cyclicBufferSize != paramInt2) {
      this._cyclicBufferSize = paramInt2;
      this._son = new int[paramInt2 * 2];
    } 
    paramInt2 = 65536;
    if (this.HASH_ARRAY) {
      paramInt1 = --paramInt1 | paramInt1 >> 1;
      paramInt1 |= paramInt1 >> 2;
      paramInt1 |= paramInt1 >> 4;
      paramInt2 = (paramInt1 | paramInt1 >> 8) >> 1 | 0xFFFF;
      paramInt1 = paramInt2;
      if (paramInt2 > 16777216)
        paramInt1 = paramInt2 >> 1; 
      this._hashMask = paramInt1;
      paramInt2 = this.kFixHashSize + paramInt1 + 1;
    } 
    if (paramInt2 != this._hashSizeSum) {
      this._hashSizeSum = paramInt2;
      this._hash = new int[paramInt2];
    } 
    return true;
  }
  
  public int GetMatches(int[] paramArrayOfInt) throws IOException { // Byte code:
    //   0: aload_0
    //   1: getfield _pos : I
    //   4: aload_0
    //   5: getfield _matchMaxLen : I
    //   8: iadd
    //   9: aload_0
    //   10: getfield _streamPos : I
    //   13: if_icmpgt -> 24
    //   16: aload_0
    //   17: getfield _matchMaxLen : I
    //   20: istore_2
    //   21: goto -> 50
    //   24: aload_0
    //   25: getfield _streamPos : I
    //   28: aload_0
    //   29: getfield _pos : I
    //   32: isub
    //   33: istore_3
    //   34: iload_3
    //   35: istore_2
    //   36: iload_3
    //   37: aload_0
    //   38: getfield kMinMatchCheck : I
    //   41: if_icmpge -> 50
    //   44: aload_0
    //   45: invokevirtual MovePos : ()V
    //   48: iconst_0
    //   49: ireturn
    //   50: aload_0
    //   51: getfield _pos : I
    //   54: aload_0
    //   55: getfield _cyclicBufferSize : I
    //   58: if_icmple -> 75
    //   61: aload_0
    //   62: getfield _pos : I
    //   65: aload_0
    //   66: getfield _cyclicBufferSize : I
    //   69: isub
    //   70: istore #4
    //   72: goto -> 78
    //   75: iconst_0
    //   76: istore #4
    //   78: aload_0
    //   79: getfield _bufferOffset : I
    //   82: aload_0
    //   83: getfield _pos : I
    //   86: iadd
    //   87: istore #5
    //   89: aload_0
    //   90: getfield HASH_ARRAY : Z
    //   93: ifeq -> 194
    //   96: getstatic com/badlogic/gdx/utils/compression/lz/BinTree.CrcTable : [I
    //   99: aload_0
    //   100: getfield _bufferBase : [B
    //   103: iload #5
    //   105: baload
    //   106: sipush #255
    //   109: iand
    //   110: iaload
    //   111: aload_0
    //   112: getfield _bufferBase : [B
    //   115: iload #5
    //   117: iconst_1
    //   118: iadd
    //   119: baload
    //   120: sipush #255
    //   123: iand
    //   124: ixor
    //   125: istore #6
    //   127: iload #6
    //   129: sipush #1023
    //   132: iand
    //   133: istore_3
    //   134: iload #6
    //   136: aload_0
    //   137: getfield _bufferBase : [B
    //   140: iload #5
    //   142: iconst_2
    //   143: iadd
    //   144: baload
    //   145: sipush #255
    //   148: iand
    //   149: bipush #8
    //   151: ishl
    //   152: ixor
    //   153: istore #7
    //   155: ldc 65535
    //   157: iload #7
    //   159: iand
    //   160: istore #6
    //   162: iload #7
    //   164: getstatic com/badlogic/gdx/utils/compression/lz/BinTree.CrcTable : [I
    //   167: aload_0
    //   168: getfield _bufferBase : [B
    //   171: iload #5
    //   173: iconst_3
    //   174: iadd
    //   175: baload
    //   176: sipush #255
    //   179: iand
    //   180: iaload
    //   181: iconst_5
    //   182: ishl
    //   183: ixor
    //   184: aload_0
    //   185: getfield _hashMask : I
    //   188: iand
    //   189: istore #8
    //   191: goto -> 229
    //   194: aload_0
    //   195: getfield _bufferBase : [B
    //   198: iload #5
    //   200: baload
    //   201: sipush #255
    //   204: iand
    //   205: aload_0
    //   206: getfield _bufferBase : [B
    //   209: iload #5
    //   211: iconst_1
    //   212: iadd
    //   213: baload
    //   214: sipush #255
    //   217: iand
    //   218: bipush #8
    //   220: ishl
    //   221: ixor
    //   222: istore #8
    //   224: iconst_0
    //   225: istore_3
    //   226: iconst_0
    //   227: istore #6
    //   229: aload_0
    //   230: getfield _hash : [I
    //   233: astore #9
    //   235: aload #9
    //   237: aload_0
    //   238: getfield kFixHashSize : I
    //   241: iload #8
    //   243: iadd
    //   244: iaload
    //   245: istore #10
    //   247: aload_0
    //   248: getfield HASH_ARRAY : Z
    //   251: ifeq -> 484
    //   254: aload #9
    //   256: iload_3
    //   257: iaload
    //   258: istore #11
    //   260: wide iinc #6 1024
    //   266: aload #9
    //   268: iload #6
    //   270: iaload
    //   271: istore #12
    //   273: aload #9
    //   275: iload_3
    //   276: aload_0
    //   277: getfield _pos : I
    //   280: iastore
    //   281: aload_0
    //   282: getfield _hash : [I
    //   285: iload #6
    //   287: aload_0
    //   288: getfield _pos : I
    //   291: iastore
    //   292: iconst_2
    //   293: istore_3
    //   294: iload #11
    //   296: iload #4
    //   298: if_icmple -> 345
    //   301: aload_0
    //   302: getfield _bufferBase : [B
    //   305: aload_0
    //   306: getfield _bufferOffset : I
    //   309: iload #11
    //   311: iadd
    //   312: baload
    //   313: aload_0
    //   314: getfield _bufferBase : [B
    //   317: iload #5
    //   319: baload
    //   320: if_icmpne -> 345
    //   323: aload_1
    //   324: iconst_0
    //   325: iconst_2
    //   326: iastore
    //   327: aload_1
    //   328: iconst_1
    //   329: aload_0
    //   330: getfield _pos : I
    //   333: iload #11
    //   335: isub
    //   336: iconst_1
    //   337: isub
    //   338: iastore
    //   339: iconst_2
    //   340: istore #6
    //   342: goto -> 350
    //   345: iconst_0
    //   346: istore_3
    //   347: iconst_1
    //   348: istore #6
    //   350: iload_3
    //   351: istore #13
    //   353: iload #6
    //   355: istore #7
    //   357: iload #11
    //   359: istore #14
    //   361: iload #12
    //   363: iload #4
    //   365: if_icmple -> 450
    //   368: iload_3
    //   369: istore #13
    //   371: iload #6
    //   373: istore #7
    //   375: iload #11
    //   377: istore #14
    //   379: aload_0
    //   380: getfield _bufferBase : [B
    //   383: aload_0
    //   384: getfield _bufferOffset : I
    //   387: iload #12
    //   389: iadd
    //   390: baload
    //   391: aload_0
    //   392: getfield _bufferBase : [B
    //   395: iload #5
    //   397: baload
    //   398: if_icmpne -> 450
    //   401: iload_3
    //   402: istore #6
    //   404: iload #12
    //   406: iload #11
    //   408: if_icmpne -> 416
    //   411: iload_3
    //   412: iconst_2
    //   413: isub
    //   414: istore #6
    //   416: iload #6
    //   418: iconst_1
    //   419: iadd
    //   420: istore_3
    //   421: aload_1
    //   422: iload #6
    //   424: iconst_3
    //   425: iastore
    //   426: iload_3
    //   427: iconst_1
    //   428: iadd
    //   429: istore #13
    //   431: aload_1
    //   432: iload_3
    //   433: aload_0
    //   434: getfield _pos : I
    //   437: iload #12
    //   439: isub
    //   440: iconst_1
    //   441: isub
    //   442: iastore
    //   443: iload #12
    //   445: istore #14
    //   447: iconst_3
    //   448: istore #7
    //   450: iload #13
    //   452: istore_3
    //   453: iload #7
    //   455: istore #6
    //   457: iload #13
    //   459: ifeq -> 489
    //   462: iload #13
    //   464: istore_3
    //   465: iload #7
    //   467: istore #6
    //   469: iload #14
    //   471: iload #10
    //   473: if_icmpne -> 489
    //   476: iload #13
    //   478: iconst_2
    //   479: isub
    //   480: istore_3
    //   481: goto -> 486
    //   484: iconst_0
    //   485: istore_3
    //   486: iconst_1
    //   487: istore #6
    //   489: aload_0
    //   490: getfield _hash : [I
    //   493: aload_0
    //   494: getfield kFixHashSize : I
    //   497: iload #8
    //   499: iadd
    //   500: aload_0
    //   501: getfield _pos : I
    //   504: iastore
    //   505: aload_0
    //   506: getfield _cyclicBufferPos : I
    //   509: istore #7
    //   511: iload #7
    //   513: iconst_1
    //   514: ishl
    //   515: iconst_1
    //   516: iadd
    //   517: istore #14
    //   519: iload #7
    //   521: iconst_1
    //   522: ishl
    //   523: istore #12
    //   525: aload_0
    //   526: getfield kNumHashDirectBytes : I
    //   529: istore #8
    //   531: iload #8
    //   533: ifeq -> 622
    //   536: iload #10
    //   538: iload #4
    //   540: if_icmple -> 622
    //   543: aload_0
    //   544: getfield _bufferBase : [B
    //   547: aload_0
    //   548: getfield _bufferOffset : I
    //   551: iload #10
    //   553: iadd
    //   554: aload_0
    //   555: getfield kNumHashDirectBytes : I
    //   558: iadd
    //   559: baload
    //   560: istore #13
    //   562: aload_0
    //   563: getfield _bufferBase : [B
    //   566: astore #9
    //   568: aload_0
    //   569: getfield kNumHashDirectBytes : I
    //   572: istore #7
    //   574: iload #13
    //   576: aload #9
    //   578: iload #5
    //   580: iload #7
    //   582: iadd
    //   583: baload
    //   584: if_icmpeq -> 622
    //   587: iload_3
    //   588: iconst_1
    //   589: iadd
    //   590: istore #6
    //   592: aload_1
    //   593: iload_3
    //   594: iload #7
    //   596: iastore
    //   597: iload #6
    //   599: iconst_1
    //   600: iadd
    //   601: istore_3
    //   602: aload_1
    //   603: iload #6
    //   605: aload_0
    //   606: getfield _pos : I
    //   609: iload #10
    //   611: isub
    //   612: iconst_1
    //   613: isub
    //   614: iastore
    //   615: iload #7
    //   617: istore #6
    //   619: goto -> 622
    //   622: aload_0
    //   623: getfield _cutValue : I
    //   626: istore #13
    //   628: iload_3
    //   629: istore #7
    //   631: iload #8
    //   633: istore_3
    //   634: iload #6
    //   636: istore #11
    //   638: iload #7
    //   640: istore #6
    //   642: iload #13
    //   644: istore #7
    //   646: iload #4
    //   648: istore #13
    //   650: iload #10
    //   652: iload #13
    //   654: if_icmple -> 985
    //   657: iload #7
    //   659: ifne -> 665
    //   662: goto -> 985
    //   665: aload_0
    //   666: getfield _pos : I
    //   669: iload #10
    //   671: isub
    //   672: istore #15
    //   674: aload_0
    //   675: getfield _cyclicBufferPos : I
    //   678: istore #4
    //   680: iload #15
    //   682: iload #4
    //   684: if_icmpgt -> 697
    //   687: iload #4
    //   689: iload #15
    //   691: isub
    //   692: istore #4
    //   694: goto -> 709
    //   697: iload #4
    //   699: iload #15
    //   701: isub
    //   702: aload_0
    //   703: getfield _cyclicBufferSize : I
    //   706: iadd
    //   707: istore #4
    //   709: iload #4
    //   711: iconst_1
    //   712: ishl
    //   713: istore #16
    //   715: aload_0
    //   716: getfield _bufferOffset : I
    //   719: iload #10
    //   721: iadd
    //   722: istore #17
    //   724: iload #8
    //   726: iload_3
    //   727: invokestatic min : (II)I
    //   730: istore #4
    //   732: aload_0
    //   733: getfield _bufferBase : [B
    //   736: iload #17
    //   738: iload #4
    //   740: iadd
    //   741: baload
    //   742: aload_0
    //   743: getfield _bufferBase : [B
    //   746: iload #5
    //   748: iload #4
    //   750: iadd
    //   751: baload
    //   752: if_icmpne -> 873
    //   755: iload #4
    //   757: istore #18
    //   759: iload_3
    //   760: istore #4
    //   762: iload #18
    //   764: iconst_1
    //   765: iadd
    //   766: istore_3
    //   767: iload_3
    //   768: iload_2
    //   769: if_icmpeq -> 802
    //   772: aload_0
    //   773: getfield _bufferBase : [B
    //   776: iload #17
    //   778: iload_3
    //   779: iadd
    //   780: baload
    //   781: aload_0
    //   782: getfield _bufferBase : [B
    //   785: iload #5
    //   787: iload_3
    //   788: iadd
    //   789: baload
    //   790: if_icmpeq -> 796
    //   793: goto -> 802
    //   796: iload_3
    //   797: istore #18
    //   799: goto -> 762
    //   802: iload #11
    //   804: iload_3
    //   805: if_icmpge -> 870
    //   808: iload #6
    //   810: iconst_1
    //   811: iadd
    //   812: istore #11
    //   814: aload_1
    //   815: iload #6
    //   817: iload_3
    //   818: iastore
    //   819: iload #11
    //   821: iconst_1
    //   822: iadd
    //   823: istore #6
    //   825: aload_1
    //   826: iload #11
    //   828: iload #15
    //   830: iconst_1
    //   831: isub
    //   832: iastore
    //   833: iload_3
    //   834: iload_2
    //   835: if_icmpne -> 864
    //   838: aload_0
    //   839: getfield _son : [I
    //   842: astore_1
    //   843: aload_1
    //   844: iload #12
    //   846: aload_1
    //   847: iload #16
    //   849: iaload
    //   850: iastore
    //   851: aload_1
    //   852: iload #14
    //   854: aload_1
    //   855: iload #16
    //   857: iconst_1
    //   858: iadd
    //   859: iaload
    //   860: iastore
    //   861: goto -> 1000
    //   864: iload_3
    //   865: istore #11
    //   867: goto -> 883
    //   870: goto -> 883
    //   873: iload_3
    //   874: istore #18
    //   876: iload #4
    //   878: istore_3
    //   879: iload #18
    //   881: istore #4
    //   883: aload_0
    //   884: getfield _bufferBase : [B
    //   887: iload #17
    //   889: iload_3
    //   890: iadd
    //   891: baload
    //   892: sipush #255
    //   895: iand
    //   896: aload_0
    //   897: getfield _bufferBase : [B
    //   900: iload #5
    //   902: iload_3
    //   903: iadd
    //   904: baload
    //   905: sipush #255
    //   908: iand
    //   909: if_icmpge -> 941
    //   912: aload_0
    //   913: getfield _son : [I
    //   916: astore #9
    //   918: aload #9
    //   920: iload #12
    //   922: iload #10
    //   924: iastore
    //   925: iload #16
    //   927: iconst_1
    //   928: iadd
    //   929: istore #12
    //   931: aload #9
    //   933: iload #12
    //   935: iaload
    //   936: istore #4
    //   938: goto -> 975
    //   941: aload_0
    //   942: getfield _son : [I
    //   945: astore #9
    //   947: aload #9
    //   949: iload #14
    //   951: iload #10
    //   953: iastore
    //   954: aload #9
    //   956: iload #16
    //   958: iaload
    //   959: istore #10
    //   961: iload #16
    //   963: istore #14
    //   965: iload_3
    //   966: istore #8
    //   968: iload #4
    //   970: istore_3
    //   971: iload #10
    //   973: istore #4
    //   975: iinc #7, -1
    //   978: iload #4
    //   980: istore #10
    //   982: goto -> 650
    //   985: aload_0
    //   986: getfield _son : [I
    //   989: astore_1
    //   990: aload_1
    //   991: iload #12
    //   993: iconst_0
    //   994: iastore
    //   995: aload_1
    //   996: iload #14
    //   998: iconst_0
    //   999: iastore
    //   1000: aload_0
    //   1001: invokevirtual MovePos : ()V
    //   1004: iload #6
    //   1006: ireturn }
  
  public void Init() {
    super.Init();
    for (byte b = 0; b < this._hashSizeSum; b++)
      this._hash[b] = 0; 
    this._cyclicBufferPos = 0;
    ReduceOffsets(-1);
  }
  
  public void MovePos() {
    int i = this._cyclicBufferPos + 1;
    this._cyclicBufferPos = i;
    if (i >= this._cyclicBufferSize)
      this._cyclicBufferPos = 0; 
    super.MovePos();
    if (this._pos == 1073741823)
      Normalize(); 
  }
  
  void Normalize() {
    int i = this._pos;
    int j = this._cyclicBufferSize;
    i -= j;
    NormalizeLinks(this._son, j * 2, i);
    NormalizeLinks(this._hash, this._hashSizeSum, i);
    ReduceOffsets(i);
  }
  
  void NormalizeLinks(int[] paramArrayOfInt, int paramInt1, int paramInt2) {
    for (byte b = 0; b < paramInt1; b++) {
      int i = paramArrayOfInt[b];
      if (i <= paramInt2) {
        i = 0;
      } else {
        i -= paramInt2;
      } 
      paramArrayOfInt[b] = i;
    } 
  }
  
  public void SetCutValue(int paramInt) { this._cutValue = paramInt; }
  
  public void SetType(int paramInt) {
    boolean bool;
    if (paramInt > 2) {
      bool = true;
    } else {
      bool = false;
    } 
    this.HASH_ARRAY = bool;
    if (this.HASH_ARRAY) {
      this.kNumHashDirectBytes = 0;
      this.kMinMatchCheck = 4;
      this.kFixHashSize = 66560;
    } else {
      this.kNumHashDirectBytes = 2;
      this.kMinMatchCheck = 3;
      this.kFixHashSize = 0;
    } 
  }
  
  public void Skip(int paramInt) { // Byte code:
    //   0: iload_1
    //   1: istore_2
    //   2: aload_0
    //   3: getfield _pos : I
    //   6: aload_0
    //   7: getfield _matchMaxLen : I
    //   10: iadd
    //   11: aload_0
    //   12: getfield _streamPos : I
    //   15: if_icmpgt -> 26
    //   18: aload_0
    //   19: getfield _matchMaxLen : I
    //   22: istore_3
    //   23: goto -> 53
    //   26: aload_0
    //   27: getfield _streamPos : I
    //   30: aload_0
    //   31: getfield _pos : I
    //   34: isub
    //   35: istore_1
    //   36: iload_1
    //   37: istore_3
    //   38: iload_1
    //   39: aload_0
    //   40: getfield kMinMatchCheck : I
    //   43: if_icmpge -> 53
    //   46: aload_0
    //   47: invokevirtual MovePos : ()V
    //   50: goto -> 610
    //   53: aload_0
    //   54: getfield _pos : I
    //   57: aload_0
    //   58: getfield _cyclicBufferSize : I
    //   61: if_icmple -> 78
    //   64: aload_0
    //   65: getfield _pos : I
    //   68: aload_0
    //   69: getfield _cyclicBufferSize : I
    //   72: isub
    //   73: istore #4
    //   75: goto -> 81
    //   78: iconst_0
    //   79: istore #4
    //   81: aload_0
    //   82: getfield _bufferOffset : I
    //   85: aload_0
    //   86: getfield _pos : I
    //   89: iadd
    //   90: istore #5
    //   92: aload_0
    //   93: getfield HASH_ARRAY : Z
    //   96: ifeq -> 209
    //   99: getstatic com/badlogic/gdx/utils/compression/lz/BinTree.CrcTable : [I
    //   102: aload_0
    //   103: getfield _bufferBase : [B
    //   106: iload #5
    //   108: baload
    //   109: sipush #255
    //   112: iand
    //   113: iaload
    //   114: aload_0
    //   115: getfield _bufferBase : [B
    //   118: iload #5
    //   120: iconst_1
    //   121: iadd
    //   122: baload
    //   123: sipush #255
    //   126: iand
    //   127: ixor
    //   128: istore_1
    //   129: aload_0
    //   130: getfield _hash : [I
    //   133: iload_1
    //   134: sipush #1023
    //   137: iand
    //   138: aload_0
    //   139: getfield _pos : I
    //   142: iastore
    //   143: iload_1
    //   144: aload_0
    //   145: getfield _bufferBase : [B
    //   148: iload #5
    //   150: iconst_2
    //   151: iadd
    //   152: baload
    //   153: sipush #255
    //   156: iand
    //   157: bipush #8
    //   159: ishl
    //   160: ixor
    //   161: istore_1
    //   162: aload_0
    //   163: getfield _hash : [I
    //   166: ldc 65535
    //   168: iload_1
    //   169: iand
    //   170: sipush #1024
    //   173: iadd
    //   174: aload_0
    //   175: getfield _pos : I
    //   178: iastore
    //   179: iload_1
    //   180: getstatic com/badlogic/gdx/utils/compression/lz/BinTree.CrcTable : [I
    //   183: aload_0
    //   184: getfield _bufferBase : [B
    //   187: iload #5
    //   189: iconst_3
    //   190: iadd
    //   191: baload
    //   192: sipush #255
    //   195: iand
    //   196: iaload
    //   197: iconst_5
    //   198: ishl
    //   199: ixor
    //   200: aload_0
    //   201: getfield _hashMask : I
    //   204: iand
    //   205: istore_1
    //   206: goto -> 238
    //   209: aload_0
    //   210: getfield _bufferBase : [B
    //   213: iload #5
    //   215: baload
    //   216: sipush #255
    //   219: iand
    //   220: aload_0
    //   221: getfield _bufferBase : [B
    //   224: iload #5
    //   226: iconst_1
    //   227: iadd
    //   228: baload
    //   229: sipush #255
    //   232: iand
    //   233: bipush #8
    //   235: ishl
    //   236: ixor
    //   237: istore_1
    //   238: aload_0
    //   239: getfield _hash : [I
    //   242: astore #6
    //   244: aload_0
    //   245: getfield kFixHashSize : I
    //   248: istore #7
    //   250: aload #6
    //   252: iload #7
    //   254: iload_1
    //   255: iadd
    //   256: iaload
    //   257: istore #8
    //   259: aload #6
    //   261: iload #7
    //   263: iload_1
    //   264: iadd
    //   265: aload_0
    //   266: getfield _pos : I
    //   269: iastore
    //   270: aload_0
    //   271: getfield _cyclicBufferPos : I
    //   274: istore_1
    //   275: iload_1
    //   276: iconst_1
    //   277: ishl
    //   278: iconst_1
    //   279: iadd
    //   280: istore #9
    //   282: iload_1
    //   283: iconst_1
    //   284: ishl
    //   285: istore #10
    //   287: aload_0
    //   288: getfield kNumHashDirectBytes : I
    //   291: istore #11
    //   293: aload_0
    //   294: getfield _cutValue : I
    //   297: istore #7
    //   299: iload #11
    //   301: istore #12
    //   303: iload #8
    //   305: iload #4
    //   307: if_icmple -> 588
    //   310: iload #7
    //   312: ifne -> 318
    //   315: goto -> 588
    //   318: aload_0
    //   319: getfield _pos : I
    //   322: iload #8
    //   324: isub
    //   325: istore_1
    //   326: aload_0
    //   327: getfield _cyclicBufferPos : I
    //   330: istore #13
    //   332: iload_1
    //   333: iload #13
    //   335: if_icmpgt -> 346
    //   338: iload #13
    //   340: iload_1
    //   341: isub
    //   342: istore_1
    //   343: goto -> 356
    //   346: iload #13
    //   348: iload_1
    //   349: isub
    //   350: aload_0
    //   351: getfield _cyclicBufferSize : I
    //   354: iadd
    //   355: istore_1
    //   356: iload_1
    //   357: iconst_1
    //   358: ishl
    //   359: istore #14
    //   361: aload_0
    //   362: getfield _bufferOffset : I
    //   365: iload #8
    //   367: iadd
    //   368: istore #15
    //   370: iload #11
    //   372: iload #12
    //   374: invokestatic min : (II)I
    //   377: istore #13
    //   379: iload #13
    //   381: istore_1
    //   382: aload_0
    //   383: getfield _bufferBase : [B
    //   386: iload #15
    //   388: iload #13
    //   390: iadd
    //   391: baload
    //   392: aload_0
    //   393: getfield _bufferBase : [B
    //   396: iload #5
    //   398: iload #13
    //   400: iadd
    //   401: baload
    //   402: if_icmpne -> 485
    //   405: iload #13
    //   407: istore_1
    //   408: iload_1
    //   409: iconst_1
    //   410: iadd
    //   411: istore #13
    //   413: iload #13
    //   415: iload_3
    //   416: if_icmpeq -> 445
    //   419: iload #13
    //   421: istore_1
    //   422: aload_0
    //   423: getfield _bufferBase : [B
    //   426: iload #15
    //   428: iload #13
    //   430: iadd
    //   431: baload
    //   432: aload_0
    //   433: getfield _bufferBase : [B
    //   436: iload #5
    //   438: iload #13
    //   440: iadd
    //   441: baload
    //   442: if_icmpeq -> 408
    //   445: iload #13
    //   447: istore_1
    //   448: iload #13
    //   450: iload_3
    //   451: if_icmpne -> 485
    //   454: aload_0
    //   455: getfield _son : [I
    //   458: astore #6
    //   460: aload #6
    //   462: iload #10
    //   464: aload #6
    //   466: iload #14
    //   468: iaload
    //   469: iastore
    //   470: aload #6
    //   472: iload #9
    //   474: aload #6
    //   476: iload #14
    //   478: iconst_1
    //   479: iadd
    //   480: iaload
    //   481: iastore
    //   482: goto -> 606
    //   485: aload_0
    //   486: getfield _bufferBase : [B
    //   489: iload #15
    //   491: iload_1
    //   492: iadd
    //   493: baload
    //   494: sipush #255
    //   497: iand
    //   498: aload_0
    //   499: getfield _bufferBase : [B
    //   502: iload #5
    //   504: iload_1
    //   505: iadd
    //   506: baload
    //   507: sipush #255
    //   510: iand
    //   511: if_icmpge -> 549
    //   514: aload_0
    //   515: getfield _son : [I
    //   518: astore #6
    //   520: aload #6
    //   522: iload #10
    //   524: iload #8
    //   526: iastore
    //   527: iload #14
    //   529: iconst_1
    //   530: iadd
    //   531: istore #10
    //   533: aload #6
    //   535: iload #10
    //   537: iaload
    //   538: istore #8
    //   540: iload_1
    //   541: istore #12
    //   543: iload #8
    //   545: istore_1
    //   546: goto -> 579
    //   549: aload_0
    //   550: getfield _son : [I
    //   553: astore #6
    //   555: aload #6
    //   557: iload #9
    //   559: iload #8
    //   561: iastore
    //   562: aload #6
    //   564: iload #14
    //   566: iaload
    //   567: istore #8
    //   569: iload #14
    //   571: istore #9
    //   573: iload_1
    //   574: istore #11
    //   576: iload #8
    //   578: istore_1
    //   579: iinc #7, -1
    //   582: iload_1
    //   583: istore #8
    //   585: goto -> 303
    //   588: aload_0
    //   589: getfield _son : [I
    //   592: astore #6
    //   594: aload #6
    //   596: iload #10
    //   598: iconst_0
    //   599: iastore
    //   600: aload #6
    //   602: iload #9
    //   604: iconst_0
    //   605: iastore
    //   606: aload_0
    //   607: invokevirtual MovePos : ()V
    //   610: iload_2
    //   611: iconst_1
    //   612: isub
    //   613: istore_1
    //   614: iload_1
    //   615: istore_2
    //   616: iload_1
    //   617: ifne -> 2
    //   620: return }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/lz/BinTree.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */