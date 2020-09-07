package com.badlogic.gdx.utils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.LifecycleListener;

public class Timer {
  static TimerThread thread;
  
  static final Object threadLock = new Object();
  
  final Array<Task> tasks = new Array(false, 8);
  
  public Timer() { start(); }
  
  public static Timer instance() {
    synchronized (threadLock) {
      TimerThread timerThread = thread();
      if (timerThread.instance == null) {
        Timer timer = new Timer();
        this();
        timerThread.instance = timer;
      } 
      return timerThread.instance;
    } 
  }
  
  public static Task post(Task paramTask) { return instance().postTask(paramTask); }
  
  public static Task schedule(Task paramTask, float paramFloat) { return instance().scheduleTask(paramTask, paramFloat); }
  
  public static Task schedule(Task paramTask, float paramFloat1, float paramFloat2) { return instance().scheduleTask(paramTask, paramFloat1, paramFloat2); }
  
  public static Task schedule(Task paramTask, float paramFloat1, float paramFloat2, int paramInt) { return instance().scheduleTask(paramTask, paramFloat1, paramFloat2, paramInt); }
  
  private static TimerThread thread() {
    synchronized (threadLock) {
      if (thread == null || thread.files != Gdx.files) {
        if (thread != null)
          thread.dispose(); 
        TimerThread timerThread = new TimerThread();
        this();
        thread = timerThread;
      } 
      return thread;
    } 
  }
  
  public void clear() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore_1
    //   4: aload_0
    //   5: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   8: getfield size : I
    //   11: istore_2
    //   12: iload_1
    //   13: iload_2
    //   14: if_icmpge -> 56
    //   17: aload_0
    //   18: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   21: iload_1
    //   22: invokevirtual get : (I)Ljava/lang/Object;
    //   25: checkcast com/badlogic/gdx/utils/Timer$Task
    //   28: astore_3
    //   29: aload_3
    //   30: monitorenter
    //   31: aload_3
    //   32: lconst_0
    //   33: putfield executeTimeMillis : J
    //   36: aload_3
    //   37: aconst_null
    //   38: putfield timer : Lcom/badlogic/gdx/utils/Timer;
    //   41: aload_3
    //   42: monitorexit
    //   43: iinc #1, 1
    //   46: goto -> 12
    //   49: astore #4
    //   51: aload_3
    //   52: monitorexit
    //   53: aload #4
    //   55: athrow
    //   56: aload_0
    //   57: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   60: invokevirtual clear : ()V
    //   63: aload_0
    //   64: monitorexit
    //   65: return
    //   66: astore_3
    //   67: aload_0
    //   68: monitorexit
    //   69: goto -> 74
    //   72: aload_3
    //   73: athrow
    //   74: goto -> 72
    // Exception table:
    //   from	to	target	type
    //   4	12	66	finally
    //   17	31	66	finally
    //   31	43	49	finally
    //   51	53	49	finally
    //   53	56	66	finally
    //   56	63	66	finally }
  
  public void delay(long paramLong) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore_3
    //   4: aload_0
    //   5: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   8: getfield size : I
    //   11: istore #4
    //   13: iload_3
    //   14: iload #4
    //   16: if_icmpge -> 64
    //   19: aload_0
    //   20: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   23: iload_3
    //   24: invokevirtual get : (I)Ljava/lang/Object;
    //   27: checkcast com/badlogic/gdx/utils/Timer$Task
    //   30: astore #5
    //   32: aload #5
    //   34: monitorenter
    //   35: aload #5
    //   37: aload #5
    //   39: getfield executeTimeMillis : J
    //   42: lload_1
    //   43: ladd
    //   44: putfield executeTimeMillis : J
    //   47: aload #5
    //   49: monitorexit
    //   50: iinc #3, 1
    //   53: goto -> 13
    //   56: astore #6
    //   58: aload #5
    //   60: monitorexit
    //   61: aload #6
    //   63: athrow
    //   64: aload_0
    //   65: monitorexit
    //   66: return
    //   67: astore #5
    //   69: aload_0
    //   70: monitorexit
    //   71: goto -> 77
    //   74: aload #5
    //   76: athrow
    //   77: goto -> 74
    // Exception table:
    //   from	to	target	type
    //   4	13	67	finally
    //   19	35	67	finally
    //   35	50	56	finally
    //   58	61	56	finally
    //   61	64	67	finally }
  
  public boolean isEmpty() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   6: getfield size : I
    //   9: istore_1
    //   10: iload_1
    //   11: ifne -> 19
    //   14: iconst_1
    //   15: istore_2
    //   16: goto -> 21
    //   19: iconst_0
    //   20: istore_2
    //   21: aload_0
    //   22: monitorexit
    //   23: iload_2
    //   24: ireturn
    //   25: astore_3
    //   26: aload_0
    //   27: monitorexit
    //   28: aload_3
    //   29: athrow
    // Exception table:
    //   from	to	target	type
    //   2	10	25	finally }
  
  public Task postTask(Task paramTask) { return scheduleTask(paramTask, 0.0F, 0.0F, 0); }
  
  public Task scheduleTask(Task paramTask, float paramFloat) { return scheduleTask(paramTask, paramFloat, 0.0F, 0); }
  
  public Task scheduleTask(Task paramTask, float paramFloat1, float paramFloat2) { return scheduleTask(paramTask, paramFloat1, paramFloat2, -1); }
  
  public Task scheduleTask(Task paramTask, float paramFloat1, float paramFloat2, int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: monitorenter
    //   4: aload_1
    //   5: getfield timer : Lcom/badlogic/gdx/utils/Timer;
    //   8: ifnonnull -> 85
    //   11: aload_1
    //   12: aload_0
    //   13: putfield timer : Lcom/badlogic/gdx/utils/Timer;
    //   16: aload_1
    //   17: invokestatic nanoTime : ()J
    //   20: ldc2_w 1000000
    //   23: ldiv
    //   24: fload_2
    //   25: ldc 1000.0
    //   27: fmul
    //   28: f2l
    //   29: ladd
    //   30: putfield executeTimeMillis : J
    //   33: aload_1
    //   34: fload_3
    //   35: ldc 1000.0
    //   37: fmul
    //   38: f2l
    //   39: putfield intervalMillis : J
    //   42: aload_1
    //   43: iload #4
    //   45: putfield repeatCount : I
    //   48: aload_0
    //   49: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   52: aload_1
    //   53: invokevirtual add : (Ljava/lang/Object;)V
    //   56: aload_1
    //   57: monitorexit
    //   58: aload_0
    //   59: monitorexit
    //   60: getstatic com/badlogic/gdx/utils/Timer.threadLock : Ljava/lang/Object;
    //   63: astore #5
    //   65: aload #5
    //   67: monitorenter
    //   68: getstatic com/badlogic/gdx/utils/Timer.threadLock : Ljava/lang/Object;
    //   71: invokevirtual notifyAll : ()V
    //   74: aload #5
    //   76: monitorexit
    //   77: aload_1
    //   78: areturn
    //   79: astore_1
    //   80: aload #5
    //   82: monitorexit
    //   83: aload_1
    //   84: athrow
    //   85: new java/lang/IllegalArgumentException
    //   88: astore #5
    //   90: aload #5
    //   92: ldc 'The same task may not be scheduled twice.'
    //   94: invokespecial <init> : (Ljava/lang/String;)V
    //   97: aload #5
    //   99: athrow
    //   100: astore #5
    //   102: aload_1
    //   103: monitorexit
    //   104: aload #5
    //   106: athrow
    //   107: astore_1
    //   108: aload_0
    //   109: monitorexit
    //   110: aload_1
    //   111: athrow
    // Exception table:
    //   from	to	target	type
    //   2	4	107	finally
    //   4	58	100	finally
    //   58	60	107	finally
    //   68	77	79	finally
    //   80	83	79	finally
    //   85	100	100	finally
    //   102	104	100	finally
    //   104	107	107	finally
    //   108	110	107	finally }
  
  public void start() {
    synchronized (threadLock) {
      Array array = (thread()).instances;
      if (array.contains(this, true))
        return; 
      array.add(this);
      threadLock.notifyAll();
      return;
    } 
  }
  
  public void stop() {
    synchronized (threadLock) {
      (thread()).instances.removeValue(this, true);
      return;
    } 
  }
  
  long update(long paramLong1, long paramLong2) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore #5
    //   5: aload_0
    //   6: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   9: getfield size : I
    //   12: istore #6
    //   14: iload #5
    //   16: iload #6
    //   18: if_icmpge -> 207
    //   21: aload_0
    //   22: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   25: iload #5
    //   27: invokevirtual get : (I)Ljava/lang/Object;
    //   30: checkcast com/badlogic/gdx/utils/Timer$Task
    //   33: astore #7
    //   35: aload #7
    //   37: monitorenter
    //   38: aload #7
    //   40: getfield executeTimeMillis : J
    //   43: lload_1
    //   44: lcmp
    //   45: ifle -> 66
    //   48: lload_3
    //   49: aload #7
    //   51: getfield executeTimeMillis : J
    //   54: lload_1
    //   55: lsub
    //   56: invokestatic min : (JJ)J
    //   59: lstore_3
    //   60: aload #7
    //   62: monitorexit
    //   63: goto -> 193
    //   66: aload #7
    //   68: getfield repeatCount : I
    //   71: ifne -> 105
    //   74: aload #7
    //   76: aconst_null
    //   77: putfield timer : Lcom/badlogic/gdx/utils/Timer;
    //   80: aload_0
    //   81: getfield tasks : Lcom/badlogic/gdx/utils/Array;
    //   84: iload #5
    //   86: invokevirtual removeIndex : (I)Ljava/lang/Object;
    //   89: pop
    //   90: iload #5
    //   92: iconst_1
    //   93: isub
    //   94: istore #8
    //   96: iload #6
    //   98: iconst_1
    //   99: isub
    //   100: istore #9
    //   102: goto -> 170
    //   105: aload #7
    //   107: aload #7
    //   109: getfield intervalMillis : J
    //   112: lload_1
    //   113: ladd
    //   114: putfield executeTimeMillis : J
    //   117: lload_3
    //   118: aload #7
    //   120: getfield intervalMillis : J
    //   123: invokestatic min : (JJ)J
    //   126: lstore #10
    //   128: iload #5
    //   130: istore #8
    //   132: iload #6
    //   134: istore #9
    //   136: lload #10
    //   138: lstore_3
    //   139: aload #7
    //   141: getfield repeatCount : I
    //   144: ifle -> 170
    //   147: aload #7
    //   149: aload #7
    //   151: getfield repeatCount : I
    //   154: iconst_1
    //   155: isub
    //   156: putfield repeatCount : I
    //   159: lload #10
    //   161: lstore_3
    //   162: iload #6
    //   164: istore #9
    //   166: iload #5
    //   168: istore #8
    //   170: aload #7
    //   172: getfield app : Lcom/badlogic/gdx/Application;
    //   175: aload #7
    //   177: invokeinterface postRunnable : (Ljava/lang/Runnable;)V
    //   182: aload #7
    //   184: monitorexit
    //   185: iload #9
    //   187: istore #6
    //   189: iload #8
    //   191: istore #5
    //   193: iinc #5, 1
    //   196: goto -> 14
    //   199: astore #12
    //   201: aload #7
    //   203: monitorexit
    //   204: aload #12
    //   206: athrow
    //   207: aload_0
    //   208: monitorexit
    //   209: lload_3
    //   210: lreturn
    //   211: astore #12
    //   213: aload_0
    //   214: monitorexit
    //   215: goto -> 221
    //   218: aload #12
    //   220: athrow
    //   221: goto -> 218
    // Exception table:
    //   from	to	target	type
    //   5	14	211	finally
    //   21	38	211	finally
    //   38	63	199	finally
    //   66	90	199	finally
    //   105	128	199	finally
    //   139	159	199	finally
    //   170	185	199	finally
    //   201	204	199	finally
    //   204	207	211	finally }
  
  public static abstract class Task implements Runnable {
    final Application app = Gdx.app;
    
    long executeTimeMillis;
    
    long intervalMillis;
    
    int repeatCount;
    
    public Task() {
      if (this.app != null)
        return; 
      throw new IllegalStateException("Gdx.app not available.");
    }
    
    public void cancel() { // Byte code:
      //   0: aload_0
      //   1: getfield timer : Lcom/badlogic/gdx/utils/Timer;
      //   4: astore_1
      //   5: aload_1
      //   6: ifnull -> 50
      //   9: aload_1
      //   10: monitorenter
      //   11: aload_0
      //   12: monitorenter
      //   13: aload_0
      //   14: lconst_0
      //   15: putfield executeTimeMillis : J
      //   18: aload_0
      //   19: aconst_null
      //   20: putfield timer : Lcom/badlogic/gdx/utils/Timer;
      //   23: aload_1
      //   24: getfield tasks : Lcom/badlogic/gdx/utils/Array;
      //   27: aload_0
      //   28: iconst_1
      //   29: invokevirtual removeValue : (Ljava/lang/Object;Z)Z
      //   32: pop
      //   33: aload_0
      //   34: monitorexit
      //   35: aload_1
      //   36: monitorexit
      //   37: goto -> 64
      //   40: astore_2
      //   41: aload_0
      //   42: monitorexit
      //   43: aload_2
      //   44: athrow
      //   45: astore_2
      //   46: aload_1
      //   47: monitorexit
      //   48: aload_2
      //   49: athrow
      //   50: aload_0
      //   51: monitorenter
      //   52: aload_0
      //   53: lconst_0
      //   54: putfield executeTimeMillis : J
      //   57: aload_0
      //   58: aconst_null
      //   59: putfield timer : Lcom/badlogic/gdx/utils/Timer;
      //   62: aload_0
      //   63: monitorexit
      //   64: return
      //   65: astore_1
      //   66: aload_0
      //   67: monitorexit
      //   68: aload_1
      //   69: athrow
      // Exception table:
      //   from	to	target	type
      //   11	13	45	finally
      //   13	35	40	finally
      //   35	37	45	finally
      //   41	43	40	finally
      //   43	45	45	finally
      //   46	48	45	finally
      //   52	64	65	finally
      //   66	68	65	finally }
    
    public long getExecuteTimeMillis() { // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield executeTimeMillis : J
      //   6: lstore_1
      //   7: aload_0
      //   8: monitorexit
      //   9: lload_1
      //   10: lreturn
      //   11: astore_3
      //   12: aload_0
      //   13: monitorexit
      //   14: aload_3
      //   15: athrow
      // Exception table:
      //   from	to	target	type
      //   2	7	11	finally }
    
    public boolean isScheduled() {
      boolean bool;
      if (this.timer != null) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public abstract void run();
  }
  
  static class TimerThread implements Runnable, LifecycleListener {
    final Files files = Gdx.files;
    
    Timer instance;
    
    final Array<Timer> instances = new Array(true);
    
    private long pauseMillis;
    
    public TimerThread() {
      Gdx.app.addLifecycleListener(this);
      resume();
      Thread thread = new Thread(this, "Timer");
      thread.setDaemon(true);
      thread.start();
    }
    
    public void dispose() {
      synchronized (Timer.threadLock) {
        if (Timer.thread == this)
          Timer.thread = null; 
        this.instances.clear();
        Timer.threadLock.notifyAll();
        Gdx.app.removeLifecycleListener(this);
        return;
      } 
    }
    
    public void pause() {
      synchronized (Timer.threadLock) {
        this.pauseMillis = System.nanoTime() / 1000000L;
        Timer.threadLock.notifyAll();
        return;
      } 
    }
    
    public void resume() {
      synchronized (Timer.threadLock) {
        long l1 = System.nanoTime() / 1000000L;
        long l2 = this.pauseMillis;
        byte b = 0;
        int i = this.instances.size;
        while (b < i) {
          ((Timer)this.instances.get(b)).delay(l1 - l2);
          b++;
        } 
        this.pauseMillis = 0L;
        Timer.threadLock.notifyAll();
        return;
      } 
    }
    
    public void run() {
      while (true) {
        synchronized (Timer.threadLock) {
          if (Timer.thread != this || this.files != Gdx.files) {
          
          } else {
            long l1 = 5000L;
            long l2 = l1;
            if (this.pauseMillis == 0L) {
              long l = System.nanoTime() / 1000000L;
              byte b = 0;
              int i = this.instances.size;
              while (true) {
                l2 = l1;
                if (b < i)
                  try {
                    l1 = ((Timer)this.instances.get(b)).update(l, l1);
                    b++;
                    continue;
                  } catch (Throwable throwable) {
                    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
                    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
                    this();
                    stringBuilder.append("Task failed: ");
                    stringBuilder.append(((Timer)this.instances.get(b)).getClass().getName());
                    this(stringBuilder.toString(), throwable);
                    throw gdxRuntimeException;
                  }  
                break;
              } 
            } 
            if (Timer.thread == this) {
              Files files1 = this.files;
              files2 = Gdx.files;
              if (files1 == files2) {
                if (l2 > 0L)
                  try {
                    Timer.threadLock.wait(l2);
                  } catch (InterruptedException files2) {} 
                continue;
              } 
            } 
          } 
          dispose();
          return;
        } 
      } 
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/Timer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */