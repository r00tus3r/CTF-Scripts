package com.badlogic.gdx.utils.compression.lzma;

public class Base {
  public static final int kAlignMask = 15;
  
  public static final int kAlignTableSize = 16;
  
  public static final int kDicLogSizeMin = 0;
  
  public static final int kEndPosModelIndex = 14;
  
  public static final int kMatchMaxLen = 273;
  
  public static final int kMatchMinLen = 2;
  
  public static final int kNumAlignBits = 4;
  
  public static final int kNumFullDistances = 128;
  
  public static final int kNumHighLenBits = 8;
  
  public static final int kNumLenSymbols = 272;
  
  public static final int kNumLenToPosStates = 4;
  
  public static final int kNumLenToPosStatesBits = 2;
  
  public static final int kNumLitContextBitsMax = 8;
  
  public static final int kNumLitPosStatesBitsEncodingMax = 4;
  
  public static final int kNumLowLenBits = 3;
  
  public static final int kNumLowLenSymbols = 8;
  
  public static final int kNumMidLenBits = 3;
  
  public static final int kNumMidLenSymbols = 8;
  
  public static final int kNumPosModels = 10;
  
  public static final int kNumPosSlotBits = 6;
  
  public static final int kNumPosStatesBitsEncodingMax = 4;
  
  public static final int kNumPosStatesBitsMax = 4;
  
  public static final int kNumPosStatesEncodingMax = 16;
  
  public static final int kNumPosStatesMax = 16;
  
  public static final int kNumRepDistances = 4;
  
  public static final int kNumStates = 12;
  
  public static final int kStartPosModelIndex = 4;
  
  public static final int GetLenToPosState(int paramInt) {
    paramInt -= 2;
    return (paramInt < 4) ? paramInt : 3;
  }
  
  public static final int StateInit() { return 0; }
  
  public static final boolean StateIsCharState(int paramInt) {
    boolean bool;
    if (paramInt < 7) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static final int StateUpdateChar(int paramInt) { return (paramInt < 4) ? 0 : ((paramInt < 10) ? (paramInt - 3) : (paramInt - 6)); }
  
  public static final int StateUpdateMatch(int paramInt) {
    int i = 7;
    if (paramInt < 7) {
      paramInt = i;
    } else {
      paramInt = 10;
    } 
    return paramInt;
  }
  
  public static final int StateUpdateRep(int paramInt) {
    if (paramInt < 7) {
      paramInt = 8;
    } else {
      paramInt = 11;
    } 
    return paramInt;
  }
  
  public static final int StateUpdateShortRep(int paramInt) {
    if (paramInt < 7) {
      paramInt = 9;
    } else {
      paramInt = 11;
    } 
    return paramInt;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/lzma/Base.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */