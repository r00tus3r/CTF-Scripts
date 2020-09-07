package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.utils.Array;
import java.util.Comparator;
import java.util.Iterator;

public class Attributes extends Object implements Iterable<Attribute>, Comparator<Attribute>, Comparable<Attributes> {
  protected final Array<Attribute> attributes = new Array();
  
  protected long mask;
  
  protected boolean sorted = true;
  
  private final void disable(long paramLong) { this.mask = (paramLong ^ 0xFFFFFFFFFFFFFFFFL) & this.mask; }
  
  private final void enable(long paramLong) { this.mask = paramLong | this.mask; }
  
  public int attributesHash() {
    sort();
    int i = this.attributes.size;
    long l = this.mask + 71L;
    char c = '\001';
    for (byte b = 0; b < i; b++) {
      long l1 = this.mask;
      long l2 = ((Attribute)this.attributes.get(b)).hashCode();
      c = c * 7 & 0xFFFF;
      l += l1 * l2 * c;
    } 
    return (int)(l ^ l >> 32);
  }
  
  public void clear() {
    this.mask = 0L;
    this.attributes.clear();
  }
  
  public final int compare(Attribute paramAttribute1, Attribute paramAttribute2) { return (int)(paramAttribute1.type - paramAttribute2.type); }
  
  public int compareTo(Attributes paramAttributes) {
    byte b1 = 0;
    if (paramAttributes == this)
      return 0; 
    long l1 = this.mask;
    long l2 = paramAttributes.mask;
    byte b2 = -1;
    if (l1 != l2) {
      if (l1 >= l2)
        b2 = 1; 
      return b2;
    } 
    sort();
    paramAttributes.sort();
    for (b2 = 0; b2 < this.attributes.size; b2++) {
      int i = ((Attribute)this.attributes.get(b2)).compareTo(paramAttributes.attributes.get(b2));
      if (i != 0) {
        if (i < 0) {
          b2 = -1;
        } else {
          b2 = b1;
          if (i > 0)
            b2 = 1; 
        } 
        return b2;
      } 
    } 
    return 0;
  }
  
  public boolean equals(Object paramObject) { return !(paramObject instanceof Attributes) ? false : ((paramObject == this) ? true : same((Attributes)paramObject, true)); }
  
  public final Attribute get(long paramLong) {
    if (has(paramLong))
      for (byte b = 0; b < this.attributes.size; b++) {
        if (((Attribute)this.attributes.get(b)).type == paramLong)
          return (Attribute)this.attributes.get(b); 
      }  
    return null;
  }
  
  public final <T extends Attribute> T get(Class<T> paramClass, long paramLong) { return (T)get(paramLong); }
  
  public final Array<Attribute> get(Array<Attribute> paramArray, long paramLong) {
    for (byte b = 0; b < this.attributes.size; b++) {
      if ((((Attribute)this.attributes.get(b)).type & paramLong) != 0L)
        paramArray.add(this.attributes.get(b)); 
    } 
    return paramArray;
  }
  
  public final long getMask() { return this.mask; }
  
  public final boolean has(long paramLong) {
    boolean bool;
    if (paramLong != 0L && (this.mask & paramLong) == paramLong) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int hashCode() { return attributesHash(); }
  
  protected int indexOf(long paramLong) {
    if (has(paramLong))
      for (byte b = 0; b < this.attributes.size; b++) {
        if (((Attribute)this.attributes.get(b)).type == paramLong)
          return b; 
      }  
    return -1;
  }
  
  public final Iterator<Attribute> iterator() { return this.attributes.iterator(); }
  
  public final void remove(long paramLong) {
    for (int i = this.attributes.size - 1; i >= 0; i--) {
      long l = ((Attribute)this.attributes.get(i)).type;
      if ((paramLong & l) == l) {
        this.attributes.removeIndex(i);
        disable(l);
        this.sorted = false;
      } 
    } 
    sort();
  }
  
  public final boolean same(Attributes paramAttributes) { return same(paramAttributes, false); }
  
  public final boolean same(Attributes paramAttributes, boolean paramBoolean) {
    if (paramAttributes == this)
      return true; 
    if (paramAttributes == null || this.mask != paramAttributes.mask)
      return false; 
    if (!paramBoolean)
      return true; 
    sort();
    paramAttributes.sort();
    for (byte b = 0; b < this.attributes.size; b++) {
      if (!((Attribute)this.attributes.get(b)).equals((Attribute)paramAttributes.attributes.get(b)))
        return false; 
    } 
    return true;
  }
  
  public final void set(Attribute paramAttribute) {
    int i = indexOf(paramAttribute.type);
    if (i < 0) {
      enable(paramAttribute.type);
      this.attributes.add(paramAttribute);
      this.sorted = false;
    } else {
      this.attributes.set(i, paramAttribute);
    } 
    sort();
  }
  
  public final void set(Attribute paramAttribute1, Attribute paramAttribute2) {
    set(paramAttribute1);
    set(paramAttribute2);
  }
  
  public final void set(Attribute paramAttribute1, Attribute paramAttribute2, Attribute paramAttribute3) {
    set(paramAttribute1);
    set(paramAttribute2);
    set(paramAttribute3);
  }
  
  public final void set(Attribute paramAttribute1, Attribute paramAttribute2, Attribute paramAttribute3, Attribute paramAttribute4) {
    set(paramAttribute1);
    set(paramAttribute2);
    set(paramAttribute3);
    set(paramAttribute4);
  }
  
  public final void set(Iterable<Attribute> paramIterable) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      set((Attribute)iterator.next()); 
  }
  
  public final void set(Attribute... paramVarArgs) {
    int i = paramVarArgs.length;
    for (byte b = 0; b < i; b++)
      set(paramVarArgs[b]); 
  }
  
  public int size() { return this.attributes.size; }
  
  public final void sort() {
    if (!this.sorted) {
      this.attributes.sort(this);
      this.sorted = true;
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Attributes.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */