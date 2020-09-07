package com.badlogic.gdx.graphics.profiling;

import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.math.FloatCounter;

public class GLProfiler {
  private boolean enabled = false;
  
  private GLInterceptor glInterceptor;
  
  private Graphics graphics;
  
  private GLErrorListener listener;
  
  public GLProfiler(Graphics paramGraphics) {
    this.graphics = paramGraphics;
    if (paramGraphics.getGL30() != null) {
      this.glInterceptor = new GL30Interceptor(this, paramGraphics.getGL30());
    } else {
      this.glInterceptor = new GL20Interceptor(this, paramGraphics.getGL20());
    } 
    this.listener = GLErrorListener.LOGGING_LISTENER;
  }
  
  public void disable() {
    if (!this.enabled)
      return; 
    if (this.graphics.getGL30() != null) {
      Graphics graphics1 = this.graphics;
      graphics1.setGL30(((GL30Interceptor)graphics1.getGL30()).gl30);
    } else {
      Graphics graphics1 = this.graphics;
      graphics1.setGL20(((GL20Interceptor)graphics1.getGL20()).gl20);
    } 
    this.enabled = false;
  }
  
  public void enable() {
    if (this.enabled)
      return; 
    if (this.graphics.getGL30() != null) {
      this.graphics.setGL30((GL30)this.glInterceptor);
    } else {
      this.graphics.setGL20(this.glInterceptor);
    } 
    this.enabled = true;
  }
  
  public int getCalls() { return this.glInterceptor.getCalls(); }
  
  public int getDrawCalls() { return this.glInterceptor.getDrawCalls(); }
  
  public GLErrorListener getListener() { return this.listener; }
  
  public int getShaderSwitches() { return this.glInterceptor.getShaderSwitches(); }
  
  public int getTextureBindings() { return this.glInterceptor.getTextureBindings(); }
  
  public FloatCounter getVertexCount() { return this.glInterceptor.getVertexCount(); }
  
  public boolean isEnabled() { return this.enabled; }
  
  public void reset() { this.glInterceptor.reset(); }
  
  public void setListener(GLErrorListener paramGLErrorListener) { this.listener = paramGLErrorListener; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/profiling/GLProfiler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */