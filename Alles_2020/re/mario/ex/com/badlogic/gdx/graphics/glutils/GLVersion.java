package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GLVersion {
  private final String TAG = "GLVersion";
  
  private int majorVersion;
  
  private int minorVersion;
  
  private int releaseVersion;
  
  private final String rendererString;
  
  private final Type type;
  
  private final String vendorString;
  
  public GLVersion(Application.ApplicationType paramApplicationType, String paramString1, String paramString2, String paramString3) {
    if (paramApplicationType == Application.ApplicationType.Android) {
      this.type = Type.GLES;
    } else if (paramApplicationType == Application.ApplicationType.iOS) {
      this.type = Type.GLES;
    } else if (paramApplicationType == Application.ApplicationType.Desktop) {
      this.type = Type.OpenGL;
    } else if (paramApplicationType == Application.ApplicationType.Applet) {
      this.type = Type.OpenGL;
    } else if (paramApplicationType == Application.ApplicationType.WebGL) {
      this.type = Type.WebGL;
    } else {
      this.type = Type.NONE;
    } 
    if (this.type == Type.GLES) {
      extractVersion("OpenGL ES (\\d(\\.\\d){0,2})", paramString1);
    } else if (this.type == Type.WebGL) {
      extractVersion("WebGL (\\d(\\.\\d){0,2})", paramString1);
    } else if (this.type == Type.OpenGL) {
      extractVersion("(\\d(\\.\\d){0,2})", paramString1);
    } else {
      this.majorVersion = -1;
      this.minorVersion = -1;
      this.releaseVersion = -1;
      paramString2 = "";
      paramString3 = paramString2;
    } 
    this.vendorString = paramString2;
    this.rendererString = paramString3;
  }
  
  private void extractVersion(String paramString1, String paramString2) {
    Matcher matcher = Pattern.compile(paramString1).matcher(paramString2);
    boolean bool = matcher.find();
    int i = 0;
    if (bool) {
      int j;
      String[] arrayOfString = matcher.group(1).split("\\.");
      this.majorVersion = parseInt(arrayOfString[0], 2);
      if (arrayOfString.length < 2) {
        j = 0;
      } else {
        j = parseInt(arrayOfString[1], 0);
      } 
      this.minorVersion = j;
      if (arrayOfString.length < 3) {
        j = i;
      } else {
        j = parseInt(arrayOfString[2], 0);
      } 
      this.releaseVersion = j;
    } else {
      Application application = Gdx.app;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Invalid version string: ");
      stringBuilder.append(paramString2);
      application.log("GLVersion", stringBuilder.toString());
      this.majorVersion = 2;
      this.minorVersion = 0;
      this.releaseVersion = 0;
    } 
  }
  
  private int parseInt(String paramString, int paramInt) {
    try {
      return Integer.parseInt(paramString);
    } catch (NumberFormatException numberFormatException) {
      Application application = Gdx.app;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error parsing number: ");
      stringBuilder.append(paramString);
      stringBuilder.append(", assuming: ");
      stringBuilder.append(paramInt);
      application.error("LibGDX GL", stringBuilder.toString());
      return paramInt;
    } 
  }
  
  public String getDebugVersionString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Type: ");
    stringBuilder.append(this.type);
    stringBuilder.append("\nVersion: ");
    stringBuilder.append(this.majorVersion);
    stringBuilder.append(":");
    stringBuilder.append(this.minorVersion);
    stringBuilder.append(":");
    stringBuilder.append(this.releaseVersion);
    stringBuilder.append("\nVendor: ");
    stringBuilder.append(this.vendorString);
    stringBuilder.append("\nRenderer: ");
    stringBuilder.append(this.rendererString);
    return stringBuilder.toString();
  }
  
  public int getMajorVersion() { return this.majorVersion; }
  
  public int getMinorVersion() { return this.minorVersion; }
  
  public int getReleaseVersion() { return this.releaseVersion; }
  
  public String getRendererString() { return this.rendererString; }
  
  public Type getType() { return this.type; }
  
  public String getVendorString() { return this.vendorString; }
  
  public boolean isVersionEqualToOrHigher(int paramInt1, int paramInt2) {
    int i = this.majorVersion;
    return (i > paramInt1 || (i == paramInt1 && this.minorVersion >= paramInt2));
  }
  
  public enum Type {
    GLES, NONE, OpenGL, WebGL;
    
    static  {
      GLES = new Type("GLES", true);
      WebGL = new Type("WebGL", 2);
      NONE = new Type("NONE", 3);
      $VALUES = new Type[] { OpenGL, GLES, WebGL, NONE };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/GLVersion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */