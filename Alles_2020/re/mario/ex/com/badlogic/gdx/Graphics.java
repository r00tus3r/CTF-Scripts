package com.badlogic.gdx;

import com.badlogic.gdx.graphics.Cursor;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.glutils.GLVersion;

public interface Graphics {
  int getBackBufferHeight();
  
  int getBackBufferWidth();
  
  BufferFormat getBufferFormat();
  
  float getDeltaTime();
  
  float getDensity();
  
  DisplayMode getDisplayMode();
  
  DisplayMode getDisplayMode(Monitor paramMonitor);
  
  DisplayMode[] getDisplayModes();
  
  DisplayMode[] getDisplayModes(Monitor paramMonitor);
  
  long getFrameId();
  
  int getFramesPerSecond();
  
  GL20 getGL20();
  
  GL30 getGL30();
  
  GLVersion getGLVersion();
  
  int getHeight();
  
  Monitor getMonitor();
  
  Monitor[] getMonitors();
  
  float getPpcX();
  
  float getPpcY();
  
  float getPpiX();
  
  float getPpiY();
  
  Monitor getPrimaryMonitor();
  
  float getRawDeltaTime();
  
  GraphicsType getType();
  
  int getWidth();
  
  boolean isContinuousRendering();
  
  boolean isFullscreen();
  
  boolean isGL30Available();
  
  Cursor newCursor(Pixmap paramPixmap, int paramInt1, int paramInt2);
  
  void requestRendering();
  
  void setContinuousRendering(boolean paramBoolean);
  
  void setCursor(Cursor paramCursor);
  
  boolean setFullscreenMode(DisplayMode paramDisplayMode);
  
  void setGL20(GL20 paramGL20);
  
  void setGL30(GL30 paramGL30);
  
  void setResizable(boolean paramBoolean);
  
  void setSystemCursor(Cursor.SystemCursor paramSystemCursor);
  
  void setTitle(String paramString);
  
  void setUndecorated(boolean paramBoolean);
  
  void setVSync(boolean paramBoolean);
  
  boolean setWindowedMode(int paramInt1, int paramInt2);
  
  boolean supportsDisplayModeChange();
  
  boolean supportsExtension(String paramString);
  
  public static class BufferFormat {
    public final int a;
    
    public final int b;
    
    public final boolean coverageSampling;
    
    public final int depth;
    
    public final int g;
    
    public final int r;
    
    public final int samples;
    
    public final int stencil;
    
    public BufferFormat(int param1Int1, int param1Int2, int param1Int3, int param1Int4, int param1Int5, int param1Int6, int param1Int7, boolean param1Boolean) {
      this.r = param1Int1;
      this.g = param1Int2;
      this.b = param1Int3;
      this.a = param1Int4;
      this.depth = param1Int5;
      this.stencil = param1Int6;
      this.samples = param1Int7;
      this.coverageSampling = param1Boolean;
    }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("r: ");
      stringBuilder.append(this.r);
      stringBuilder.append(", g: ");
      stringBuilder.append(this.g);
      stringBuilder.append(", b: ");
      stringBuilder.append(this.b);
      stringBuilder.append(", a: ");
      stringBuilder.append(this.a);
      stringBuilder.append(", depth: ");
      stringBuilder.append(this.depth);
      stringBuilder.append(", stencil: ");
      stringBuilder.append(this.stencil);
      stringBuilder.append(", num samples: ");
      stringBuilder.append(this.samples);
      stringBuilder.append(", coverage sampling: ");
      stringBuilder.append(this.coverageSampling);
      return stringBuilder.toString();
    }
  }
  
  public static class DisplayMode {
    public final int bitsPerPixel;
    
    public final int height;
    
    public final int refreshRate;
    
    public final int width;
    
    protected DisplayMode(int param1Int1, int param1Int2, int param1Int3, int param1Int4) {
      this.width = param1Int1;
      this.height = param1Int2;
      this.refreshRate = param1Int3;
      this.bitsPerPixel = param1Int4;
    }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(this.width);
      stringBuilder.append("x");
      stringBuilder.append(this.height);
      stringBuilder.append(", bpp: ");
      stringBuilder.append(this.bitsPerPixel);
      stringBuilder.append(", hz: ");
      stringBuilder.append(this.refreshRate);
      return stringBuilder.toString();
    }
  }
  
  public enum GraphicsType {
    AndroidGL, JGLFW, LWJGL, LWJGL3, Mock, WebGL, iOSGL;
    
    static  {
      JGLFW = new GraphicsType("JGLFW", 4);
      Mock = new GraphicsType("Mock", 5);
      LWJGL3 = new GraphicsType("LWJGL3", 6);
      $VALUES = new GraphicsType[] { AndroidGL, LWJGL, WebGL, iOSGL, JGLFW, Mock, LWJGL3 };
    }
  }
  
  public static class Monitor {
    public final String name;
    
    public final int virtualX;
    
    public final int virtualY;
    
    protected Monitor(int param1Int1, int param1Int2, String param1String) {
      this.virtualX = param1Int1;
      this.virtualY = param1Int2;
      this.name = param1String;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Graphics.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */