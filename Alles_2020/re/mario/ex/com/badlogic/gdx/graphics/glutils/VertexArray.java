package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.BufferUtils;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

public class VertexArray implements VertexData {
  final VertexAttributes attributes;
  
  final FloatBuffer buffer;
  
  final ByteBuffer byteBuffer;
  
  boolean isBound = false;
  
  public VertexArray(int paramInt, VertexAttributes paramVertexAttributes) {
    this.attributes = paramVertexAttributes;
    this.byteBuffer = BufferUtils.newUnsafeByteBuffer(this.attributes.vertexSize * paramInt);
    this.buffer = this.byteBuffer.asFloatBuffer();
    this.buffer.flip();
    this.byteBuffer.flip();
  }
  
  public VertexArray(int paramInt, VertexAttribute... paramVarArgs) { this(paramInt, new VertexAttributes(paramVarArgs)); }
  
  public void bind(ShaderProgram paramShaderProgram) { bind(paramShaderProgram, null); }
  
  public void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
    VertexAttribute vertexAttribute;
    int i = this.attributes.size();
    this.byteBuffer.limit(this.buffer.limit() * 4);
    byte b = 0;
    int j = 0;
    if (paramArrayOfInt == null) {
      for (b = j; b < i; b++) {
        vertexAttribute = this.attributes.get(b);
        j = paramShaderProgram.getAttributeLocation(vertexAttribute.alias);
        if (j >= 0) {
          paramShaderProgram.enableVertexAttribute(j);
          if (vertexAttribute.type == 5126) {
            this.buffer.position(vertexAttribute.offset / 4);
            paramShaderProgram.setVertexAttribute(j, vertexAttribute.numComponents, vertexAttribute.type, vertexAttribute.normalized, this.attributes.vertexSize, this.buffer);
          } else {
            this.byteBuffer.position(vertexAttribute.offset);
            paramShaderProgram.setVertexAttribute(j, vertexAttribute.numComponents, vertexAttribute.type, vertexAttribute.normalized, this.attributes.vertexSize, this.byteBuffer);
          } 
        } 
      } 
    } else {
      while (b < i) {
        VertexAttribute vertexAttribute2 = this.attributes.get(b);
        VertexAttribute vertexAttribute1 = vertexAttribute[b];
        if (vertexAttribute1 >= null) {
          paramShaderProgram.enableVertexAttribute(vertexAttribute1);
          if (vertexAttribute2.type == 5126) {
            this.buffer.position(vertexAttribute2.offset / 4);
            paramShaderProgram.setVertexAttribute(vertexAttribute1, vertexAttribute2.numComponents, vertexAttribute2.type, vertexAttribute2.normalized, this.attributes.vertexSize, this.buffer);
          } else {
            this.byteBuffer.position(vertexAttribute2.offset);
            paramShaderProgram.setVertexAttribute(vertexAttribute1, vertexAttribute2.numComponents, vertexAttribute2.type, vertexAttribute2.normalized, this.attributes.vertexSize, this.byteBuffer);
          } 
        } 
        b++;
      } 
    } 
    this.isBound = true;
  }
  
  public void dispose() { BufferUtils.disposeUnsafeByteBuffer(this.byteBuffer); }
  
  public VertexAttributes getAttributes() { return this.attributes; }
  
  public FloatBuffer getBuffer() { return this.buffer; }
  
  public int getNumMaxVertices() { return this.byteBuffer.capacity() / this.attributes.vertexSize; }
  
  public int getNumVertices() { return this.buffer.limit() * 4 / this.attributes.vertexSize; }
  
  public void invalidate() {}
  
  public void setVertices(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    BufferUtils.copy(paramArrayOfFloat, this.byteBuffer, paramInt2, paramInt1);
    this.buffer.position(0);
    this.buffer.limit(paramInt2);
  }
  
  public void unbind(ShaderProgram paramShaderProgram) { unbind(paramShaderProgram, null); }
  
  public void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) {
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
    this.isBound = false;
  }
  
  public void updateVertices(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    int i = this.byteBuffer.position();
    this.byteBuffer.position(paramInt1 * 4);
    BufferUtils.copy(paramArrayOfFloat, paramInt2, paramInt3, this.byteBuffer);
    this.byteBuffer.position(i);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/VertexArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */