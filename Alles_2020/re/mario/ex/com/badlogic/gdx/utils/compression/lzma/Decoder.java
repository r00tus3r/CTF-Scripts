package com.badlogic.gdx.utils.compression.lzma;

import com.badlogic.gdx.utils.compression.lz.OutWindow;
import com.badlogic.gdx.utils.compression.rangecoder.BitTreeDecoder;
import com.badlogic.gdx.utils.compression.rangecoder.Decoder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Decoder {
  int m_DictionarySize = -1;
  
  int m_DictionarySizeCheck = -1;
  
  short[] m_IsMatchDecoders = new short[192];
  
  short[] m_IsRep0LongDecoders = new short[192];
  
  short[] m_IsRepDecoders = new short[12];
  
  short[] m_IsRepG0Decoders = new short[12];
  
  short[] m_IsRepG1Decoders = new short[12];
  
  short[] m_IsRepG2Decoders = new short[12];
  
  LenDecoder m_LenDecoder = new LenDecoder();
  
  LiteralDecoder m_LiteralDecoder = new LiteralDecoder();
  
  OutWindow m_OutWindow = new OutWindow();
  
  BitTreeDecoder m_PosAlignDecoder = new BitTreeDecoder(4);
  
  short[] m_PosDecoders = new short[114];
  
  BitTreeDecoder[] m_PosSlotDecoder = new BitTreeDecoder[4];
  
  int m_PosStateMask;
  
  Decoder m_RangeDecoder = new Decoder();
  
  LenDecoder m_RepLenDecoder = new LenDecoder();
  
  public Decoder() {
    for (byte b = 0; b < 4; b++)
      this.m_PosSlotDecoder[b] = new BitTreeDecoder(6); 
  }
  
  public boolean Code(InputStream paramInputStream, OutputStream paramOutputStream, long paramLong) throws IOException {
    this.m_RangeDecoder.SetStream(paramInputStream);
    this.m_OutWindow.SetStream(paramOutputStream);
    Init();
    int i = Base.StateInit();
    long l = 0L;
    byte b1 = 0;
    byte b2 = 0;
    int j = 0;
    int k = 0;
    byte b3 = 0;
    byte b4 = b1;
    while (true) {
      byte b5;
      int i1;
      int n;
      b1 = 1;
      if (paramLong < 0L || l < paramLong) {
        i1 = (int)l;
        int i2 = this.m_PosStateMask & i1;
        Decoder decoder = this.m_RangeDecoder;
        short[] arrayOfShort = this.m_IsMatchDecoders;
        b5 = (i << 4) + i2;
        if (decoder.DecodeBit(arrayOfShort, b5) == 0) {
          LiteralDecoder.Decoder2 decoder2 = this.m_LiteralDecoder.GetDecoder(i1, b4);
          if (!Base.StateIsCharState(i)) {
            b1 = decoder2.DecodeWithMatchByte(this.m_RangeDecoder, this.m_OutWindow.GetByte(k));
            b4 = b1;
          } else {
            b1 = decoder2.DecodeNormal(this.m_RangeDecoder);
            b4 = b1;
          } 
          this.m_OutWindow.PutByte(b4);
          i = Base.StateUpdateChar(i);
          l++;
          b1 = b3;
          i1 = j;
          b3 = b2;
          b5 = b4;
        } else {
          if (this.m_RangeDecoder.DecodeBit(this.m_IsRepDecoders, i) == 1) {
            int i5;
            byte b7;
            byte b6;
            int i4;
            if (this.m_RangeDecoder.DecodeBit(this.m_IsRepG0Decoders, i) == 0) {
              if (this.m_RangeDecoder.DecodeBit(this.m_IsRep0LongDecoders, b5) == 0) {
                i4 = Base.StateUpdateShortRep(i);
                b6 = b2;
                b7 = j;
                i5 = k;
                b5 = b3;
              } else {
                b1 = 0;
                i4 = i;
                b6 = b2;
                b7 = j;
                i5 = k;
                b5 = b3;
              } 
            } else {
              byte b8;
              if (this.m_RangeDecoder.DecodeBit(this.m_IsRepG1Decoders, i) == 0) {
                int i6 = j;
                b8 = b3;
              } else {
                byte b9 = b2;
                b1 = b3;
                if (this.m_RangeDecoder.DecodeBit(this.m_IsRepG2Decoders, i) == 0) {
                  b1 = b2;
                  b9 = b3;
                } 
                b2 = b8;
                b8 = b9;
              } 
              i5 = b1;
              b1 = 0;
              b5 = b8;
              b7 = k;
              b6 = b2;
              i4 = i;
            } 
            i = i4;
            b3 = b6;
            k = b7;
            j = i5;
            b2 = b5;
            int i3 = b1;
            if (b1 == 0) {
              i3 = this.m_RepLenDecoder.Decode(this.m_RangeDecoder, i2) + 2;
              i = Base.StateUpdateRep(i4);
              b3 = b6;
              k = b7;
              j = i5;
              b2 = b5;
            } 
          } else {
            i1 = this.m_LenDecoder.Decode(this.m_RangeDecoder, i2) + 2;
            i = Base.StateUpdateMatch(i);
            int i3 = this.m_PosSlotDecoder[Base.GetLenToPosState(i1)].Decode(this.m_RangeDecoder);
            if (i3 >= 4) {
              int i4 = (i3 >> 1) - 1;
              n = (i3 & true | 0x2) << i4;
              if (i3 < 14) {
                n += BitTreeDecoder.ReverseDecode(this.m_PosDecoders, n - i3 - 1, this.m_RangeDecoder, i4);
              } else {
                i3 = n + (this.m_RangeDecoder.DecodeDirectBits(i4 - 4) << 4) + this.m_PosAlignDecoder.ReverseDecode(this.m_RangeDecoder);
                n = i3;
                if (i3 < 0) {
                  if (i3 != -1)
                    return false; 
                  this.m_OutWindow.Flush();
                  this.m_OutWindow.ReleaseStream();
                  this.m_RangeDecoder.ReleaseStream();
                  return true;
                } 
              } 
              i3 = j;
              j = n;
              n = i3;
            } else {
              n = j;
              j = i3;
            } 
          } 
          if (j >= l || j >= this.m_DictionarySizeCheck)
            break; 
          this.m_OutWindow.CopyBlock(j, i1);
          l += i1;
          b5 = this.m_OutWindow.GetByte(0);
          i1 = k;
          k = j;
          b1 = b2;
        } 
      } else {
        this.m_OutWindow.Flush();
        this.m_OutWindow.ReleaseStream();
        this.m_RangeDecoder.ReleaseStream();
        return true;
      } 
      b4 = b5;
      int m = n;
      j = i1;
      byte b = b1;
    } 
    return false;
  }
  
  void Init() {
    OutWindow outWindow = this.m_OutWindow;
    byte b = 0;
    outWindow.Init(false);
    Decoder.InitBitModels(this.m_IsMatchDecoders);
    Decoder.InitBitModels(this.m_IsRep0LongDecoders);
    Decoder.InitBitModels(this.m_IsRepDecoders);
    Decoder.InitBitModels(this.m_IsRepG0Decoders);
    Decoder.InitBitModels(this.m_IsRepG1Decoders);
    Decoder.InitBitModels(this.m_IsRepG2Decoders);
    Decoder.InitBitModels(this.m_PosDecoders);
    this.m_LiteralDecoder.Init();
    while (b < 4) {
      this.m_PosSlotDecoder[b].Init();
      b++;
    } 
    this.m_LenDecoder.Init();
    this.m_RepLenDecoder.Init();
    this.m_PosAlignDecoder.Init();
    this.m_RangeDecoder.Init();
  }
  
  public boolean SetDecoderProperties(byte[] paramArrayOfByte) {
    if (paramArrayOfByte.length < 5)
      return false; 
    byte b1 = paramArrayOfByte[0] & 0xFF;
    byte b2 = b1 / 9;
    byte b3 = b2 / 5;
    byte b = 0;
    byte b4 = 0;
    while (b < 4) {
      byte b5 = b + true;
      b4 += ((paramArrayOfByte[b5] & 0xFF) << b * 8);
      b = b5;
    } 
    return !SetLcLpPb(b1 % 9, b2 % 5, b3) ? false : SetDictionarySize(b4);
  }
  
  boolean SetDictionarySize(int paramInt) {
    if (paramInt < 0)
      return false; 
    if (this.m_DictionarySize != paramInt) {
      this.m_DictionarySize = paramInt;
      this.m_DictionarySizeCheck = Math.max(this.m_DictionarySize, 1);
      this.m_OutWindow.Create(Math.max(this.m_DictionarySizeCheck, 4096));
    } 
    return true;
  }
  
  boolean SetLcLpPb(int paramInt1, int paramInt2, int paramInt3) {
    if (paramInt1 > 8 || paramInt2 > 4 || paramInt3 > 4)
      return false; 
    this.m_LiteralDecoder.Create(paramInt2, paramInt1);
    paramInt1 = 1 << paramInt3;
    this.m_LenDecoder.Create(paramInt1);
    this.m_RepLenDecoder.Create(paramInt1);
    this.m_PosStateMask = paramInt1 - 1;
    return true;
  }
  
  class LenDecoder {
    short[] m_Choice = new short[2];
    
    BitTreeDecoder m_HighCoder = new BitTreeDecoder(8);
    
    BitTreeDecoder[] m_LowCoder = new BitTreeDecoder[16];
    
    BitTreeDecoder[] m_MidCoder = new BitTreeDecoder[16];
    
    int m_NumPosStates = 0;
    
    public void Create(int param1Int) {
      while (true) {
        int i = this.m_NumPosStates;
        if (i < param1Int) {
          this.m_LowCoder[i] = new BitTreeDecoder(3);
          this.m_MidCoder[this.m_NumPosStates] = new BitTreeDecoder(3);
          this.m_NumPosStates++;
          continue;
        } 
        break;
      } 
    }
    
    public int Decode(Decoder param1Decoder, int param1Int) throws IOException {
      if (param1Decoder.DecodeBit(this.m_Choice, 0) == 0)
        return this.m_LowCoder[param1Int].Decode(param1Decoder); 
      if (param1Decoder.DecodeBit(this.m_Choice, 1) == 0) {
        param1Int = this.m_MidCoder[param1Int].Decode(param1Decoder);
      } else {
        param1Int = this.m_HighCoder.Decode(param1Decoder) + 8;
      } 
      return param1Int + 8;
    }
    
    public void Init() {
      Decoder.InitBitModels(this.m_Choice);
      for (byte b = 0; b < this.m_NumPosStates; b++) {
        this.m_LowCoder[b].Init();
        this.m_MidCoder[b].Init();
      } 
      this.m_HighCoder.Init();
    }
  }
  
  class LiteralDecoder {
    Decoder2[] m_Coders;
    
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
      this.m_Coders = new Decoder2[param1Int2];
      for (param1Int1 = 0; param1Int1 < param1Int2; param1Int1++)
        this.m_Coders[param1Int1] = new Decoder2(); 
    }
    
    Decoder2 GetDecoder(int param1Int, byte param1Byte) {
      Decoder2[] arrayOfDecoder2 = this.m_Coders;
      int i = this.m_PosMask;
      int j = this.m_NumPrevBits;
      return arrayOfDecoder2[((param1Int & i) << j) + ((param1Byte & 0xFF) >>> 8 - j)];
    }
    
    public void Init() {
      int i = this.m_NumPrevBits;
      int j = this.m_NumPosBits;
      for (byte b = 0; b < 1 << i + j; b++)
        this.m_Coders[b].Init(); 
    }
    
    class Decoder2 {
      short[] m_Decoders = new short[768];
      
      public byte DecodeNormal(Decoder param2Decoder) throws IOException {
        int j;
        int i = 1;
        do {
          j = param2Decoder.DecodeBit(this.m_Decoders, i) | i << 1;
          i = j;
        } while (j < 256);
        return (byte)j;
      }
      
      public byte DecodeWithMatchByte(Decoder param2Decoder, byte param2Byte) throws IOException {
        int i = 1;
        byte b = param2Byte;
        while (true) {
          byte b1 = b >> 7 & true;
          b = (byte)(b << 1);
          int k = param2Decoder.DecodeBit(this.m_Decoders, (b1 + 1 << 8) + i);
          int j = i << 1 | k;
          if (b1 != k) {
            while (true) {
              i = j;
              if (j < 256) {
                j = j << 1 | param2Decoder.DecodeBit(this.m_Decoders, j);
                continue;
              } 
              break;
            } 
            break;
          } 
          i = j;
          if (j >= 256) {
            i = j;
            break;
          } 
        } 
        return (byte)i;
      }
      
      public void Init() { Decoder.InitBitModels(this.m_Decoders); }
    }
  }
  
  class Decoder2 {
    short[] m_Decoders = new short[768];
    
    Decoder2() {}
    
    public byte DecodeNormal(Decoder param1Decoder) throws IOException {
      int j;
      int i = 1;
      do {
        j = param1Decoder.DecodeBit(this.m_Decoders, i) | i << 1;
        i = j;
      } while (j < 256);
      return (byte)j;
    }
    
    public byte DecodeWithMatchByte(Decoder param1Decoder, byte param1Byte) throws IOException {
      int i = 1;
      byte b = param1Byte;
      while (true) {
        byte b1 = b >> 7 & true;
        b = (byte)(b << 1);
        int k = param1Decoder.DecodeBit(this.m_Decoders, (b1 + 1 << 8) + i);
        int j = i << 1 | k;
        if (b1 != k) {
          while (true) {
            i = j;
            if (j < 256) {
              j = j << 1 | param1Decoder.DecodeBit(this.m_Decoders, j);
              continue;
            } 
            break;
          } 
          break;
        } 
        i = j;
        if (j >= 256) {
          i = j;
          break;
        } 
      } 
      return (byte)i;
    }
    
    public void Init() { Decoder.InitBitModels(this.m_Decoders); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/lzma/Decoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */