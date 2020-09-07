package com.badlogic.gdx.graphics;

import com.badlogic.gdx.utils.Collections;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;
import java.util.NoSuchElementException;

public final class VertexAttributes extends Object implements Iterable<VertexAttribute>, Comparable<VertexAttributes> {
  private final VertexAttribute[] attributes;
  
  private ReadonlyIterable<VertexAttribute> iterable;
  
  private long mask = -1L;
  
  public final int vertexSize;
  
  public VertexAttributes(VertexAttribute... paramVarArgs) {
    if (paramVarArgs.length != 0) {
      VertexAttribute[] arrayOfVertexAttribute = new VertexAttribute[paramVarArgs.length];
      for (byte b = 0; b < paramVarArgs.length; b++)
        arrayOfVertexAttribute[b] = paramVarArgs[b]; 
      this.attributes = arrayOfVertexAttribute;
      this.vertexSize = calculateOffsets();
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("attributes must be >= 1");
    throw illegalArgumentException;
  }
  
  private int calculateOffsets() {
    byte b = 0;
    int i = 0;
    while (true) {
      VertexAttribute[] arrayOfVertexAttribute = this.attributes;
      if (b < arrayOfVertexAttribute.length) {
        VertexAttribute vertexAttribute = arrayOfVertexAttribute[b];
        vertexAttribute.offset = i;
        i += vertexAttribute.getSizeInBytes();
        b++;
        continue;
      } 
      break;
    } 
    return i;
  }
  
  public int compareTo(VertexAttributes paramVertexAttributes) {
    VertexAttribute[] arrayOfVertexAttribute1 = this.attributes;
    int i = arrayOfVertexAttribute1.length;
    VertexAttribute[] arrayOfVertexAttribute2 = paramVertexAttributes.attributes;
    if (i != arrayOfVertexAttribute2.length) {
      int k = arrayOfVertexAttribute1.length;
      i = arrayOfVertexAttribute2.length;
      return k - i;
    } 
    long l1 = getMask();
    long l2 = paramVertexAttributes.getMask();
    i = -1;
    if (l1 != l2) {
      if (l1 >= l2)
        i = 1; 
      return i;
    } 
    for (int j = this.attributes.length - 1; j >= 0; j--) {
      VertexAttribute vertexAttribute2 = this.attributes[j];
      VertexAttribute vertexAttribute1 = paramVertexAttributes.attributes[j];
      if (vertexAttribute2.usage != vertexAttribute1.usage) {
        j = vertexAttribute2.usage;
        i = vertexAttribute1.usage;
        return j - i;
      } 
      if (vertexAttribute2.unit != vertexAttribute1.unit) {
        j = vertexAttribute2.unit;
        i = vertexAttribute1.unit;
        return j - i;
      } 
      if (vertexAttribute2.numComponents != vertexAttribute1.numComponents) {
        j = vertexAttribute2.numComponents;
        i = vertexAttribute1.numComponents;
        return j - i;
      } 
      if (vertexAttribute2.normalized != vertexAttribute1.normalized) {
        if (vertexAttribute2.normalized)
          i = 1; 
        return i;
      } 
      if (vertexAttribute2.type != vertexAttribute1.type) {
        j = vertexAttribute2.type;
        i = vertexAttribute1.type;
        return j - i;
      } 
    } 
    return 0;
  }
  
  public boolean equals(Object paramObject) {
    if (paramObject == this)
      return true; 
    if (!(paramObject instanceof VertexAttributes))
      return false; 
    VertexAttributes vertexAttributes = (VertexAttributes)paramObject;
    if (this.attributes.length != vertexAttributes.attributes.length)
      return false; 
    byte b = 0;
    while (true) {
      VertexAttribute[] arrayOfVertexAttribute = this.attributes;
      if (b < arrayOfVertexAttribute.length) {
        if (!arrayOfVertexAttribute[b].equals(vertexAttributes.attributes[b]))
          return false; 
        b++;
        continue;
      } 
      break;
    } 
    return true;
  }
  
  public VertexAttribute findByUsage(int paramInt) {
    int i = size();
    for (byte b = 0; b < i; b++) {
      if ((get(b)).usage == paramInt)
        return get(b); 
    } 
    return null;
  }
  
  public VertexAttribute get(int paramInt) { return this.attributes[paramInt]; }
  
  public long getMask() {
    if (this.mask == -1L) {
      long l = 0L;
      byte b = 0;
      while (true) {
        VertexAttribute[] arrayOfVertexAttribute = this.attributes;
        if (b < arrayOfVertexAttribute.length) {
          l |= (arrayOfVertexAttribute[b]).usage;
          b++;
          continue;
        } 
        break;
      } 
      this.mask = l;
    } 
    return this.mask;
  }
  
  public long getMaskWithSizePacked() { return getMask() | this.attributes.length << 32; }
  
  public int getOffset(int paramInt) { return getOffset(paramInt, 0); }
  
  public int getOffset(int paramInt1, int paramInt2) {
    VertexAttribute vertexAttribute = findByUsage(paramInt1);
    return (vertexAttribute == null) ? paramInt2 : (vertexAttribute.offset / 4);
  }
  
  public int hashCode() {
    long l = (this.attributes.length * 61);
    byte b = 0;
    while (true) {
      VertexAttribute[] arrayOfVertexAttribute = this.attributes;
      if (b < arrayOfVertexAttribute.length) {
        l = l * 61L + arrayOfVertexAttribute[b].hashCode();
        b++;
        continue;
      } 
      break;
    } 
    return (int)(l ^ l >> 32);
  }
  
  public Iterator<VertexAttribute> iterator() {
    if (this.iterable == null)
      this.iterable = new ReadonlyIterable(this.attributes); 
    return this.iterable.iterator();
  }
  
  public int size() { return this.attributes.length; }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("[");
    for (byte b = 0; b < this.attributes.length; b++) {
      stringBuilder.append("(");
      stringBuilder.append((this.attributes[b]).alias);
      stringBuilder.append(", ");
      stringBuilder.append((this.attributes[b]).usage);
      stringBuilder.append(", ");
      stringBuilder.append((this.attributes[b]).numComponents);
      stringBuilder.append(", ");
      stringBuilder.append((this.attributes[b]).offset);
      stringBuilder.append(")");
      stringBuilder.append("\n");
    } 
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
  
  private static class ReadonlyIterable<T> extends Object implements Iterable<T> {
    private final T[] array;
    
    private VertexAttributes.ReadonlyIterator iterator1;
    
    private VertexAttributes.ReadonlyIterator iterator2;
    
    public ReadonlyIterable(T[] param1ArrayOfT) { this.array = param1ArrayOfT; }
    
    public Iterator<T> iterator() {
      if (Collections.allocateIterators)
        return new VertexAttributes.ReadonlyIterator(this.array); 
      if (this.iterator1 == null) {
        this.iterator1 = new VertexAttributes.ReadonlyIterator(this.array);
        this.iterator2 = new VertexAttributes.ReadonlyIterator(this.array);
      } 
      if (!this.iterator1.valid) {
        VertexAttributes.ReadonlyIterator readonlyIterator1 = this.iterator1;
        readonlyIterator1.index = 0;
        readonlyIterator1.valid = true;
        this.iterator2.valid = false;
        return readonlyIterator1;
      } 
      VertexAttributes.ReadonlyIterator readonlyIterator = this.iterator2;
      readonlyIterator.index = 0;
      readonlyIterator.valid = true;
      this.iterator1.valid = false;
      return readonlyIterator;
    }
  }
  
  private static class ReadonlyIterator<T> extends Object implements Iterator<T>, Iterable<T> {
    private final T[] array;
    
    int index;
    
    boolean valid = true;
    
    public ReadonlyIterator(T[] param1ArrayOfT) { this.array = param1ArrayOfT; }
    
    public boolean hasNext() {
      if (this.valid) {
        boolean bool;
        if (this.index < this.array.length) {
          bool = true;
        } else {
          bool = false;
        } 
        return bool;
      } 
      throw new GdxRuntimeException("#iterator() cannot be used nested.");
    }
    
    public Iterator<T> iterator() { return this; }
    
    public T next() {
      int i = this.index;
      Object[] arrayOfObject = this.array;
      if (i < arrayOfObject.length) {
        if (this.valid) {
          this.index = i + 1;
          return (T)arrayOfObject[i];
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException(String.valueOf(i));
    }
    
    public void remove() { throw new GdxRuntimeException("Remove not allowed."); }
    
    public void reset() { this.index = 0; }
  }
  
  public static final class Usage {
    public static final int BiNormal = 256;
    
    public static final int BoneWeight = 64;
    
    public static final int ColorPacked = 4;
    
    public static final int ColorUnpacked = 2;
    
    public static final int Generic = 32;
    
    public static final int Normal = 8;
    
    public static final int Position = 1;
    
    public static final int Tangent = 128;
    
    public static final int TextureCoordinates = 16;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/VertexAttributes.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */