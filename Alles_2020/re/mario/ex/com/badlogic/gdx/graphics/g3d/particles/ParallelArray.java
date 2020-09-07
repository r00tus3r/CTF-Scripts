package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Iterator;

public class ParallelArray {
  Array<Channel> arrays = new Array(false, 2, Channel.class);
  
  public int capacity;
  
  public int size;
  
  public ParallelArray(int paramInt) {
    this.capacity = paramInt;
    this.size = 0;
  }
  
  private <T extends Channel> T allocateChannel(ChannelDescriptor paramChannelDescriptor) { return (paramChannelDescriptor.type == float.class) ? (T)new FloatChannel(paramChannelDescriptor.id, paramChannelDescriptor.count, this.capacity) : ((paramChannelDescriptor.type == int.class) ? (T)new IntChannel(paramChannelDescriptor.id, paramChannelDescriptor.count, this.capacity) : (T)new ObjectChannel(paramChannelDescriptor.id, paramChannelDescriptor.count, this.capacity, paramChannelDescriptor.type)); }
  
  private int findIndex(int paramInt) {
    for (byte b = 0; b < this.arrays.size; b++) {
      if (((Channel[])this.arrays.items[b]).id == paramInt)
        return b; 
    } 
    return -1;
  }
  
  public <T extends Channel> T addChannel(ChannelDescriptor paramChannelDescriptor) { return (T)addChannel(paramChannelDescriptor, null); }
  
  public <T extends Channel> T addChannel(ChannelDescriptor paramChannelDescriptor, ChannelInitializer<T> paramChannelInitializer) {
    Channel channel1 = getChannel(paramChannelDescriptor);
    Channel channel2 = channel1;
    if (channel1 == null) {
      channel2 = allocateChannel(paramChannelDescriptor);
      if (paramChannelInitializer != null)
        paramChannelInitializer.init(channel2); 
      this.arrays.add(channel2);
    } 
    return (T)channel2;
  }
  
  public void addElement(Object... paramVarArgs) {
    if (this.size != this.capacity) {
      int i = 0;
      for (Channel channel : this.arrays) {
        channel.add(i, paramVarArgs);
        i += channel.strideSize;
      } 
      this.size++;
      return;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Capacity reached, cannot add other elements");
    throw gdxRuntimeException;
  }
  
  public void clear() {
    this.arrays.clear();
    this.size = 0;
  }
  
  public <T extends Channel> T getChannel(ChannelDescriptor paramChannelDescriptor) {
    for (Channel channel : this.arrays) {
      if (channel.id == paramChannelDescriptor.id)
        return (T)channel; 
    } 
    return null;
  }
  
  public <T> void removeArray(int paramInt) { this.arrays.removeIndex(findIndex(paramInt)); }
  
  public void removeElement(int paramInt) {
    int i = this.size - 1;
    Iterator iterator = this.arrays.iterator();
    while (iterator.hasNext())
      ((Channel)iterator.next()).swap(paramInt, i); 
    this.size = i;
  }
  
  public void setCapacity(int paramInt) {
    if (this.capacity != paramInt) {
      Iterator iterator = this.arrays.iterator();
      while (iterator.hasNext())
        ((Channel)iterator.next()).setCapacity(paramInt); 
      this.capacity = paramInt;
    } 
  }
  
  public abstract class Channel {
    public Object data;
    
    public int id;
    
    public int strideSize;
    
    public Channel(int param1Int1, Object param1Object, int param1Int2) {
      this.id = param1Int1;
      this.strideSize = param1Int2;
      this.data = param1Object;
    }
    
    public abstract void add(int param1Int, Object... param1VarArgs);
    
    protected abstract void setCapacity(int param1Int);
    
    public abstract void swap(int param1Int1, int param1Int2);
  }
  
  public static class ChannelDescriptor {
    public int count;
    
    public int id;
    
    public Class<?> type;
    
    public ChannelDescriptor(int param1Int1, Class<?> param1Class, int param1Int2) {
      this.id = param1Int1;
      this.type = param1Class;
      this.count = param1Int2;
    }
  }
  
  public static interface ChannelInitializer<T extends Channel> {
    void init(T param1T);
  }
  
  public class FloatChannel extends Channel {
    public float[] data = (float[])super.data;
    
    public FloatChannel(int param1Int1, int param1Int2, int param1Int3) { super(ParallelArray.this, param1Int1, new float[param1Int3 * param1Int2], param1Int2); }
    
    public void add(int param1Int, Object... param1VarArgs) {
      int i = this.strideSize * ParallelArray.this.size;
      int j = this.strideSize;
      byte b = 0;
      param1Int = i;
      while (param1Int < j + i) {
        this.data[param1Int] = ((Float)param1VarArgs[b]).floatValue();
        param1Int++;
        b++;
      } 
    }
    
    public void setCapacity(int param1Int) {
      float[] arrayOfFloat1 = new float[this.strideSize * param1Int];
      float[] arrayOfFloat2 = this.data;
      System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, 0, Math.min(arrayOfFloat2.length, arrayOfFloat1.length));
      this.data = arrayOfFloat1;
      super.data = arrayOfFloat1;
    }
    
    public void swap(int param1Int1, int param1Int2) {
      int i = this.strideSize * param1Int1;
      param1Int2 = this.strideSize * param1Int2;
      int j = this.strideSize;
      param1Int1 = i;
      while (param1Int1 < j + i) {
        float[] arrayOfFloat = this.data;
        float f = arrayOfFloat[param1Int1];
        arrayOfFloat[param1Int1] = arrayOfFloat[param1Int2];
        arrayOfFloat[param1Int2] = f;
        param1Int1++;
        param1Int2++;
      } 
    }
  }
  
  public class IntChannel extends Channel {
    public int[] data = (int[])super.data;
    
    public IntChannel(int param1Int1, int param1Int2, int param1Int3) { super(ParallelArray.this, param1Int1, new int[param1Int3 * param1Int2], param1Int2); }
    
    public void add(int param1Int, Object... param1VarArgs) {
      int i = this.strideSize * ParallelArray.this.size;
      int j = this.strideSize;
      byte b = 0;
      param1Int = i;
      while (param1Int < j + i) {
        this.data[param1Int] = ((Integer)param1VarArgs[b]).intValue();
        param1Int++;
        b++;
      } 
    }
    
    public void setCapacity(int param1Int) {
      int[] arrayOfInt1 = new int[this.strideSize * param1Int];
      int[] arrayOfInt2 = this.data;
      System.arraycopy(arrayOfInt2, 0, arrayOfInt1, 0, Math.min(arrayOfInt2.length, arrayOfInt1.length));
      this.data = arrayOfInt1;
      super.data = arrayOfInt1;
    }
    
    public void swap(int param1Int1, int param1Int2) {
      int i = this.strideSize * param1Int1;
      param1Int2 = this.strideSize * param1Int2;
      int j = this.strideSize;
      param1Int1 = i;
      while (param1Int1 < j + i) {
        int[] arrayOfInt = this.data;
        int k = arrayOfInt[param1Int1];
        arrayOfInt[param1Int1] = arrayOfInt[param1Int2];
        arrayOfInt[param1Int2] = k;
        param1Int1++;
        param1Int2++;
      } 
    }
  }
  
  public class ObjectChannel<T> extends Channel {
    Class<T> componentType;
    
    public T[] data;
    
    public ObjectChannel(int param1Int1, int param1Int2, int param1Int3, Class<T> param1Class) {
      super(ParallelArray.this, param1Int1, ArrayReflection.newInstance(param1Class, param1Int3 * param1Int2), param1Int2);
      this.componentType = param1Class;
      this.data = (Object[])super.data;
    }
    
    public void add(int param1Int, Object... param1VarArgs) {
      int i = this.strideSize * ParallelArray.this.size;
      int j = this.strideSize;
      byte b = 0;
      param1Int = i;
      while (param1Int < j + i) {
        this.data[param1Int] = param1VarArgs[b];
        param1Int++;
        b++;
      } 
    }
    
    public void setCapacity(int param1Int) {
      Object[] arrayOfObject1 = (Object[])ArrayReflection.newInstance(this.componentType, this.strideSize * param1Int);
      Object[] arrayOfObject2 = this.data;
      System.arraycopy(arrayOfObject2, 0, arrayOfObject1, 0, Math.min(arrayOfObject2.length, arrayOfObject1.length));
      this.data = arrayOfObject1;
      super.data = arrayOfObject1;
    }
    
    public void swap(int param1Int1, int param1Int2) {
      int i = this.strideSize * param1Int1;
      param1Int2 = this.strideSize * param1Int2;
      int j = this.strideSize;
      param1Int1 = i;
      while (param1Int1 < j + i) {
        Object[] arrayOfObject = this.data;
        Object object = arrayOfObject[param1Int1];
        arrayOfObject[param1Int1] = arrayOfObject[param1Int2];
        arrayOfObject[param1Int2] = object;
        param1Int1++;
        param1Int2++;
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParallelArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */