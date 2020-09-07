package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;
import com.badlogic.gdx.utils.Pools;
import java.util.Iterator;

public class Selection<T> extends Object implements Disableable, Iterable<T> {
  private Actor actor;
  
  boolean isDisabled;
  
  T lastSelected;
  
  boolean multiple;
  
  private final OrderedSet<T> old = new OrderedSet();
  
  private boolean programmaticChangeEvents = true;
  
  boolean required;
  
  final OrderedSet<T> selected = new OrderedSet();
  
  private boolean toggle;
  
  public void add(T paramT) {
    if (paramT != null) {
      if (!this.selected.add(paramT))
        return; 
      if (this.programmaticChangeEvents && fireChangeEvent()) {
        this.selected.remove(paramT);
      } else {
        this.lastSelected = paramT;
        changed();
      } 
      return;
    } 
    throw new IllegalArgumentException("item cannot be null.");
  }
  
  public void addAll(Array<T> paramArray) {
    snapshot();
    int i = paramArray.size;
    byte b = 0;
    boolean bool = false;
    while (b < i) {
      Object object = paramArray.get(b);
      if (object != null) {
        if (this.selected.add(object))
          bool = true; 
        b++;
        continue;
      } 
      throw new IllegalArgumentException("item cannot be null.");
    } 
    if (bool)
      if (this.programmaticChangeEvents && fireChangeEvent()) {
        revert();
      } else {
        this.lastSelected = paramArray.peek();
        changed();
      }  
    cleanup();
  }
  
  protected void changed() {}
  
  public void choose(T paramT) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 244
    //   4: aload_0
    //   5: getfield isDisabled : Z
    //   8: ifeq -> 12
    //   11: return
    //   12: aload_0
    //   13: invokevirtual snapshot : ()V
    //   16: aload_0
    //   17: getfield toggle : Z
    //   20: ifeq -> 41
    //   23: aload_0
    //   24: getfield required : Z
    //   27: ifne -> 41
    //   30: aload_0
    //   31: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   34: getfield size : I
    //   37: iconst_1
    //   38: if_icmpeq -> 47
    //   41: invokestatic ctrl : ()Z
    //   44: ifeq -> 100
    //   47: aload_0
    //   48: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   51: aload_1
    //   52: invokevirtual contains : (Ljava/lang/Object;)Z
    //   55: ifeq -> 100
    //   58: aload_0
    //   59: getfield required : Z
    //   62: ifeq -> 83
    //   65: aload_0
    //   66: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   69: getfield size : I
    //   72: istore_2
    //   73: iload_2
    //   74: iconst_1
    //   75: if_icmpne -> 83
    //   78: aload_0
    //   79: invokevirtual cleanup : ()V
    //   82: return
    //   83: aload_0
    //   84: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   87: aload_1
    //   88: invokevirtual remove : (Ljava/lang/Object;)Z
    //   91: pop
    //   92: aload_0
    //   93: aconst_null
    //   94: putfield lastSelected : Ljava/lang/Object;
    //   97: goto -> 214
    //   100: aload_0
    //   101: getfield multiple : Z
    //   104: istore_3
    //   105: iconst_0
    //   106: istore #4
    //   108: iconst_0
    //   109: istore #5
    //   111: iload_3
    //   112: ifeq -> 134
    //   115: iload #4
    //   117: istore_2
    //   118: aload_0
    //   119: getfield toggle : Z
    //   122: ifne -> 187
    //   125: iload #4
    //   127: istore_2
    //   128: invokestatic ctrl : ()Z
    //   131: ifne -> 187
    //   134: aload_0
    //   135: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   138: getfield size : I
    //   141: iconst_1
    //   142: if_icmpne -> 163
    //   145: aload_0
    //   146: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   149: aload_1
    //   150: invokevirtual contains : (Ljava/lang/Object;)Z
    //   153: istore_3
    //   154: iload_3
    //   155: ifeq -> 163
    //   158: aload_0
    //   159: invokevirtual cleanup : ()V
    //   162: return
    //   163: iload #5
    //   165: istore_2
    //   166: aload_0
    //   167: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   170: getfield size : I
    //   173: ifle -> 178
    //   176: iconst_1
    //   177: istore_2
    //   178: aload_0
    //   179: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   182: bipush #8
    //   184: invokevirtual clear : (I)V
    //   187: aload_0
    //   188: getfield selected : Lcom/badlogic/gdx/utils/OrderedSet;
    //   191: aload_1
    //   192: invokevirtual add : (Ljava/lang/Object;)Z
    //   195: istore_3
    //   196: iload_3
    //   197: ifne -> 209
    //   200: iload_2
    //   201: ifne -> 209
    //   204: aload_0
    //   205: invokevirtual cleanup : ()V
    //   208: return
    //   209: aload_0
    //   210: aload_1
    //   211: putfield lastSelected : Ljava/lang/Object;
    //   214: aload_0
    //   215: invokevirtual fireChangeEvent : ()Z
    //   218: ifeq -> 228
    //   221: aload_0
    //   222: invokevirtual revert : ()V
    //   225: goto -> 232
    //   228: aload_0
    //   229: invokevirtual changed : ()V
    //   232: aload_0
    //   233: invokevirtual cleanup : ()V
    //   236: return
    //   237: astore_1
    //   238: aload_0
    //   239: invokevirtual cleanup : ()V
    //   242: aload_1
    //   243: athrow
    //   244: new java/lang/IllegalArgumentException
    //   247: dup
    //   248: ldc 'item cannot be null.'
    //   250: invokespecial <init> : (Ljava/lang/String;)V
    //   253: athrow
    // Exception table:
    //   from	to	target	type
    //   16	41	237	finally
    //   41	47	237	finally
    //   47	73	237	finally
    //   83	97	237	finally
    //   100	105	237	finally
    //   118	125	237	finally
    //   128	134	237	finally
    //   134	154	237	finally
    //   166	176	237	finally
    //   178	187	237	finally
    //   187	196	237	finally
    //   209	214	237	finally
    //   214	225	237	finally
    //   228	232	237	finally }
  
  void cleanup() { this.old.clear(32); }
  
  public void clear() {
    if (this.selected.size == 0)
      return; 
    snapshot();
    this.selected.clear(8);
    if (this.programmaticChangeEvents && fireChangeEvent()) {
      revert();
    } else {
      this.lastSelected = null;
      changed();
    } 
    cleanup();
  }
  
  public boolean contains(T paramT) { return (paramT == null) ? false : this.selected.contains(paramT); }
  
  public boolean fireChangeEvent() {
    if (this.actor == null)
      return false; 
    changeEvent = (ChangeListener.ChangeEvent)Pools.obtain(ChangeListener.ChangeEvent.class);
    try {
      return this.actor.fire(changeEvent);
    } finally {
      Pools.free(changeEvent);
    } 
  }
  
  public T first() {
    Object object;
    if (this.selected.size == 0) {
      object = null;
    } else {
      object = this.selected.first();
    } 
    return (T)object;
  }
  
  public T getLastSelected() {
    Object object = this.lastSelected;
    return (object != null) ? (T)object : ((this.selected.size > 0) ? (T)this.selected.first() : null);
  }
  
  public boolean getMultiple() { return this.multiple; }
  
  public boolean getRequired() { return this.required; }
  
  public boolean getToggle() { return this.toggle; }
  
  @Deprecated
  public boolean hasItems() {
    boolean bool;
    if (this.selected.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isDisabled() { return this.isDisabled; }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.selected.size == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public OrderedSet<T> items() { return this.selected; }
  
  public Iterator<T> iterator() { return this.selected.iterator(); }
  
  public boolean notEmpty() {
    boolean bool;
    if (this.selected.size > 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void remove(T paramT) {
    if (paramT != null) {
      if (!this.selected.remove(paramT))
        return; 
      if (this.programmaticChangeEvents && fireChangeEvent()) {
        this.selected.add(paramT);
      } else {
        this.lastSelected = null;
        changed();
      } 
      return;
    } 
    throw new IllegalArgumentException("item cannot be null.");
  }
  
  public void removeAll(Array<T> paramArray) {
    snapshot();
    int i = paramArray.size;
    byte b = 0;
    boolean bool = false;
    while (b < i) {
      Object object = paramArray.get(b);
      if (object != null) {
        if (this.selected.remove(object))
          bool = true; 
        b++;
        continue;
      } 
      throw new IllegalArgumentException("item cannot be null.");
    } 
    if (bool)
      if (this.programmaticChangeEvents && fireChangeEvent()) {
        revert();
      } else {
        this.lastSelected = null;
        changed();
      }  
    cleanup();
  }
  
  void revert() {
    this.selected.clear(this.old.size);
    this.selected.addAll(this.old);
  }
  
  public void set(T paramT) {
    if (paramT != null) {
      if (this.selected.size == 1 && this.selected.first() == paramT)
        return; 
      snapshot();
      this.selected.clear(8);
      this.selected.add(paramT);
      if (this.programmaticChangeEvents && fireChangeEvent()) {
        revert();
      } else {
        this.lastSelected = paramT;
        changed();
      } 
      cleanup();
      return;
    } 
    throw new IllegalArgumentException("item cannot be null.");
  }
  
  public void setActor(Actor paramActor) { this.actor = paramActor; }
  
  public void setAll(Array<T> paramArray) {
    snapshot();
    this.lastSelected = null;
    this.selected.clear(paramArray.size);
    int i = paramArray.size;
    byte b = 0;
    boolean bool = false;
    while (b < i) {
      Object object = paramArray.get(b);
      if (object != null) {
        if (this.selected.add(object))
          bool = true; 
        b++;
        continue;
      } 
      throw new IllegalArgumentException("item cannot be null.");
    } 
    if (bool)
      if (this.programmaticChangeEvents && fireChangeEvent()) {
        revert();
      } else if (paramArray.size > 0) {
        this.lastSelected = paramArray.peek();
        changed();
      }  
    cleanup();
  }
  
  public void setDisabled(boolean paramBoolean) { this.isDisabled = paramBoolean; }
  
  public void setMultiple(boolean paramBoolean) { this.multiple = paramBoolean; }
  
  public void setProgrammaticChangeEvents(boolean paramBoolean) { this.programmaticChangeEvents = paramBoolean; }
  
  public void setRequired(boolean paramBoolean) { this.required = paramBoolean; }
  
  public void setToggle(boolean paramBoolean) { this.toggle = paramBoolean; }
  
  public int size() { return this.selected.size; }
  
  void snapshot() {
    this.old.clear(this.selected.size);
    this.old.addAll(this.selected);
  }
  
  public Array<T> toArray() { return this.selected.iterator().toArray(); }
  
  public Array<T> toArray(Array<T> paramArray) { return this.selected.iterator().toArray(paramArray); }
  
  public String toString() { return this.selected.toString(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/utils/Selection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */