package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

public class VertexBufferObjectSubData implements VertexData {
  final VertexAttributes attributes;
  
  final FloatBuffer buffer;
  
  int bufferHandle;
  
  final ByteBuffer byteBuffer;
  
  boolean isBound = false;
  
  final boolean isDirect;
  
  boolean isDirty = false;
  
  final boolean isStatic;
  
  final int usage;
  
  public VertexBufferObjectSubData(boolean paramBoolean, int paramInt, VertexAttributes paramVertexAttributes) {
    this.isStatic = paramBoolean;
    this.attributes = paramVertexAttributes;
    this.byteBuffer = BufferUtils.newByteBuffer(this.attributes.vertexSize * paramInt);
    this.isDirect = true;
    if (paramBoolean) {
      paramInt = 35044;
    } else {
      paramInt = 35048;
    } 
    this.usage = paramInt;
    this.buffer = this.byteBuffer.asFloatBuffer();
    this.bufferHandle = createBufferObject();
    this.buffer.flip();
    this.byteBuffer.flip();
  }
  
  public VertexBufferObjectSubData(boolean paramBoolean, int paramInt, VertexAttribute... paramVarArgs) { this(paramBoolean, paramInt, new VertexAttributes(paramVarArgs)); }
  
  private void bufferChanged() {
    if (this.isBound) {
      Gdx.gl20.glBufferSubData(34962, 0, this.byteBuffer.limit(), this.byteBuffer);
      this.isDirty = false;
    } 
  }
  
  private int createBufferObject() {
    int i = Gdx.gl20.glGenBuffer();
    Gdx.gl20.glBindBuffer(34962, i);
    Gdx.gl20.glBufferData(34962, this.byteBuffer.capacity(), null, this.usage);
    Gdx.gl20.glBindBuffer(34962, 0);
    return i;
  }
  
  public void bind(ShaderProgram paramShaderProgram) { bind(paramShaderProgram, null); }
  
  public void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    VertexAttribute vertexAttribute;
    GL20 gL20 = Gdx.gl20;
    gL20.glBindBuffer(34962, this.bufferHandle);
    boolean bool = this.isDirty;
    byte b = 0;
    int i = 0;
    if (bool) {
      this.byteBuffer.limit(this.buffer.limit() * 4);
      gL20.glBufferData(34962, this.byteBuffer.limit(), this.byteBuffer, this.usage);
      this.isDirty = false;
    } 
    int j = this.attributes.size();
    if (paramArrayOfInt == null) {
      for (b = i; b < j; b++) {
        vertexAttribute = this.attributes.get(b);
        i = paramShaderProgram.getAttributeLocation(vertexAttribute.alias);
        if (i >= 0) {
          paramShaderProgram.enableVertexAttribute(i);
          paramShaderProgram.setVertexAttribute(i, vertexAttribute.numComponents, vertexAttribute.type, vertexAttribute.normalized, this.attributes.vertexSize, vertexAttribute.offset);
        } 
      } 
    } else {
      while (b < j) {
        VertexAttribute vertexAttribute1 = this.attributes.get(b);
        VertexAttribute vertexAttribute2 = vertexAttribute[b];
        if (vertexAttribute2 >= null) {
          paramShaderProgram.enableVertexAttribute(vertexAttribute2);
          paramShaderProgram.setVertexAttribute(vertexAttribute2, vertexAttribute1.numComponents, vertexAttribute1.type, vertexAttribute1.normalized, this.attributes.vertexSize, vertexAttribute1.offset);
        } 
        b++;
      } 
    } 
    this.isBound = true;
  }
  
  public void dispose() {
    GL20 gL20 = Gdx.gl20;
    gL20.glBindBuffer(34962, 0);
    gL20.glDeleteBuffer(this.bufferHandle);
    this.bufferHandle = 0;
  }
  
  public VertexAttributes getAttributes() { return this.attributes; }
  
  public FloatBuffer getBuffer() {
    this.isDirty = true;
    return this.buffer;
  }
  
  public int getBufferHandle() { return this.bufferHandle; }
  
  public int getNumMaxVertices() { return this.byteBuffer.capacity() / this.attributes.vertexSize; }
  
  public int getNumVertices() { return this.buffer.limit() * 4 / this.attributes.vertexSize; }
  
  public void invalidate() {
    this.bufferHandle = createBufferObject();
    this.isDirty = true;
  }
  
  public void setVertices(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    this.isDirty = true;
    if (this.isDirect) {
      BufferUtils.copy(paramArrayOfFloat, this.byteBuffer, paramInt2, paramInt1);
      this.buffer.position(0);
      this.buffer.limit(paramInt2);
    } else {
      this.buffer.clear();
      this.buffer.put(paramArrayOfFloat, paramInt1, paramInt2);
      this.buffer.flip();
      this.byteBuffer.position(0);
      this.byteBuffer.limit(this.buffer.limit() << 2);
    } 
    bufferChanged();
  }
  
  public void unbind(ShaderProgram paramShaderProgram) { unbind(paramShaderProgram, null); }
  
  public void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    GL20 gL20 = Gdx.gl20;
    int i = this.attributes.size();
    if (paramArrayOfInt == null) {
      for (byte b = 0; b < i; b++)
        paramShaderProgram.disableVertexAttribute((this.attributes.get(b)).alias); 
    } else {
      for (byte b = 0; b < i; b++) {
        int j = paramArrayOfInt[b];
        if (j >= 0)
          paramShaderProgram.disableVertexAttribute(j); 
      } 
    } 
    gL20.glBindBuffer(34962, 0);
    this.isBound = false;
  }
  
  public void updateVertices(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    this.isDirty = true;
    if (this.isDirect) {
      int i = this.byteBuffer.position();
      this.byteBuffer.position(paramInt1 * 4);
      BufferUtils.copy(paramArrayOfFloat, paramInt2, paramInt3, this.byteBuffer);
      this.byteBuffer.position(i);
      bufferChanged();
      return;
    } 
    throw new GdxRuntimeException("Buffer must be allocated direct.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/VertexBufferObjectSubData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */