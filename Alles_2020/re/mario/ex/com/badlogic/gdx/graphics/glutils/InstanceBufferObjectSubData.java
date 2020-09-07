package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

public class InstanceBufferObjectSubData implements InstanceData {
  final VertexAttributes attributes;
  
  final FloatBuffer buffer;
  
  int bufferHandle;
  
  final ByteBuffer byteBuffer;
  
  boolean isBound = false;
  
  final boolean isDirect;
  
  boolean isDirty = false;
  
  final boolean isStatic;
  
  final int usage;
  
  public InstanceBufferObjectSubData(boolean paramBoolean, int paramInt, VertexAttributes paramVertexAttributes) {
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
  
  public InstanceBufferObjectSubData(boolean paramBoolean, int paramInt, VertexAttribute... paramVarArgs) { this(paramBoolean, paramInt, new VertexAttributes(paramVarArgs)); }
  
  private void bufferChanged() {
    if (this.isBound) {
      Gdx.gl20.glBufferData(34962, this.byteBuffer.limit(), null, this.usage);
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
  
  public void bind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) { // Byte code:
    //   0: getstatic com/badlogic/gdx/Gdx.gl20 : Lcom/badlogic/gdx/graphics/GL20;
    //   3: astore_3
    //   4: aload_3
    //   5: ldc 34962
    //   7: aload_0
    //   8: getfield bufferHandle : I
    //   11: invokeinterface glBindBuffer : (II)V
    //   16: aload_0
    //   17: getfield isDirty : Z
    //   20: istore #4
    //   22: iconst_0
    //   23: istore #5
    //   25: iconst_0
    //   26: istore #6
    //   28: iload #4
    //   30: ifeq -> 78
    //   33: aload_0
    //   34: getfield byteBuffer : Ljava/nio/ByteBuffer;
    //   37: aload_0
    //   38: getfield buffer : Ljava/nio/FloatBuffer;
    //   41: invokevirtual limit : ()I
    //   44: iconst_4
    //   45: imul
    //   46: invokevirtual limit : (I)Ljava/nio/Buffer;
    //   49: pop
    //   50: aload_3
    //   51: ldc 34962
    //   53: aload_0
    //   54: getfield byteBuffer : Ljava/nio/ByteBuffer;
    //   57: invokevirtual limit : ()I
    //   60: aload_0
    //   61: getfield byteBuffer : Ljava/nio/ByteBuffer;
    //   64: aload_0
    //   65: getfield usage : I
    //   68: invokeinterface glBufferData : (IILjava/nio/Buffer;I)V
    //   73: aload_0
    //   74: iconst_0
    //   75: putfield isDirty : Z
    //   78: aload_0
    //   79: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   82: invokevirtual size : ()I
    //   85: istore #7
    //   87: aload_2
    //   88: ifnonnull -> 191
    //   91: iload #6
    //   93: istore #5
    //   95: iload #5
    //   97: iload #7
    //   99: if_icmpge -> 283
    //   102: aload_0
    //   103: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   106: iload #5
    //   108: invokevirtual get : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   111: astore_2
    //   112: aload_1
    //   113: aload_2
    //   114: getfield alias : Ljava/lang/String;
    //   117: invokevirtual getAttributeLocation : (Ljava/lang/String;)I
    //   120: istore #6
    //   122: iload #6
    //   124: ifge -> 130
    //   127: goto -> 185
    //   130: iload #6
    //   132: aload_2
    //   133: getfield unit : I
    //   136: iadd
    //   137: istore #6
    //   139: aload_1
    //   140: iload #6
    //   142: invokevirtual enableVertexAttribute : (I)V
    //   145: aload_1
    //   146: iload #6
    //   148: aload_2
    //   149: getfield numComponents : I
    //   152: aload_2
    //   153: getfield type : I
    //   156: aload_2
    //   157: getfield normalized : Z
    //   160: aload_0
    //   161: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   164: getfield vertexSize : I
    //   167: aload_2
    //   168: getfield offset : I
    //   171: invokevirtual setVertexAttribute : (IIIZII)V
    //   174: getstatic com/badlogic/gdx/Gdx.gl30 : Lcom/badlogic/gdx/graphics/GL30;
    //   177: iload #6
    //   179: iconst_1
    //   180: invokeinterface glVertexAttribDivisor : (II)V
    //   185: iinc #5, 1
    //   188: goto -> 95
    //   191: iload #5
    //   193: iload #7
    //   195: if_icmpge -> 283
    //   198: aload_0
    //   199: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   202: iload #5
    //   204: invokevirtual get : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   207: astore_3
    //   208: aload_2
    //   209: iload #5
    //   211: iaload
    //   212: istore #6
    //   214: iload #6
    //   216: ifge -> 222
    //   219: goto -> 277
    //   222: iload #6
    //   224: aload_3
    //   225: getfield unit : I
    //   228: iadd
    //   229: istore #6
    //   231: aload_1
    //   232: iload #6
    //   234: invokevirtual enableVertexAttribute : (I)V
    //   237: aload_1
    //   238: iload #6
    //   240: aload_3
    //   241: getfield numComponents : I
    //   244: aload_3
    //   245: getfield type : I
    //   248: aload_3
    //   249: getfield normalized : Z
    //   252: aload_0
    //   253: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   256: getfield vertexSize : I
    //   259: aload_3
    //   260: getfield offset : I
    //   263: invokevirtual setVertexAttribute : (IIIZII)V
    //   266: getstatic com/badlogic/gdx/Gdx.gl30 : Lcom/badlogic/gdx/graphics/GL30;
    //   269: iload #6
    //   271: iconst_1
    //   272: invokeinterface glVertexAttribDivisor : (II)V
    //   277: iinc #5, 1
    //   280: goto -> 191
    //   283: aload_0
    //   284: iconst_1
    //   285: putfield isBound : Z
    //   288: return }
  
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
  
  public int getNumInstances() { return this.buffer.limit() * 4 / this.attributes.vertexSize; }
  
  public int getNumMaxInstances() { return this.byteBuffer.capacity() / this.attributes.vertexSize; }
  
  public void invalidate() {
    this.bufferHandle = createBufferObject();
    this.isDirty = true;
  }
  
  public void setInstanceData(FloatBuffer paramFloatBuffer, int paramInt) {
    this.isDirty = true;
    if (this.isDirect) {
      BufferUtils.copy(paramFloatBuffer, this.byteBuffer, paramInt);
      this.buffer.position(0);
      this.buffer.limit(paramInt);
    } else {
      this.buffer.clear();
      this.buffer.put(paramFloatBuffer);
      this.buffer.flip();
      this.byteBuffer.position(0);
      this.byteBuffer.limit(this.buffer.limit() << 2);
    } 
    bufferChanged();
  }
  
  public void setInstanceData(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
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
  
  public void unbind(ShaderProgram paramShaderProgram, int[] paramArrayOfInt) { // Byte code:
    //   0: getstatic com/badlogic/gdx/Gdx.gl20 : Lcom/badlogic/gdx/graphics/GL20;
    //   3: astore_3
    //   4: aload_0
    //   5: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   8: invokevirtual size : ()I
    //   11: istore #4
    //   13: aload_2
    //   14: ifnonnull -> 72
    //   17: iconst_0
    //   18: istore #5
    //   20: iload #5
    //   22: iload #4
    //   24: if_icmpge -> 125
    //   27: aload_0
    //   28: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   31: iload #5
    //   33: invokevirtual get : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   36: astore_2
    //   37: aload_1
    //   38: aload_2
    //   39: getfield alias : Ljava/lang/String;
    //   42: invokevirtual getAttributeLocation : (Ljava/lang/String;)I
    //   45: istore #6
    //   47: iload #6
    //   49: ifge -> 55
    //   52: goto -> 66
    //   55: aload_1
    //   56: iload #6
    //   58: aload_2
    //   59: getfield unit : I
    //   62: iadd
    //   63: invokevirtual disableVertexAttribute : (I)V
    //   66: iinc #5, 1
    //   69: goto -> 20
    //   72: iconst_0
    //   73: istore #5
    //   75: iload #5
    //   77: iload #4
    //   79: if_icmpge -> 125
    //   82: aload_0
    //   83: getfield attributes : Lcom/badlogic/gdx/graphics/VertexAttributes;
    //   86: iload #5
    //   88: invokevirtual get : (I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    //   91: astore #7
    //   93: aload_2
    //   94: iload #5
    //   96: iaload
    //   97: istore #6
    //   99: iload #6
    //   101: ifge -> 107
    //   104: goto -> 119
    //   107: aload_1
    //   108: iload #6
    //   110: aload #7
    //   112: getfield unit : I
    //   115: iadd
    //   116: invokevirtual enableVertexAttribute : (I)V
    //   119: iinc #5, 1
    //   122: goto -> 75
    //   125: aload_3
    //   126: ldc 34962
    //   128: iconst_0
    //   129: invokeinterface glBindBuffer : (II)V
    //   134: aload_0
    //   135: iconst_0
    //   136: putfield isBound : Z
    //   139: return }
  
  public void updateInstanceData(int paramInt1, FloatBuffer paramFloatBuffer, int paramInt2, int paramInt3) {
    this.isDirty = true;
    if (this.isDirect) {
      int i = this.byteBuffer.position();
      this.byteBuffer.position(paramInt1 * 4);
      paramFloatBuffer.position(paramInt2 * 4);
      BufferUtils.copy(paramFloatBuffer, this.byteBuffer, paramInt3);
      this.byteBuffer.position(i);
      bufferChanged();
      return;
    } 
    throw new GdxRuntimeException("Buffer must be allocated direct.");
  }
  
  public void updateInstanceData(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */