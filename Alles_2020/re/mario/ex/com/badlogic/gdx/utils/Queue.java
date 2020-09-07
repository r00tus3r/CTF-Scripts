package com.badlogic.gdx.utils;

import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Queue<T> extends Object implements Iterable<T> {
  protected int head = 0;
  
  private QueueIterable iterable;
  
  public int size = 0;
  
  protected int tail = 0;
  
  protected T[] values;
  
  public Queue() { this(16); }
  
  public Queue(int paramInt) { this.values = (Object[])new Object[paramInt]; }
  
  public Queue(int paramInt, Class<T> paramClass) { this.values = (Object[])ArrayReflection.newInstance(paramClass, paramInt); }
  
  public void addFirst(T paramT) {
    Object[] arrayOfObject1 = this.values;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (this.size == arrayOfObject1.length) {
      resize(arrayOfObject1.length << 1);
      arrayOfObject2 = this.values;
    } 
    int i = this.head - 1;
    int j = i;
    if (i == -1)
      j = arrayOfObject2.length - 1; 
    arrayOfObject2[j] = paramT;
    this.head = j;
    this.size++;
  }
  
  public void addLast(T paramT) {
    Object[] arrayOfObject1 = this.values;
    Object[] arrayOfObject2 = arrayOfObject1;
    if (this.size == arrayOfObject1.length) {
      resize(arrayOfObject1.length << 1);
      arrayOfObject2 = this.values;
    } 
    int i = this.tail;
    this.tail = i + 1;
    arrayOfObject2[i] = paramT;
    if (this.tail == arrayOfObject2.length)
      this.tail = 0; 
    this.size++;
  }
  
  public void clear() {
    if (this.size == 0)
      return; 
    Object[] arrayOfObject = this.values;
    int i = this.head;
    int j = this.tail;
    int k = i;
    if (i < j) {
      while (i < j) {
        arrayOfObject[i] = null;
        i++;
      } 
    } else {
      while (k < arrayOfObject.length) {
        arrayOfObject[k] = null;
        k++;
      } 
      for (k = 0; k < j; k++)
        arrayOfObject[k] = null; 
    } 
    this.head = 0;
    this.tail = 0;
    this.size = 0;
  }
  
  public void ensureCapacity(int paramInt) {
    paramInt = this.size + paramInt;
    if (this.values.length < paramInt)
      resize(paramInt); 
  }
  
  public boolean equals(Object paramObject) {
    if (this == paramObject)
      return true; 
    if (paramObject == null || !(paramObject instanceof Queue))
      return false; 
    Queue queue = (Queue)paramObject;
    int i = this.size;
    if (queue.size != i)
      return false; 
    Object[] arrayOfObject2 = this.values;
    int j = arrayOfObject2.length;
    Object[] arrayOfObject1 = queue.values;
    int k = arrayOfObject1.length;
    int m = this.head;
    int n = queue.head;
    byte b = 0;
    while (b < i) {
      Object object2 = arrayOfObject2[m];
      Object object1 = arrayOfObject1[n];
      if ((object2 == null) ? (object1 == null) : object2.equals(object1)) {
        int i1 = m + 1;
        int i2 = n + 1;
        m = i1;
        if (i1 == j)
          m = 0; 
        n = i2;
        if (i2 == k)
          n = 0; 
        b++;
        continue;
      } 
      return false;
    } 
    return true;
  }
  
  public boolean equalsIdentity(Object paramObject) {
    if (this == paramObject)
      return true; 
    if (paramObject == null || !(paramObject instanceof Queue))
      return false; 
    Queue queue = (Queue)paramObject;
    int i = this.size;
    if (queue.size != i)
      return false; 
    Object[] arrayOfObject2 = this.values;
    int j = arrayOfObject2.length;
    Object[] arrayOfObject1 = queue.values;
    int k = arrayOfObject1.length;
    int m = this.head;
    int n = queue.head;
    for (byte b = 0; b < i; b++) {
      if (arrayOfObject2[m] != arrayOfObject1[n])
        return false; 
      int i1 = m + 1;
      int i2 = n + 1;
      m = i1;
      if (i1 == j)
        m = 0; 
      n = i2;
      if (i2 == k)
        n = 0; 
    } 
    return true;
  }
  
  public T first() {
    if (this.size != 0)
      return (T)this.values[this.head]; 
    throw new NoSuchElementException("Queue is empty.");
  }
  
  public T get(int paramInt) {
    if (paramInt >= 0) {
      if (paramInt < this.size) {
        Object[] arrayOfObject = this.values;
        int i = this.head + paramInt;
        paramInt = i;
        if (i >= arrayOfObject.length)
          paramInt = i - arrayOfObject.length; 
        return (T)arrayOfObject[paramInt];
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("index can't be >= size: ");
      stringBuilder1.append(paramInt);
      stringBuilder1.append(" >= ");
      stringBuilder1.append(this.size);
      throw new IndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be < 0: ");
    stringBuilder.append(paramInt);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public int hashCode() {
    int i = this.size;
    Object[] arrayOfObject = this.values;
    int j = arrayOfObject.length;
    int k = this.head;
    int m = i + 1;
    for (byte b = 0; b < i; b++) {
      Object object = arrayOfObject[k];
      int n = m * 31;
      m = n;
      if (object != null)
        m = n + object.hashCode(); 
      n = k + 1;
      k = n;
      if (n == j)
        k = 0; 
    } 
    return m;
  }
  
  public int indexOf(T paramT, boolean paramBoolean) {
    if (this.size == 0)
      return -1; 
    Object[] arrayOfObject = this.values;
    int i = this.head;
    int j = this.tail;
    int k = 0;
    int m = 0;
    if (paramBoolean || paramT == null) {
      if (i < j) {
        for (int n = i; n < j; n++) {
          if (arrayOfObject[n] == paramT)
            return n - i; 
        } 
      } else {
        int n;
        m = arrayOfObject.length;
        int i1 = i;
        while (true) {
          n = k;
          if (i1 < m) {
            if (arrayOfObject[i1] == paramT)
              return i1 - i; 
            i1++;
            continue;
          } 
          break;
        } 
        while (n < j) {
          if (arrayOfObject[n] == paramT) {
            i1 = arrayOfObject.length;
            return n + i1 - i;
          } 
          n++;
        } 
      } 
      return -1;
    } 
    if (i < j) {
      for (int n = i; n < j; n++) {
        if (paramT.equals(arrayOfObject[n]))
          return n - i; 
      } 
    } else {
      int n;
      k = arrayOfObject.length;
      int i1 = i;
      while (true) {
        n = m;
        if (i1 < k) {
          if (paramT.equals(arrayOfObject[i1]))
            return i1 - i; 
          i1++;
          continue;
        } 
        break;
      } 
      while (n < j) {
        if (paramT.equals(arrayOfObject[n])) {
          i1 = arrayOfObject.length;
          return n + i1 - i;
        } 
        n++;
      } 
    } 
    return -1;
  }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.size == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Iterator<T> iterator() {
    if (Collections.allocateIterators)
      return new QueueIterator(this, true); 
    if (this.iterable == null)
      this.iterable = new QueueIterable(this); 
    return this.iterable.iterator();
  }
  
  public T last() {
    if (this.size != 0) {
      Object[] arrayOfObject = this.values;
      int i = this.tail - 1;
      int j = i;
      if (i == -1)
        j = arrayOfObject.length - 1; 
      return (T)arrayOfObject[j];
    } 
    throw new NoSuchElementException("Queue is empty.");
  }
  
  public boolean notEmpty() {
    boolean bool;
    if (this.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public T removeFirst() {
    if (this.size != 0) {
      Object[] arrayOfObject = this.values;
      int i = this.head;
      Object object = arrayOfObject[i];
      arrayOfObject[i] = null;
      this.head = i + 1;
      if (this.head == arrayOfObject.length)
        this.head = 0; 
      this.size--;
      return (T)object;
    } 
    throw new NoSuchElementException("Queue is empty.");
  }
  
  public T removeIndex(int paramInt) {
    if (paramInt >= 0) {
      if (paramInt < this.size) {
        Object object;
        Object[] arrayOfObject = this.values;
        int i = this.head;
        int j = this.tail;
        paramInt += i;
        if (i < j) {
          object = arrayOfObject[paramInt];
          System.arraycopy(arrayOfObject, paramInt + 1, arrayOfObject, paramInt, j - paramInt);
          arrayOfObject[j] = null;
          this.tail--;
        } else if (paramInt >= arrayOfObject.length) {
          paramInt -= arrayOfObject.length;
          object = arrayOfObject[paramInt];
          System.arraycopy(arrayOfObject, paramInt + 1, arrayOfObject, paramInt, j - paramInt);
          this.tail--;
        } else {
          object = arrayOfObject[paramInt];
          System.arraycopy(arrayOfObject, i, arrayOfObject, i + 1, paramInt - i);
          arrayOfObject[i] = null;
          this.head++;
          if (this.head == arrayOfObject.length)
            this.head = 0; 
        } 
        this.size--;
        return (T)object;
      } 
      java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
      stringBuilder1.append("index can't be >= size: ");
      stringBuilder1.append(paramInt);
      stringBuilder1.append(" >= ");
      stringBuilder1.append(this.size);
      throw new IndexOutOfBoundsException(stringBuilder1.toString());
    } 
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append("index can't be < 0: ");
    stringBuilder.append(paramInt);
    throw new IndexOutOfBoundsException(stringBuilder.toString());
  }
  
  public T removeLast() {
    if (this.size != 0) {
      Object[] arrayOfObject = this.values;
      int i = this.tail - 1;
      int j = i;
      if (i == -1)
        j = arrayOfObject.length - 1; 
      Object object = arrayOfObject[j];
      arrayOfObject[j] = null;
      this.tail = j;
      this.size--;
      return (T)object;
    } 
    throw new NoSuchElementException("Queue is empty.");
  }
  
  public boolean removeValue(T paramT, boolean paramBoolean) {
    int i = indexOf(paramT, paramBoolean);
    if (i == -1)
      return false; 
    removeIndex(i);
    return true;
  }
  
  protected void resize(int paramInt) {
    Object[] arrayOfObject1 = this.values;
    int i = this.head;
    int j = this.tail;
    Object[] arrayOfObject2 = (Object[])ArrayReflection.newInstance(arrayOfObject1.getClass().getComponentType(), paramInt);
    if (i < j) {
      System.arraycopy(arrayOfObject1, i, arrayOfObject2, 0, j - i);
    } else if (this.size > 0) {
      paramInt = arrayOfObject1.length - i;
      System.arraycopy(arrayOfObject1, i, arrayOfObject2, 0, paramInt);
      System.arraycopy(arrayOfObject1, 0, arrayOfObject2, paramInt, j);
    } 
    this.values = arrayOfObject2;
    this.head = 0;
    this.tail = this.size;
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    Object[] arrayOfObject = this.values;
    int i = this.head;
    int j = this.tail;
    StringBuilder stringBuilder = new StringBuilder(64);
    stringBuilder.append('[');
    stringBuilder.append(arrayOfObject[i]);
    while (true) {
      i = (i + 1) % arrayOfObject.length;
      if (i != j) {
        stringBuilder.append(", ").append(arrayOfObject[i]);
        continue;
      } 
      break;
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public static class QueueIterable<T> extends Object implements Iterable<T> {
    private final boolean allowRemove;
    
    private Queue.QueueIterator iterator1;
    
    private Queue.QueueIterator iterator2;
    
    private final Queue<T> queue;
    
    public QueueIterable(Queue<T> param1Queue) { this(param1Queue, true); }
    
    public QueueIterable(Queue<T> param1Queue, boolean param1Boolean) {
      this.queue = param1Queue;
      this.allowRemove = param1Boolean;
    }
    
    public Iterator<T> iterator() {
      if (Collections.allocateIterators)
        return new Queue.QueueIterator(this.queue, this.allowRemove); 
      if (this.iterator1 == null) {
        this.iterator1 = new Queue.QueueIterator(this.queue, this.allowRemove);
        this.iterator2 = new Queue.QueueIterator(this.queue, this.allowRemove);
      } 
      if (!this.iterator1.valid) {
        Queue.QueueIterator queueIterator1 = this.iterator1;
        queueIterator1.index = 0;
        queueIterator1.valid = true;
        this.iterator2.valid = false;
        return queueIterator1;
      } 
      Queue.QueueIterator queueIterator = this.iterator2;
      queueIterator.index = 0;
      queueIterator.valid = true;
      this.iterator1.valid = false;
      return queueIterator;
    }
  }
  
  public static class QueueIterator<T> extends Object implements Iterator<T>, Iterable<T> {
    private final boolean allowRemove;
    
    int index;
    
    private final Queue<T> queue;
    
    boolean valid = true;
    
    public QueueIterator(Queue<T> param1Queue) { this(param1Queue, true); }
    
    public QueueIterator(Queue<T> param1Queue, boolean param1Boolean) {
      this.queue = param1Queue;
      this.allowRemove = param1Boolean;
    }
    
    public boolean hasNext() {
      if (this.valid) {
        boolean bool;
        if (this.index < this.queue.size) {
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
      if (this.index < this.queue.size) {
        if (this.valid) {
          Queue queue1 = this.queue;
          int i = this.index;
          this.index = i + 1;
          return (T)queue1.get(i);
        } 
        throw new GdxRuntimeException("#iterator() cannot be used nested.");
      } 
      throw new NoSuchElementException(String.valueOf(this.index));
    }
    
    public void remove() {
      if (this.allowRemove) {
        this.index--;
        this.queue.removeIndex(this.index);
        return;
      } 
      throw new GdxRuntimeException("Remove not allowed.");
    }
    
    public void reset() { this.index = 0; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Queue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */