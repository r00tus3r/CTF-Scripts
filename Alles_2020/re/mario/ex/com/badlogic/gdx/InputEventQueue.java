package com.badlogic.gdx;

import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.TimeUtils;

public class InputEventQueue implements InputProcessor {
  private static final int KEY_DOWN = 0;
  
  private static final int KEY_TYPED = 2;
  
  private static final int KEY_UP = 1;
  
  private static final int MOUSE_MOVED = 6;
  
  private static final int SCROLLED = 7;
  
  private static final int SKIP = -1;
  
  private static final int TOUCH_DOWN = 3;
  
  private static final int TOUCH_DRAGGED = 5;
  
  private static final int TOUCH_UP = 4;
  
  private long currentEventTime;
  
  private final IntArray processingQueue = new IntArray();
  
  private InputProcessor processor;
  
  private final IntArray queue = new IntArray();
  
  public InputEventQueue() {}
  
  public InputEventQueue(InputProcessor paramInputProcessor) { this.processor = paramInputProcessor; }
  
  private int next(int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: getfield items : [I
    //   9: astore_3
    //   10: aload_0
    //   11: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   14: getfield size : I
    //   17: istore #4
    //   19: iload_2
    //   20: iload #4
    //   22: if_icmpge -> 142
    //   25: aload_3
    //   26: iload_2
    //   27: iaload
    //   28: istore #5
    //   30: iload #5
    //   32: iload_1
    //   33: if_icmpne -> 40
    //   36: aload_0
    //   37: monitorexit
    //   38: iload_2
    //   39: ireturn
    //   40: iinc #2, 3
    //   43: iload #5
    //   45: tableswitch default -> 96, -1 -> 127, 0 -> 121, 1 -> 121, 2 -> 121, 3 -> 115, 4 -> 115, 5 -> 109, 6 -> 103, 7 -> 121
    //   96: new java/lang/RuntimeException
    //   99: astore_3
    //   100: goto -> 136
    //   103: iinc #2, 2
    //   106: goto -> 19
    //   109: iinc #2, 3
    //   112: goto -> 19
    //   115: iinc #2, 4
    //   118: goto -> 19
    //   121: iinc #2, 1
    //   124: goto -> 19
    //   127: iload_2
    //   128: aload_3
    //   129: iload_2
    //   130: iaload
    //   131: iadd
    //   132: istore_2
    //   133: goto -> 19
    //   136: aload_3
    //   137: invokespecial <init> : ()V
    //   140: aload_3
    //   141: athrow
    //   142: aload_0
    //   143: monitorexit
    //   144: iconst_m1
    //   145: ireturn
    //   146: astore_3
    //   147: aload_0
    //   148: monitorexit
    //   149: goto -> 154
    //   152: aload_3
    //   153: athrow
    //   154: goto -> 152
    // Exception table:
    //   from	to	target	type
    //   2	19	146	finally
    //   96	100	146	finally
    //   136	142	146	finally }
  
  private void queueTime() {
    long l = TimeUtils.nanoTime();
    this.queue.add((int)(l >> 32));
    this.queue.add((int)l);
  }
  
  public void drain() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield processor : Lcom/badlogic/gdx/InputProcessor;
    //   6: ifnonnull -> 19
    //   9: aload_0
    //   10: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   13: invokevirtual clear : ()V
    //   16: aload_0
    //   17: monitorexit
    //   18: return
    //   19: aload_0
    //   20: getfield processingQueue : Lcom/badlogic/gdx/utils/IntArray;
    //   23: aload_0
    //   24: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   27: invokevirtual addAll : (Lcom/badlogic/gdx/utils/IntArray;)V
    //   30: aload_0
    //   31: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   34: invokevirtual clear : ()V
    //   37: aload_0
    //   38: monitorexit
    //   39: aload_0
    //   40: getfield processingQueue : Lcom/badlogic/gdx/utils/IntArray;
    //   43: getfield items : [I
    //   46: astore_1
    //   47: aload_0
    //   48: getfield processor : Lcom/badlogic/gdx/InputProcessor;
    //   51: astore_2
    //   52: iconst_0
    //   53: istore_3
    //   54: aload_0
    //   55: getfield processingQueue : Lcom/badlogic/gdx/utils/IntArray;
    //   58: getfield size : I
    //   61: istore #4
    //   63: iload_3
    //   64: iload #4
    //   66: if_icmpge -> 445
    //   69: iload_3
    //   70: iconst_1
    //   71: iadd
    //   72: istore #5
    //   74: aload_1
    //   75: iload_3
    //   76: iaload
    //   77: istore #6
    //   79: iload #5
    //   81: iconst_1
    //   82: iadd
    //   83: istore_3
    //   84: aload_1
    //   85: iload #5
    //   87: iaload
    //   88: i2l
    //   89: lstore #7
    //   91: iload_3
    //   92: iconst_1
    //   93: iadd
    //   94: istore #5
    //   96: aload_0
    //   97: lload #7
    //   99: bipush #32
    //   101: lshl
    //   102: aload_1
    //   103: iload_3
    //   104: iaload
    //   105: i2l
    //   106: ldc2_w 4294967295
    //   109: land
    //   110: lor
    //   111: putfield currentEventTime : J
    //   114: iload #6
    //   116: tableswitch default -> 168, -1 -> 434, 0 -> 415, 1 -> 396, 2 -> 376, 3 -> 318, 4 -> 260, 5 -> 220, 6 -> 195, 7 -> 176
    //   168: new java/lang/RuntimeException
    //   171: dup
    //   172: invokespecial <init> : ()V
    //   175: athrow
    //   176: iload #5
    //   178: iconst_1
    //   179: iadd
    //   180: istore_3
    //   181: aload_2
    //   182: aload_1
    //   183: iload #5
    //   185: iaload
    //   186: invokeinterface scrolled : (I)Z
    //   191: pop
    //   192: goto -> 63
    //   195: iload #5
    //   197: iconst_1
    //   198: iadd
    //   199: istore_3
    //   200: aload_2
    //   201: aload_1
    //   202: iload #5
    //   204: iaload
    //   205: aload_1
    //   206: iload_3
    //   207: iaload
    //   208: invokeinterface mouseMoved : (II)Z
    //   213: pop
    //   214: iinc #3, 1
    //   217: goto -> 63
    //   220: iload #5
    //   222: iconst_1
    //   223: iadd
    //   224: istore_3
    //   225: aload_1
    //   226: iload #5
    //   228: iaload
    //   229: istore #5
    //   231: iload_3
    //   232: iconst_1
    //   233: iadd
    //   234: istore #6
    //   236: aload_2
    //   237: iload #5
    //   239: aload_1
    //   240: iload_3
    //   241: iaload
    //   242: aload_1
    //   243: iload #6
    //   245: iaload
    //   246: invokeinterface touchDragged : (III)Z
    //   251: pop
    //   252: iload #6
    //   254: iconst_1
    //   255: iadd
    //   256: istore_3
    //   257: goto -> 63
    //   260: iload #5
    //   262: iconst_1
    //   263: iadd
    //   264: istore #6
    //   266: aload_1
    //   267: iload #5
    //   269: iaload
    //   270: istore #5
    //   272: iload #6
    //   274: iconst_1
    //   275: iadd
    //   276: istore_3
    //   277: aload_1
    //   278: iload #6
    //   280: iaload
    //   281: istore #9
    //   283: iload_3
    //   284: iconst_1
    //   285: iadd
    //   286: istore #6
    //   288: aload_1
    //   289: iload_3
    //   290: iaload
    //   291: istore #10
    //   293: iload #6
    //   295: iconst_1
    //   296: iadd
    //   297: istore_3
    //   298: aload_2
    //   299: iload #5
    //   301: iload #9
    //   303: iload #10
    //   305: aload_1
    //   306: iload #6
    //   308: iaload
    //   309: invokeinterface touchUp : (IIII)Z
    //   314: pop
    //   315: goto -> 373
    //   318: iload #5
    //   320: iconst_1
    //   321: iadd
    //   322: istore #6
    //   324: aload_1
    //   325: iload #5
    //   327: iaload
    //   328: istore #5
    //   330: iload #6
    //   332: iconst_1
    //   333: iadd
    //   334: istore_3
    //   335: aload_1
    //   336: iload #6
    //   338: iaload
    //   339: istore #6
    //   341: iload_3
    //   342: iconst_1
    //   343: iadd
    //   344: istore #9
    //   346: aload_1
    //   347: iload_3
    //   348: iaload
    //   349: istore #10
    //   351: iload #9
    //   353: iconst_1
    //   354: iadd
    //   355: istore_3
    //   356: aload_2
    //   357: iload #5
    //   359: iload #6
    //   361: iload #10
    //   363: aload_1
    //   364: iload #9
    //   366: iaload
    //   367: invokeinterface touchDown : (IIII)Z
    //   372: pop
    //   373: goto -> 63
    //   376: iload #5
    //   378: iconst_1
    //   379: iadd
    //   380: istore_3
    //   381: aload_2
    //   382: aload_1
    //   383: iload #5
    //   385: iaload
    //   386: i2c
    //   387: invokeinterface keyTyped : (C)Z
    //   392: pop
    //   393: goto -> 63
    //   396: iload #5
    //   398: iconst_1
    //   399: iadd
    //   400: istore_3
    //   401: aload_2
    //   402: aload_1
    //   403: iload #5
    //   405: iaload
    //   406: invokeinterface keyUp : (I)Z
    //   411: pop
    //   412: goto -> 63
    //   415: iload #5
    //   417: iconst_1
    //   418: iadd
    //   419: istore_3
    //   420: aload_2
    //   421: aload_1
    //   422: iload #5
    //   424: iaload
    //   425: invokeinterface keyDown : (I)Z
    //   430: pop
    //   431: goto -> 63
    //   434: iload #5
    //   436: aload_1
    //   437: iload #5
    //   439: iaload
    //   440: iadd
    //   441: istore_3
    //   442: goto -> 63
    //   445: aload_0
    //   446: getfield processingQueue : Lcom/badlogic/gdx/utils/IntArray;
    //   449: invokevirtual clear : ()V
    //   452: return
    //   453: astore_1
    //   454: aload_0
    //   455: monitorexit
    //   456: goto -> 461
    //   459: aload_1
    //   460: athrow
    //   461: goto -> 459
    // Exception table:
    //   from	to	target	type
    //   2	18	453	finally
    //   19	39	453	finally
    //   454	456	453	finally }
  
  public long getCurrentEventTime() { return this.currentEventTime; }
  
  public InputProcessor getProcessor() { return this.processor; }
  
  public boolean keyDown(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: iconst_0
    //   7: invokevirtual add : (I)V
    //   10: aload_0
    //   11: invokespecial queueTime : ()V
    //   14: aload_0
    //   15: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   18: iload_1
    //   19: invokevirtual add : (I)V
    //   22: aload_0
    //   23: monitorexit
    //   24: iconst_0
    //   25: ireturn
    //   26: astore_2
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_2
    //   30: athrow
    // Exception table:
    //   from	to	target	type
    //   2	22	26	finally }
  
  public boolean keyTyped(char paramChar) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: iconst_2
    //   7: invokevirtual add : (I)V
    //   10: aload_0
    //   11: invokespecial queueTime : ()V
    //   14: aload_0
    //   15: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   18: iload_1
    //   19: invokevirtual add : (I)V
    //   22: aload_0
    //   23: monitorexit
    //   24: iconst_0
    //   25: ireturn
    //   26: astore_2
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_2
    //   30: athrow
    // Exception table:
    //   from	to	target	type
    //   2	22	26	finally }
  
  public boolean keyUp(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: iconst_1
    //   7: invokevirtual add : (I)V
    //   10: aload_0
    //   11: invokespecial queueTime : ()V
    //   14: aload_0
    //   15: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   18: iload_1
    //   19: invokevirtual add : (I)V
    //   22: aload_0
    //   23: monitorexit
    //   24: iconst_0
    //   25: ireturn
    //   26: astore_2
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_2
    //   30: athrow
    // Exception table:
    //   from	to	target	type
    //   2	22	26	finally }
  
  public boolean mouseMoved(int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: bipush #6
    //   5: iconst_0
    //   6: invokespecial next : (II)I
    //   9: istore_3
    //   10: iload_3
    //   11: iflt -> 47
    //   14: aload_0
    //   15: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   18: iload_3
    //   19: iconst_m1
    //   20: invokevirtual set : (II)V
    //   23: aload_0
    //   24: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   27: iload_3
    //   28: iconst_3
    //   29: iadd
    //   30: iconst_2
    //   31: invokevirtual set : (II)V
    //   34: aload_0
    //   35: bipush #6
    //   37: iload_3
    //   38: iconst_5
    //   39: iadd
    //   40: invokespecial next : (II)I
    //   43: istore_3
    //   44: goto -> 10
    //   47: aload_0
    //   48: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   51: bipush #6
    //   53: invokevirtual add : (I)V
    //   56: aload_0
    //   57: invokespecial queueTime : ()V
    //   60: aload_0
    //   61: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   64: iload_1
    //   65: invokevirtual add : (I)V
    //   68: aload_0
    //   69: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   72: iload_2
    //   73: invokevirtual add : (I)V
    //   76: aload_0
    //   77: monitorexit
    //   78: iconst_0
    //   79: ireturn
    //   80: astore #4
    //   82: aload_0
    //   83: monitorexit
    //   84: goto -> 90
    //   87: aload #4
    //   89: athrow
    //   90: goto -> 87
    // Exception table:
    //   from	to	target	type
    //   2	10	80	finally
    //   14	44	80	finally
    //   47	76	80	finally }
  
  public boolean scrolled(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: bipush #7
    //   8: invokevirtual add : (I)V
    //   11: aload_0
    //   12: invokespecial queueTime : ()V
    //   15: aload_0
    //   16: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   19: iload_1
    //   20: invokevirtual add : (I)V
    //   23: aload_0
    //   24: monitorexit
    //   25: iconst_0
    //   26: ireturn
    //   27: astore_2
    //   28: aload_0
    //   29: monitorexit
    //   30: aload_2
    //   31: athrow
    // Exception table:
    //   from	to	target	type
    //   2	23	27	finally }
  
  public void setProcessor(InputProcessor paramInputProcessor) { this.processor = paramInputProcessor; }
  
  public boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: iconst_3
    //   7: invokevirtual add : (I)V
    //   10: aload_0
    //   11: invokespecial queueTime : ()V
    //   14: aload_0
    //   15: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   18: iload_1
    //   19: invokevirtual add : (I)V
    //   22: aload_0
    //   23: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   26: iload_2
    //   27: invokevirtual add : (I)V
    //   30: aload_0
    //   31: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   34: iload_3
    //   35: invokevirtual add : (I)V
    //   38: aload_0
    //   39: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   42: iload #4
    //   44: invokevirtual add : (I)V
    //   47: aload_0
    //   48: monitorexit
    //   49: iconst_0
    //   50: ireturn
    //   51: astore #5
    //   53: aload_0
    //   54: monitorexit
    //   55: aload #5
    //   57: athrow
    // Exception table:
    //   from	to	target	type
    //   2	47	51	finally }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iconst_5
    //   4: iconst_0
    //   5: invokespecial next : (II)I
    //   8: istore #4
    //   10: iload #4
    //   12: iflt -> 67
    //   15: aload_0
    //   16: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   19: iload #4
    //   21: iconst_5
    //   22: iadd
    //   23: invokevirtual get : (I)I
    //   26: iload_3
    //   27: if_icmpne -> 52
    //   30: aload_0
    //   31: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   34: iload #4
    //   36: iconst_m1
    //   37: invokevirtual set : (II)V
    //   40: aload_0
    //   41: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   44: iload #4
    //   46: iconst_3
    //   47: iadd
    //   48: iconst_3
    //   49: invokevirtual set : (II)V
    //   52: aload_0
    //   53: iconst_5
    //   54: iload #4
    //   56: bipush #6
    //   58: iadd
    //   59: invokespecial next : (II)I
    //   62: istore #4
    //   64: goto -> 10
    //   67: aload_0
    //   68: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   71: iconst_5
    //   72: invokevirtual add : (I)V
    //   75: aload_0
    //   76: invokespecial queueTime : ()V
    //   79: aload_0
    //   80: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   83: iload_1
    //   84: invokevirtual add : (I)V
    //   87: aload_0
    //   88: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   91: iload_2
    //   92: invokevirtual add : (I)V
    //   95: aload_0
    //   96: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   99: iload_3
    //   100: invokevirtual add : (I)V
    //   103: aload_0
    //   104: monitorexit
    //   105: iconst_0
    //   106: ireturn
    //   107: astore #5
    //   109: aload_0
    //   110: monitorexit
    //   111: goto -> 117
    //   114: aload #5
    //   116: athrow
    //   117: goto -> 114
    // Exception table:
    //   from	to	target	type
    //   2	10	107	finally
    //   15	52	107	finally
    //   52	64	107	finally
    //   67	103	107	finally }
  
  public boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   6: iconst_4
    //   7: invokevirtual add : (I)V
    //   10: aload_0
    //   11: invokespecial queueTime : ()V
    //   14: aload_0
    //   15: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   18: iload_1
    //   19: invokevirtual add : (I)V
    //   22: aload_0
    //   23: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   26: iload_2
    //   27: invokevirtual add : (I)V
    //   30: aload_0
    //   31: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   34: iload_3
    //   35: invokevirtual add : (I)V
    //   38: aload_0
    //   39: getfield queue : Lcom/badlogic/gdx/utils/IntArray;
    //   42: iload #4
    //   44: invokevirtual add : (I)V
    //   47: aload_0
    //   48: monitorexit
    //   49: iconst_0
    //   50: ireturn
    //   51: astore #5
    //   53: aload_0
    //   54: monitorexit
    //   55: aload #5
    //   57: athrow
    // Exception table:
    //   from	to	target	type
    //   2	47	51	finally }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/InputEventQueue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */