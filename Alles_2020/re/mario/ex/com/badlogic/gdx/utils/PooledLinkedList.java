package com.badlogic.gdx.utils;

public class PooledLinkedList<T> extends Object {
  private Item<T> curr;
  
  private Item<T> head;
  
  private Item<T> iter;
  
  private final Pool<Item<T>> pool;
  
  private int size = 0;
  
  private Item<T> tail;
  
  public PooledLinkedList(int paramInt) { this.pool = new Pool<Item<T>>(16, paramInt) {
        protected PooledLinkedList.Item<T> newObject() { return new PooledLinkedList.Item(); }
      }; }
  
  public void add(T paramT) {
    Item item = (Item)this.pool.obtain();
    item.payload = paramT;
    item.next = null;
    item.prev = null;
    if (this.head == null) {
      this.head = item;
      this.tail = item;
      this.size++;
      return;
    } 
    paramT = (T)this.tail;
    item.prev = paramT;
    paramT.next = item;
    this.tail = item;
    this.size++;
  }
  
  public void addFirst(T paramT) {
    Item item = (Item)this.pool.obtain();
    item.payload = paramT;
    paramT = (T)this.head;
    item.next = paramT;
    item.prev = null;
    if (paramT != null) {
      paramT.prev = item;
    } else {
      this.tail = item;
    } 
    this.head = item;
    this.size++;
  }
  
  public void clear() {
    iter();
    while (next() != null)
      remove(); 
  }
  
  public void iter() { this.iter = this.head; }
  
  public void iterReverse() { this.iter = this.tail; }
  
  public T next() {
    Item item = this.iter;
    if (item == null)
      return null; 
    Object object = item.payload;
    item = this.iter;
    this.curr = item;
    this.iter = item.next;
    return (T)object;
  }
  
  public T previous() {
    Item item1 = this.iter;
    if (item1 == null)
      return null; 
    Object object = item1.payload;
    Item item2 = this.iter;
    this.curr = item2;
    this.iter = item2.prev;
    return (T)object;
  }
  
  public void remove() {
    Item item1 = this.curr;
    if (item1 == null)
      return; 
    this.size--;
    Item item2 = item1.next;
    Item item3 = this.curr.prev;
    this.pool.free(this.curr);
    this.curr = null;
    if (this.size == 0) {
      this.head = null;
      this.tail = null;
      return;
    } 
    if (item1 == this.head) {
      item2.prev = null;
      this.head = item2;
      return;
    } 
    if (item1 == this.tail) {
      item3.next = null;
      this.tail = item3;
      return;
    } 
    item3.next = item2;
    item2.prev = item3;
  }
  
  public T removeLast() {
    Item item1 = this.tail;
    if (item1 == null)
      return null; 
    Object object = item1.payload;
    this.size--;
    Item item2 = this.tail.prev;
    this.pool.free(this.tail);
    if (this.size == 0) {
      this.head = null;
      this.tail = null;
    } else {
      this.tail = item2;
      this.tail.next = null;
    } 
    return (T)object;
  }
  
  public int size() { return this.size; }
  
  static final class Item<T> extends Object {
    public Item<T> next;
    
    public T payload;
    
    public Item<T> prev;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/PooledLinkedList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */