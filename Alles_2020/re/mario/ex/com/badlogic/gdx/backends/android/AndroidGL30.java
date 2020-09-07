package com.badlogic.gdx.backends.android;

import android.annotation.TargetApi;
import android.opengl.GLES30;
import com.badlogic.gdx.graphics.GL30;
import java.nio.Buffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;

@TargetApi(18)
public class AndroidGL30 extends AndroidGL20 implements GL30 {
  public void glBeginQuery(int paramInt1, int paramInt2) { GLES30.glBeginQuery(paramInt1, paramInt2); }
  
  public void glBeginTransformFeedback(int paramInt) { GLES30.glBeginTransformFeedback(paramInt); }
  
  public void glBindBufferBase(int paramInt1, int paramInt2, int paramInt3) { GLES30.glBindBufferBase(paramInt1, paramInt2, paramInt3); }
  
  public void glBindBufferRange(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glBindBufferRange(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glBindSampler(int paramInt1, int paramInt2) { GLES30.glBindSampler(paramInt1, paramInt2); }
  
  public void glBindTransformFeedback(int paramInt1, int paramInt2) { GLES30.glBindTransformFeedback(paramInt1, paramInt2); }
  
  public void glBindVertexArray(int paramInt) { GLES30.glBindVertexArray(paramInt); }
  
  public void glBlitFramebuffer(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10) { GLES30.glBlitFramebuffer(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10); }
  
  public void glClearBufferfi(int paramInt1, int paramInt2, float paramFloat, int paramInt3) { GLES30.glClearBufferfi(paramInt1, paramInt2, paramFloat, paramInt3); }
  
  public void glClearBufferfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES30.glClearBufferfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glClearBufferiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glClearBufferiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glClearBufferuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glClearBufferuiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glCopyBufferSubData(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glCopyBufferSubData(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glCopyTexSubImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9) { GLES30.glCopyTexSubImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9); }
  
  public void glDeleteQueries(int paramInt, IntBuffer paramIntBuffer) { GLES30.glDeleteQueries(paramInt, paramIntBuffer); }
  
  public void glDeleteQueries(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glDeleteQueries(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glDeleteSamplers(int paramInt, IntBuffer paramIntBuffer) { GLES30.glDeleteSamplers(paramInt, paramIntBuffer); }
  
  public void glDeleteSamplers(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glDeleteSamplers(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glDeleteTransformFeedbacks(int paramInt, IntBuffer paramIntBuffer) { GLES30.glDeleteTransformFeedbacks(paramInt, paramIntBuffer); }
  
  public void glDeleteTransformFeedbacks(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glDeleteTransformFeedbacks(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glDeleteVertexArrays(int paramInt, IntBuffer paramIntBuffer) { GLES30.glDeleteVertexArrays(paramInt, paramIntBuffer); }
  
  public void glDeleteVertexArrays(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glDeleteVertexArrays(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glDrawArraysInstanced(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { GLES30.glDrawArraysInstanced(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public void glDrawBuffers(int paramInt, IntBuffer paramIntBuffer) { GLES30.glDrawBuffers(paramInt, paramIntBuffer); }
  
  public void glDrawElementsInstanced(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glDrawElementsInstanced(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glDrawRangeElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6) { GLES30.glDrawRangeElements(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6); }
  
  public void glDrawRangeElements(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, Buffer paramBuffer) { GLES30.glDrawRangeElements(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramBuffer); }
  
  public void glEndQuery(int paramInt) { GLES30.glEndQuery(paramInt); }
  
  public void glEndTransformFeedback() { GLES30.glEndTransformFeedback(); }
  
  public void glFlushMappedBufferRange(int paramInt1, int paramInt2, int paramInt3) { GLES30.glFlushMappedBufferRange(paramInt1, paramInt2, paramInt3); }
  
  public void glFramebufferTextureLayer(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glFramebufferTextureLayer(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glGenQueries(int paramInt, IntBuffer paramIntBuffer) { GLES30.glGenQueries(paramInt, paramIntBuffer); }
  
  public void glGenQueries(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glGenQueries(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glGenSamplers(int paramInt, IntBuffer paramIntBuffer) { GLES30.glGenSamplers(paramInt, paramIntBuffer); }
  
  public void glGenSamplers(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glGenSamplers(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glGenTransformFeedbacks(int paramInt, IntBuffer paramIntBuffer) { GLES30.glGenTransformFeedbacks(paramInt, paramIntBuffer); }
  
  public void glGenTransformFeedbacks(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glGenTransformFeedbacks(paramInt1, paramArrayOfInt, paramInt2); }
  
  public void glGenVertexArrays(int paramInt, IntBuffer paramIntBuffer) { GLES30.glGenVertexArrays(paramInt, paramIntBuffer); }
  
  public void glGenVertexArrays(int paramInt1, int[] paramArrayOfInt, int paramInt2) { GLES30.glGenVertexArrays(paramInt1, paramArrayOfInt, paramInt2); }
  
  public String glGetActiveUniformBlockName(int paramInt1, int paramInt2) { return GLES30.glGetActiveUniformBlockName(paramInt1, paramInt2); }
  
  public void glGetActiveUniformBlockName(int paramInt1, int paramInt2, Buffer paramBuffer1, Buffer paramBuffer2) { GLES30.glGetActiveUniformBlockName(paramInt1, paramInt2, paramBuffer1, paramBuffer2); }
  
  public void glGetActiveUniformBlockiv(int paramInt1, int paramInt2, int paramInt3, IntBuffer paramIntBuffer) { GLES30.glGetActiveUniformBlockiv(paramInt1, paramInt2, paramInt3, paramIntBuffer); }
  
  public void glGetActiveUniformsiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer1, int paramInt3, IntBuffer paramIntBuffer2) { GLES30.glGetActiveUniformsiv(paramInt1, paramInt2, paramIntBuffer1, paramInt3, paramIntBuffer2); }
  
  public void glGetBufferParameteri64v(int paramInt1, int paramInt2, LongBuffer paramLongBuffer) { GLES30.glGetBufferParameteri64v(paramInt1, paramInt2, paramLongBuffer); }
  
  public Buffer glGetBufferPointerv(int paramInt1, int paramInt2) { return GLES30.glGetBufferPointerv(paramInt1, paramInt2); }
  
  public int glGetFragDataLocation(int paramInt, String paramString) { return GLES30.glGetFragDataLocation(paramInt, paramString); }
  
  public void glGetInteger64v(int paramInt, LongBuffer paramLongBuffer) { GLES30.glGetInteger64v(paramInt, paramLongBuffer); }
  
  public void glGetQueryObjectuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glGetQueryObjectuiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glGetQueryiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glGetQueryiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glGetSamplerParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES30.glGetSamplerParameterfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glGetSamplerParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glGetSamplerParameteriv(paramInt1, paramInt2, paramIntBuffer); }
  
  public String glGetStringi(int paramInt1, int paramInt2) { return GLES30.glGetStringi(paramInt1, paramInt2); }
  
  public int glGetUniformBlockIndex(int paramInt, String paramString) { return GLES30.glGetUniformBlockIndex(paramInt, paramString); }
  
  public void glGetUniformIndices(int paramInt, String[] paramArrayOfString, IntBuffer paramIntBuffer) { GLES30.glGetUniformIndices(paramInt, paramArrayOfString, paramIntBuffer); }
  
  public void glGetUniformuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glGetUniformuiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glGetVertexAttribIiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glGetVertexAttribIiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glGetVertexAttribIuiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glGetVertexAttribIuiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glInvalidateFramebuffer(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glInvalidateFramebuffer(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glInvalidateSubFramebuffer(int paramInt1, int paramInt2, IntBuffer paramIntBuffer, int paramInt3, int paramInt4, int paramInt5, int paramInt6) { GLES30.glInvalidateSubFramebuffer(paramInt1, paramInt2, paramIntBuffer, paramInt3, paramInt4, paramInt5, paramInt6); }
  
  public boolean glIsQuery(int paramInt) { return GLES30.glIsQuery(paramInt); }
  
  public boolean glIsSampler(int paramInt) { return GLES30.glIsSampler(paramInt); }
  
  public boolean glIsTransformFeedback(int paramInt) { return GLES30.glIsTransformFeedback(paramInt); }
  
  public boolean glIsVertexArray(int paramInt) { return GLES30.glIsVertexArray(paramInt); }
  
  public void glPauseTransformFeedback() { GLES30.glPauseTransformFeedback(); }
  
  public void glProgramParameteri(int paramInt1, int paramInt2, int paramInt3) { GLES30.glProgramParameteri(paramInt1, paramInt2, paramInt3); }
  
  public void glReadBuffer(int paramInt) { GLES30.glReadBuffer(paramInt); }
  
  public void glRenderbufferStorageMultisample(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glRenderbufferStorageMultisample(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glResumeTransformFeedback() { GLES30.glResumeTransformFeedback(); }
  
  public void glSamplerParameterf(int paramInt1, int paramInt2, float paramFloat) { GLES30.glSamplerParameterf(paramInt1, paramInt2, paramFloat); }
  
  public void glSamplerParameterfv(int paramInt1, int paramInt2, FloatBuffer paramFloatBuffer) { GLES30.glSamplerParameterfv(paramInt1, paramInt2, paramFloatBuffer); }
  
  public void glSamplerParameteri(int paramInt1, int paramInt2, int paramInt3) { GLES30.glSamplerParameteri(paramInt1, paramInt2, paramInt3); }
  
  public void glSamplerParameteriv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glSamplerParameteriv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glTexImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10) { GLES30.glTexImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10); }
  
  public void glTexImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, Buffer paramBuffer) {
    if (paramBuffer == null) {
      GLES30.glTexImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, 0);
    } else {
      GLES30.glTexImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramBuffer);
    } 
  }
  
  public void glTexSubImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11) { GLES30.glTexSubImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10, paramInt11); }
  
  public void glTexSubImage3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, Buffer paramBuffer) { GLES30.glTexSubImage3D(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10, paramBuffer); }
  
  public void glTransformFeedbackVaryings(int paramInt1, String[] paramArrayOfString, int paramInt2) { GLES30.glTransformFeedbackVaryings(paramInt1, paramArrayOfString, paramInt2); }
  
  public void glUniform1uiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glUniform1uiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniform3uiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glUniform3uiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniform4uiv(int paramInt1, int paramInt2, IntBuffer paramIntBuffer) { GLES30.glUniform4uiv(paramInt1, paramInt2, paramIntBuffer); }
  
  public void glUniformBlockBinding(int paramInt1, int paramInt2, int paramInt3) { GLES30.glUniformBlockBinding(paramInt1, paramInt2, paramInt3); }
  
  public void glUniformMatrix2x3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES30.glUniformMatrix2x3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix2x4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES30.glUniformMatrix2x4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix3x2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES30.glUniformMatrix3x2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix3x4fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES30.glUniformMatrix3x4fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix4x2fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES30.glUniformMatrix4x2fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public void glUniformMatrix4x3fv(int paramInt1, int paramInt2, boolean paramBoolean, FloatBuffer paramFloatBuffer) { GLES30.glUniformMatrix4x3fv(paramInt1, paramInt2, paramBoolean, paramFloatBuffer); }
  
  public boolean glUnmapBuffer(int paramInt) { return GLES30.glUnmapBuffer(paramInt); }
  
  public void glVertexAttribDivisor(int paramInt1, int paramInt2) { GLES30.glVertexAttribDivisor(paramInt1, paramInt2); }
  
  public void glVertexAttribI4i(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glVertexAttribI4i(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glVertexAttribI4ui(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glVertexAttribI4ui(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
  
  public void glVertexAttribIPointer(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) { GLES30.glVertexAttribIPointer(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidGL30.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */