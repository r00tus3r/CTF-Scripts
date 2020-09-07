package com.badlogic.gdx.graphics.profiling;

import com.badlogic.gdx.graphics.GL20;
import java.nio.Buffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class GL20Interceptor extends GLInterceptor implements GL20 {
  protected final GL20 gl20;
  
  protected GL20Interceptor(GLProfiler paramGLProfiler, GL20 paramGL20) {
    super(paramGLProfiler);
    this.gl20 = paramGL20;
  }
  
  private void check() {
    for (int i = this.gl20.glGetError(); i != 0; i = this.gl20.glGetError())
      this.glProfiler.getListener().onError(i); 
  }
  
  public void glActiveTexture(int paramInt) {
    this.calls++;
    this.gl20.glActiveTexture(paramInt);
    check();
  }
  
  public void glAttachShader(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glAttachShader(paramInt1, paramInt2);
    check();
  }
  
  public void glBindAttribLocation(int paramInt1, int paramInt2, String paramString) {
    this.calls++;
    this.gl20.glBindAttribLocation(paramInt1, paramInt2, paramString);
    check();
  }
  
  public void glBindBuffer(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glBindBuffer(paramInt1, paramInt2);
    check();
  }
  
  public void glBindFramebuffer(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glBindFramebuffer(paramInt1, paramInt2);
    check();
  }
  
  public void glBindRenderbuffer(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glBindRenderbuffer(paramInt1, paramInt2);
    check();
  }
  
  public void glBindTexture(int paramInt1, int paramInt2) {
    this.textureBindings++;
    this.calls++;
    this.gl20.glBindTexture(paramInt1, paramInt2);
    check();
  }
  
  public void glBlendColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl20.glBlendColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glBlendEquation(int paramInt) {
    this.calls++;
    this.gl20.glBlendEquation(paramInt);
    check();
  }
  
  public void glBlendEquationSeparate(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glBlendEquationSeparate(paramInt1, paramInt2);
    check();
  }
  
  public void glBlendFunc(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glBlendFunc(paramInt1, paramInt2);
    check();
  }
  
  public void glBlendFuncSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glBlendFuncSeparate(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glBufferData(int paramInt1, int paramInt2, Buffer paramBuffer, int paramInt3) {
    this.calls++;
    this.gl20.glBufferData(paramInt1, paramInt2, paramBuffer, paramInt3);
    check();
  }
  
  public void glBufferSubData(int paramInt1, int paramInt2, int paramInt3, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glBufferSubData(paramInt1, paramInt2, paramInt3, paramBuffer);
    check();
  }
  
  public int glCheckFramebufferStatus(int paramInt) {
    this.calls++;
    paramInt = this.gl20.glCheckFramebufferStatus(paramInt);
    check();
    return paramInt;
  }
  
  public void glClear(int paramInt) {
    this.calls++;
    this.gl20.glClear(paramInt);
    check();
  }
  
  public void glClearColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl20.glClearColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glClearDepthf(float paramFloat) {
    this.calls++;
    this.gl20.glClearDepthf(paramFloat);
    check();
  }
  
  public void glClearStencil(int paramInt) {
    this.calls++;
    this.gl20.glClearStencil(paramInt);
    check();
  }
  
  public void glColorMask(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4) {
    this.calls++;
    this.gl20.glColorMask(paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4);
    check();
  }
  
  public void glCompileShader(int paramInt) {
    this.calls++;
    this.gl20.glCompileShader(paramInt);
    check();
  }
  
  public void glCompressedTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glCompressedTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramBuffer);
    check();
  }
  
  public void glCompressedTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glCompressedTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer);
    check();
  }
  
  public void glCopyTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) {
    this.calls++;
    this.gl20.glCopyTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
    check();
  }
  
  public void glCopyTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) {
    this.calls++;
    this.gl20.glCopyTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
    check();
  }
  
  public int glCreateProgram() {
    this.calls++;
    int i = this.gl20.glCreateProgram();
    check();
    return i;
  }
  
  public int glCreateShader(int paramInt) {
    this.calls++;
    paramInt = this.gl20.glCreateShader(paramInt);
    check();
    return paramInt;
  }
  
  public void glCullFace(int paramInt) {
    this.calls++;
    this.gl20.glCullFace(paramInt);
    check();
  }
  
  public void glDeleteBuffer(int paramInt) {
    this.calls++;
    this.gl20.glDeleteBuffer(paramInt);
    check();
  }
  
  public void glDeleteBuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glDeleteBuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteFramebuffer(int paramInt) {
    this.calls++;
    this.gl20.glDeleteFramebuffer(paramInt);
    check();
  }
  
  public void glDeleteFramebuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glDeleteFramebuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteProgram(int paramInt) {
    this.calls++;
    this.gl20.glDeleteProgram(paramInt);
    check();
  }
  
  public void glDeleteRenderbuffer(int paramInt) {
    this.calls++;
    this.gl20.glDeleteRenderbuffer(paramInt);
    check();
  }
  
  public void glDeleteRenderbuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glDeleteRenderbuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteShader(int paramInt) {
    this.calls++;
    this.gl20.glDeleteShader(paramInt);
    check();
  }
  
  public void glDeleteTexture(int paramInt) {
    this.calls++;
    this.gl20.glDeleteTexture(paramInt);
    check();
  }
  
  public void glDeleteTextures(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glDeleteTextures(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDepthFunc(int paramInt) {
    this.calls++;
    this.gl20.glDepthFunc(paramInt);
    check();
  }
  
  public void glDepthMask(boolean paramBoolean) {
    this.calls++;
    this.gl20.glDepthMask(paramBoolean);
    check();
  }
  
  public void glDepthRangef(float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl20.glDepthRangef(paramFloat1, paramFloat2);
    check();
  }
  
  public void glDetachShader(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glDetachShader(paramInt1, paramInt2);
    check();
  }
  
  public void glDisable(int paramInt) {
    this.calls++;
    this.gl20.glDisable(paramInt);
    check();
  }
  
  public void glDisableVertexAttribArray(int paramInt) {
    this.calls++;
    this.gl20.glDisableVertexAttribArray(paramInt);
    check();
  }
  
  public void glDrawArrays(int paramInt1, int paramInt2, int paramInt3) {
    this.vertexCount.put(paramInt3);
    this.drawCalls++;
    this.calls++;
    this.gl20.glDrawArrays(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glDrawElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.vertexCount.put(paramInt2);
    this.drawCalls++;
    this.calls++;
    this.gl20.glDrawElements(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glDrawElements(int paramInt1, int paramInt2, int paramInt3, Buffer paramBuffer) {
    this.vertexCount.put(paramInt2);
    this.drawCalls++;
    this.calls++;
    this.gl20.glDrawElements(paramInt1, paramInt2, paramInt3, paramBuffer);
    check();
  }
  
  public void glEnable(int paramInt) {
    this.calls++;
    this.gl20.glEnable(paramInt);
    check();
  }
  
  public void glEnableVertexAttribArray(int paramInt) {
    this.calls++;
    this.gl20.glEnableVertexAttribArray(paramInt);
    check();
  }
  
  public void glFinish() {
    this.calls++;
    this.gl20.glFinish();
    check();
  }
  
  public void glFlush() {
    this.calls++;
    this.gl20.glFlush();
    check();
  }
  
  public void glFramebufferRenderbuffer(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glFramebufferRenderbuffer(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glFramebufferTexture2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl20.glFramebufferTexture2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glFrontFace(int paramInt) {
    this.calls++;
    this.gl20.glFrontFace(paramInt);
    check();
  }
  
  public int glGenBuffer() {
    this.calls++;
    int i = this.gl20.glGenBuffer();
    check();
    return i;
  }
  
  public void glGenBuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGenBuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public int glGenFramebuffer() {
    this.calls++;
    int i = this.gl20.glGenFramebuffer();
    check();
    return i;
  }
  
  public void glGenFramebuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGenFramebuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public int glGenRenderbuffer() {
    this.calls++;
    int i = this.gl20.glGenRenderbuffer();
    check();
    return i;
  }
  
  public void glGenRenderbuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGenRenderbuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public int glGenTexture() {
    this.calls++;
    int i = this.gl20.glGenTexture();
    check();
    return i;
  }
  
  public void glGenTextures(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGenTextures(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenerateMipmap(int paramInt) {
    this.calls++;
    this.gl20.glGenerateMipmap(paramInt);
    check();
  }
  
  public String glGetActiveAttrib(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, Buffer paramBuffer) {
    this.calls++;
    String str = this.gl20.glGetActiveAttrib(paramInt1, paramInt2, paramIntBuffer, paramBuffer);
    check();
    return str;
  }
  
  public String glGetActiveUniform(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, Buffer paramBuffer) {
    this.calls++;
    String str = this.gl20.glGetActiveUniform(paramInt1, paramInt2, paramIntBuffer, paramBuffer);
    check();
    return str;
  }
  
  public void glGetAttachedShaders(int paramInt1, int paramInt2, Buffer paramBuffer, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetAttachedShaders(paramInt1, paramInt2, paramBuffer, paramIntBuffer);
    check();
  }
  
  public int glGetAttribLocation(int paramInt, String paramString) {
    this.calls++;
    paramInt = this.gl20.glGetAttribLocation(paramInt, paramString);
    check();
    return paramInt;
  }
  
  public void glGetBooleanv(int paramInt, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glGetBooleanv(paramInt, paramBuffer);
    check();
  }
  
  public void glGetBufferParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetBufferParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public int glGetError() {
    this.calls++;
    return this.gl20.glGetError();
  }
  
  public void glGetFloatv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glGetFloatv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glGetFramebufferAttachmentParameteriv(int paramInt1, int paramInt2, int paramInt3, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetFramebufferAttachmentParameteriv(paramInt1, paramInt2, paramInt3, paramIntBuffer);
    check();
  }
  
  public void glGetIntegerv(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetIntegerv(paramInt, paramIntBuffer);
    check();
  }
  
  public String glGetProgramInfoLog(int paramInt) {
    this.calls++;
    String str = this.gl20.glGetProgramInfoLog(paramInt);
    check();
    return str;
  }
  
  public void glGetProgramiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetProgramiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetRenderbufferParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetRenderbufferParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public String glGetShaderInfoLog(int paramInt) {
    this.calls++;
    String str = this.gl20.glGetShaderInfoLog(paramInt);
    check();
    return str;
  }
  
  public void glGetShaderPrecisionFormat(int paramInt1, int paramInt2, IntBuffer paramIntBuffer1, IntBuffer paramIntBuffer2) {
    this.calls++;
    this.gl20.glGetShaderPrecisionFormat(paramInt1, paramInt2, paramIntBuffer1, paramIntBuffer2);
    check();
  }
  
  public void glGetShaderiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetShaderiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public String glGetString(int paramInt) {
    this.calls++;
    String str = this.gl20.glGetString(paramInt);
    check();
    return str;
  }
  
  public void glGetTexParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glGetTexParameterfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetTexParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetTexParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public int glGetUniformLocation(int paramInt, String paramString) {
    this.calls++;
    paramInt = this.gl20.glGetUniformLocation(paramInt, paramString);
    check();
    return paramInt;
  }
  
  public void glGetUniformfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glGetUniformfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetUniformiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetUniformiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetVertexAttribPointerv(int paramInt1, int paramInt2, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glGetVertexAttribPointerv(paramInt1, paramInt2, paramBuffer);
    check();
  }
  
  public void glGetVertexAttribfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glGetVertexAttribfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetVertexAttribiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glGetVertexAttribiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glHint(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glHint(paramInt1, paramInt2);
    check();
  }
  
  public boolean glIsBuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsBuffer(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsEnabled(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsEnabled(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsFramebuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsFramebuffer(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsProgram(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsProgram(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsRenderbuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsRenderbuffer(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsShader(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsShader(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsTexture(int paramInt) {
    this.calls++;
    boolean bool = this.gl20.glIsTexture(paramInt);
    check();
    return bool;
  }
  
  public void glLineWidth(float paramFloat) {
    this.calls++;
    this.gl20.glLineWidth(paramFloat);
    check();
  }
  
  public void glLinkProgram(int paramInt) {
    this.calls++;
    this.gl20.glLinkProgram(paramInt);
    check();
  }
  
  public void glPixelStorei(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glPixelStorei(paramInt1, paramInt2);
    check();
  }
  
  public void glPolygonOffset(float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl20.glPolygonOffset(paramFloat1, paramFloat2);
    check();
  }
  
  public void glReadPixels(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glReadPixels(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramBuffer);
    check();
  }
  
  public void glReleaseShaderCompiler() {
    this.calls++;
    this.gl20.glReleaseShaderCompiler();
    check();
  }
  
  public void glRenderbufferStorage(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glRenderbufferStorage(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glSampleCoverage(float paramFloat, boolean paramBoolean) {
    this.calls++;
    this.gl20.glSampleCoverage(paramFloat, paramBoolean);
    check();
  }
  
  public void glScissor(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glScissor(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glShaderBinary(int paramInt1, IntBuffer paramIntBuffer, int paramInt2, Buffer paramBuffer, int paramInt3) {
    this.calls++;
    this.gl20.glShaderBinary(paramInt1, paramIntBuffer, paramInt2, paramBuffer, paramInt3);
    check();
  }
  
  public void glShaderSource(int paramInt, String paramString) {
    this.calls++;
    this.gl20.glShaderSource(paramInt, paramString);
    check();
  }
  
  public void glStencilFunc(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl20.glStencilFunc(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glStencilFuncSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glStencilFuncSeparate(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glStencilMask(int paramInt) {
    this.calls++;
    this.gl20.glStencilMask(paramInt);
    check();
  }
  
  public void glStencilMaskSeparate(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glStencilMaskSeparate(paramInt1, paramInt2);
    check();
  }
  
  public void glStencilOp(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl20.glStencilOp(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glStencilOpSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glStencilOpSeparate(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer);
    check();
  }
  
  public void glTexParameterf(int paramInt1, int paramInt2, float paramFloat) {
    this.calls++;
    this.gl20.glTexParameterf(paramInt1, paramInt2, paramFloat);
    check();
  }
  
  public void glTexParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glTexParameterfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glTexParameteri(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl20.glTexParameteri(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glTexParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glTexParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer);
    check();
  }
  
  public void glUniform1f(int paramInt, float paramFloat) {
    this.calls++;
    this.gl20.glUniform1f(paramInt, paramFloat);
    check();
  }
  
  public void glUniform1fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniform1fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform1fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniform1fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform1i(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl20.glUniform1i(paramInt1, paramInt2);
    check();
  }
  
  public void glUniform1iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glUniform1iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform1iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl20.glUniform1iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform2f(int paramInt, float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl20.glUniform2f(paramInt, paramFloat1, paramFloat2);
    check();
  }
  
  public void glUniform2fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniform2fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform2fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniform2fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform2i(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl20.glUniform2i(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glUniform2iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glUniform2iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform2iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl20.glUniform2iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform3f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) {
    this.calls++;
    this.gl20.glUniform3f(paramInt, paramFloat1, paramFloat2, paramFloat3);
    check();
  }
  
  public void glUniform3fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniform3fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform3fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniform3fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform3i(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glUniform3i(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glUniform3iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glUniform3iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform3iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl20.glUniform3iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform4f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl20.glUniform4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glUniform4fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniform4fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform4fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniform4fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform4i(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl20.glUniform4i(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glUniform4iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl20.glUniform4iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform4iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl20.glUniform4iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniformMatrix2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniformMatrix2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix2fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniformMatrix2fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniformMatrix3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniformMatrix3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix3fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniformMatrix3fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniformMatrix4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glUniformMatrix4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix4fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl20.glUniformMatrix4fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUseProgram(int paramInt) {
    this.shaderSwitches++;
    this.calls++;
    this.gl20.glUseProgram(paramInt);
    check();
  }
  
  public void glValidateProgram(int paramInt) {
    this.calls++;
    this.gl20.glValidateProgram(paramInt);
    check();
  }
  
  public void glVertexAttrib1f(int paramInt, float paramFloat) {
    this.calls++;
    this.gl20.glVertexAttrib1f(paramInt, paramFloat);
    check();
  }
  
  public void glVertexAttrib1fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glVertexAttrib1fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttrib2f(int paramInt, float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl20.glVertexAttrib2f(paramInt, paramFloat1, paramFloat2);
    check();
  }
  
  public void glVertexAttrib2fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glVertexAttrib2fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttrib3f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) {
    this.calls++;
    this.gl20.glVertexAttrib3f(paramInt, paramFloat1, paramFloat2, paramFloat3);
    check();
  }
  
  public void glVertexAttrib3fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glVertexAttrib3fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttrib4f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl20.glVertexAttrib4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glVertexAttrib4fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl20.glVertexAttrib4fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttribPointer(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl20.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramInt5);
    check();
  }
  
  public void glVertexAttribPointer(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, Buffer paramBuffer) {
    this.calls++;
    this.gl20.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramBuffer);
    check();
  }
  
  public void glViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl20.glViewport(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/profiling/GL20Interceptor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */