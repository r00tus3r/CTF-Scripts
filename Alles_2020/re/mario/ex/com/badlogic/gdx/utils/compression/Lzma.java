package com.badlogic.gdx.utils.compression;

import com.badlogic.gdx.utils.compression.lzma.Decoder;
import com.badlogic.gdx.utils.compression.lzma.Encoder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Lzma {
  public static void compress(InputStream paramInputStream, OutputStream paramOutputStream) throws IOException {
    CommandLine commandLine = new CommandLine();
    boolean bool = commandLine.Eos;
    Encoder encoder = new Encoder();
    if (encoder.SetAlgorithm(commandLine.Algorithm)) {
      if (encoder.SetDictionarySize(commandLine.DictionarySize)) {
        if (encoder.SetNumFastBytes(commandLine.Fb)) {
          if (encoder.SetMatchFinder(commandLine.MatchFinder)) {
            if (encoder.SetLcLpPb(commandLine.Lc, commandLine.Lp, commandLine.Pb)) {
              encoder.SetEndMarkerMode(bool);
              encoder.WriteCoderProperties(paramOutputStream);
              long l = -1L;
              if (!bool) {
                long l1 = paramInputStream.available();
                if (l1 != 0L)
                  l = l1; 
              } 
              for (byte b = 0; b < 8; b++)
                paramOutputStream.write((int)(l >>> b * 8) & 0xFF); 
              encoder.Code(paramInputStream, paramOutputStream, -1L, -1L, null);
              return;
            } 
            throw new RuntimeException("Incorrect -lc or -lp or -pb value");
          } 
          throw new RuntimeException("Incorrect -mf value");
        } 
        throw new RuntimeException("Incorrect -fb value");
      } 
      throw new RuntimeException("Incorrect dictionary size");
    } 
    RuntimeException runtimeException = new RuntimeException("Incorrect compression mode");
    throw runtimeException;
  }
  
  public static void decompress(InputStream paramInputStream, OutputStream paramOutputStream) throws IOException {
    byte[] arrayOfByte = new byte[5];
    byte b = 0;
    if (paramInputStream.read(arrayOfByte, 0, 5) == 5) {
      Decoder decoder = new Decoder();
      if (decoder.SetDecoderProperties(arrayOfByte)) {
        long l = 0L;
        while (b < 8) {
          int i = paramInputStream.read();
          if (i >= 0) {
            l |= i << b * 8;
            b++;
            continue;
          } 
          throw new RuntimeException("Can't read stream size");
        } 
        if (decoder.Code(paramInputStream, paramOutputStream, l))
          return; 
        throw new RuntimeException("Error in data stream");
      } 
      throw new RuntimeException("Incorrect stream properties");
    } 
    RuntimeException runtimeException = new RuntimeException("input .lzma file is too short");
    throw runtimeException;
  }
  
  static class CommandLine {
    public static final int kBenchmak = 2;
    
    public static final int kDecode = 1;
    
    public static final int kEncode = 0;
    
    public int Algorithm = 2;
    
    public int Command = -1;
    
    public int DictionarySize = 8388608;
    
    public boolean DictionarySizeIsDefined = false;
    
    public boolean Eos = false;
    
    public int Fb = 128;
    
    public boolean FbIsDefined = false;
    
    public String InFile;
    
    public int Lc = 3;
    
    public int Lp = 0;
    
    public int MatchFinder = 1;
    
    public int NumBenchmarkPasses = 10;
    
    public String OutFile;
    
    public int Pb = 2;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/compression/Lzma.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */