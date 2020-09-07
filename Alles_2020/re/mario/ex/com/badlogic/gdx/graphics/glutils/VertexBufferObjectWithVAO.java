package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.IntArray;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class VertexBufferObjectWithVAO implements VertexData {
  static final IntBuffer tmpHandle = BufferUtils.newIntBuffer(1);
  
  final VertexAttributes attributes;
  
  final FloatBuffer buffer;
  
  int bufferHandle;
  
  final ByteBuffer byteBuffer;
  
  IntArray cachedLocations = new IntArray();
  
  boolean isBound = false;
  
  boolean isDirty = false;
  
  final boolean isStatic;
  
  final boolean ownsBuffer;
  
  final int usage;
  
  int vaoHandle = -1;
  
  public VertexBufferObjectWithVAO(boolean paramBoolean, int paramInt, VertexAttributes paramVertexAttributes) {
    this.isStatic = paramBoolean;
    this.attributes = paramVertexAttributes;
    this.byteBuffer = BufferUtils.newUnsafeByteBuffer(this.attributes.vertexSize * paramInt);
    this.buffer = this.byteBuffer.asFloatBuffer();
    this.ownsBuffer = true;
    this.buffer.flip();
    this.byteBuffer.flip();
    this.bufferHandle = Gdx.gl20.glGenBuffer();
    if (paramBoolean) {
      paramInt = 35044;
    } else {
      paramInt = 35048;
    } 
    this.usage = paramInt;
    createVAO();
  }
  
  public VertexBufferObjectWithVAO(boolean paramBoolean, int paramInt, VertexAttribute... paramVarArgs) { this(paramBoolean, paramInt, new VertexAttributes(paramVarArgs)); }
  
  public VertexBufferObjectWithVAO(boolean paramBoolean, ByteBuffer paramByteBuffer, VertexAttributes paramVertexAttributes) {
    this.isStatic = paramBoolean;
    this.attributes = paramVertexAttributes;
    this.byteBuffer = paramByteBuffer;
    this.ownsBuffer = false;
    this.buffer = this.byteBuffer.asFloatBuffer();
    this.buffer.flip();
    this.byteBuffer.flip();
    this.bufferHandle = Gdx.gl20.glGenBuffer();
    if (paramBoolean) {
      c = '裤';
    } else {
      c = '裨';
    } 
    this.usage = c;
    createVAO();
  }
  
  private void bindAttributes(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    int i = this.cachedLocations.size;
    int j = 0;
    if (i != 0) {
      i = 1;
    } else {
      i = 0;
    } 
    int k = this.attributes.size();
    int m = i;
    if (i != 0)
      if (paramArrayOfInt == null) {
        byte b = 0;
        while (true) {
          m = i;
          if (i != 0) {
            m = i;
            if (b < k) {
              if (paramShaderProgram.getAttributeLocation((this.attributes.get(b)).alias) == this.cachedLocations.get(b)) {
                i = 1;
              } else {
                i = 0;
              } 
              b++;
              continue;
            } 
          } 
          break;
        } 
      } else {
        if (paramArrayOfInt.length == this.cachedLocations.size) {
          i = 1;
        } else {
          i = 0;
        } 
        byte b = 0;
        while (true) {
          m = i;
          if (i != 0) {
            m = i;
            if (b < k) {
              if (paramArrayOfInt[b] == this.cachedLocations.get(b)) {
                i = 1;
              } else {
                i = 0;
              } 
              b++;
              continue;
            } 
          } 
          break;
        } 
      }  
    if (m == 0) {
      Gdx.gl.glBindBuffer(34962, this.bufferHandle);
      unbindAttributes(paramShaderProgram);
      this.cachedLocations.clear();
      for (i = j; i < k; i++) {
        VertexAttribute vertexAttribute = this.attributes.get(i);
        if (paramArrayOfInt == null) {
          this.cachedLocations.add(paramShaderProgram.getAttributeLocation(vertexAttribute.alias));
        } else {
          this.cachedLocations.add(paramArrayOfInt[i]);
        } 
        m = this.cachedLocations.get(i);
        if (m >= 0) {
          paramShaderProgram.enableVertexAttribute(m);
          paramShaderProgram.setVertexAttribute(m, vertexAttribute.numComponents, vertexAttribute.type, vertexAttribute.normalized, this.attributes.vertexSize, vertexAttribute.offset);
        } 
      } 
    } 
  }
  
  private void bindData(GL20 paramGL20) {
    if (this.isDirty) {
      paramGL20.glBindBuffer(34962, this.bufferHandle);
      this.byteBuffer.limit(this.buffer.limit() * 4);
      paramGL20.glBufferData(34962, this.byteBuffer.limit(), this.byteBuffer, this.usage);
      this.isDirty = false;
    } 
  }
  
  private void bufferChanged() {
    if (this.isBound) {
      Gdx.gl20.glBufferData(34962, this.byteBuffer.limit(), this.byteBuffer, this.usage);
      this.isDirty = false;
    } 
  }
  
  private void createVAO() {
    tmpHandle.clear();
    Gdx.gl30.glGenVertexArrays(1, tmpHandle);
    this.vaoHandle = tmpHandle.get();
  }
  
  private void deleteVAO() {
    if (this.vaoHandle != -1) {
      tmpHandle.clear();
      tmpHandle.put(this.vaoHandle);
      tmpHandle.flip();
      Gdx.gl30.glDeleteVertexArrays(1, tmpHandle);
      this.vaoHandle = -1;
    } 
  }
  
  private void unbindAttributes(ShaderProgram paramShaderProgram) {
    if (this.cachedLocations.size == 0)
      return; 
    int i = this.attributes.size();
    for (byte b = 0; b < i; b++) {
      int j = this.cachedLocations.get(b);
      if (j >= 0)
        paramShaderProgram.disableVertexAttribute(j); 
    } 
  }
  
  public void bind(ShaderProgram paramShaderProgram) { bind(paramShaderProgram, null); }
  
  public void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    GL30 gL30 = Gdx.gl30;
    gL30.glBindVertexArray(this.vaoHandle);
    bindAttributes(paramShaderProgram, paramArrayOfInt);
    bindData(gL30);
    this.isBound = true;
  }
  
  public void dispose() {
    GL30 gL30 = Gdx.gl30;
    gL30.glBindBuffer(34962, 0);
    gL30.glDeleteBuffer(this.bufferHandle);
    this.bufferHandle = 0;
    if (this.ownsBuffer)
      BufferUtils.disposeUnsafeByteBuffer(this.byteBuffer); 
    deleteVAO();
  }
  
  public VertexAttributes getAttributes() { return this.attributes; }
  
  public FloatBuffer getBuffer() {
    this.isDirty = true;
    return this.buffer;
  }
  
  public int getNumMaxVertices() { return this.byteBuffer.capacity() / this.attributes.vertexSize; }
  
  public int getNumVertices() { return this.buffer.limit() * 4 / this.attributes.vertexSize; }
  
  public void invalidate() {
    this.bufferHandle = Gdx.gl30.glGenBuffer();
    createVAO();
    this.isDirty = true;
  }
  
  public void setVertices(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    this.isDirty = true;
    BufferUtils.copy(paramArrayOfFloat, this.byteBuffer, paramInt2, paramInt1);
    this.buffer.position(0);
    this.buffer.limit(paramInt2);
    bufferChanged();
  }
  
  public void unbind(ShaderProgram paramShaderProgram) { unbind(paramShaderProgram, null); }
  
  public void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    Gdx.gl30.glBindVertexArray(0);
    this.isBound = false;
  }
  
  public void updateVertices(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    this.isDirty = true;
    int i = this.byteBuffer.position();
    this.byteBuffer.position(paramInt1 * 4);
    BufferUtils.copy(paramArrayOfFloat, paramInt2, paramInt3, this.byteBuffer);
    this.byteBuffer.position(i);
    this.buffer.position(0);
    bufferChanged();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */