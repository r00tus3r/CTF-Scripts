package com.badlogic.gdx.graphics.profiling;

import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.math.FloatCounter;

public abstract class GLInterceptor implements GL20 {
  protected int calls;
  
  protected int drawCalls;
  
  protected GLProfiler glProfiler;
  
  protected int shaderSwitches;
  
  protected int textureBindings;
  
  protected final FloatCounter vertexCount = new FloatCounter(false);
  
  protected GLInterceptor(GLProfiler paramGLProfiler) { this.glProfiler = paramGLProfiler; }
  
  public static String resolveErrorNumber(int paramInt) {
    StringBuilder stringBuilder;
    switch (paramInt) {
      default:
        stringBuilder = new StringBuilder();
        stringBuilder.append("number ");
        stringBuilder.append(paramInt);
        return stringBuilder.toString();
      case 1286:
        return "GL_INVALID_FRAMEBUFFER_OPERATION";
      case 1285:
        return "GL_OUT_OF_MEMORY";
      case 1282:
        return "GL_INVALID_OPERATION";
      case 1281:
        return "GL_INVALID_VALUE";
      case 1280:
        break;
    } 
    return "GL_INVALID_ENUM";
  }
  
  public int getCalls() { return this.calls; }
  
  public int getDrawCalls() { return this.drawCalls; }
  
  public int getShaderSwitches() { return this.shaderSwitches; }
  
  public int getTextureBindings() { return this.textureBindings; }
  
  public FloatCounter getVertexCount() { return this.vertexCount; }
  
  public void reset() {
    this.calls = 0;
    this.textureBindings = 0;
    this.drawCalls = 0;
    this.shaderSwitches = 0;
    this.vertexCount.reset();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/profiling/GLInterceptor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */