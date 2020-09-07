package com.badlogic.gdx.utils.compression.lzma;

import com.badlogic.gdx.utils.compression.ICodeProgress;
import com.badlogic.gdx.utils.compression.lz.BinTree;
import com.badlogic.gdx.utils.compression.rangecoder.BitTreeEncoder;
import com.badlogic.gdx.utils.compression.rangecoder.Encoder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Encoder {
  public static final int EMatchFinderTypeBT2 = 0;
  
  public static final int EMatchFinderTypeBT4 = 1;
  
  static byte[] g_FastPos = new byte[2048];
  
  static final int kDefaultDictionaryLogSize = 22;
  
  static final int kIfinityPrice = 268435455;
  
  static final int kNumFastBytesDefault = 32;
  
  public static final int kNumLenSpecSymbols = 16;
  
  static final int kNumOpts = 4096;
  
  public static final int kPropSize = 5;
  
  int _additionalOffset;
  
  int _alignPriceCount;
  
  int[] _alignPrices = new int[16];
  
  int _dictionarySize;
  
  int _dictionarySizePrev;
  
  int _distTableSize = 44;
  
  int[] _distancesPrices = new int[512];
  
  boolean _finished;
  
  InputStream _inStream;
  
  short[] _isMatch = new short[192];
  
  short[] _isRep = new short[12];
  
  short[] _isRep0Long = new short[192];
  
  short[] _isRepG0 = new short[12];
  
  short[] _isRepG1 = new short[12];
  
  short[] _isRepG2 = new short[12];
  
  LenPriceTableEncoder _lenEncoder = new LenPriceTableEncoder();
  
  LiteralEncoder _literalEncoder = new LiteralEncoder();
  
  int _longestMatchLength;
  
  boolean _longestMatchWasFound;
  
  int[] _matchDistances = new int[548];
  
  BinTree _matchFinder = null;
  
  int _matchFinderType;
  
  int _matchPriceCount;
  
  boolean _needReleaseMFStream;
  
  int _numDistancePairs;
  
  int _numFastBytes = 32;
  
  int _numFastBytesPrev;
  
  int _numLiteralContextBits;
  
  int _numLiteralPosStateBits;
  
  Optimal[] _optimum = new Optimal[4096];
  
  int _optimumCurrentIndex;
  
  int _optimumEndIndex;
  
  BitTreeEncoder _posAlignEncoder = new BitTreeEncoder(4);
  
  short[] _posEncoders = new short[114];
  
  BitTreeEncoder[] _posSlotEncoder = new BitTreeEncoder[4];
  
  int[] _posSlotPrices = new int[256];
  
  int _posStateBits = 2;
  
  int _posStateMask = 3;
  
  byte _previousByte;
  
  Encoder _rangeEncoder = new Encoder();
  
  int[] _repDistances = new int[4];
  
  LenPriceTableEncoder _repMatchLenEncoder = new LenPriceTableEncoder();
  
  int _state = Base.StateInit();
  
  boolean _writeEndMark;
  
  int backRes;
  
  boolean[] finished;
  
  long nowPos64;
  
  long[] processedInSize;
  
  long[] processedOutSize;
  
  byte[] properties;
  
  int[] repLens;
  
  int[] reps;
  
  int[] tempPrices;
  
  static  {
    byte[] arrayOfByte = g_FastPos;
    arrayOfByte[0] = (byte)0;
    arrayOfByte[1] = (byte)1;
    byte b1 = 2;
    byte b2 = 2;
    while (b1 < 22) {
      byte b = 0;
      while (b < 1 << (b1 >> 1) - 1) {
        g_FastPos[b2] = (byte)(byte)b1;
        b++;
        b2++;
      } 
      b1++;
    } 
  }
  
  public Encoder() {
    boolean bool = false;
    this._numLiteralPosStateBits = 0;
    this._numLiteralContextBits = 3;
    this._dictionarySize = 4194304;
    this._dictionarySizePrev = -1;
    this._numFastBytesPrev = -1;
    this._matchFinderType = 1;
    this._writeEndMark = false;
    this._needReleaseMFStream = false;
    this.reps = new int[4];
    this.repLens = new int[4];
    this.processedInSize = new long[1];
    this.processedOutSize = new long[1];
    this.finished = new boolean[1];
    this.properties = new byte[5];
    this.tempPrices = new int[128];
    byte b1 = 0;
    while (true) {
      b2 = bool;
      if (b1 < 'က') {
        this._optimum[b1] = new Optimal();
        b1++;
        continue;
      } 
      break;
    } 
    while (b2 < 4) {
      this._posSlotEncoder[b2] = new BitTreeEncoder(6);
      b2++;
    } 
  }
  
  static int GetPosSlot(int paramInt) { return (paramInt < 2048) ? g_FastPos[paramInt] : ((paramInt < 2097152) ? (g_FastPos[paramInt >> 10] + 20) : (g_FastPos[paramInt >> 20] + 40)); }
  
  static int GetPosSlot2(int paramInt) { return (paramInt < 131072) ? (g_FastPos[paramInt >> 6] + 12) : ((paramInt < 134217728) ? (g_FastPos[paramInt >> 16] + 32) : (g_FastPos[paramInt >> 26] + 52)); }
  
  int Backward(int paramInt) {
    this._optimumEndIndex = paramInt;
    int i = (this._optimum[paramInt]).PosPrev;
    int j = (this._optimum[paramInt]).BackPrev;
    int k = paramInt;
    for (paramInt = i;; paramInt = i) {
      if ((this._optimum[k]).Prev1IsChar) {
        this._optimum[paramInt].MakeAsChar();
        Optimal[] arrayOfOptimal1 = this._optimum;
        Optimal optimal = arrayOfOptimal1[paramInt];
        i = paramInt - 1;
        optimal.PosPrev = i;
        if ((arrayOfOptimal1[k]).Prev2) {
          Optimal[] arrayOfOptimal2 = this._optimum;
          (arrayOfOptimal2[i]).Prev1IsChar = false;
          (arrayOfOptimal2[i]).PosPrev = (arrayOfOptimal2[k]).PosPrev2;
          arrayOfOptimal2 = this._optimum;
          (arrayOfOptimal2[i]).BackPrev = (arrayOfOptimal2[k]).BackPrev2;
        } 
      } 
      int m = (this._optimum[paramInt]).BackPrev;
      i = (this._optimum[paramInt]).PosPrev;
      Optimal[] arrayOfOptimal = this._optimum;
      (arrayOfOptimal[paramInt]).BackPrev = j;
      (arrayOfOptimal[paramInt]).PosPrev = k;
      if (paramInt <= 0) {
        this.backRes = (arrayOfOptimal[0]).BackPrev;
        this._optimumCurrentIndex = (this._optimum[0]).PosPrev;
        return this._optimumCurrentIndex;
      } 
      k = paramInt;
      j = m;
    } 
  }
  
  void BaseInit() {
    this._state = Base.StateInit();
    this._previousByte = (byte)0;
    for (byte b = 0; b < 4; b++)
      this._repDistances[b] = 0; 
  }
  
  boolean ChangePair(int paramInt1, int paramInt2) {
    boolean bool;
    if (paramInt1 < 33554432 && paramInt2 >= paramInt1 << 7) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void Code(InputStream paramInputStream, OutputStream paramOutputStream, long paramLong1, long paramLong2, ICodeProgress paramICodeProgress) throws IOException {
    this._needReleaseMFStream = false;
    try {
      SetStreams(paramInputStream, paramOutputStream, paramLong1, paramLong2);
      while (true) {
        CodeOneBlock(this.processedInSize, this.processedOutSize, this.finished);
        boolean bool = this.finished[0];
        if (bool)
          return; 
        if (paramICodeProgress != null)
          paramICodeProgress.SetProgress(this.processedInSize[0], this.processedOutSize[0]); 
      } 
    } finally {
      ReleaseStreams();
    } 
  }
  
  public void CodeOneBlock(long[] paramArrayOfLong1, long[] paramArrayOfLong2, boolean[] paramArrayOfBoolean) throws IOException {
    paramArrayOfLong1[0] = 0L;
    paramArrayOfLong2[0] = 0L;
    paramArrayOfBoolean[0] = true;
    InputStream inputStream = this._inStream;
    if (inputStream != null) {
      this._matchFinder.SetStream(inputStream);
      this._matchFinder.Init();
      this._needReleaseMFStream = true;
      this._inStream = null;
    } 
    if (this._finished)
      return; 
    this._finished = true;
    long l = this.nowPos64;
    if (l == 0L) {
      if (this._matchFinder.GetNumAvailableBytes() == 0) {
        Flush((int)this.nowPos64);
        return;
      } 
      ReadMatchDistances();
      int i = (int)this.nowPos64;
      int j = this._posStateMask;
      this._rangeEncoder.Encode(this._isMatch, (this._state << 4) + (j & i), 0);
      this._state = Base.StateUpdateChar(this._state);
      byte b = this._matchFinder.GetIndexByte(0 - this._additionalOffset);
      this._literalEncoder.GetSubCoder((int)this.nowPos64, this._previousByte).Encode(this._rangeEncoder, b);
      this._previousByte = b;
      this._additionalOffset--;
      this.nowPos64++;
    } 
    if (this._matchFinder.GetNumAvailableBytes() == 0) {
      Flush((int)this.nowPos64);
      return;
    } 
    while (true) {
      int j = GetOptimum((int)this.nowPos64);
      int i = this.backRes;
      int k = (int)this.nowPos64;
      int m = this._posStateMask & k;
      k = (this._state << 4) + m;
      if (j == 1 && i == -1) {
        this._rangeEncoder.Encode(this._isMatch, k, 0);
        byte b = this._matchFinder.GetIndexByte(0 - this._additionalOffset);
        LiteralEncoder.Encoder2 encoder2 = this._literalEncoder.GetSubCoder((int)this.nowPos64, this._previousByte);
        if (!Base.StateIsCharState(this._state)) {
          byte b1 = this._matchFinder.GetIndexByte(0 - this._repDistances[0] - 1 - this._additionalOffset);
          encoder2.EncodeMatched(this._rangeEncoder, b1, b);
        } else {
          encoder2.Encode(this._rangeEncoder, b);
        } 
        this._previousByte = b;
        this._state = Base.StateUpdateChar(this._state);
      } else {
        this._rangeEncoder.Encode(this._isMatch, k, 1);
        if (i < 4) {
          this._rangeEncoder.Encode(this._isRep, this._state, 1);
          if (i == 0) {
            this._rangeEncoder.Encode(this._isRepG0, this._state, 0);
            if (j == 1) {
              this._rangeEncoder.Encode(this._isRep0Long, k, 0);
            } else {
              this._rangeEncoder.Encode(this._isRep0Long, k, 1);
            } 
          } else {
            this._rangeEncoder.Encode(this._isRepG0, this._state, 1);
            if (i == 1) {
              this._rangeEncoder.Encode(this._isRepG1, this._state, 0);
            } else {
              this._rangeEncoder.Encode(this._isRepG1, this._state, 1);
              this._rangeEncoder.Encode(this._isRepG2, this._state, i - 2);
            } 
          } 
          if (j == 1) {
            this._state = Base.StateUpdateShortRep(this._state);
          } else {
            this._repMatchLenEncoder.Encode(this._rangeEncoder, j - 2, m);
            this._state = Base.StateUpdateRep(this._state);
          } 
          k = this._repDistances[i];
          if (i != 0) {
            while (i >= 1) {
              int[] arrayOfInt = this._repDistances;
              arrayOfInt[i] = arrayOfInt[i - 1];
              i--;
            } 
            this._repDistances[0] = k;
          } 
        } else {
          this._rangeEncoder.Encode(this._isRep, this._state, 0);
          this._state = Base.StateUpdateMatch(this._state);
          this._lenEncoder.Encode(this._rangeEncoder, j - 2, m);
          k = i - 4;
          i = GetPosSlot(k);
          m = Base.GetLenToPosState(j);
          this._posSlotEncoder[m].Encode(this._rangeEncoder, i);
          if (i >= 4) {
            int n = (i >> 1) - 1;
            m = (i & true | 0x2) << n;
            int i1 = k - m;
            if (i < 14) {
              BitTreeEncoder.ReverseEncode(this._posEncoders, m - i - 1, this._rangeEncoder, n, i1);
            } else {
              this._rangeEncoder.EncodeDirectBits(i1 >> 4, n - 4);
              this._posAlignEncoder.ReverseEncode(this._rangeEncoder, i1 & 0xF);
              this._alignPriceCount++;
            } 
          } 
          for (i = 3; i >= 1; i--) {
            int[] arrayOfInt = this._repDistances;
            arrayOfInt[i] = arrayOfInt[i - 1];
          } 
          this._repDistances[0] = k;
          this._matchPriceCount++;
        } 
        this._previousByte = this._matchFinder.GetIndexByte(j - 1 - this._additionalOffset);
      } 
      this._additionalOffset -= j;
      this.nowPos64 += j;
      if (this._additionalOffset == 0) {
        if (this._matchPriceCount >= 128)
          FillDistancesPrices(); 
        if (this._alignPriceCount >= 16)
          FillAlignPrices(); 
        paramArrayOfLong1[0] = this.nowPos64;
        paramArrayOfLong2[0] = this._rangeEncoder.GetProcessedSizeAdd();
        if (this._matchFinder.GetNumAvailableBytes() == 0) {
          Flush((int)this.nowPos64);
          return;
        } 
        if (this.nowPos64 - l >= 4096L)
          break; 
      } 
    } 
    this._finished = false;
    paramArrayOfBoolean[0] = false;
  }
  
  void Create() {
    if (this._matchFinder == null) {
      BinTree binTree = new BinTree();
      byte b = 4;
      if (this._matchFinderType == 0)
        b = 2; 
      binTree.SetType(b);
      this._matchFinder = binTree;
    } 
    this._literalEncoder.Create(this._numLiteralPosStateBits, this._numLiteralContextBits);
    if (this._dictionarySize == this._dictionarySizePrev && this._numFastBytesPrev == this._numFastBytes)
      return; 
    this._matchFinder.Create(this._dictionarySize, 4096, this._numFastBytes, 274);
    this._dictionarySizePrev = this._dictionarySize;
    this._numFastBytesPrev = this._numFastBytes;
  }
  
  void FillAlignPrices() {
    for (byte b = 0; b < 16; b++)
      this._alignPrices[b] = this._posAlignEncoder.ReverseGetPrice(b); 
    this._alignPriceCount = 0;
  }
  
  void FillDistancesPrices() {
    int i;
    for (i = 4; i < 128; i++) {
      int j = GetPosSlot(i);
      int k = (j >> 1) - 1;
      int m = (j & true | 0x2) << k;
      this.tempPrices[i] = BitTreeEncoder.ReverseGetPrice(this._posEncoders, m - j - 1, k, i - m);
    } 
    for (byte b = 0; b < 4; b++) {
      int k;
      BitTreeEncoder bitTreeEncoder = this._posSlotEncoder[b];
      int j = b << 6;
      for (i = 0; i < this._distTableSize; i++)
        this._posSlotPrices[j + i] = bitTreeEncoder.GetPrice(i); 
      for (i = 14; i < this._distTableSize; i++) {
        int[] arrayOfInt = this._posSlotPrices;
        k = j + i;
        arrayOfInt[k] = arrayOfInt[k] + ((i >> 1) - 1 - 4 << 6);
      } 
      int m = b * '';
      i = 0;
      while (true) {
        k = i;
        if (i < 4) {
          this._distancesPrices[m + i] = this._posSlotPrices[j + i];
          i++;
          continue;
        } 
        break;
      } 
      while (k < 128) {
        this._distancesPrices[m + k] = this._posSlotPrices[GetPosSlot(k) + j] + this.tempPrices[k];
        k++;
      } 
    } 
    this._matchPriceCount = 0;
  }
  
  void Flush(int paramInt) throws IOException {
    ReleaseMFStream();
    WriteEndMarker(paramInt & this._posStateMask);
    this._rangeEncoder.FlushData();
    this._rangeEncoder.FlushStream();
  }
  
  int GetOptimum(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: getfield _optimumEndIndex : I
    //   4: istore_2
    //   5: aload_0
    //   6: getfield _optimumCurrentIndex : I
    //   9: istore_3
    //   10: iload_2
    //   11: iload_3
    //   12: if_icmpeq -> 63
    //   15: aload_0
    //   16: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   19: iload_3
    //   20: aaload
    //   21: getfield PosPrev : I
    //   24: istore_3
    //   25: aload_0
    //   26: getfield _optimumCurrentIndex : I
    //   29: istore_1
    //   30: aload_0
    //   31: aload_0
    //   32: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   35: iload_1
    //   36: aaload
    //   37: getfield BackPrev : I
    //   40: putfield backRes : I
    //   43: aload_0
    //   44: aload_0
    //   45: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   48: aload_0
    //   49: getfield _optimumCurrentIndex : I
    //   52: aaload
    //   53: getfield PosPrev : I
    //   56: putfield _optimumCurrentIndex : I
    //   59: iload_3
    //   60: iload_1
    //   61: isub
    //   62: ireturn
    //   63: aload_0
    //   64: iconst_0
    //   65: putfield _optimumEndIndex : I
    //   68: aload_0
    //   69: iconst_0
    //   70: putfield _optimumCurrentIndex : I
    //   73: aload_0
    //   74: getfield _longestMatchWasFound : Z
    //   77: ifne -> 88
    //   80: aload_0
    //   81: invokevirtual ReadMatchDistances : ()I
    //   84: istore_2
    //   85: goto -> 98
    //   88: aload_0
    //   89: getfield _longestMatchLength : I
    //   92: istore_2
    //   93: aload_0
    //   94: iconst_0
    //   95: putfield _longestMatchWasFound : Z
    //   98: aload_0
    //   99: getfield _numDistancePairs : I
    //   102: istore #4
    //   104: aload_0
    //   105: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   108: invokevirtual GetNumAvailableBytes : ()I
    //   111: iconst_1
    //   112: iadd
    //   113: iconst_2
    //   114: if_icmpge -> 124
    //   117: aload_0
    //   118: iconst_m1
    //   119: putfield backRes : I
    //   122: iconst_1
    //   123: ireturn
    //   124: iconst_0
    //   125: istore_3
    //   126: iconst_0
    //   127: istore #5
    //   129: iload_3
    //   130: iconst_4
    //   131: if_icmpge -> 206
    //   134: aload_0
    //   135: getfield reps : [I
    //   138: astore #6
    //   140: aload #6
    //   142: iload_3
    //   143: aload_0
    //   144: getfield _repDistances : [I
    //   147: iload_3
    //   148: iaload
    //   149: iastore
    //   150: aload_0
    //   151: getfield repLens : [I
    //   154: iload_3
    //   155: aload_0
    //   156: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   159: iconst_m1
    //   160: aload #6
    //   162: iload_3
    //   163: iaload
    //   164: sipush #273
    //   167: invokevirtual GetMatchLen : (III)I
    //   170: iastore
    //   171: aload_0
    //   172: getfield repLens : [I
    //   175: astore #6
    //   177: iload #5
    //   179: istore #7
    //   181: aload #6
    //   183: iload_3
    //   184: iaload
    //   185: aload #6
    //   187: iload #5
    //   189: iaload
    //   190: if_icmple -> 196
    //   193: iload_3
    //   194: istore #7
    //   196: iinc #3, 1
    //   199: iload #7
    //   201: istore #5
    //   203: goto -> 129
    //   206: aload_0
    //   207: getfield repLens : [I
    //   210: astore #6
    //   212: aload #6
    //   214: iload #5
    //   216: iaload
    //   217: istore_3
    //   218: aload_0
    //   219: getfield _numFastBytes : I
    //   222: istore #7
    //   224: iload_3
    //   225: iload #7
    //   227: if_icmplt -> 251
    //   230: aload_0
    //   231: iload #5
    //   233: putfield backRes : I
    //   236: aload #6
    //   238: iload #5
    //   240: iaload
    //   241: istore_1
    //   242: aload_0
    //   243: iload_1
    //   244: iconst_1
    //   245: isub
    //   246: invokevirtual MovePos : (I)V
    //   249: iload_1
    //   250: ireturn
    //   251: iload_2
    //   252: iload #7
    //   254: if_icmplt -> 281
    //   257: aload_0
    //   258: aload_0
    //   259: getfield _matchDistances : [I
    //   262: iload #4
    //   264: iconst_1
    //   265: isub
    //   266: iaload
    //   267: iconst_4
    //   268: iadd
    //   269: putfield backRes : I
    //   272: aload_0
    //   273: iload_2
    //   274: iconst_1
    //   275: isub
    //   276: invokevirtual MovePos : (I)V
    //   279: iload_2
    //   280: ireturn
    //   281: aload_0
    //   282: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   285: iconst_m1
    //   286: invokevirtual GetIndexByte : (I)B
    //   289: istore #8
    //   291: aload_0
    //   292: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   295: iconst_0
    //   296: aload_0
    //   297: getfield _repDistances : [I
    //   300: iconst_0
    //   301: iaload
    //   302: isub
    //   303: iconst_1
    //   304: isub
    //   305: iconst_1
    //   306: isub
    //   307: invokevirtual GetIndexByte : (I)B
    //   310: istore #9
    //   312: iload_2
    //   313: iconst_2
    //   314: if_icmpge -> 342
    //   317: iload #8
    //   319: iload #9
    //   321: if_icmpeq -> 342
    //   324: aload_0
    //   325: getfield repLens : [I
    //   328: iload #5
    //   330: iaload
    //   331: iconst_2
    //   332: if_icmpge -> 342
    //   335: aload_0
    //   336: iconst_m1
    //   337: putfield backRes : I
    //   340: iconst_1
    //   341: ireturn
    //   342: aload_0
    //   343: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   346: astore #6
    //   348: aload #6
    //   350: iconst_0
    //   351: aaload
    //   352: astore #10
    //   354: aload_0
    //   355: getfield _state : I
    //   358: istore_3
    //   359: aload #10
    //   361: iload_3
    //   362: putfield State : I
    //   365: aload_0
    //   366: getfield _posStateMask : I
    //   369: iload_1
    //   370: iand
    //   371: istore #11
    //   373: aload #6
    //   375: iconst_1
    //   376: aaload
    //   377: aload_0
    //   378: getfield _isMatch : [S
    //   381: iload_3
    //   382: iconst_4
    //   383: ishl
    //   384: iload #11
    //   386: iadd
    //   387: saload
    //   388: invokestatic GetPrice0 : (I)I
    //   391: aload_0
    //   392: getfield _literalEncoder : Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;
    //   395: iload_1
    //   396: aload_0
    //   397: getfield _previousByte : B
    //   400: invokevirtual GetSubCoder : (IB)Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;
    //   403: aload_0
    //   404: getfield _state : I
    //   407: invokestatic StateIsCharState : (I)Z
    //   410: iconst_1
    //   411: ixor
    //   412: iload #9
    //   414: iload #8
    //   416: invokevirtual GetPrice : (ZBB)I
    //   419: iadd
    //   420: putfield Price : I
    //   423: aload_0
    //   424: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   427: iconst_1
    //   428: aaload
    //   429: invokevirtual MakeAsChar : ()V
    //   432: aload_0
    //   433: getfield _isMatch : [S
    //   436: aload_0
    //   437: getfield _state : I
    //   440: iconst_4
    //   441: ishl
    //   442: iload #11
    //   444: iadd
    //   445: saload
    //   446: invokestatic GetPrice1 : (I)I
    //   449: istore #12
    //   451: aload_0
    //   452: getfield _isRep : [S
    //   455: aload_0
    //   456: getfield _state : I
    //   459: saload
    //   460: invokestatic GetPrice1 : (I)I
    //   463: iload #12
    //   465: iadd
    //   466: istore #13
    //   468: iload #9
    //   470: iload #8
    //   472: if_icmpne -> 523
    //   475: aload_0
    //   476: aload_0
    //   477: getfield _state : I
    //   480: iload #11
    //   482: invokevirtual GetRepLen1Price : (II)I
    //   485: iload #13
    //   487: iadd
    //   488: istore_3
    //   489: iload_3
    //   490: aload_0
    //   491: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   494: iconst_1
    //   495: aaload
    //   496: getfield Price : I
    //   499: if_icmpge -> 523
    //   502: aload_0
    //   503: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   506: astore #6
    //   508: aload #6
    //   510: iconst_1
    //   511: aaload
    //   512: iload_3
    //   513: putfield Price : I
    //   516: aload #6
    //   518: iconst_1
    //   519: aaload
    //   520: invokevirtual MakeAsShortRep : ()V
    //   523: aload_0
    //   524: getfield repLens : [I
    //   527: astore #6
    //   529: iload_2
    //   530: aload #6
    //   532: iload #5
    //   534: iaload
    //   535: if_icmplt -> 543
    //   538: iload_2
    //   539: istore_3
    //   540: goto -> 549
    //   543: aload #6
    //   545: iload #5
    //   547: iaload
    //   548: istore_3
    //   549: iload_3
    //   550: iconst_2
    //   551: if_icmpge -> 569
    //   554: aload_0
    //   555: aload_0
    //   556: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   559: iconst_1
    //   560: aaload
    //   561: getfield BackPrev : I
    //   564: putfield backRes : I
    //   567: iconst_1
    //   568: ireturn
    //   569: aload_0
    //   570: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   573: astore #10
    //   575: aload #10
    //   577: iconst_1
    //   578: aaload
    //   579: iconst_0
    //   580: putfield PosPrev : I
    //   583: aload #10
    //   585: iconst_0
    //   586: aaload
    //   587: astore #6
    //   589: aload_0
    //   590: getfield reps : [I
    //   593: astore #14
    //   595: aload #6
    //   597: aload #14
    //   599: iconst_0
    //   600: iaload
    //   601: putfield Backs0 : I
    //   604: aload #10
    //   606: iconst_0
    //   607: aaload
    //   608: aload #14
    //   610: iconst_1
    //   611: iaload
    //   612: putfield Backs1 : I
    //   615: aload #10
    //   617: iconst_0
    //   618: aaload
    //   619: aload #14
    //   621: iconst_2
    //   622: iaload
    //   623: putfield Backs2 : I
    //   626: aload #10
    //   628: iconst_0
    //   629: aaload
    //   630: aload #14
    //   632: iconst_3
    //   633: iaload
    //   634: putfield Backs3 : I
    //   637: iload_3
    //   638: istore #5
    //   640: aload_0
    //   641: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   644: astore #6
    //   646: iload #5
    //   648: iconst_1
    //   649: isub
    //   650: istore #7
    //   652: aload #6
    //   654: iload #5
    //   656: aaload
    //   657: ldc 268435455
    //   659: putfield Price : I
    //   662: iload #7
    //   664: iconst_2
    //   665: if_icmpge -> 3332
    //   668: iconst_0
    //   669: istore #5
    //   671: iload #5
    //   673: iconst_4
    //   674: if_icmpge -> 793
    //   677: aload_0
    //   678: getfield repLens : [I
    //   681: iload #5
    //   683: iaload
    //   684: istore #7
    //   686: iload #7
    //   688: iconst_2
    //   689: if_icmpge -> 695
    //   692: goto -> 784
    //   695: aload_0
    //   696: iload #5
    //   698: aload_0
    //   699: getfield _state : I
    //   702: iload #11
    //   704: invokevirtual GetPureRepPrice : (III)I
    //   707: istore #15
    //   709: aload_0
    //   710: getfield _repMatchLenEncoder : Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;
    //   713: iload #7
    //   715: iconst_2
    //   716: isub
    //   717: iload #11
    //   719: invokevirtual GetPrice : (II)I
    //   722: iload #15
    //   724: iload #13
    //   726: iadd
    //   727: iadd
    //   728: istore #16
    //   730: aload_0
    //   731: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   734: iload #7
    //   736: aaload
    //   737: astore #6
    //   739: iload #16
    //   741: aload #6
    //   743: getfield Price : I
    //   746: if_icmpge -> 775
    //   749: aload #6
    //   751: iload #16
    //   753: putfield Price : I
    //   756: aload #6
    //   758: iconst_0
    //   759: putfield PosPrev : I
    //   762: aload #6
    //   764: iload #5
    //   766: putfield BackPrev : I
    //   769: aload #6
    //   771: iconst_0
    //   772: putfield Prev1IsChar : Z
    //   775: iinc #7, -1
    //   778: iload #7
    //   780: iconst_2
    //   781: if_icmpge -> 790
    //   784: iinc #5, 1
    //   787: goto -> 671
    //   790: goto -> 709
    //   793: aload_0
    //   794: getfield _isRep : [S
    //   797: aload_0
    //   798: getfield _state : I
    //   801: saload
    //   802: invokestatic GetPrice0 : (I)I
    //   805: istore #15
    //   807: aload_0
    //   808: getfield repLens : [I
    //   811: astore #6
    //   813: aload #6
    //   815: iconst_0
    //   816: iaload
    //   817: iconst_2
    //   818: if_icmplt -> 832
    //   821: aload #6
    //   823: iconst_0
    //   824: iaload
    //   825: iconst_1
    //   826: iadd
    //   827: istore #5
    //   829: goto -> 835
    //   832: iconst_2
    //   833: istore #5
    //   835: iload #5
    //   837: iload_2
    //   838: if_icmpgt -> 983
    //   841: iconst_0
    //   842: istore_2
    //   843: iload_2
    //   844: istore #13
    //   846: iload #5
    //   848: istore #7
    //   850: iload #5
    //   852: aload_0
    //   853: getfield _matchDistances : [I
    //   856: iload_2
    //   857: iaload
    //   858: if_icmple -> 867
    //   861: iinc #2, 2
    //   864: goto -> 843
    //   867: aload_0
    //   868: getfield _matchDistances : [I
    //   871: iload #13
    //   873: iconst_1
    //   874: iadd
    //   875: iaload
    //   876: istore #5
    //   878: aload_0
    //   879: iload #5
    //   881: iload #7
    //   883: iload #11
    //   885: invokevirtual GetPosLenPrice : (III)I
    //   888: iload #12
    //   890: iload #15
    //   892: iadd
    //   893: iadd
    //   894: istore_2
    //   895: aload_0
    //   896: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   899: iload #7
    //   901: aaload
    //   902: astore #6
    //   904: iload_2
    //   905: aload #6
    //   907: getfield Price : I
    //   910: if_icmpge -> 940
    //   913: aload #6
    //   915: iload_2
    //   916: putfield Price : I
    //   919: aload #6
    //   921: iconst_0
    //   922: putfield PosPrev : I
    //   925: aload #6
    //   927: iload #5
    //   929: iconst_4
    //   930: iadd
    //   931: putfield BackPrev : I
    //   934: aload #6
    //   936: iconst_0
    //   937: putfield Prev1IsChar : Z
    //   940: iload #13
    //   942: istore_2
    //   943: iload #7
    //   945: aload_0
    //   946: getfield _matchDistances : [I
    //   949: iload #13
    //   951: iaload
    //   952: if_icmpne -> 974
    //   955: iload #13
    //   957: iconst_2
    //   958: iadd
    //   959: istore #5
    //   961: iload #5
    //   963: istore_2
    //   964: iload #5
    //   966: iload #4
    //   968: if_icmpne -> 974
    //   971: goto -> 983
    //   974: iinc #7, 1
    //   977: iload_2
    //   978: istore #13
    //   980: goto -> 867
    //   983: iconst_0
    //   984: istore #5
    //   986: iload_3
    //   987: istore_2
    //   988: iload #5
    //   990: istore_3
    //   991: iload_3
    //   992: iconst_1
    //   993: iadd
    //   994: istore #17
    //   996: iload #17
    //   998: iload_2
    //   999: if_icmpne -> 1009
    //   1002: aload_0
    //   1003: iload #17
    //   1005: invokevirtual Backward : (I)I
    //   1008: ireturn
    //   1009: aload_0
    //   1010: invokevirtual ReadMatchDistances : ()I
    //   1013: istore #13
    //   1015: aload_0
    //   1016: getfield _numDistancePairs : I
    //   1019: istore #16
    //   1021: iload #13
    //   1023: aload_0
    //   1024: getfield _numFastBytes : I
    //   1027: if_icmplt -> 1048
    //   1030: aload_0
    //   1031: iload #13
    //   1033: putfield _longestMatchLength : I
    //   1036: aload_0
    //   1037: iconst_1
    //   1038: putfield _longestMatchWasFound : Z
    //   1041: aload_0
    //   1042: iload #17
    //   1044: invokevirtual Backward : (I)I
    //   1047: ireturn
    //   1048: iload_1
    //   1049: iconst_1
    //   1050: iadd
    //   1051: istore #11
    //   1053: aload_0
    //   1054: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1057: iload #17
    //   1059: aaload
    //   1060: getfield PosPrev : I
    //   1063: istore_3
    //   1064: aload_0
    //   1065: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1068: iload #17
    //   1070: aaload
    //   1071: getfield Prev1IsChar : Z
    //   1074: ifeq -> 1162
    //   1077: iinc #3, -1
    //   1080: aload_0
    //   1081: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1084: iload #17
    //   1086: aaload
    //   1087: getfield Prev2 : Z
    //   1090: ifeq -> 1144
    //   1093: aload_0
    //   1094: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1097: astore #6
    //   1099: aload #6
    //   1101: aload #6
    //   1103: iload #17
    //   1105: aaload
    //   1106: getfield PosPrev2 : I
    //   1109: aaload
    //   1110: getfield State : I
    //   1113: istore_1
    //   1114: aload_0
    //   1115: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1118: iload #17
    //   1120: aaload
    //   1121: getfield BackPrev2 : I
    //   1124: iconst_4
    //   1125: if_icmpge -> 1136
    //   1128: iload_1
    //   1129: invokestatic StateUpdateRep : (I)I
    //   1132: istore_1
    //   1133: goto -> 1154
    //   1136: iload_1
    //   1137: invokestatic StateUpdateMatch : (I)I
    //   1140: istore_1
    //   1141: goto -> 1154
    //   1144: aload_0
    //   1145: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1148: iload_3
    //   1149: aaload
    //   1150: getfield State : I
    //   1153: istore_1
    //   1154: iload_1
    //   1155: invokestatic StateUpdateChar : (I)I
    //   1158: istore_1
    //   1159: goto -> 1172
    //   1162: aload_0
    //   1163: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1166: iload_3
    //   1167: aaload
    //   1168: getfield State : I
    //   1171: istore_1
    //   1172: iload_3
    //   1173: iload #17
    //   1175: iconst_1
    //   1176: isub
    //   1177: if_icmpne -> 1209
    //   1180: aload_0
    //   1181: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1184: iload #17
    //   1186: aaload
    //   1187: invokevirtual IsShortRep : ()Z
    //   1190: ifeq -> 1201
    //   1193: iload_1
    //   1194: invokestatic StateUpdateShortRep : (I)I
    //   1197: istore_3
    //   1198: goto -> 1563
    //   1201: iload_1
    //   1202: invokestatic StateUpdateChar : (I)I
    //   1205: istore_3
    //   1206: goto -> 1563
    //   1209: aload_0
    //   1210: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1213: iload #17
    //   1215: aaload
    //   1216: getfield Prev1IsChar : Z
    //   1219: ifeq -> 1266
    //   1222: aload_0
    //   1223: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1226: iload #17
    //   1228: aaload
    //   1229: getfield Prev2 : Z
    //   1232: ifeq -> 1266
    //   1235: aload_0
    //   1236: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1239: iload #17
    //   1241: aaload
    //   1242: getfield PosPrev2 : I
    //   1245: istore_3
    //   1246: aload_0
    //   1247: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1250: iload #17
    //   1252: aaload
    //   1253: getfield BackPrev2 : I
    //   1256: istore #5
    //   1258: iload_1
    //   1259: invokestatic StateUpdateRep : (I)I
    //   1262: istore_1
    //   1263: goto -> 1297
    //   1266: aload_0
    //   1267: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1270: iload #17
    //   1272: aaload
    //   1273: getfield BackPrev : I
    //   1276: istore #5
    //   1278: iload #5
    //   1280: iconst_4
    //   1281: if_icmpge -> 1292
    //   1284: iload_1
    //   1285: invokestatic StateUpdateRep : (I)I
    //   1288: istore_1
    //   1289: goto -> 1297
    //   1292: iload_1
    //   1293: invokestatic StateUpdateMatch : (I)I
    //   1296: istore_1
    //   1297: aload_0
    //   1298: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1301: iload_3
    //   1302: aaload
    //   1303: astore #6
    //   1305: iload #5
    //   1307: iconst_4
    //   1308: if_icmpge -> 1516
    //   1311: iload #5
    //   1313: ifne -> 1363
    //   1316: aload_0
    //   1317: getfield reps : [I
    //   1320: iconst_0
    //   1321: aload #6
    //   1323: getfield Backs0 : I
    //   1326: iastore
    //   1327: aload_0
    //   1328: getfield reps : [I
    //   1331: iconst_1
    //   1332: aload #6
    //   1334: getfield Backs1 : I
    //   1337: iastore
    //   1338: aload_0
    //   1339: getfield reps : [I
    //   1342: iconst_2
    //   1343: aload #6
    //   1345: getfield Backs2 : I
    //   1348: iastore
    //   1349: aload_0
    //   1350: getfield reps : [I
    //   1353: iconst_3
    //   1354: aload #6
    //   1356: getfield Backs3 : I
    //   1359: iastore
    //   1360: goto -> 1561
    //   1363: iload #5
    //   1365: iconst_1
    //   1366: if_icmpne -> 1416
    //   1369: aload_0
    //   1370: getfield reps : [I
    //   1373: iconst_0
    //   1374: aload #6
    //   1376: getfield Backs1 : I
    //   1379: iastore
    //   1380: aload_0
    //   1381: getfield reps : [I
    //   1384: iconst_1
    //   1385: aload #6
    //   1387: getfield Backs0 : I
    //   1390: iastore
    //   1391: aload_0
    //   1392: getfield reps : [I
    //   1395: iconst_2
    //   1396: aload #6
    //   1398: getfield Backs2 : I
    //   1401: iastore
    //   1402: aload_0
    //   1403: getfield reps : [I
    //   1406: iconst_3
    //   1407: aload #6
    //   1409: getfield Backs3 : I
    //   1412: iastore
    //   1413: goto -> 1561
    //   1416: iload #5
    //   1418: iconst_2
    //   1419: if_icmpne -> 1469
    //   1422: aload_0
    //   1423: getfield reps : [I
    //   1426: iconst_0
    //   1427: aload #6
    //   1429: getfield Backs2 : I
    //   1432: iastore
    //   1433: aload_0
    //   1434: getfield reps : [I
    //   1437: iconst_1
    //   1438: aload #6
    //   1440: getfield Backs0 : I
    //   1443: iastore
    //   1444: aload_0
    //   1445: getfield reps : [I
    //   1448: iconst_2
    //   1449: aload #6
    //   1451: getfield Backs1 : I
    //   1454: iastore
    //   1455: aload_0
    //   1456: getfield reps : [I
    //   1459: iconst_3
    //   1460: aload #6
    //   1462: getfield Backs3 : I
    //   1465: iastore
    //   1466: goto -> 1561
    //   1469: aload_0
    //   1470: getfield reps : [I
    //   1473: iconst_0
    //   1474: aload #6
    //   1476: getfield Backs3 : I
    //   1479: iastore
    //   1480: aload_0
    //   1481: getfield reps : [I
    //   1484: iconst_1
    //   1485: aload #6
    //   1487: getfield Backs0 : I
    //   1490: iastore
    //   1491: aload_0
    //   1492: getfield reps : [I
    //   1495: iconst_2
    //   1496: aload #6
    //   1498: getfield Backs1 : I
    //   1501: iastore
    //   1502: aload_0
    //   1503: getfield reps : [I
    //   1506: iconst_3
    //   1507: aload #6
    //   1509: getfield Backs2 : I
    //   1512: iastore
    //   1513: goto -> 1561
    //   1516: aload_0
    //   1517: getfield reps : [I
    //   1520: astore #10
    //   1522: aload #10
    //   1524: iconst_0
    //   1525: iload #5
    //   1527: iconst_4
    //   1528: isub
    //   1529: iastore
    //   1530: aload #10
    //   1532: iconst_1
    //   1533: aload #6
    //   1535: getfield Backs0 : I
    //   1538: iastore
    //   1539: aload_0
    //   1540: getfield reps : [I
    //   1543: iconst_2
    //   1544: aload #6
    //   1546: getfield Backs1 : I
    //   1549: iastore
    //   1550: aload_0
    //   1551: getfield reps : [I
    //   1554: iconst_3
    //   1555: aload #6
    //   1557: getfield Backs2 : I
    //   1560: iastore
    //   1561: iload_1
    //   1562: istore_3
    //   1563: aload_0
    //   1564: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1567: astore #10
    //   1569: aload #10
    //   1571: iload #17
    //   1573: aaload
    //   1574: iload_3
    //   1575: putfield State : I
    //   1578: aload #10
    //   1580: iload #17
    //   1582: aaload
    //   1583: astore #14
    //   1585: aload_0
    //   1586: getfield reps : [I
    //   1589: astore #6
    //   1591: aload #14
    //   1593: aload #6
    //   1595: iconst_0
    //   1596: iaload
    //   1597: putfield Backs0 : I
    //   1600: aload #10
    //   1602: iload #17
    //   1604: aaload
    //   1605: aload #6
    //   1607: iconst_1
    //   1608: iaload
    //   1609: putfield Backs1 : I
    //   1612: aload #10
    //   1614: iload #17
    //   1616: aaload
    //   1617: aload #6
    //   1619: iconst_2
    //   1620: iaload
    //   1621: putfield Backs2 : I
    //   1624: aload #10
    //   1626: iload #17
    //   1628: aaload
    //   1629: aload #6
    //   1631: iconst_3
    //   1632: iaload
    //   1633: putfield Backs3 : I
    //   1636: aload #10
    //   1638: iload #17
    //   1640: aaload
    //   1641: getfield Price : I
    //   1644: istore #7
    //   1646: aload_0
    //   1647: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   1650: iconst_m1
    //   1651: invokevirtual GetIndexByte : (I)B
    //   1654: istore #8
    //   1656: aload_0
    //   1657: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   1660: iconst_0
    //   1661: aload_0
    //   1662: getfield reps : [I
    //   1665: iconst_0
    //   1666: iaload
    //   1667: isub
    //   1668: iconst_1
    //   1669: isub
    //   1670: iconst_1
    //   1671: isub
    //   1672: invokevirtual GetIndexByte : (I)B
    //   1675: istore #9
    //   1677: aload_0
    //   1678: getfield _posStateMask : I
    //   1681: iload #11
    //   1683: iand
    //   1684: istore #18
    //   1686: aload_0
    //   1687: getfield _isMatch : [S
    //   1690: astore #6
    //   1692: iload_3
    //   1693: iconst_4
    //   1694: ishl
    //   1695: iload #18
    //   1697: iadd
    //   1698: istore #4
    //   1700: aload #6
    //   1702: iload #4
    //   1704: saload
    //   1705: invokestatic GetPrice0 : (I)I
    //   1708: iload #7
    //   1710: iadd
    //   1711: aload_0
    //   1712: getfield _literalEncoder : Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;
    //   1715: iload #11
    //   1717: aload_0
    //   1718: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   1721: bipush #-2
    //   1723: invokevirtual GetIndexByte : (I)B
    //   1726: invokevirtual GetSubCoder : (IB)Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;
    //   1729: iload_3
    //   1730: invokestatic StateIsCharState : (I)Z
    //   1733: iconst_1
    //   1734: ixor
    //   1735: iload #9
    //   1737: iload #8
    //   1739: invokevirtual GetPrice : (ZBB)I
    //   1742: iadd
    //   1743: istore #19
    //   1745: aload_0
    //   1746: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   1749: astore #6
    //   1751: iload #17
    //   1753: iconst_1
    //   1754: iadd
    //   1755: istore #15
    //   1757: aload #6
    //   1759: iload #15
    //   1761: aaload
    //   1762: astore #6
    //   1764: iload #19
    //   1766: aload #6
    //   1768: getfield Price : I
    //   1771: if_icmpge -> 1799
    //   1774: aload #6
    //   1776: iload #19
    //   1778: putfield Price : I
    //   1781: aload #6
    //   1783: iload #17
    //   1785: putfield PosPrev : I
    //   1788: aload #6
    //   1790: invokevirtual MakeAsChar : ()V
    //   1793: iconst_1
    //   1794: istore #5
    //   1796: goto -> 1802
    //   1799: iconst_0
    //   1800: istore #5
    //   1802: iload_2
    //   1803: istore_1
    //   1804: iload #7
    //   1806: aload_0
    //   1807: getfield _isMatch : [S
    //   1810: iload #4
    //   1812: saload
    //   1813: invokestatic GetPrice1 : (I)I
    //   1816: iadd
    //   1817: istore #20
    //   1819: aload_0
    //   1820: getfield _isRep : [S
    //   1823: iload_3
    //   1824: saload
    //   1825: invokestatic GetPrice1 : (I)I
    //   1828: iload #20
    //   1830: iadd
    //   1831: istore #12
    //   1833: iload #9
    //   1835: iload #8
    //   1837: if_icmpne -> 1902
    //   1840: aload #6
    //   1842: getfield PosPrev : I
    //   1845: iload #17
    //   1847: if_icmpge -> 1858
    //   1850: aload #6
    //   1852: getfield BackPrev : I
    //   1855: ifeq -> 1902
    //   1858: aload_0
    //   1859: iload_3
    //   1860: iload #18
    //   1862: invokevirtual GetRepLen1Price : (II)I
    //   1865: iload #12
    //   1867: iadd
    //   1868: istore_2
    //   1869: iload_2
    //   1870: aload #6
    //   1872: getfield Price : I
    //   1875: if_icmpgt -> 1902
    //   1878: aload #6
    //   1880: iload_2
    //   1881: putfield Price : I
    //   1884: aload #6
    //   1886: iload #17
    //   1888: putfield PosPrev : I
    //   1891: aload #6
    //   1893: invokevirtual MakeAsShortRep : ()V
    //   1896: iconst_1
    //   1897: istore #5
    //   1899: goto -> 1902
    //   1902: sipush #4095
    //   1905: iload #17
    //   1907: isub
    //   1908: aload_0
    //   1909: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   1912: invokevirtual GetNumAvailableBytes : ()I
    //   1915: iconst_1
    //   1916: iadd
    //   1917: invokestatic min : (II)I
    //   1920: istore #4
    //   1922: iload #4
    //   1924: iconst_2
    //   1925: if_icmpge -> 1939
    //   1928: iload_1
    //   1929: istore_2
    //   1930: iload #11
    //   1932: istore_1
    //   1933: iload #17
    //   1935: istore_3
    //   1936: goto -> 991
    //   1939: aload_0
    //   1940: getfield _numFastBytes : I
    //   1943: istore #7
    //   1945: iload #4
    //   1947: iload #7
    //   1949: if_icmple -> 1955
    //   1952: goto -> 1959
    //   1955: iload #4
    //   1957: istore #7
    //   1959: iload #5
    //   1961: ifne -> 2180
    //   1964: iload #9
    //   1966: iload #8
    //   1968: if_icmpeq -> 2180
    //   1971: iload #4
    //   1973: iconst_1
    //   1974: isub
    //   1975: aload_0
    //   1976: getfield _numFastBytes : I
    //   1979: invokestatic min : (II)I
    //   1982: istore_2
    //   1983: aload_0
    //   1984: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   1987: iconst_0
    //   1988: aload_0
    //   1989: getfield reps : [I
    //   1992: iconst_0
    //   1993: iaload
    //   1994: iload_2
    //   1995: invokevirtual GetMatchLen : (III)I
    //   1998: istore #21
    //   2000: iload #21
    //   2002: iconst_2
    //   2003: if_icmplt -> 2180
    //   2006: iload_3
    //   2007: invokestatic StateUpdateChar : (I)I
    //   2010: istore #22
    //   2012: iload #11
    //   2014: iconst_1
    //   2015: iadd
    //   2016: aload_0
    //   2017: getfield _posStateMask : I
    //   2020: iand
    //   2021: istore #23
    //   2023: aload_0
    //   2024: getfield _isMatch : [S
    //   2027: iload #22
    //   2029: iconst_4
    //   2030: ishl
    //   2031: iload #23
    //   2033: iadd
    //   2034: saload
    //   2035: invokestatic GetPrice1 : (I)I
    //   2038: istore #24
    //   2040: aload_0
    //   2041: getfield _isRep : [S
    //   2044: iload #22
    //   2046: saload
    //   2047: invokestatic GetPrice1 : (I)I
    //   2050: istore #25
    //   2052: iload #15
    //   2054: iload #21
    //   2056: iadd
    //   2057: istore #26
    //   2059: iload #13
    //   2061: istore_2
    //   2062: iload_1
    //   2063: iload #26
    //   2065: if_icmpge -> 2089
    //   2068: aload_0
    //   2069: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2072: astore #6
    //   2074: iinc #1, 1
    //   2077: aload #6
    //   2079: iload_1
    //   2080: aaload
    //   2081: ldc 268435455
    //   2083: putfield Price : I
    //   2086: goto -> 2062
    //   2089: iload_2
    //   2090: istore #5
    //   2092: iload #19
    //   2094: iload #24
    //   2096: iadd
    //   2097: iload #25
    //   2099: iadd
    //   2100: aload_0
    //   2101: iconst_0
    //   2102: iload #21
    //   2104: iload #22
    //   2106: iload #23
    //   2108: invokevirtual GetRepPrice : (IIII)I
    //   2111: iadd
    //   2112: istore #19
    //   2114: aload_0
    //   2115: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2118: iload #26
    //   2120: aaload
    //   2121: astore #6
    //   2123: iload_1
    //   2124: istore_2
    //   2125: iload #5
    //   2127: istore #13
    //   2129: iload #19
    //   2131: aload #6
    //   2133: getfield Price : I
    //   2136: if_icmpge -> 2182
    //   2139: aload #6
    //   2141: iload #19
    //   2143: putfield Price : I
    //   2146: aload #6
    //   2148: iload #15
    //   2150: putfield PosPrev : I
    //   2153: aload #6
    //   2155: iconst_0
    //   2156: putfield BackPrev : I
    //   2159: aload #6
    //   2161: iconst_1
    //   2162: putfield Prev1IsChar : Z
    //   2165: aload #6
    //   2167: iconst_0
    //   2168: putfield Prev2 : Z
    //   2171: iload_1
    //   2172: istore_2
    //   2173: iload #5
    //   2175: istore #13
    //   2177: goto -> 2182
    //   2180: iload_1
    //   2181: istore_2
    //   2182: iconst_0
    //   2183: istore #15
    //   2185: iconst_2
    //   2186: istore #5
    //   2188: iload_2
    //   2189: istore_1
    //   2190: iload #5
    //   2192: istore_2
    //   2193: iload #11
    //   2195: istore #5
    //   2197: iload #15
    //   2199: iconst_4
    //   2200: if_icmpge -> 2718
    //   2203: aload_0
    //   2204: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   2207: iconst_m1
    //   2208: aload_0
    //   2209: getfield reps : [I
    //   2212: iload #15
    //   2214: iaload
    //   2215: iload #7
    //   2217: invokevirtual GetMatchLen : (III)I
    //   2220: istore #19
    //   2222: iload #19
    //   2224: iconst_2
    //   2225: if_icmpge -> 2231
    //   2228: goto -> 2709
    //   2231: iload #19
    //   2233: istore #11
    //   2235: iload #17
    //   2237: iload #11
    //   2239: iadd
    //   2240: istore #25
    //   2242: iload_1
    //   2243: iload #25
    //   2245: if_icmpge -> 2269
    //   2248: aload_0
    //   2249: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2252: astore #6
    //   2254: iinc #1, 1
    //   2257: aload #6
    //   2259: iload_1
    //   2260: aaload
    //   2261: ldc 268435455
    //   2263: putfield Price : I
    //   2266: goto -> 2235
    //   2269: aload_0
    //   2270: iload #15
    //   2272: iload #11
    //   2274: iload_3
    //   2275: iload #18
    //   2277: invokevirtual GetRepPrice : (IIII)I
    //   2280: iload #12
    //   2282: iadd
    //   2283: istore #26
    //   2285: aload_0
    //   2286: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2289: iload #25
    //   2291: aaload
    //   2292: astore #6
    //   2294: iload #26
    //   2296: aload #6
    //   2298: getfield Price : I
    //   2301: if_icmpge -> 2331
    //   2304: aload #6
    //   2306: iload #26
    //   2308: putfield Price : I
    //   2311: aload #6
    //   2313: iload #17
    //   2315: putfield PosPrev : I
    //   2318: aload #6
    //   2320: iload #15
    //   2322: putfield BackPrev : I
    //   2325: aload #6
    //   2327: iconst_0
    //   2328: putfield Prev1IsChar : Z
    //   2331: iinc #11, -1
    //   2334: iload #11
    //   2336: iconst_2
    //   2337: if_icmpge -> 2715
    //   2340: iload #15
    //   2342: ifne -> 2350
    //   2345: iload #19
    //   2347: iconst_1
    //   2348: iadd
    //   2349: istore_2
    //   2350: iload #19
    //   2352: iload #4
    //   2354: if_icmpge -> 2709
    //   2357: iload #4
    //   2359: iconst_1
    //   2360: isub
    //   2361: iload #19
    //   2363: isub
    //   2364: aload_0
    //   2365: getfield _numFastBytes : I
    //   2368: invokestatic min : (II)I
    //   2371: istore #11
    //   2373: aload_0
    //   2374: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   2377: iload #19
    //   2379: aload_0
    //   2380: getfield reps : [I
    //   2383: iload #15
    //   2385: iaload
    //   2386: iload #11
    //   2388: invokevirtual GetMatchLen : (III)I
    //   2391: istore #11
    //   2393: iload #11
    //   2395: iconst_2
    //   2396: if_icmplt -> 2709
    //   2399: iload_3
    //   2400: invokestatic StateUpdateRep : (I)I
    //   2403: istore #24
    //   2405: iload #5
    //   2407: iload #19
    //   2409: iadd
    //   2410: istore #21
    //   2412: aload_0
    //   2413: getfield _posStateMask : I
    //   2416: istore #25
    //   2418: aload_0
    //   2419: iload #15
    //   2421: iload #19
    //   2423: iload_3
    //   2424: iload #18
    //   2426: invokevirtual GetRepPrice : (IIII)I
    //   2429: istore #26
    //   2431: aload_0
    //   2432: getfield _isMatch : [S
    //   2435: iload #24
    //   2437: iconst_4
    //   2438: ishl
    //   2439: iload #25
    //   2441: iload #21
    //   2443: iand
    //   2444: iadd
    //   2445: saload
    //   2446: invokestatic GetPrice0 : (I)I
    //   2449: istore #25
    //   2451: aload_0
    //   2452: getfield _literalEncoder : Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;
    //   2455: astore #6
    //   2457: aload_0
    //   2458: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   2461: astore #10
    //   2463: iload #19
    //   2465: iconst_1
    //   2466: isub
    //   2467: istore #23
    //   2469: aload #6
    //   2471: iload #21
    //   2473: aload #10
    //   2475: iload #23
    //   2477: iconst_1
    //   2478: isub
    //   2479: invokevirtual GetIndexByte : (I)B
    //   2482: invokevirtual GetSubCoder : (IB)Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;
    //   2485: iconst_1
    //   2486: aload_0
    //   2487: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   2490: iload #23
    //   2492: aload_0
    //   2493: getfield reps : [I
    //   2496: iload #15
    //   2498: iaload
    //   2499: iconst_1
    //   2500: iadd
    //   2501: isub
    //   2502: invokevirtual GetIndexByte : (I)B
    //   2505: aload_0
    //   2506: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   2509: iload #23
    //   2511: invokevirtual GetIndexByte : (I)B
    //   2514: invokevirtual GetPrice : (ZBB)I
    //   2517: istore #23
    //   2519: iload #24
    //   2521: invokestatic StateUpdateChar : (I)I
    //   2524: istore #24
    //   2526: aload_0
    //   2527: getfield _posStateMask : I
    //   2530: iload #21
    //   2532: iconst_1
    //   2533: iadd
    //   2534: iand
    //   2535: istore #22
    //   2537: aload_0
    //   2538: getfield _isMatch : [S
    //   2541: iload #24
    //   2543: iconst_4
    //   2544: ishl
    //   2545: iload #22
    //   2547: iadd
    //   2548: saload
    //   2549: invokestatic GetPrice1 : (I)I
    //   2552: istore #27
    //   2554: aload_0
    //   2555: getfield _isRep : [S
    //   2558: iload #24
    //   2560: saload
    //   2561: invokestatic GetPrice1 : (I)I
    //   2564: istore #21
    //   2566: iload #17
    //   2568: iload #19
    //   2570: iconst_1
    //   2571: iadd
    //   2572: iload #11
    //   2574: iadd
    //   2575: iadd
    //   2576: istore #28
    //   2578: iload_1
    //   2579: iload #28
    //   2581: if_icmpge -> 2605
    //   2584: aload_0
    //   2585: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2588: astore #6
    //   2590: iinc #1, 1
    //   2593: aload #6
    //   2595: iload_1
    //   2596: aaload
    //   2597: ldc 268435455
    //   2599: putfield Price : I
    //   2602: goto -> 2566
    //   2605: iload #12
    //   2607: iload #26
    //   2609: iadd
    //   2610: iload #25
    //   2612: iadd
    //   2613: iload #23
    //   2615: iadd
    //   2616: iload #27
    //   2618: iadd
    //   2619: iload #21
    //   2621: iadd
    //   2622: aload_0
    //   2623: iconst_0
    //   2624: iload #11
    //   2626: iload #24
    //   2628: iload #22
    //   2630: invokevirtual GetRepPrice : (IIII)I
    //   2633: iadd
    //   2634: istore #11
    //   2636: aload_0
    //   2637: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2640: iload #28
    //   2642: aaload
    //   2643: astore #6
    //   2645: iload #11
    //   2647: aload #6
    //   2649: getfield Price : I
    //   2652: if_icmpge -> 2706
    //   2655: aload #6
    //   2657: iload #11
    //   2659: putfield Price : I
    //   2662: aload #6
    //   2664: iload #19
    //   2666: iload #17
    //   2668: iadd
    //   2669: iconst_1
    //   2670: iadd
    //   2671: putfield PosPrev : I
    //   2674: aload #6
    //   2676: iconst_0
    //   2677: putfield BackPrev : I
    //   2680: aload #6
    //   2682: iconst_1
    //   2683: putfield Prev1IsChar : Z
    //   2686: aload #6
    //   2688: iconst_1
    //   2689: putfield Prev2 : Z
    //   2692: aload #6
    //   2694: iload #17
    //   2696: putfield PosPrev2 : I
    //   2699: aload #6
    //   2701: iload #15
    //   2703: putfield BackPrev2 : I
    //   2706: goto -> 2709
    //   2709: iinc #15, 1
    //   2712: goto -> 2197
    //   2715: goto -> 2235
    //   2718: iload #13
    //   2720: iload #7
    //   2722: if_icmple -> 2770
    //   2725: iconst_0
    //   2726: istore #13
    //   2728: aload_0
    //   2729: getfield _matchDistances : [I
    //   2732: astore #6
    //   2734: iload #7
    //   2736: aload #6
    //   2738: iload #13
    //   2740: iaload
    //   2741: if_icmple -> 2750
    //   2744: iinc #13, 2
    //   2747: goto -> 2728
    //   2750: aload #6
    //   2752: iload #13
    //   2754: iload #7
    //   2756: iastore
    //   2757: iload #13
    //   2759: iconst_2
    //   2760: iadd
    //   2761: istore #11
    //   2763: iload #7
    //   2765: istore #13
    //   2767: goto -> 2774
    //   2770: iload #16
    //   2772: istore #11
    //   2774: iload #13
    //   2776: iload_2
    //   2777: if_icmplt -> 3324
    //   2780: iload #20
    //   2782: aload_0
    //   2783: getfield _isRep : [S
    //   2786: iload_3
    //   2787: saload
    //   2788: invokestatic GetPrice0 : (I)I
    //   2791: iadd
    //   2792: istore #25
    //   2794: iload_1
    //   2795: istore #7
    //   2797: iload #7
    //   2799: iload #17
    //   2801: iload #13
    //   2803: iadd
    //   2804: if_icmpge -> 2829
    //   2807: aload_0
    //   2808: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2811: astore #6
    //   2813: iinc #7, 1
    //   2816: aload #6
    //   2818: iload #7
    //   2820: aaload
    //   2821: ldc 268435455
    //   2823: putfield Price : I
    //   2826: goto -> 2797
    //   2829: iconst_0
    //   2830: istore #13
    //   2832: iload #4
    //   2834: istore #19
    //   2836: iload #13
    //   2838: istore #26
    //   2840: iload_3
    //   2841: istore #12
    //   2843: iload #25
    //   2845: istore #16
    //   2847: iload_2
    //   2848: istore #20
    //   2850: iload #7
    //   2852: istore_1
    //   2853: iload #18
    //   2855: istore #15
    //   2857: iload_2
    //   2858: aload_0
    //   2859: getfield _matchDistances : [I
    //   2862: iload #13
    //   2864: iaload
    //   2865: if_icmple -> 2874
    //   2868: iinc #13, 2
    //   2871: goto -> 2832
    //   2874: aload_0
    //   2875: getfield _matchDistances : [I
    //   2878: iload #26
    //   2880: iconst_1
    //   2881: iadd
    //   2882: iaload
    //   2883: istore_3
    //   2884: aload_0
    //   2885: iload_3
    //   2886: iload #20
    //   2888: iload #15
    //   2890: invokevirtual GetPosLenPrice : (III)I
    //   2893: iload #16
    //   2895: iadd
    //   2896: istore #7
    //   2898: aload_0
    //   2899: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   2902: astore #6
    //   2904: iload #17
    //   2906: iload #20
    //   2908: iadd
    //   2909: istore_2
    //   2910: aload #6
    //   2912: iload_2
    //   2913: aaload
    //   2914: astore #6
    //   2916: iload #7
    //   2918: aload #6
    //   2920: getfield Price : I
    //   2923: if_icmpge -> 2954
    //   2926: aload #6
    //   2928: iload #7
    //   2930: putfield Price : I
    //   2933: aload #6
    //   2935: iload #17
    //   2937: putfield PosPrev : I
    //   2940: aload #6
    //   2942: iload_3
    //   2943: iconst_4
    //   2944: iadd
    //   2945: putfield BackPrev : I
    //   2948: aload #6
    //   2950: iconst_0
    //   2951: putfield Prev1IsChar : Z
    //   2954: iload #20
    //   2956: aload_0
    //   2957: getfield _matchDistances : [I
    //   2960: iload #26
    //   2962: iaload
    //   2963: if_icmpne -> 3318
    //   2966: iload #20
    //   2968: iload #19
    //   2970: if_icmpge -> 3300
    //   2973: iload #19
    //   2975: iconst_1
    //   2976: isub
    //   2977: iload #20
    //   2979: isub
    //   2980: aload_0
    //   2981: getfield _numFastBytes : I
    //   2984: invokestatic min : (II)I
    //   2987: istore #13
    //   2989: aload_0
    //   2990: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   2993: iload #20
    //   2995: iload_3
    //   2996: iload #13
    //   2998: invokevirtual GetMatchLen : (III)I
    //   3001: istore #13
    //   3003: iload #13
    //   3005: iconst_2
    //   3006: if_icmplt -> 3300
    //   3009: iload #12
    //   3011: invokestatic StateUpdateMatch : (I)I
    //   3014: istore #25
    //   3016: iload #5
    //   3018: iload #20
    //   3020: iadd
    //   3021: istore #23
    //   3023: aload_0
    //   3024: getfield _posStateMask : I
    //   3027: istore #4
    //   3029: aload_0
    //   3030: getfield _isMatch : [S
    //   3033: iload #25
    //   3035: iconst_4
    //   3036: ishl
    //   3037: iload #4
    //   3039: iload #23
    //   3041: iand
    //   3042: iadd
    //   3043: saload
    //   3044: invokestatic GetPrice0 : (I)I
    //   3047: istore #4
    //   3049: aload_0
    //   3050: getfield _literalEncoder : Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;
    //   3053: astore #6
    //   3055: aload_0
    //   3056: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   3059: astore #10
    //   3061: iload #20
    //   3063: iconst_1
    //   3064: isub
    //   3065: istore #18
    //   3067: aload #6
    //   3069: iload #23
    //   3071: aload #10
    //   3073: iload #18
    //   3075: iconst_1
    //   3076: isub
    //   3077: invokevirtual GetIndexByte : (I)B
    //   3080: invokevirtual GetSubCoder : (IB)Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;
    //   3083: iconst_1
    //   3084: aload_0
    //   3085: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   3088: iload #20
    //   3090: iload_3
    //   3091: iconst_1
    //   3092: iadd
    //   3093: isub
    //   3094: iconst_1
    //   3095: isub
    //   3096: invokevirtual GetIndexByte : (I)B
    //   3099: aload_0
    //   3100: getfield _matchFinder : Lcom/badlogic/gdx/utils/compression/lz/BinTree;
    //   3103: iload #18
    //   3105: invokevirtual GetIndexByte : (I)B
    //   3108: invokevirtual GetPrice : (ZBB)I
    //   3111: istore #18
    //   3113: iload #25
    //   3115: invokestatic StateUpdateChar : (I)I
    //   3118: istore #25
    //   3120: aload_0
    //   3121: getfield _posStateMask : I
    //   3124: iload #23
    //   3126: iconst_1
    //   3127: iadd
    //   3128: iand
    //   3129: istore #21
    //   3131: aload_0
    //   3132: getfield _isMatch : [S
    //   3135: iload #25
    //   3137: iconst_4
    //   3138: ishl
    //   3139: iload #21
    //   3141: iadd
    //   3142: saload
    //   3143: invokestatic GetPrice1 : (I)I
    //   3146: istore #23
    //   3148: aload_0
    //   3149: getfield _isRep : [S
    //   3152: iload #25
    //   3154: saload
    //   3155: invokestatic GetPrice1 : (I)I
    //   3158: istore #24
    //   3160: iload #17
    //   3162: iload #20
    //   3164: iconst_1
    //   3165: iadd
    //   3166: iload #13
    //   3168: iadd
    //   3169: iadd
    //   3170: istore #22
    //   3172: iload_1
    //   3173: iload #22
    //   3175: if_icmpge -> 3199
    //   3178: aload_0
    //   3179: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   3182: astore #6
    //   3184: iinc #1, 1
    //   3187: aload #6
    //   3189: iload_1
    //   3190: aaload
    //   3191: ldc 268435455
    //   3193: putfield Price : I
    //   3196: goto -> 3160
    //   3199: iload #7
    //   3201: iload #4
    //   3203: iadd
    //   3204: iload #18
    //   3206: iadd
    //   3207: iload #23
    //   3209: iadd
    //   3210: iload #24
    //   3212: iadd
    //   3213: aload_0
    //   3214: iconst_0
    //   3215: iload #13
    //   3217: iload #25
    //   3219: iload #21
    //   3221: invokevirtual GetRepPrice : (IIII)I
    //   3224: iadd
    //   3225: istore #7
    //   3227: aload_0
    //   3228: getfield _optimum : [Lcom/badlogic/gdx/utils/compression/lzma/Encoder$Optimal;
    //   3231: iload #22
    //   3233: aaload
    //   3234: astore #6
    //   3236: iload #7
    //   3238: aload #6
    //   3240: getfield Price : I
    //   3243: if_icmpge -> 3297
    //   3246: aload #6
    //   3248: iload #7
    //   3250: putfield Price : I
    //   3253: aload #6
    //   3255: iload_2
    //   3256: iconst_1
    //   3257: iadd
    //   3258: putfield PosPrev : I
    //   3261: aload #6
    //   3263: iconst_0
    //   3264: putfield BackPrev : I
    //   3267: aload #6
    //   3269: iconst_1
    //   3270: putfield Prev1IsChar : Z
    //   3273: aload #6
    //   3275: iconst_1
    //   3276: putfield Prev2 : Z
    //   3279: aload #6
    //   3281: iload #17
    //   3283: putfield PosPrev2 : I
    //   3286: aload #6
    //   3288: iload_3
    //   3289: iconst_4
    //   3290: iadd
    //   3291: putfield BackPrev2 : I
    //   3294: goto -> 3297
    //   3297: goto -> 3300
    //   3300: iinc #26, 2
    //   3303: iload #26
    //   3305: iload #11
    //   3307: if_icmpne -> 3315
    //   3310: iload_1
    //   3311: istore_2
    //   3312: goto -> 3326
    //   3315: goto -> 3318
    //   3318: iinc #20, 1
    //   3321: goto -> 2874
    //   3324: iload_1
    //   3325: istore_2
    //   3326: iload #5
    //   3328: istore_1
    //   3329: goto -> 1933
    //   3332: iload #7
    //   3334: istore #5
    //   3336: goto -> 640 }
  
  int GetPosLenPrice(int paramInt1, int paramInt2, int paramInt3) {
    int i = Base.GetLenToPosState(paramInt2);
    if (paramInt1 < 128) {
      paramInt1 = this._distancesPrices[i * 128 + paramInt1];
    } else {
      i = this._posSlotPrices[(i << 6) + GetPosSlot2(paramInt1)];
      paramInt1 = this._alignPrices[paramInt1 & 0xF] + i;
    } 
    return paramInt1 + this._lenEncoder.GetPrice(paramInt2 - 2, paramInt3);
  }
  
  int GetPureRepPrice(int paramInt1, int paramInt2, int paramInt3) {
    if (paramInt1 == 0) {
      paramInt1 = Encoder.GetPrice0(this._isRepG0[paramInt2]) + Encoder.GetPrice1(this._isRep0Long[(paramInt2 << 4) + paramInt3]);
    } else {
      paramInt3 = Encoder.GetPrice1(this._isRepG0[paramInt2]);
      if (paramInt1 == 1) {
        paramInt1 = Encoder.GetPrice0(this._isRepG1[paramInt2]);
        paramInt2 = paramInt3;
      } else {
        paramInt3 += Encoder.GetPrice1(this._isRepG1[paramInt2]);
        paramInt1 = Encoder.GetPrice(this._isRepG2[paramInt2], paramInt1 - 2);
        paramInt2 = paramInt3;
      } 
      paramInt1 += paramInt2;
    } 
    return paramInt1;
  }
  
  int GetRepLen1Price(int paramInt1, int paramInt2) { return Encoder.GetPrice0(this._isRepG0[paramInt1]) + Encoder.GetPrice0(this._isRep0Long[(paramInt1 << 4) + paramInt2]); }
  
  int GetRepPrice(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { return this._repMatchLenEncoder.GetPrice(paramInt2 - 2, paramInt4) + GetPureRepPrice(paramInt1, paramInt3, paramInt4); }
  
  void Init() {
    BaseInit();
    this._rangeEncoder.Init();
    Encoder.InitBitModels(this._isMatch);
    Encoder.InitBitModels(this._isRep0Long);
    Encoder.InitBitModels(this._isRep);
    Encoder.InitBitModels(this._isRepG0);
    Encoder.InitBitModels(this._isRepG1);
    Encoder.InitBitModels(this._isRepG2);
    Encoder.InitBitModels(this._posEncoders);
    this._literalEncoder.Init();
    for (byte b = 0; b < 4; b++)
      this._posSlotEncoder[b].Init(); 
    this._lenEncoder.Init(1 << this._posStateBits);
    this._repMatchLenEncoder.Init(1 << this._posStateBits);
    this._posAlignEncoder.Init();
    this._longestMatchWasFound = false;
    this._optimumEndIndex = 0;
    this._optimumCurrentIndex = 0;
    this._additionalOffset = 0;
  }
  
  void MovePos(int paramInt) throws IOException {
    if (paramInt > 0) {
      this._matchFinder.Skip(paramInt);
      this._additionalOffset += paramInt;
    } 
  }
  
  int ReadMatchDistances() throws IOException {
    byte b;
    this._numDistancePairs = this._matchFinder.GetMatches(this._matchDistances);
    int i = this._numDistancePairs;
    if (i > 0) {
      int[] arrayOfInt = this._matchDistances;
      int j = arrayOfInt[i - 2];
      b = j;
      if (j == this._numFastBytes)
        b = j + this._matchFinder.GetMatchLen(j - 1, arrayOfInt[i - 1], 273 - j); 
    } else {
      b = 0;
    } 
    this._additionalOffset++;
    return b;
  }
  
  void ReleaseMFStream() {
    BinTree binTree = this._matchFinder;
    if (binTree != null && this._needReleaseMFStream) {
      binTree.ReleaseStream();
      this._needReleaseMFStream = false;
    } 
  }
  
  void ReleaseOutStream() { this._rangeEncoder.ReleaseStream(); }
  
  void ReleaseStreams() {
    ReleaseMFStream();
    ReleaseOutStream();
  }
  
  public boolean SetAlgorithm(int paramInt) { return true; }
  
  public boolean SetDictionarySize(int paramInt) {
    byte b = 0;
    if (paramInt < 1 || paramInt > 536870912)
      return false; 
    this._dictionarySize = paramInt;
    while (paramInt > true << b)
      b++; 
    this._distTableSize = b * 2;
    return true;
  }
  
  public void SetEndMarkerMode(boolean paramBoolean) { this._writeEndMark = paramBoolean; }
  
  public boolean SetLcLpPb(int paramInt1, int paramInt2, int paramInt3) {
    if (paramInt2 < 0 || paramInt2 > 4 || paramInt1 < 0 || paramInt1 > 8 || paramInt3 < 0 || paramInt3 > 4)
      return false; 
    this._numLiteralPosStateBits = paramInt2;
    this._numLiteralContextBits = paramInt1;
    this._posStateBits = paramInt3;
    this._posStateMask = (1 << this._posStateBits) - 1;
    return true;
  }
  
  public boolean SetMatchFinder(int paramInt) {
    if (paramInt < 0 || paramInt > 2)
      return false; 
    int i = this._matchFinderType;
    this._matchFinderType = paramInt;
    if (this._matchFinder != null && i != this._matchFinderType) {
      this._dictionarySizePrev = -1;
      this._matchFinder = null;
    } 
    return true;
  }
  
  public boolean SetNumFastBytes(int paramInt) {
    if (paramInt < 5 || paramInt > 273)
      return false; 
    this._numFastBytes = paramInt;
    return true;
  }
  
  void SetOutStream(OutputStream paramOutputStream) { this._rangeEncoder.SetStream(paramOutputStream); }
  
  void SetStreams(InputStream paramInputStream, OutputStream paramOutputStream, long paramLong1, long paramLong2) {
    this._inStream = paramInputStream;
    this._finished = false;
    Create();
    SetOutStream(paramOutputStream);
    Init();
    FillDistancesPrices();
    FillAlignPrices();
    this._lenEncoder.SetTableSize(this._numFastBytes + 1 - 2);
    this._lenEncoder.UpdateTables(1 << this._posStateBits);
    this._repMatchLenEncoder.SetTableSize(this._numFastBytes + 1 - 2);
    this._repMatchLenEncoder.UpdateTables(1 << this._posStateBits);
    this.nowPos64 = 0L;
  }
  
  void SetWriteEndMarkerMode(boolean paramBoolean) { this._writeEndMark = paramBoolean; }
  
  public void WriteCoderProperties(OutputStream paramOutputStream) {
    this.properties[0] = (byte)(byte)((this._posStateBits * 5 + this._numLiteralPosStateBits) * 9 + this._numLiteralContextBits);
    for (byte b = 0; b < 4; b = b1) {
      byte[] arrayOfByte = this.properties;
      byte b1 = b + true;
      arrayOfByte[b1] = (byte)(byte)(this._dictionarySize >> b * 8);
    } 
    paramOutputStream.write(this.properties, 0, 5);
  }
  
  void WriteEndMarker(int paramInt) throws IOException {
    if (!this._writeEndMark)
      return; 
    this._rangeEncoder.Encode(this._isMatch, (this._state << 4) + paramInt, 1);
    this._rangeEncoder.Encode(this._isRep, this._state, 0);
    this._state = Base.StateUpdateMatch(this._state);
    this._lenEncoder.Encode(this._rangeEncoder, 0, paramInt);
    paramInt = Base.GetLenToPosState(2);
    this._posSlotEncoder[paramInt].Encode(this._rangeEncoder, 63);
    this._rangeEncoder.EncodeDirectBits(67108863, 26);
    this._posAlignEncoder.ReverseEncode(this._rangeEncoder, 15);
  }
  
  class LenEncoder {
    short[] _choice = new short[2];
    
    BitTreeEncoder _highCoder = new BitTreeEncoder(8);
    
    BitTreeEncoder[] _lowCoder = new BitTreeEncoder[16];
    
    BitTreeEncoder[] _midCoder = new BitTreeEncoder[16];
    
    public LenEncoder() {
      for (byte b = 0; b < 16; b++) {
        this._lowCoder[b] = new BitTreeEncoder(3);
        this._midCoder[b] = new BitTreeEncoder(3);
      } 
    }
    
    public void Encode(Encoder param1Encoder, int param1Int1, int param1Int2) throws IOException {
      if (param1Int1 < 8) {
        param1Encoder.Encode(this._choice, 0, 0);
        this._lowCoder[param1Int2].Encode(param1Encoder, param1Int1);
      } else {
        param1Int1 -= 8;
        param1Encoder.Encode(this._choice, 0, 1);
        if (param1Int1 < 8) {
          param1Encoder.Encode(this._choice, 1, 0);
          this._midCoder[param1Int2].Encode(param1Encoder, param1Int1);
        } else {
          param1Encoder.Encode(this._choice, 1, 1);
          this._highCoder.Encode(param1Encoder, param1Int1 - 8);
        } 
      } 
    }
    
    public void Init(int param1Int) throws IOException {
      Encoder.InitBitModels(this._choice);
      for (byte b = 0; b < param1Int; b++) {
        this._lowCoder[b].Init();
        this._midCoder[b].Init();
      } 
      this._highCoder.Init();
    }
    
    public void SetPrices(int param1Int1, int param1Int2, int[] param1ArrayOfInt, int param1Int3) {
      int i1;
      short[] arrayOfShort = this._choice;
      int i = 0;
      int j = Encoder.GetPrice0(arrayOfShort[0]);
      int k = Encoder.GetPrice1(this._choice[0]);
      int m = Encoder.GetPrice0(this._choice[1]);
      int n = Encoder.GetPrice1(this._choice[1]);
      while (true) {
        i1 = i;
        if (i < 8) {
          if (i >= param1Int2)
            return; 
          param1ArrayOfInt[param1Int3 + i] = this._lowCoder[param1Int1].GetPrice(i) + j;
          i++;
          continue;
        } 
        break;
      } 
      while (true) {
        i = i1;
        if (i1 < 16) {
          if (i1 >= param1Int2)
            return; 
          param1ArrayOfInt[param1Int3 + i1] = this._midCoder[param1Int1].GetPrice(i1 - 8) + m + k;
          i1++;
          continue;
        } 
        break;
      } 
      while (i < param1Int2) {
        param1ArrayOfInt[param1Int3 + i] = this._highCoder.GetPrice(i - 8 - 8) + k + n;
        i++;
      } 
    }
  }
  
  class LenPriceTableEncoder extends LenEncoder {
    int[] _counters = new int[16];
    
    int[] _prices = new int[4352];
    
    int _tableSize;
    
    LenPriceTableEncoder() { super(Encoder.this); }
    
    public void Encode(Encoder param1Encoder, int param1Int1, int param1Int2) throws IOException {
      super.Encode(param1Encoder, param1Int1, param1Int2);
      int[] arrayOfInt = this._counters;
      param1Int1 = arrayOfInt[param1Int2] - 1;
      arrayOfInt[param1Int2] = param1Int1;
      if (param1Int1 == 0)
        UpdateTable(param1Int2); 
    }
    
    public int GetPrice(int param1Int1, int param1Int2) { return this._prices[param1Int2 * 272 + param1Int1]; }
    
    public void SetTableSize(int param1Int) throws IOException { this._tableSize = param1Int; }
    
    void UpdateTable(int param1Int) throws IOException {
      SetPrices(param1Int, this._tableSize, this._prices, param1Int * 272);
      this._counters[param1Int] = this._tableSize;
    }
    
    public void UpdateTables(int param1Int) throws IOException {
      for (byte b = 0; b < param1Int; b++)
        UpdateTable(b); 
    }
  }
  
  class LiteralEncoder {
    Encoder2[] m_Coders;
    
    int m_NumPosBits;
    
    int m_NumPrevBits;
    
    int m_PosMask;
    
    public void Create(int param1Int1, int param1Int2) {
      if (this.m_Coders != null && this.m_NumPrevBits == param1Int2 && this.m_NumPosBits == param1Int1)
        return; 
      this.m_NumPosBits = param1Int1;
      this.m_PosMask = (1 << param1Int1) - 1;
      this.m_NumPrevBits = param1Int2;
      param1Int2 = 1 << this.m_NumPrevBits + this.m_NumPosBits;
      this.m_Coders = new Encoder2[param1Int2];
      for (param1Int1 = 0; param1Int1 < param1Int2; param1Int1++)
        this.m_Coders[param1Int1] = new Encoder2(); 
    }
    
    public Encoder2 GetSubCoder(int param1Int, byte param1Byte) {
      Encoder2[] arrayOfEncoder2 = this.m_Coders;
      int i = this.m_PosMask;
      int j = this.m_NumPrevBits;
      return arrayOfEncoder2[((param1Int & i) << j) + ((param1Byte & 0xFF) >>> 8 - j)];
    }
    
    public void Init() {
      int i = this.m_NumPrevBits;
      int j = this.m_NumPosBits;
      for (byte b = 0; b < 1 << i + j; b++)
        this.m_Coders[b].Init(); 
    }
    
    class Encoder2 {
      short[] m_Encoders = new short[768];
      
      public void Encode(Encoder param2Encoder, byte param2Byte) throws IOException {
        byte b1 = 7;
        byte b2 = 1;
        while (b1 >= 0) {
          byte b = param2Byte >> b1 & true;
          param2Encoder.Encode(this.m_Encoders, b2, b);
          b2 = b2 << 1 | b;
          b1--;
        } 
      }
      
      public void EncodeMatched(Encoder param2Encoder, byte param2Byte1, byte param2Byte2) throws IOException {
        byte b1 = 7;
        byte b2 = 1;
        byte b3 = 1;
        while (b1 >= 0) {
          byte b4;
          byte b = param2Byte2 >> b1 & true;
          if (b3) {
            b3 = param2Byte1 >> b1 & true;
            b4 = (b3 + 1 << 8) + b2;
            if (b3 == b) {
              b3 = 1;
            } else {
              b3 = 0;
            } 
          } else {
            b4 = b2;
          } 
          param2Encoder.Encode(this.m_Encoders, b4, b);
          b2 = b2 << 1 | b;
          b1--;
        } 
      }
      
      public int GetPrice(boolean param2Boolean, byte param2Byte1, byte param2Byte2) { // Byte code:
        //   0: iconst_0
        //   1: istore #4
        //   3: iconst_0
        //   4: istore #5
        //   6: bipush #7
        //   8: istore #6
        //   10: iload_1
        //   11: ifeq -> 108
        //   14: iconst_1
        //   15: istore #7
        //   17: iload #5
        //   19: istore #4
        //   21: iload #6
        //   23: istore #8
        //   25: iload #7
        //   27: istore #9
        //   29: iload #6
        //   31: iflt -> 115
        //   34: iload_2
        //   35: iload #6
        //   37: ishr
        //   38: iconst_1
        //   39: iand
        //   40: istore #9
        //   42: iload_3
        //   43: iload #6
        //   45: ishr
        //   46: iconst_1
        //   47: iand
        //   48: istore #8
        //   50: iload #5
        //   52: aload_0
        //   53: getfield m_Encoders : [S
        //   56: iload #9
        //   58: iconst_1
        //   59: iadd
        //   60: bipush #8
        //   62: ishl
        //   63: iload #7
        //   65: iadd
        //   66: saload
        //   67: iload #8
        //   69: invokestatic GetPrice : (II)I
        //   72: iadd
        //   73: istore #5
        //   75: iload #7
        //   77: iconst_1
        //   78: ishl
        //   79: iload #8
        //   81: ior
        //   82: istore #7
        //   84: iload #9
        //   86: iload #8
        //   88: if_icmpeq -> 102
        //   91: iload #5
        //   93: istore #4
        //   95: iload #7
        //   97: istore #9
        //   99: goto -> 155
        //   102: iinc #6, -1
        //   105: goto -> 17
        //   108: iconst_1
        //   109: istore #9
        //   111: iload #6
        //   113: istore #8
        //   115: iload #8
        //   117: iflt -> 164
        //   120: iload_3
        //   121: iload #8
        //   123: ishr
        //   124: iconst_1
        //   125: iand
        //   126: istore_2
        //   127: iload #4
        //   129: aload_0
        //   130: getfield m_Encoders : [S
        //   133: iload #9
        //   135: saload
        //   136: iload_2
        //   137: invokestatic GetPrice : (II)I
        //   140: iadd
        //   141: istore #4
        //   143: iload #9
        //   145: iconst_1
        //   146: ishl
        //   147: iload_2
        //   148: ior
        //   149: istore #9
        //   151: iload #8
        //   153: istore #6
        //   155: iload #6
        //   157: iconst_1
        //   158: isub
        //   159: istore #8
        //   161: goto -> 115
        //   164: iload #4
        //   166: ireturn }
      
      public void Init() { Encoder.InitBitModels(this.m_Encoders); }
    }
  }
  
  class Encoder2 {
    short[] m_Encoders = new short[768];
    
    Encoder2() {}
    
    public void Encode(Encoder param1Encoder, byte param1Byte) throws IOException {
      byte b1 = 7;
      byte b2 = 1;
      while (b1 >= 0) {
        byte b = param1Byte >> b1 & true;
        param1Encoder.Encode(this.m_Encoders, b2, b);
        b2 = b2 << 1 | b;
        b1--;
      } 
    }
    
    public void EncodeMatched(Encoder param1Encoder, byte param1Byte1, byte param1Byte2) throws IOException {
      byte b1 = 7;
      byte b2 = 1;
      byte b3 = 1;
      while (b1 >= 0) {
        byte b4;
        byte b = param1Byte2 >> b1 & true;
        if (b3) {
          b3 = param1Byte1 >> b1 & true;
          b4 = (b3 + 1 << 8) + b2;
          if (b3 == b) {
            b3 = 1;
          } else {
            b3 = 0;
          } 
        } else {
          b4 = b2;
        } 
        param1Encoder.Encode(this.m_Encoders, b4, b);
        b2 = b2 << 1 | b;
        b1--;
      } 
    }
    
    public int GetPrice(boolean param1Boolean, byte param1Byte1, byte param1Byte2) { // Byte code:
      //   0: iconst_0
      //   1: istore #4
      //   3: iconst_0
      //   4: istore #5
      //   6: bipush #7
      //   8: istore #6
      //   10: iload_1
      //   11: ifeq -> 108
      //   14: iconst_1
      //   15: istore #7
      //   17: iload #5
      //   19: istore #4
      //   21: iload #6
      //   23: istore #8
      //   25: iload #7
      //   27: istore #9
      //   29: iload #6
      //   31: iflt -> 115
      //   34: iload_2
      //   35: iload #6
      //   37: ishr
      //   38: iconst_1
      //   39: iand
      //   40: istore #9
      //   42: iload_3
      //   43: iload #6
      //   45: ishr
      //   46: iconst_1
      //   47: iand
      //   48: istore #8
      //   50: iload #5
      //   52: aload_0
      //   53: getfield m_Encoders : [S
      //   56: iload #9
      //   58: iconst_1
      //   59: iadd
      //   60: bipush #8
      //   62: ishl
      //   63: iload #7
      //   65: iadd
      //   66: saload
      //   67: iload #8
      //   69: invokestatic GetPrice : (II)I
      //   72: iadd
      //   73: istore #5
      //   75: iload #7
      //   77: iconst_1
      //   78: ishl
      //   79: iload #8
      //   81: ior
      //   82: istore #7
      //   84: iload #9
      //   86: iload #8
      //   88: if_icmpeq -> 102
      //   91: iload #5
      //   93: istore #4
      //   95: iload #7
      //   97: istore #9
      //   99: goto -> 155
      //   102: iinc #6, -1
      //   105: goto -> 17
      //   108: iconst_1
      //   109: istore #9
      //   111: iload #6
      //   113: istore #8
      //   115: iload #8
      //   117: iflt -> 164
      //   120: iload_3
      //   121: iload #8
      //   123: ishr
      //   124: iconst_1
      //   125: iand
      //   126: istore_2
      //   127: iload #4
      //   129: aload_0
      //   130: getfield m_Encoders : [S
      //   133: iload #9
      //   135: saload
      //   136: iload_2
      //   137: invokestatic GetPrice : (II)I
      //   140: iadd
      //   141: istore #4
      //   143: iload #9
      //   145: iconst_1
      //   146: ishl
      //   147: iload_2
      //   148: ior
      //   149: istore #9
      //   151: iload #8
      //   153: istore #6
      //   155: iload #6
      //   157: iconst_1
      //   158: isub
      //   159: istore #8
      //   161: goto -> 115
      //   164: iload #4
      //   166: ireturn }
    
    public void Init() { Encoder.InitBitModels(this.m_Encoders); }
  }
  
  class Optimal {
    public int BackPrev;
    
    public int BackPrev2;
    
    public int Backs0;
    
    public int Backs1;
    
    public int Backs2;
    
    public int Backs3;
    
    public int PosPrev;
    
    public int PosPrev2;
    
    public boolean Prev1IsChar;
    
    public boolean Prev2;
    
    public int Price;
    
    public int State;
    
    public boolean IsShortRep() {
      boolean bool;
      if (this.BackPrev == 0) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public void MakeAsChar() {
      this.BackPrev = -1;
      this.Prev1IsChar = false;
    }
    
    public void MakeAsShortRep() {
      this.BackPrev = 0;
      this.Prev1IsChar = false;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/lzma/Encoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */