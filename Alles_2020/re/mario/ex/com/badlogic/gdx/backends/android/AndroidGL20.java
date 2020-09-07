package com.badlogic.gdx.backends.android;

import android.opengl.GLES20;
import com.badlogic.gdx.graphics.GL20;
import java.nio.Buffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class AndroidGL20 implements GL20 {
  private byte[] buffer = new byte[512];
  
  private int[] ints = new int[1];
  
  private int[] ints2 = new int[1];
  
  private int[] ints3 = new int[1];
  
  public void glActiveTexture(int paramInt) { GLES20.glActiveTexture(paramInt); }
  
  public void glAttachShader(int paramInt1, int paramInt2) { GLES20.glAttachShader(paramInt1, paramInt2); }
  
  public void glBindAttribLocation(int paramInt1, int paramInt2, String paramString) { GLES20.glBindAttribLocation(paramInt1, paramInt2, paramString); }
  
  public void glBindBuffer(int paramInt1, int paramInt2) { GLES20.glBindBuffer(paramInt1, paramInt2); }
  
  public void glBindFramebuffer(int paramInt1, int paramInt2) { GLES20.glBindFramebuffer(paramInt1, paramInt2); }
  
  public void glBindRenderbuffer(int paramInt1, int paramInt2) { GLES20.glBindRenderbuffer(paramInt1, paramInt2); }
  
  public void glBindTexture(int paramInt1, int paramInt2) { GLES20.glBindTexture(paramInt1, paramInt2); }
  
  public void glBlendColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { GLES20.glBlendColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void glBlendEquation(int paramInt) { GLES20.glBlendEquation(paramInt); }
  
  public void glBlendEquationSeparate(int paramInt1, int paramInt2) { GLES20.glBlendEquationSeparate(paramInt1, paramInt2); }
  
  public void glBlendFunc(int paramInt1, int paramInt2) { GLES20.glBlendFunc(paramInt1, paramInt2); }
  
  public void glBlendFuncSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glBlendFuncSeparate(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glBufferData(int paramInt1, int paramInt2, Buffer paramBuffer, int paramInt3) { GLES20.glBufferData(paramInt1, paramInt2, paramBuffer, paramInt3); }
  
  public void glBufferSubData(int paramInt1, int paramInt2, int paramInt3, Buffer paramBuffer) { GLES20.glBufferSubData(paramInt1, paramInt2, paramInt3, paramBuffer); }
  
  public int glCheckFramebufferStatus(int paramInt) { return GLES20.glCheckFramebufferStatus(paramInt); }
  
  public void glClear(int paramInt) { GLES20.glClear(paramInt); }
  
  public void glClearColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { GLES20.glClearColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void glClearDepthf(float paramFloat) { GLES20.glClearDepthf(paramFloat); }
  
  public void glClearStencil(int paramInt) { GLES20.glClearStencil(paramInt); }
  
  public void glColorMask(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4) { GLES20.glColorMask(paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4); }
  
  public void glCompileShader(int paramInt) { GLES20.glCompileShader(paramInt); }
  
  public void glCompressedTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, Buffer paramBuffer) { GLES20.glCompressedTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramBuffer); }
  
  public void glCompressedTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) { GLES20.glCompressedTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer); }
  
  public void glCopyTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) { GLES20.glCopyTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8); }
  
  public void glCopyTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8) { GLES20.glCopyTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8); }
  
  public int glCreateProgram() { return GLES20.glCreateProgram(); }
  
  public int glCreateShader(int paramInt) { return GLES20.glCreateShader(paramInt); }
  
  public void glCullFace(int paramInt) { GLES20.glCullFace(paramInt); }
  
  public void glDeleteBuffer(int paramInt) {
    int[] arrayOfInt = this.ints;
    arrayOfInt[0] = paramInt;
    GLES20.glDeleteBuffers(1, arrayOfInt, 0);
  }
  
  public void glDeleteBuffers(int paramInt, IntBuffer paramIntBuffer) { GLES20.glDeleteBuffers(paramInt, paramIntBuffer); }
  
  public void glDeleteFramebuffer(int paramInt) {
    int[] arrayOfInt = this.ints;
    arrayOfInt[0] = paramInt;
    GLES20.glDeleteFramebuffers(1, arrayOfInt, 0);
  }
  
  public void glDeleteFramebuffers(int paramInt, IntBuffer paramIntBuffer) { GLES20.glDeleteFramebuffers(paramInt, paramIntBuffer); }
  
  public void glDeleteProgram(int paramInt) { GLES20.glDeleteProgram(paramInt); }
  
  public void glDeleteRenderbuffer(int paramInt) {
    int[] arrayOfInt = this.ints;
    arrayOfInt[0] = paramInt;
    GLES20.glDeleteRenderbuffers(1, arrayOfInt, 0);
  }
  
  public void glDeleteRenderbuffers(int paramInt, IntBuffer paramIntBuffer) { GLES20.glDeleteRenderbuffers(paramInt, paramIntBuffer); }
  
  public void glDeleteShader(int paramInt) { GLES20.glDeleteShader(paramInt); }
  
  public void glDeleteTexture(int paramInt) {
    int[] arrayOfInt = this.ints;
    arrayOfInt[0] = paramInt;
    GLES20.glDeleteTextures(1, arrayOfInt, 0);
  }
  
  public void glDeleteTextures(int paramInt, IntBuffer paramIntBuffer) { GLES20.glDeleteTextures(paramInt, paramIntBuffer); }
  
  public void glDepthFunc(int paramInt) { GLES20.glDepthFunc(paramInt); }
  
  public void glDepthMask(boolean paramBoolean) { GLES20.glDepthMask(paramBoolean); }
  
  public void glDepthRangef(float paramFloat1, float paramFloat2) { GLES20.glDepthRangef(paramFloat1, paramFloat2); }
  
  public void glDetachShader(int paramInt1, int paramInt2) { GLES20.glDetachShader(paramInt1, paramInt2); }
  
  public void glDisable(int paramInt) { GLES20.glDisable(paramInt); }
  
  public void glDisableVertexAttribArray(int paramInt) { GLES20.glDisableVertexAttribArray(paramInt); }
  
  public void glDrawArrays(int paramInt1, int paramInt2, int paramInt3) { GLES20.glDrawArrays(paramInt1, paramInt2, paramInt3); }
  
  public void glDrawElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glDrawElements(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glDrawElements(int paramInt1, int paramInt2, int paramInt3, Buffer paramBuffer) { GLES20.glDrawElements(paramInt1, paramInt2, paramInt3, paramBuffer); }
  
  public void glEnable(int paramInt) { GLES20.glEnable(paramInt); }
  
  public void glEnableVertexAttribArray(int paramInt) { GLES20.glEnableVertexAttribArray(paramInt); }
  
  public void glFinish() { GLES20.glFinish(); }
  
  public void glFlush() { GLES20.glFlush(); }
  
  public void glFramebufferRenderbuffer(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glFramebufferRenderbuffer(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glFramebufferTexture2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES20.glFramebufferTexture2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glFrontFace(int paramInt) { GLES20.glFrontFace(paramInt); }
  
  public int glGenBuffer() {
    GLES20.glGenBuffers(1, this.ints, 0);
    return this.ints[0];
  }
  
  public void glGenBuffers(int paramInt, IntBuffer paramIntBuffer) { GLES20.glGenBuffers(paramInt, paramIntBuffer); }
  
  public int glGenFramebuffer() {
    GLES20.glGenFramebuffers(1, this.ints, 0);
    return this.ints[0];
  }
  
  public void glGenFramebuffers(int paramInt, IntBuffer paramIntBuffer) { GLES20.glGenFramebuffers(paramInt, paramIntBuffer); }
  
  public int glGenRenderbuffer() {
    GLES20.glGenRenderbuffers(1, this.ints, 0);
    return this.ints[0];
  }
  
  public void glGenRenderbuffers(int paramInt, IntBuffer paramIntBuffer) { GLES20.glGenRenderbuffers(paramInt, paramIntBuffer); }
  
  public int glGenTexture() {
    GLES20.glGenTextures(1, this.ints, 0);
    return this.ints[0];
  }
  
  public void glGenTextures(int paramInt, IntBuffer paramIntBuffer) { GLES20.glGenTextures(paramInt, paramIntBuffer); }
  
  public void glGenerateMipmap(int paramInt) { GLES20.glGenerateMipmap(paramInt); }
  
  public String glGetActiveAttrib(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, Buffer paramBuffer) {
    this.ints[0] = 0;
    this.ints2[0] = paramIntBuffer.get(0);
    this.ints3[0] = ((IntBuffer)paramBuffer).get(0);
    byte[] arrayOfByte = this.buffer;
    GLES20.glGetActiveAttrib(paramInt1, paramInt2, arrayOfByte.length, this.ints, 0, this.ints2, 0, this.ints3, 0, arrayOfByte, 0);
    return new String(this.buffer, false, this.ints[0]);
  }
  
  public String glGetActiveUniform(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, Buffer paramBuffer) {
    this.ints[0] = 0;
    this.ints2[0] = paramIntBuffer.get(0);
    this.ints3[0] = ((IntBuffer)paramBuffer).get(0);
    byte[] arrayOfByte = this.buffer;
    GLES20.glGetActiveUniform(paramInt1, paramInt2, arrayOfByte.length, this.ints, 0, this.ints2, 0, this.ints3, 0, arrayOfByte, 0);
    return new String(this.buffer, false, this.ints[0]);
  }
  
  public void glGetAttachedShaders(int paramInt1, int paramInt2, Buffer paramBuffer, IntBuffer paramIntBuffer) { GLES20.glGetAttachedShaders(paramInt1, paramInt2, (IntBuffer)paramBuffer, paramIntBuffer); }
  
  public int glGetAttribLocation(int paramInt, String paramString) { return GLES20.glGetAttribLocation(paramInt, paramString); }
  
  public void glGetBooleanv(int paramInt, Buffer paramBuffer) { GLES20.glGetBooleanv(paramInt, (IntBuffer)paramBuffer); }
  
  public void glGetBufferParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetBufferParameteriv(paramInt1, paramInt2, paramIntBuffer); }
  
  public int glGetError() { return GLES20.glGetError(); }
  
  public void glGetFloatv(int paramInt, FloatBuffer paramFloatBuffer) { GLES20.glGetFloatv(paramInt, paramFloatBuffer); }
  
  public void glGetFramebufferAttachmentParameteriv(int paramInt1, int paramInt2, int paramInt3, IntBuffer paramIntBuffer) { GLES20.glGetFramebufferAttachmentParameteriv(paramInt1, paramInt2, paramInt3, paramIntBuffer); }
  
  public void glGetIntegerv(int paramInt, IntBuffer paramIntBuffer) { GLES20.glGetIntegerv(paramInt, paramIntBuffer); }
  
  public String glGetProgramInfoLog(int paramInt) { return GLES20.glGetProgramInfoLog(paramInt); }
  
  public void glGetProgramiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetProgramiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glGetRenderbufferParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetRenderbufferParameteriv(paramInt1, paramInt2, paramIntBuffer); }
  
  public String glGetShaderInfoLog(int paramInt) { return GLES20.glGetShaderInfoLog(paramInt); }
  
  public void glGetShaderPrecisionFormat(int paramInt1, int paramInt2, IntBuffer paramIntBuffer1, IntBuffer paramIntBuffer2) { GLES20.glGetShaderPrecisionFormat(paramInt1, paramInt2, paramIntBuffer1, paramIntBuffer2); }
  
  public void glGetShaderiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetShaderiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public String glGetString(int paramInt) { return GLES20.glGetString(paramInt); }
  
  public void glGetTexParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glGetTexParameterfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glGetTexParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetTexParameteriv(paramInt1, paramInt2, paramIntBuffer); }
  
  public int glGetUniformLocation(int paramInt, String paramString) { return GLES20.glGetUniformLocation(paramInt, paramString); }
  
  public void glGetUniformfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glGetUniformfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glGetUniformiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetUniformiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glGetVertexAttribPointerv(int paramInt1, int paramInt2, Buffer paramBuffer) {}
  
  public void glGetVertexAttribfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glGetVertexAttribfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glGetVertexAttribiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glGetVertexAttribiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glHint(int paramInt1, int paramInt2) { GLES20.glHint(paramInt1, paramInt2); }
  
  public boolean glIsBuffer(int paramInt) { return GLES20.glIsBuffer(paramInt); }
  
  public boolean glIsEnabled(int paramInt) { return GLES20.glIsEnabled(paramInt); }
  
  public boolean glIsFramebuffer(int paramInt) { return GLES20.glIsFramebuffer(paramInt); }
  
  public boolean glIsProgram(int paramInt) { return GLES20.glIsProgram(paramInt); }
  
  public boolean glIsRenderbuffer(int paramInt) { return GLES20.glIsRenderbuffer(paramInt); }
  
  public boolean glIsShader(int paramInt) { return GLES20.glIsShader(paramInt); }
  
  public boolean glIsTexture(int paramInt) { return GLES20.glIsTexture(paramInt); }
  
  public void glLineWidth(float paramFloat) { GLES20.glLineWidth(paramFloat); }
  
  public void glLinkProgram(int paramInt) { GLES20.glLinkProgram(paramInt); }
  
  public void glPixelStorei(int paramInt1, int paramInt2) { GLES20.glPixelStorei(paramInt1, paramInt2); }
  
  public void glPolygonOffset(float paramFloat1, float paramFloat2) { GLES20.glPolygonOffset(paramFloat1, paramFloat2); }
  
  public void glReadPixels(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, Buffer paramBuffer) { GLES20.glReadPixels(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramBuffer); }
  
  public void glReleaseShaderCompiler() { GLES20.glReleaseShaderCompiler(); }
  
  public void glRenderbufferStorage(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glRenderbufferStorage(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glSampleCoverage(float paramFloat, boolean paramBoolean) { GLES20.glSampleCoverage(paramFloat, paramBoolean); }
  
  public void glScissor(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glScissor(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glShaderBinary(int paramInt1, IntBuffer paramIntBuffer, int paramInt2, Buffer paramBuffer, int paramInt3) { GLES20.glShaderBinary(paramInt1, paramIntBuffer, paramInt2, paramBuffer, paramInt3); }
  
  public void glShaderSource(int paramInt, String paramString) { GLES20.glShaderSource(paramInt, paramString); }
  
  public void glStencilFunc(int paramInt1, int paramInt2, int paramInt3) { GLES20.glStencilFunc(paramInt1, paramInt2, paramInt3); }
  
  public void glStencilFuncSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glStencilFuncSeparate(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glStencilMask(int paramInt) { GLES20.glStencilMask(paramInt); }
  
  public void glStencilMaskSeparate(int paramInt1, int paramInt2) { GLES20.glStencilMaskSeparate(paramInt1, paramInt2); }
  
  public void glStencilOp(int paramInt1, int paramInt2, int paramInt3) { GLES20.glStencilOp(paramInt1, paramInt2, paramInt3); }
  
  public void glStencilOpSeparate(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glStencilOpSeparate(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glTexImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) { GLES20.glTexImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer); }
  
  public void glTexParameterf(int paramInt1, int paramInt2, float paramFloat) { GLES20.glTexParameterf(paramInt1, paramInt2, paramFloat); }
  
  public void glTexParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glTexParameterfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glTexParameteri(int paramInt1, int paramInt2, int paramInt3) { GLES20.glTexParameteri(paramInt1, paramInt2, paramInt3); }
  
  public void glTexParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glTexParameteriv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glTexSubImage2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, Buffer paramBuffer) { GLES20.glTexSubImage2D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramBuffer); }
  
  public void glUniform1f(int paramInt, float paramFloat) { GLES20.glUniform1f(paramInt, paramFloat); }
  
  public void glUniform1fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glUniform1fv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glUniform1fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniform1fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3); }
  
  public void glUniform1i(int paramInt1, int paramInt2) { GLES20.glUniform1i(paramInt1, paramInt2); }
  
  public void glUniform1iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glUniform1iv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniform1iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) { GLES20.glUniform1iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3); }
  
  public void glUniform2f(int paramInt, float paramFloat1, float paramFloat2) { GLES20.glUniform2f(paramInt, paramFloat1, paramFloat2); }
  
  public void glUniform2fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glUniform2fv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glUniform2fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniform2fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3); }
  
  public void glUniform2i(int paramInt1, int paramInt2, int paramInt3) { GLES20.glUniform2i(paramInt1, paramInt2, paramInt3); }
  
  public void glUniform2iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glUniform2iv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniform2iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) { GLES20.glUniform2iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3); }
  
  public void glUniform3f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) { GLES20.glUniform3f(paramInt, paramFloat1, paramFloat2, paramFloat3); }
  
  public void glUniform3fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glUniform3fv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glUniform3fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniform3fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3); }
  
  public void glUniform3i(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glUniform3i(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glUniform3iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glUniform3iv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniform3iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) { GLES20.glUniform3iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3); }
  
  public void glUniform4f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { GLES20.glUniform4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void glUniform4fv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES20.glUniform4fv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glUniform4fv(int paramInt1, int paramInt2, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniform4fv(paramInt1, paramInt2, paramArrayOfFloat, paramInt3); }
  
  public void glUniform4i(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES20.glUniform4i(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glUniform4iv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES20.glUniform4iv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniform4iv(int paramInt1, int paramInt2, int[] paramArrayOfInt, int paramInt3) { GLES20.glUniform4iv(paramInt1, paramInt2, paramArrayOfInt, paramInt3); }
  
  public void glUniformMatrix2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES20.glUniformMatrix2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix2fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniformMatrix2fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3); }
  
  public void glUniformMatrix3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES20.glUniformMatrix3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix3fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniformMatrix3fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3); }
  
  public void glUniformMatrix4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES20.glUniformMatrix4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix4fv(int paramInt1, int paramInt2, boolean paramBoolean, float[] paramArrayOfFloat, int paramInt3) { GLES20.glUniformMatrix4fv(paramInt1, paramInt2, paramBoolean, paramArrayOfFloat, paramInt3); }
  
  public void glUseProgram(int paramInt) { GLES20.glUseProgram(paramInt); }
  
  public void glValidateProgram(int paramInt) { GLES20.glValidateProgram(paramInt); }
  
  public void glVertexAttrib1f(int paramInt, float paramFloat) { GLES20.glVertexAttrib1f(paramInt, paramFloat); }
  
  public void glVertexAttrib1fv(int paramInt, FloatBuffer paramFloatBuffer) { GLES20.glVertexAttrib1fv(paramInt, paramFloatBuffer); }
  
  public void glVertexAttrib2f(int paramInt, float paramFloat1, float paramFloat2) { GLES20.glVertexAttrib2f(paramInt, paramFloat1, paramFloat2); }
  
  public void glVertexAttrib2fv(int paramInt, FloatBuffer paramFloatBuffer) { GLES20.glVertexAttrib2fv(paramInt, paramFloatBuffer); }
  
  public void glVertexAttrib3f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) { GLES20.glVertexAttrib3f(paramInt, paramFloat1, paramFloat2, paramFloat3); }
  
  public void glVertexAttrib3fv(int paramInt, FloatBuffer paramFloatBuffer) { GLES20.glVertexAttrib3fv(paramInt, paramFloatBuffer); }
  
  public void glVertexAttrib4f(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { GLES20.glVertexAttrib4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void glVertexAttrib4fv(int paramInt, FloatBuffer paramFloatBuffer) { GLES20.glVertexAttrib4fv(paramInt, paramFloatBuffer); }
  
  public void glVertexAttribPointer(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, int paramInt5) { GLES20.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramInt5); }
  
  public void glVertexAttribPointer(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, Buffer paramBuffer) { GLES20.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramBuffer); }
  
  public void glViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES20.glViewport(paramInt1, paramInt2, paramInt3, paramInt4); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidGL20.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */