package com.badlogic.gdx.input;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.InputProcessor;
import java.io.DataOutputStream;
import java.net.Socket;

public class RemoteSender implements InputProcessor {
  public static final int ACCEL = 6;
  
  public static final int COMPASS = 7;
  
  public static final int GYRO = 9;
  
  public static final int KEY_DOWN = 0;
  
  public static final int KEY_TYPED = 2;
  
  public static final int KEY_UP = 1;
  
  public static final int SIZE = 8;
  
  public static final int TOUCH_DOWN = 3;
  
  public static final int TOUCH_DRAGGED = 5;
  
  public static final int TOUCH_UP = 4;
  
  private boolean connected = false;
  
  private DataOutputStream out;
  
  public RemoteSender(String paramString, int paramInt) {
    try {
      Socket socket = new Socket();
      this(paramString, paramInt);
      socket.setTcpNoDelay(true);
      socket.setSoTimeout(3000);
      DataOutputStream dataOutputStream = new DataOutputStream();
      this(socket.getOutputStream());
      this.out = dataOutputStream;
      this.out.writeBoolean(Gdx.input.isPeripheralAvailable(Input.Peripheral.MultitouchScreen));
      this.connected = true;
      Gdx.input.setInputProcessor(this);
    } catch (Exception exception) {
      Application application = Gdx.app;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("couldn't connect to ");
      stringBuilder.append(paramString);
      stringBuilder.append(":");
      stringBuilder.append(paramInt);
      application.log("RemoteSender", stringBuilder.toString());
    } 
  }
  
  public boolean isConnected() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: istore_1
    //   7: aload_0
    //   8: monitorexit
    //   9: iload_1
    //   10: ireturn
    //   11: astore_2
    //   12: aload_0
    //   13: monitorexit
    //   14: aload_2
    //   15: athrow
    // Exception table:
    //   from	to	target	type
    //   2	9	11	finally
    //   12	14	11	finally }
  
  public boolean keyDown(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 13
    //   9: aload_0
    //   10: monitorexit
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_0
    //   16: getfield out : Ljava/io/DataOutputStream;
    //   19: iconst_0
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: iload_1
    //   28: invokevirtual writeInt : (I)V
    //   31: goto -> 44
    //   34: astore_2
    //   35: aload_0
    //   36: monitorenter
    //   37: aload_0
    //   38: iconst_0
    //   39: putfield connected : Z
    //   42: aload_0
    //   43: monitorexit
    //   44: iconst_0
    //   45: ireturn
    //   46: astore_2
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_2
    //   50: athrow
    //   51: astore_2
    //   52: aload_0
    //   53: monitorexit
    //   54: aload_2
    //   55: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	51	finally
    //   13	15	51	finally
    //   15	31	34	java/lang/Throwable
    //   37	44	46	finally
    //   47	49	46	finally
    //   52	54	51	finally }
  
  public boolean keyTyped(char paramChar) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 13
    //   9: aload_0
    //   10: monitorexit
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_0
    //   16: getfield out : Ljava/io/DataOutputStream;
    //   19: iconst_2
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: iload_1
    //   28: invokevirtual writeChar : (I)V
    //   31: goto -> 44
    //   34: astore_2
    //   35: aload_0
    //   36: monitorenter
    //   37: aload_0
    //   38: iconst_0
    //   39: putfield connected : Z
    //   42: aload_0
    //   43: monitorexit
    //   44: iconst_0
    //   45: ireturn
    //   46: astore_2
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_2
    //   50: athrow
    //   51: astore_2
    //   52: aload_0
    //   53: monitorexit
    //   54: aload_2
    //   55: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	51	finally
    //   13	15	51	finally
    //   15	31	34	java/lang/Throwable
    //   37	44	46	finally
    //   47	49	46	finally
    //   52	54	51	finally }
  
  public boolean keyUp(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 13
    //   9: aload_0
    //   10: monitorexit
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_0
    //   16: getfield out : Ljava/io/DataOutputStream;
    //   19: iconst_1
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: iload_1
    //   28: invokevirtual writeInt : (I)V
    //   31: goto -> 44
    //   34: astore_2
    //   35: aload_0
    //   36: monitorenter
    //   37: aload_0
    //   38: iconst_0
    //   39: putfield connected : Z
    //   42: aload_0
    //   43: monitorexit
    //   44: iconst_0
    //   45: ireturn
    //   46: astore_2
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_2
    //   50: athrow
    //   51: astore_2
    //   52: aload_0
    //   53: monitorexit
    //   54: aload_2
    //   55: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	51	finally
    //   13	15	51	finally
    //   15	31	34	java/lang/Throwable
    //   37	44	46	finally
    //   47	49	46	finally
    //   52	54	51	finally }
  
  public boolean mouseMoved(int paramInt1, int paramInt2) { return false; }
  
  public boolean scrolled(int paramInt) { return false; }
  
  public void sendUpdate() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 12
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: aload_0
    //   13: monitorexit
    //   14: aload_0
    //   15: getfield out : Ljava/io/DataOutputStream;
    //   18: bipush #6
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   30: invokeinterface getAccelerometerX : ()F
    //   35: invokevirtual writeFloat : (F)V
    //   38: aload_0
    //   39: getfield out : Ljava/io/DataOutputStream;
    //   42: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   45: invokeinterface getAccelerometerY : ()F
    //   50: invokevirtual writeFloat : (F)V
    //   53: aload_0
    //   54: getfield out : Ljava/io/DataOutputStream;
    //   57: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   60: invokeinterface getAccelerometerZ : ()F
    //   65: invokevirtual writeFloat : (F)V
    //   68: aload_0
    //   69: getfield out : Ljava/io/DataOutputStream;
    //   72: bipush #7
    //   74: invokevirtual writeInt : (I)V
    //   77: aload_0
    //   78: getfield out : Ljava/io/DataOutputStream;
    //   81: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   84: invokeinterface getAzimuth : ()F
    //   89: invokevirtual writeFloat : (F)V
    //   92: aload_0
    //   93: getfield out : Ljava/io/DataOutputStream;
    //   96: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   99: invokeinterface getPitch : ()F
    //   104: invokevirtual writeFloat : (F)V
    //   107: aload_0
    //   108: getfield out : Ljava/io/DataOutputStream;
    //   111: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   114: invokeinterface getRoll : ()F
    //   119: invokevirtual writeFloat : (F)V
    //   122: aload_0
    //   123: getfield out : Ljava/io/DataOutputStream;
    //   126: bipush #8
    //   128: invokevirtual writeInt : (I)V
    //   131: aload_0
    //   132: getfield out : Ljava/io/DataOutputStream;
    //   135: getstatic com/badlogic/gdx/Gdx.graphics : Lcom/badlogic/gdx/Graphics;
    //   138: invokeinterface getWidth : ()I
    //   143: i2f
    //   144: invokevirtual writeFloat : (F)V
    //   147: aload_0
    //   148: getfield out : Ljava/io/DataOutputStream;
    //   151: getstatic com/badlogic/gdx/Gdx.graphics : Lcom/badlogic/gdx/Graphics;
    //   154: invokeinterface getHeight : ()I
    //   159: i2f
    //   160: invokevirtual writeFloat : (F)V
    //   163: aload_0
    //   164: getfield out : Ljava/io/DataOutputStream;
    //   167: bipush #9
    //   169: invokevirtual writeInt : (I)V
    //   172: aload_0
    //   173: getfield out : Ljava/io/DataOutputStream;
    //   176: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   179: invokeinterface getGyroscopeX : ()F
    //   184: invokevirtual writeFloat : (F)V
    //   187: aload_0
    //   188: getfield out : Ljava/io/DataOutputStream;
    //   191: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   194: invokeinterface getGyroscopeY : ()F
    //   199: invokevirtual writeFloat : (F)V
    //   202: aload_0
    //   203: getfield out : Ljava/io/DataOutputStream;
    //   206: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   209: invokeinterface getGyroscopeZ : ()F
    //   214: invokevirtual writeFloat : (F)V
    //   217: goto -> 231
    //   220: astore_1
    //   221: aload_0
    //   222: aconst_null
    //   223: putfield out : Ljava/io/DataOutputStream;
    //   226: aload_0
    //   227: iconst_0
    //   228: putfield connected : Z
    //   231: return
    //   232: astore_1
    //   233: aload_0
    //   234: monitorexit
    //   235: aload_1
    //   236: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	232	finally
    //   12	14	232	finally
    //   14	217	220	java/lang/Throwable
    //   233	235	232	finally }
  
  public boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 13
    //   9: aload_0
    //   10: monitorexit
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_0
    //   16: getfield out : Ljava/io/DataOutputStream;
    //   19: iconst_3
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: iload_1
    //   28: invokevirtual writeInt : (I)V
    //   31: aload_0
    //   32: getfield out : Ljava/io/DataOutputStream;
    //   35: iload_2
    //   36: invokevirtual writeInt : (I)V
    //   39: aload_0
    //   40: getfield out : Ljava/io/DataOutputStream;
    //   43: iload_3
    //   44: invokevirtual writeInt : (I)V
    //   47: goto -> 61
    //   50: astore #5
    //   52: aload_0
    //   53: monitorenter
    //   54: aload_0
    //   55: iconst_0
    //   56: putfield connected : Z
    //   59: aload_0
    //   60: monitorexit
    //   61: iconst_0
    //   62: ireturn
    //   63: astore #5
    //   65: aload_0
    //   66: monitorexit
    //   67: aload #5
    //   69: athrow
    //   70: astore #5
    //   72: aload_0
    //   73: monitorexit
    //   74: aload #5
    //   76: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	70	finally
    //   13	15	70	finally
    //   15	47	50	java/lang/Throwable
    //   54	61	63	finally
    //   65	67	63	finally
    //   72	74	70	finally }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 13
    //   9: aload_0
    //   10: monitorexit
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_0
    //   16: getfield out : Ljava/io/DataOutputStream;
    //   19: iconst_5
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: iload_1
    //   28: invokevirtual writeInt : (I)V
    //   31: aload_0
    //   32: getfield out : Ljava/io/DataOutputStream;
    //   35: iload_2
    //   36: invokevirtual writeInt : (I)V
    //   39: aload_0
    //   40: getfield out : Ljava/io/DataOutputStream;
    //   43: iload_3
    //   44: invokevirtual writeInt : (I)V
    //   47: goto -> 61
    //   50: astore #4
    //   52: aload_0
    //   53: monitorenter
    //   54: aload_0
    //   55: iconst_0
    //   56: putfield connected : Z
    //   59: aload_0
    //   60: monitorexit
    //   61: iconst_0
    //   62: ireturn
    //   63: astore #4
    //   65: aload_0
    //   66: monitorexit
    //   67: aload #4
    //   69: athrow
    //   70: astore #4
    //   72: aload_0
    //   73: monitorexit
    //   74: aload #4
    //   76: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	70	finally
    //   13	15	70	finally
    //   15	47	50	java/lang/Throwable
    //   54	61	63	finally
    //   65	67	63	finally
    //   72	74	70	finally }
  
  public boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connected : Z
    //   6: ifne -> 13
    //   9: aload_0
    //   10: monitorexit
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: monitorexit
    //   15: aload_0
    //   16: getfield out : Ljava/io/DataOutputStream;
    //   19: iconst_4
    //   20: invokevirtual writeInt : (I)V
    //   23: aload_0
    //   24: getfield out : Ljava/io/DataOutputStream;
    //   27: iload_1
    //   28: invokevirtual writeInt : (I)V
    //   31: aload_0
    //   32: getfield out : Ljava/io/DataOutputStream;
    //   35: iload_2
    //   36: invokevirtual writeInt : (I)V
    //   39: aload_0
    //   40: getfield out : Ljava/io/DataOutputStream;
    //   43: iload_3
    //   44: invokevirtual writeInt : (I)V
    //   47: goto -> 61
    //   50: astore #5
    //   52: aload_0
    //   53: monitorenter
    //   54: aload_0
    //   55: iconst_0
    //   56: putfield connected : Z
    //   59: aload_0
    //   60: monitorexit
    //   61: iconst_0
    //   62: ireturn
    //   63: astore #5
    //   65: aload_0
    //   66: monitorexit
    //   67: aload #5
    //   69: athrow
    //   70: astore #5
    //   72: aload_0
    //   73: monitorexit
    //   74: aload #5
    //   76: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	70	finally
    //   13	15	70	finally
    //   15	47	50	java/lang/Throwable
    //   54	61	63	finally
    //   65	67	63	finally
    //   72	74	70	finally }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/input/RemoteSender.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */