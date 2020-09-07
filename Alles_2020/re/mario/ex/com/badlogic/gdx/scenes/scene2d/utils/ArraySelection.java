package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;

public class ArraySelection<T> extends Selection<T> {
  private Array<T> array;
  
  private boolean rangeSelect = true;
  
  private T rangeStart;
  
  public ArraySelection(Array<T> paramArray) { this.array = paramArray; }
  
  protected void changed() { this.rangeStart = null; }
  
  public void choose(T paramT) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 209
    //   4: aload_0
    //   5: getfield isDisabled : Z
    //   8: ifeq -> 12
    //   11: return
    //   12: aload_0
    //   13: getfield rangeSelect : Z
    //   16: ifeq -> 203
    //   19: aload_0
    //   20: getfield multiple : Z
    //   23: ifne -> 29
    //   26: goto -> 203
    //   29: aload_0
    //   30: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   33: getfield size : I
    //   36: ifle -> 192
    //   39: invokestatic shift : ()Z
    //   42: ifeq -> 192
    //   45: aload_0
    //   46: getfield rangeStart : Ljava/lang/Object;
    //   49: astore_2
    //   50: aload_2
    //   51: ifnonnull -> 59
    //   54: iconst_m1
    //   55: istore_3
    //   56: goto -> 69
    //   59: aload_0
    //   60: getfield array : Lcom/badlogic/gdx/utils/Array;
    //   63: aload_2
    //   64: iconst_0
    //   65: invokevirtual indexOf : (Ljava/lang/Object;Z)I
    //   68: istore_3
    //   69: iload_3
    //   70: iconst_m1
    //   71: if_icmpeq -> 192
    //   74: aload_0
    //   75: getfield rangeStart : Ljava/lang/Object;
    //   78: astore_2
    //   79: aload_0
    //   80: invokevirtual snapshot : ()V
    //   83: aload_0
    //   84: getfield array : Lcom/badlogic/gdx/utils/Array;
    //   87: aload_1
    //   88: iconst_0
    //   89: invokevirtual indexOf : (Ljava/lang/Object;Z)I
    //   92: istore #4
    //   94: iload_3
    //   95: iload #4
    //   97: if_icmple -> 109
    //   100: iload_3
    //   101: istore #5
    //   103: iload #4
    //   105: istore_3
    //   106: goto -> 113
    //   109: iload #4
    //   111: istore #5
    //   113: iload_3
    //   114: istore #4
    //   116: invokestatic ctrl : ()Z
    //   119: ifne -> 134
    //   122: aload_0
    //   123: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   126: bipush #8
    //   128: invokevirtual clear : (I)V
    //   131: iload_3
    //   132: istore #4
    //   134: iload #4
    //   136: iload #5
    //   138: if_icmpgt -> 164
    //   141: aload_0
    //   142: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   145: aload_0
    //   146: getfield array : Lcom/badlogic/gdx/utils/Array;
    //   149: iload #4
    //   151: invokevirtual get : (I)Ljava/lang/Object;
    //   154: invokevirtual add : (Ljava/lang/Object;)Z
    //   157: pop
    //   158: iinc #4, 1
    //   161: goto -> 134
    //   164: aload_0
    //   165: invokevirtual fireChangeEvent : ()Z
    //   168: ifeq -> 178
    //   171: aload_0
    //   172: invokevirtual revert : ()V
    //   175: goto -> 182
    //   178: aload_0
    //   179: invokevirtual changed : ()V
    //   182: aload_0
    //   183: aload_2
    //   184: putfield rangeStart : Ljava/lang/Object;
    //   187: aload_0
    //   188: invokevirtual cleanup : ()V
    //   191: return
    //   192: aload_0
    //   193: aload_1
    //   194: invokespecial choose : (Ljava/lang/Object;)V
    //   197: aload_0
    //   198: aload_1
    //   199: putfield rangeStart : Ljava/lang/Object;
    //   202: return
    //   203: aload_0
    //   204: aload_1
    //   205: invokespecial choose : (Ljava/lang/Object;)V
    //   208: return
    //   209: new java/lang/IllegalArgumentException
    //   212: dup
    //   213: ldc 'item cannot be null.'
    //   215: invokespecial <init> : (Ljava/lang/String;)V
    //   218: astore_1
    //   219: goto -> 224
    //   222: aload_1
    //   223: athrow
    //   224: goto -> 222 }
  
  public boolean getRangeSelect() { return this.rangeSelect; }
  
  public void setRangeSelect(boolean paramBoolean) { this.rangeSelect = paramBoolean; }
  
  public void validate() {
    Array array1 = this.array;
    if (array1.size == 0) {
      clear();
      return;
    } 
    OrderedSet.OrderedSetIterator orderedSetIterator = items().iterator();
    while (orderedSetIterator.hasNext()) {
      if (!array1.contains(orderedSetIterator.next(), false))
        orderedSetIterator.remove(); 
    } 
    if (this.required && this.selected.size == 0)
      set(array1.first()); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/ArraySelection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */