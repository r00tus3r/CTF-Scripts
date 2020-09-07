package com.badlogic.gdx.utils;

public class BinaryHeap<T extends BinaryHeap.Node> extends Object {
  private final boolean isMaxHeap;
  
  private Node[] nodes;
  
  public int size;
  
  public BinaryHeap() { this(16, false); }
  
  public BinaryHeap(int paramInt, boolean paramBoolean) {
    this.isMaxHeap = paramBoolean;
    this.nodes = new Node[paramInt];
  }
  
  private void down(int paramInt) {
    Node[] arrayOfNode = this.nodes;
    int i = this.size;
    Node node = arrayOfNode[paramInt];
    float f = node.value;
    while (true) {
      boolean bool;
      float f2;
      Node node2;
      boolean bool1 = true;
      boolean bool2 = true;
      int j = (paramInt << 1) + 1;
      if (j >= i)
        break; 
      int k = j + 1;
      Node node1 = arrayOfNode[j];
      float f1 = node1.value;
      if (k >= i) {
        node2 = null;
        if (this.isMaxHeap) {
          f2 = -3.4028235E38F;
        } else {
          f2 = Float.MAX_VALUE;
        } 
      } else {
        node2 = arrayOfNode[k];
        f2 = node2.value;
      } 
      if (f1 < f2) {
        bool = true;
      } else {
        bool = false;
      } 
      if (bool ^ this.isMaxHeap) {
        if (f1 != f) {
          if (f1 > f) {
            bool = bool2;
          } else {
            bool = false;
          } 
          if (bool ^ this.isMaxHeap)
            break; 
          arrayOfNode[paramInt] = node1;
          node1.index = paramInt;
          paramInt = j;
          continue;
        } 
        break;
      } 
      if (f2 != f) {
        if (f2 > f) {
          bool = bool1;
        } else {
          bool = false;
        } 
        if (this.isMaxHeap ^ bool)
          break; 
        arrayOfNode[paramInt] = node2;
        node2.index = paramInt;
        paramInt = k;
        continue;
      } 
      break;
    } 
    arrayOfNode[paramInt] = node;
    node.index = paramInt;
  }
  
  private T remove(int paramInt) {
    Node[] arrayOfNode = this.nodes;
    Node node = arrayOfNode[paramInt];
    int i = this.size - 1;
    this.size = i;
    arrayOfNode[paramInt] = arrayOfNode[i];
    i = this.size;
    arrayOfNode[i] = null;
    if (i > 0 && paramInt < i)
      down(paramInt); 
    return (T)node;
  }
  
  private void up(int paramInt) {
    Node[] arrayOfNode = this.nodes;
    Node node = arrayOfNode[paramInt];
    float f = node.value;
    while (paramInt > 0) {
      boolean bool = true;
      int i = paramInt - 1 >> 1;
      Node node1 = arrayOfNode[i];
      if (f >= node1.value)
        bool = false; 
      if (bool ^ this.isMaxHeap) {
        arrayOfNode[paramInt] = node1;
        node1.index = paramInt;
        paramInt = i;
      } 
    } 
    arrayOfNode[paramInt] = node;
    node.index = paramInt;
  }
  
  public T add(T paramT) {
    int i = this.size;
    Node[] arrayOfNode = this.nodes;
    if (i == arrayOfNode.length) {
      Node[] arrayOfNode1 = new Node[i << 1];
      System.arraycopy(arrayOfNode, 0, arrayOfNode1, 0, i);
      this.nodes = arrayOfNode1;
    } 
    i = this.size;
    paramT.index = i;
    this.nodes[i] = paramT;
    this.size = i + 1;
    up(i);
    return paramT;
  }
  
  public T add(T paramT, float paramFloat) {
    paramT.value = paramFloat;
    return (T)add(paramT);
  }
  
  public void clear() {
    Node[] arrayOfNode = this.nodes;
    int i = this.size;
    for (byte b = 0; b < i; b++)
      arrayOfNode[b] = null; 
    this.size = 0;
  }
  
  public boolean contains(T paramT, boolean paramBoolean) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 83
    //   4: iload_2
    //   5: ifeq -> 43
    //   8: aload_0
    //   9: getfield nodes : [Lcom/badlogic/gdx/utils/BinaryHeap$Node;
    //   12: astore_3
    //   13: aload_3
    //   14: arraylength
    //   15: istore #4
    //   17: iconst_0
    //   18: istore #5
    //   20: iload #5
    //   22: iload #4
    //   24: if_icmpge -> 81
    //   27: aload_3
    //   28: iload #5
    //   30: aaload
    //   31: aload_1
    //   32: if_acmpne -> 37
    //   35: iconst_1
    //   36: ireturn
    //   37: iinc #5, 1
    //   40: goto -> 20
    //   43: aload_0
    //   44: getfield nodes : [Lcom/badlogic/gdx/utils/BinaryHeap$Node;
    //   47: astore_3
    //   48: aload_3
    //   49: arraylength
    //   50: istore #4
    //   52: iconst_0
    //   53: istore #5
    //   55: iload #5
    //   57: iload #4
    //   59: if_icmpge -> 81
    //   62: aload_3
    //   63: iload #5
    //   65: aaload
    //   66: aload_1
    //   67: invokevirtual equals : (Ljava/lang/Object;)Z
    //   70: ifeq -> 75
    //   73: iconst_1
    //   74: ireturn
    //   75: iinc #5, 1
    //   78: goto -> 55
    //   81: iconst_0
    //   82: ireturn
    //   83: new java/lang/IllegalArgumentException
    //   86: dup
    //   87: ldc 'node cannot be null.'
    //   89: invokespecial <init> : (Ljava/lang/String;)V
    //   92: astore_1
    //   93: goto -> 98
    //   96: aload_1
    //   97: athrow
    //   98: goto -> 96 }
  
  public boolean equals(Object paramObject) {
    if (!(paramObject instanceof BinaryHeap))
      return false; 
    BinaryHeap binaryHeap = (BinaryHeap)paramObject;
    int i = binaryHeap.size;
    int j = this.size;
    if (i != j)
      return false; 
    Node[] arrayOfNode1 = this.nodes;
    Node[] arrayOfNode2 = binaryHeap.nodes;
    for (i = 0; i < j; i++) {
      if ((arrayOfNode1[i]).value != (arrayOfNode2[i]).value)
        return false; 
    } 
    return true;
  }
  
  public int hashCode() {
    int i = this.size;
    int j = 1;
    for (byte b = 0; b < i; b++)
      j = j * 31 + Float.floatToIntBits((this.nodes[b]).value); 
    return j;
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
  
  public boolean notEmpty() {
    boolean bool;
    if (this.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public T peek() {
    if (this.size != 0)
      return (T)this.nodes[0]; 
    throw new IllegalStateException("The heap is empty.");
  }
  
  public T pop() { return (T)remove(0); }
  
  public T remove(T paramT) { return (T)remove(paramT.index); }
  
  public void setValue(T paramT, float paramFloat) {
    boolean bool;
    float f = paramT.value;
    paramT.value = paramFloat;
    if (paramFloat < f) {
      bool = true;
    } else {
      bool = false;
    } 
    if (bool ^ this.isMaxHeap) {
      up(paramT.index);
    } else {
      down(paramT.index);
    } 
  }
  
  public String toString() {
    if (this.size == 0)
      return "[]"; 
    Node[] arrayOfNode = this.nodes;
    StringBuilder stringBuilder = new StringBuilder(32);
    stringBuilder.append('[');
    stringBuilder.append((arrayOfNode[0]).value);
    for (byte b = 1; b < this.size; b++) {
      stringBuilder.append(", ");
      stringBuilder.append((arrayOfNode[b]).value);
    } 
    stringBuilder.append(']');
    return stringBuilder.toString();
  }
  
  public static class Node {
    int index;
    
    float value;
    
    public Node(float param1Float) { this.value = param1Float; }
    
    public float getValue() { return this.value; }
    
    public String toString() { return Float.toString(this.value); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/BinaryHeap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */