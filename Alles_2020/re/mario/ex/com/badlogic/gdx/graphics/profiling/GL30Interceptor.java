package com.badlogic.gdx.graphics.profiling;

import com.badlogic.gdx.graphics.GL30;
import java.nio.Buffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;

public class GL30Interceptor extends GLInterceptor implements GL30 {
  protected final GL30 gl30;
  
  protected GL30Interceptor(GLProfiler paramGLProfiler, GL30 paramGL30) {
    super(paramGLProfiler);
    this.gl30 = paramGL30;
  }
  
  private void check() {
    for (int i = this.gl30.glGetError(); i != 0; i = this.gl30.glGetError())
      this.glProfiler.getListener().onError(i); 
  }
  
  public void glActiveTexture(int paramInt) {
    this.calls++;
    this.gl30.glActiveTexture(paramInt);
    check();
  }
  
  public void glAttachShader(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glAttachShader(paramInt1, paramInt2);
    check();
  }
  
  public void glBeginQuery(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBeginQuery(paramInt1, paramInt2);
    check();
  }
  
  public void glBeginTransformFeedback(int paramInt) {
    this.calls++;
    this.gl30.glBeginTransformFeedback(paramInt);
    check();
  }
  
  public void glBindAttribLocation(int paramInt1, int paramInt2, String paramString) {
    this.calls++;
    this.gl30.glBindAttribLocation(paramInt1, paramInt2, paramString);
    check();
  }
  
  public void glBindBuffer(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBindBuffer(paramInt1, paramInt2);
    check();
  }
  
  public void glBindBufferBase(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glBindBufferBase(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glBindBufferRange(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glBindBufferRange(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glBindFramebuffer(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBindFramebuffer(paramInt1, paramInt2);
    check();
  }
  
  public void glBindRenderbuffer(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBindRenderbuffer(paramInt1, paramInt2);
    check();
  }
  
  public void glBindSampler(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBindSampler(paramInt1, paramInt2);
    check();
  }
  
  public void glBindTexture(int paramInt1, int paramInt2) {
    this.textureBindings++;
    this.calls++;
    this.gl30.glBindTexture(paramInt1, paramInt2);
    check();
  }
  
  public void glBindTransformFeedback(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBindTransformFeedback(paramInt1, paramInt2);
    check();
  }
  
  public void glBindVertexArray(int paramInt) {
    this.calls++;
    this.gl30.glBindVertexArray(paramInt);
    check();
  }
  
  public void glBlendColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl30.glBlendColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glBlendEquation(int paramInt) {
    this.calls++;
    this.gl30.glBlendEquation(paramInt);
    check();
  }
  
  public void glBlendEquationSeparate(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBlendEquationSeparate(paramInt1, paramInt2);
    check();
  }
  
  public void glBlendFunc(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glBlendFunc(paramInt1, paramInt2);
    check();
  }
  
  public void glBlendFuncSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glBlendFuncSeparate(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glBlitFramebuffer(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10) {
    this.calls++;
    this.gl30.glBlitFramebuffer(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10);
    check();
  }
  
  public void glBufferData(int paramInt1, int paramInt2, Buffer paramBuffer, int paramInt3) {
    this.calls++;
    this.gl30.glBufferData(paramInt1, paramInt2, paramBuffer, paramInt3);
    check();
  }
  
  public void glBufferSubData(int paramInt1, int paramInt2, int paramInt3, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glBufferSubData(paramInt1, paramInt2, paramInt3, paramBuffer);
    check();
  }
  
  public int glCheckFramebufferStatus(int paramInt) {
    this.calls++;
    paramInt = this.gl30.glCheckFramebufferStatus(paramInt);
    check();
    return paramInt;
  }
  
  public void glClear(int paramInt) {
    this.calls++;
    this.gl30.glClear(paramInt);
    check();
  }
  
  public void glClearBufferfi(int paramInt1, int paramInt2, float paramFloat, int paramInt3) {
    this.calls++;
    this.gl30.glClearBufferfi(paramInt1, paramInt2, paramFloat, paramInt3);
    check();
  }
  
  public void glClearBufferfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glClearBufferfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glClearBufferiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glClearBufferiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glClearBufferuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glClearBufferuiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glClearColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl30.glClearColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glClearDepthf(float paramFloat) {
    this.calls++;
    this.gl30.glClearDepthf(paramFloat);
    check();
  }
  
  public void glClearStencil(int paramInt) {
    this.calls++;
    this.gl30.glClearStencil(paramInt);
    check();
  }
  
  public void glColorMask(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4) {
    this.calls++;
    this.gl30.glColorMask(paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4);
    check();
  }
  
  public void glCompileShader(int paramInt) {
    this.calls++;
    this.gl30.glCompileShader(paramInt);
    check();
  }
  
  public void glCompressedTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glCompressedTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramBuffer);
    check();
  }
  
  public void glCompressedTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glCompressedTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer);
    check();
  }
  
  public void glCopyBufferSubData(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glCopyBufferSubData(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glCopyTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) {
    this.calls++;
    this.gl30.glCopyTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
    check();
  }
  
  public void glCopyTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) {
    this.calls++;
    this.gl30.glCopyTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
    check();
  }
  
  public void glCopyTexSubImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9) {
    this.calls++;
    this.gl30.glCopyTexSubImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9);
    check();
  }
  
  public int glCreateProgram() {
    this.calls++;
    int i = this.gl30.glCreateProgram();
    check();
    return i;
  }
  
  public int glCreateShader(int paramInt) {
    this.calls++;
    paramInt = this.gl30.glCreateShader(paramInt);
    check();
    return paramInt;
  }
  
  public void glCullFace(int paramInt) {
    this.calls++;
    this.gl30.glCullFace(paramInt);
    check();
  }
  
  public void glDeleteBuffer(int paramInt) {
    this.calls++;
    this.gl30.glDeleteBuffer(paramInt);
    check();
  }
  
  public void glDeleteBuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteBuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteFramebuffer(int paramInt) {
    this.calls++;
    this.gl30.glDeleteFramebuffer(paramInt);
    check();
  }
  
  public void glDeleteFramebuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteFramebuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteProgram(int paramInt) {
    this.calls++;
    this.gl30.glDeleteProgram(paramInt);
    check();
  }
  
  public void glDeleteQueries(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteQueries(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteQueries(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glDeleteQueries(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public void glDeleteRenderbuffer(int paramInt) {
    this.calls++;
    this.gl30.glDeleteRenderbuffer(paramInt);
    check();
  }
  
  public void glDeleteRenderbuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteRenderbuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteSamplers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteSamplers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteSamplers(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glDeleteSamplers(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public void glDeleteShader(int paramInt) {
    this.calls++;
    this.gl30.glDeleteShader(paramInt);
    check();
  }
  
  public void glDeleteTexture(int paramInt) {
    this.calls++;
    this.gl30.glDeleteTexture(paramInt);
    check();
  }
  
  public void glDeleteTextures(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteTextures(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteTransformFeedbacks(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteTransformFeedbacks(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteTransformFeedbacks(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glDeleteTransformFeedbacks(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public void glDeleteVertexArrays(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glDeleteVertexArrays(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDeleteVertexArrays(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glDeleteVertexArrays(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public void glDepthFunc(int paramInt) {
    this.calls++;
    this.gl30.glDepthFunc(paramInt);
    check();
  }
  
  public void glDepthMask(boolean paramBoolean) {
    this.calls++;
    this.gl30.glDepthMask(paramBoolean);
    check();
  }
  
  public void glDepthRangef(float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl30.glDepthRangef(paramFloat1, paramFloat2);
    check();
  }
  
  public void glDetachShader(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glDetachShader(paramInt1, paramInt2);
    check();
  }
  
  public void glDisable(int paramInt) {
    this.calls++;
    this.gl30.glDisable(paramInt);
    check();
  }
  
  public void glDisableVertexAttribArray(int paramInt) {
    this.calls++;
    this.gl30.glDisableVertexAttribArray(paramInt);
    check();
  }
  
  public void glDrawArrays(int paramInt1, int paramInt2, int paramInt3) {
    this.vertexCount.put(paramInt3);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawArrays(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glDrawArraysInstanced(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.vertexCount.put(paramInt3);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawArraysInstanced(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glDrawBuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawBuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glDrawElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.vertexCount.put(paramInt2);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawElements(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glDrawElements(int paramInt1, int paramInt2, int paramInt3, Buffer paramBuffer) {
    this.vertexCount.put(paramInt2);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawElements(paramInt1, paramInt2, paramInt3, paramBuffer);
    check();
  }
  
  public void glDrawElementsInstanced(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.vertexCount.put(paramInt2);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawElementsInstanced(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glDrawRangeElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) {
    this.vertexCount.put(paramInt4);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawRangeElements(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6);
    check();
  }
  
  public void glDrawRangeElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, Buffer paramBuffer) {
    this.vertexCount.put(paramInt4);
    this.drawCalls++;
    this.calls++;
    this.gl30.glDrawRangeElements(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramBuffer);
    check();
  }
  
  public void glEnable(int paramInt) {
    this.calls++;
    this.gl30.glEnable(paramInt);
    check();
  }
  
  public void glEnableVertexAttribArray(int paramInt) {
    this.calls++;
    this.gl30.glEnableVertexAttribArray(paramInt);
    check();
  }
  
  public void glEndQuery(int paramInt) {
    this.calls++;
    this.gl30.glEndQuery(paramInt);
    check();
  }
  
  public void glEndTransformFeedback() {
    this.calls++;
    this.gl30.glEndTransformFeedback();
    check();
  }
  
  public void glFinish() {
    this.calls++;
    this.gl30.glFinish();
    check();
  }
  
  public void glFlush() {
    this.calls++;
    this.gl30.glFlush();
    check();
  }
  
  public void glFlushMappedBufferRange(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glFlushMappedBufferRange(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glFramebufferRenderbuffer(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glFramebufferRenderbuffer(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glFramebufferTexture2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glFramebufferTexture2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glFramebufferTextureLayer(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glFramebufferTextureLayer(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glFrontFace(int paramInt) {
    this.calls++;
    this.gl30.glFrontFace(paramInt);
    check();
  }
  
  public int glGenBuffer() {
    this.calls++;
    int i = this.gl30.glGenBuffer();
    check();
    return i;
  }
  
  public void glGenBuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenBuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public int glGenFramebuffer() {
    this.calls++;
    int i = this.gl30.glGenFramebuffer();
    check();
    return i;
  }
  
  public void glGenFramebuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenFramebuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenQueries(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenQueries(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenQueries(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glGenQueries(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public int glGenRenderbuffer() {
    this.calls++;
    int i = this.gl30.glGenRenderbuffer();
    check();
    return i;
  }
  
  public void glGenRenderbuffers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenRenderbuffers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenSamplers(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenSamplers(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenSamplers(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glGenSamplers(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public int glGenTexture() {
    this.calls++;
    int i = this.gl30.glGenTexture();
    check();
    return i;
  }
  
  public void glGenTextures(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenTextures(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenTransformFeedbacks(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenTransformFeedbacks(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenTransformFeedbacks(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glGenTransformFeedbacks(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public void glGenVertexArrays(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGenVertexArrays(paramInt, paramIntBuffer);
    check();
  }
  
  public void glGenVertexArrays(int paramInt1, int[] paramArrayOfInt, int paramInt2) {
    this.calls++;
    this.gl30.glGenVertexArrays(paramInt1, paramArrayOfInt, paramInt2);
    check();
  }
  
  public void glGenerateMipmap(int paramInt) {
    this.calls++;
    this.gl30.glGenerateMipmap(paramInt);
    check();
  }
  
  public String glGetActiveAttrib(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, Buffer paramBuffer) {
    this.calls++;
    String str = this.gl30.glGetActiveAttrib(paramInt1, paramInt2, paramIntBuffer, paramBuffer);
    check();
    return str;
  }
  
  public String glGetActiveUniform(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, Buffer paramBuffer) {
    this.calls++;
    String str = this.gl30.glGetActiveUniform(paramInt1, paramInt2, paramIntBuffer, paramBuffer);
    check();
    return str;
  }
  
  public String glGetActiveUniformBlockName(int paramInt1, int paramInt2) {
    this.calls++;
    String str = this.gl30.glGetActiveUniformBlockName(paramInt1, paramInt2);
    check();
    return str;
  }
  
  public void glGetActiveUniformBlockName(int paramInt1, int paramInt2, Buffer paramBuffer1, Buffer paramBuffer2) {
    this.calls++;
    this.gl30.glGetActiveUniformBlockName(paramInt1, paramInt2, paramBuffer1, paramBuffer2);
    check();
  }
  
  public void glGetActiveUniformBlockiv(int paramInt1, int paramInt2, int paramInt3, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetActiveUniformBlockiv(paramInt1, paramInt2, paramInt3, paramIntBuffer);
    check();
  }
  
  public void glGetActiveUniformsiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer1, int paramInt3, IntBuffer paramIntBuffer2) {
    this.calls++;
    this.gl30.glGetActiveUniformsiv(paramInt1, paramInt2, paramIntBuffer1, paramInt3, paramIntBuffer2);
    check();
  }
  
  public void glGetAttachedShaders(int paramInt1, int paramInt2, Buffer paramBuffer, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetAttachedShaders(paramInt1, paramInt2, paramBuffer, paramIntBuffer);
    check();
  }
  
  public int glGetAttribLocation(int paramInt, String paramString) {
    this.calls++;
    paramInt = this.gl30.glGetAttribLocation(paramInt, paramString);
    check();
    return paramInt;
  }
  
  public void glGetBooleanv(int paramInt, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glGetBooleanv(paramInt, paramBuffer);
    check();
  }
  
  public void glGetBufferParameteri64v(int paramInt1, int paramInt2, LongBuffer paramLongBuffer) {
    this.calls++;
    this.gl30.glGetBufferParameteri64v(paramInt1, paramInt2, paramLongBuffer);
    check();
  }
  
  public void glGetBufferParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetBufferParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public Buffer glGetBufferPointerv(int paramInt1, int paramInt2) {
    this.calls++;
    Buffer buffer = this.gl30.glGetBufferPointerv(paramInt1, paramInt2);
    check();
    return buffer;
  }
  
  public int glGetError() {
    this.calls++;
    return this.gl30.glGetError();
  }
  
  public void glGetFloatv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glGetFloatv(paramInt, paramFloatBuffer);
    check();
  }
  
  public int glGetFragDataLocation(int paramInt, String paramString) {
    this.calls++;
    paramInt = this.gl30.glGetFragDataLocation(paramInt, paramString);
    check();
    return paramInt;
  }
  
  public void glGetFramebufferAttachmentParameteriv(int paramInt1, int paramInt2, int paramInt3, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetFramebufferAttachmentParameteriv(paramInt1, paramInt2, paramInt3, paramIntBuffer);
    check();
  }
  
  public void glGetInteger64v(int paramInt, LongBuffer paramLongBuffer) {
    this.calls++;
    this.gl30.glGetInteger64v(paramInt, paramLongBuffer);
    check();
  }
  
  public void glGetIntegerv(int paramInt, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetIntegerv(paramInt, paramIntBuffer);
    check();
  }
  
  public String glGetProgramInfoLog(int paramInt) {
    this.calls++;
    String str = this.gl30.glGetProgramInfoLog(paramInt);
    check();
    return str;
  }
  
  public void glGetProgramiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetProgramiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetQueryObjectuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetQueryObjectuiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetQueryiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetQueryiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetRenderbufferParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetRenderbufferParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetSamplerParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glGetSamplerParameterfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetSamplerParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetSamplerParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public String glGetShaderInfoLog(int paramInt) {
    this.calls++;
    String str = this.gl30.glGetShaderInfoLog(paramInt);
    check();
    return str;
  }
  
  public void glGetShaderPrecisionFormat(int paramInt1, int paramInt2, IntBuffer paramIntBuffer1, IntBuffer paramIntBuffer2) {
    this.calls++;
    this.gl30.glGetShaderPrecisionFormat(paramInt1, paramInt2, paramIntBuffer1, paramIntBuffer2);
    check();
  }
  
  public void glGetShaderiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetShaderiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public String glGetString(int paramInt) {
    this.calls++;
    String str = this.gl30.glGetString(paramInt);
    check();
    return str;
  }
  
  public String glGetStringi(int paramInt1, int paramInt2) {
    this.calls++;
    String str = this.gl30.glGetStringi(paramInt1, paramInt2);
    check();
    return str;
  }
  
  public void glGetTexParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glGetTexParameterfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetTexParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetTexParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public int glGetUniformBlockIndex(int paramInt, String paramString) {
    this.calls++;
    paramInt = this.gl30.glGetUniformBlockIndex(paramInt, paramString);
    check();
    return paramInt;
  }
  
  public void glGetUniformIndices(int paramInt, String[] paramArrayOfString, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetUniformIndices(paramInt, paramArrayOfString, paramIntBuffer);
    check();
  }
  
  public int glGetUniformLocation(int paramInt, String paramString) {
    this.calls++;
    paramInt = this.gl30.glGetUniformLocation(paramInt, paramString);
    check();
    return paramInt;
  }
  
  public void glGetUniformfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glGetUniformfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetUniformiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetUniformiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetUniformuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetUniformuiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetVertexAttribIiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetVertexAttribIiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetVertexAttribIuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetVertexAttribIuiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glGetVertexAttribPointerv(int paramInt1, int paramInt2, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glGetVertexAttribPointerv(paramInt1, paramInt2, paramBuffer);
    check();
  }
  
  public void glGetVertexAttribfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glGetVertexAttribfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glGetVertexAttribiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glGetVertexAttribiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glHint(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glHint(paramInt1, paramInt2);
    check();
  }
  
  public void glInvalidateFramebuffer(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glInvalidateFramebuffer(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glInvalidateSubFramebuffer(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, int paramInt3, int paramInt4, int paramInt5, int paramInt6) {
    this.calls++;
    this.gl30.glInvalidateSubFramebuffer(paramInt1, paramInt2, paramIntBuffer, paramInt3, paramInt4, paramInt5, paramInt6);
    check();
  }
  
  public boolean glIsBuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsBuffer(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsEnabled(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsEnabled(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsFramebuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsFramebuffer(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsProgram(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsProgram(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsQuery(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsQuery(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsRenderbuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsRenderbuffer(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsSampler(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsSampler(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsShader(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsShader(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsTexture(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsTexture(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsTransformFeedback(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsTransformFeedback(paramInt);
    check();
    return bool;
  }
  
  public boolean glIsVertexArray(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glIsVertexArray(paramInt);
    check();
    return bool;
  }
  
  public void glLineWidth(float paramFloat) {
    this.calls++;
    this.gl30.glLineWidth(paramFloat);
    check();
  }
  
  public void glLinkProgram(int paramInt) {
    this.calls++;
    this.gl30.glLinkProgram(paramInt);
    check();
  }
  
  public void glPauseTransformFeedback() {
    this.calls++;
    this.gl30.glPauseTransformFeedback();
    check();
  }
  
  public void glPixelStorei(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glPixelStorei(paramInt1, paramInt2);
    check();
  }
  
  public void glPolygonOffset(float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl30.glPolygonOffset(paramFloat1, paramFloat2);
    check();
  }
  
  public void glProgramParameteri(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glProgramParameteri(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glReadBuffer(int paramInt) {
    this.calls++;
    this.gl30.glReadBuffer(paramInt);
    check();
  }
  
  public void glReadPixels(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glReadPixels(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramBuffer);
    check();
  }
  
  public void glReleaseShaderCompiler() {
    this.calls++;
    this.gl30.glReleaseShaderCompiler();
    check();
  }
  
  public void glRenderbufferStorage(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glRenderbufferStorage(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glRenderbufferStorageMultisample(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glRenderbufferStorageMultisample(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glResumeTransformFeedback() {
    this.calls++;
    this.gl30.glResumeTransformFeedback();
    check();
  }
  
  public void glSampleCoverage(float paramFloat, boolean paramBoolean) {
    this.calls++;
    this.gl30.glSampleCoverage(paramFloat, paramBoolean);
    check();
  }
  
  public void glSamplerParameterf(int paramInt1, int paramInt2, float paramFloat) {
    this.calls++;
    this.gl30.glSamplerParameterf(paramInt1, paramInt2, paramFloat);
    check();
  }
  
  public void glSamplerParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glSamplerParameterfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glSamplerParameteri(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glSamplerParameteri(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glSamplerParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glSamplerParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glScissor(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glScissor(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glShaderBinary(int paramInt1, IntBuffer paramIntBuffer, int paramInt2, Buffer paramBuffer, int paramInt3) {
    this.calls++;
    this.gl30.glShaderBinary(paramInt1, paramIntBuffer, paramInt2, paramBuffer, paramInt3);
    check();
  }
  
  public void glShaderSource(int paramInt, String paramString) {
    this.calls++;
    this.gl30.glShaderSource(paramInt, paramString);
    check();
  }
  
  public void glStencilFunc(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glStencilFunc(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glStencilFuncSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glStencilFuncSeparate(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glStencilMask(int paramInt) {
    this.calls++;
    this.gl30.glStencilMask(paramInt);
    check();
  }
  
  public void glStencilMaskSeparate(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glStencilMaskSeparate(paramInt1, paramInt2);
    check();
  }
  
  public void glStencilOp(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glStencilOp(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glStencilOpSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glStencilOpSeparate(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer);
    check();
  }
  
  public void glTexImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10) {
    this.calls++;
    this.gl30.glTexImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10);
    check();
  }
  
  public void glTexImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glTexImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramBuffer);
    check();
  }
  
  public void glTexParameterf(int paramInt1, int paramInt2, float paramFloat) {
    this.calls++;
    this.gl30.glTexParameterf(paramInt1, paramInt2, paramFloat);
    check();
  }
  
  public void glTexParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glTexParameterfv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glTexParameteri(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glTexParameteri(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glTexParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glTexParameteriv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer);
    check();
  }
  
  public void glTexSubImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11) {
    this.calls++;
    this.gl30.glTexSubImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10, paramInt11);
    check();
  }
  
  public void glTexSubImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glTexSubImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10, paramBuffer);
    check();
  }
  
  public void glTransformFeedbackVaryings(int paramInt1, String[] paramArrayOfString, int paramInt2) {
    this.calls++;
    this.gl30.glTransformFeedbackVaryings(paramInt1, paramArrayOfString, paramInt2);
    check();
  }
  
  public void glUniform1f(int paramInt, float paramFloat) {
    this.calls++;
    this.gl30.glUniform1f(paramInt, paramFloat);
    check();
  }
  
  public void glUniform1fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniform1fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform1fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniform1fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform1i(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glUniform1i(paramInt1, paramInt2);
    check();
  }
  
  public void glUniform1iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform1iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform1iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl30.glUniform1iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform1uiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform1uiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform2f(int paramInt, float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl30.glUniform2f(paramInt, paramFloat1, paramFloat2);
    check();
  }
  
  public void glUniform2fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniform2fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform2fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniform2fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform2i(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glUniform2i(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glUniform2iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform2iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform2iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl30.glUniform2iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform3f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) {
    this.calls++;
    this.gl30.glUniform3f(paramInt, paramFloat1, paramFloat2, paramFloat3);
    check();
  }
  
  public void glUniform3fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniform3fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform3fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniform3fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform3i(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glUniform3i(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
  
  public void glUniform3iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform3iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform3iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl30.glUniform3iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform3uiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform3uiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform4f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl30.glUniform4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glUniform4fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniform4fv(paramInt1, paramInt2, paramFloatBuffer);
    check();
  }
  
  public void glUniform4fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniform4fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniform4i(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glUniform4i(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glUniform4iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform4iv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniform4iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) {
    this.calls++;
    this.gl30.glUniform4iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3);
    check();
  }
  
  public void glUniform4uiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) {
    this.calls++;
    this.gl30.glUniform4uiv(paramInt1, paramInt2, paramIntBuffer);
    check();
  }
  
  public void glUniformBlockBinding(int paramInt1, int paramInt2, int paramInt3) {
    this.calls++;
    this.gl30.glUniformBlockBinding(paramInt1, paramInt2, paramInt3);
    check();
  }
  
  public void glUniformMatrix2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix2fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniformMatrix2fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniformMatrix2x3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix2x3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix2x4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix2x4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix3fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniformMatrix3fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniformMatrix3x2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix3x2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix3x4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix3x4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix4fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) {
    this.calls++;
    this.gl30.glUniformMatrix4fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3);
    check();
  }
  
  public void glUniformMatrix4x2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix4x2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public void glUniformMatrix4x3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glUniformMatrix4x3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer);
    check();
  }
  
  public boolean glUnmapBuffer(int paramInt) {
    this.calls++;
    boolean bool = this.gl30.glUnmapBuffer(paramInt);
    check();
    return bool;
  }
  
  public void glUseProgram(int paramInt) {
    this.shaderSwitches++;
    this.calls++;
    this.gl30.glUseProgram(paramInt);
    check();
  }
  
  public void glValidateProgram(int paramInt) {
    this.calls++;
    this.gl30.glValidateProgram(paramInt);
    check();
  }
  
  public void glVertexAttrib1f(int paramInt, float paramFloat) {
    this.calls++;
    this.gl30.glVertexAttrib1f(paramInt, paramFloat);
    check();
  }
  
  public void glVertexAttrib1fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glVertexAttrib1fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttrib2f(int paramInt, float paramFloat1, float paramFloat2) {
    this.calls++;
    this.gl30.glVertexAttrib2f(paramInt, paramFloat1, paramFloat2);
    check();
  }
  
  public void glVertexAttrib2fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glVertexAttrib2fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttrib3f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) {
    this.calls++;
    this.gl30.glVertexAttrib3f(paramInt, paramFloat1, paramFloat2, paramFloat3);
    check();
  }
  
  public void glVertexAttrib3fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glVertexAttrib3fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttrib4f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.calls++;
    this.gl30.glVertexAttrib4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    check();
  }
  
  public void glVertexAttrib4fv(int paramInt, FloatBuffer paramFloatBuffer) {
    this.calls++;
    this.gl30.glVertexAttrib4fv(paramInt, paramFloatBuffer);
    check();
  }
  
  public void glVertexAttribDivisor(int paramInt1, int paramInt2) {
    this.calls++;
    this.gl30.glVertexAttribDivisor(paramInt1, paramInt2);
    check();
  }
  
  public void glVertexAttribI4i(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glVertexAttribI4i(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glVertexAttribI4ui(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glVertexAttribI4ui(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glVertexAttribIPointer(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glVertexAttribIPointer(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    check();
  }
  
  public void glVertexAttribPointer(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, int paramInt5) {
    this.calls++;
    this.gl30.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramInt5);
    check();
  }
  
  public void glVertexAttribPointer(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, Buffer paramBuffer) {
    this.calls++;
    this.gl30.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramBuffer);
    check();
  }
  
  public void glViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.calls++;
    this.gl30.glViewport(paramInt1, paramInt2, paramInt3, paramInt4);
    check();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/profiling/GL30Interceptor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */