package com.badlogic.gdx.backends.android;

import android.view.MotionEvent;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;

public class AndroidMouseHandler {
  private int deltaX = 0;
  
  private int deltaY = 0;
  
  private void logAction(int paramInt) {
    String str;
    if (paramInt == 9) {
      str = "HOVER_ENTER";
    } else if (paramInt == 7) {
      str = "HOVER_MOVE";
    } else if (paramInt == 10) {
      str = "HOVER_EXIT";
    } else if (paramInt == 8) {
      str = "SCROLL";
    } else {
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("UNKNOWN (");
      stringBuilder1.append(paramInt);
      stringBuilder1.append(")");
      str = stringBuilder1.toString();
    } 
    Application application = Gdx.app;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("action ");
    stringBuilder.append(str);
    application.log("AndroidMouseHandler", stringBuilder.toString());
  }
  
  private void postTouchEvent(AndroidInput paramAndroidInput, int paramInt1, int paramInt2, int paramInt3, int paramInt4, long paramLong) {
    AndroidInput.TouchEvent touchEvent = (AndroidInput.TouchEvent)paramAndroidInput.usedTouchEvents.obtain();
    touchEvent.timeStamp = paramLong;
    touchEvent.x = paramInt2;
    touchEvent.y = paramInt3;
    touchEvent.type = paramInt1;
    touchEvent.scrollAmount = paramInt4;
    paramAndroidInput.touchEvents.add(touchEvent);
  }
  
  public boolean onGenericMotion(MotionEvent paramMotionEvent, AndroidInput paramAndroidInput) { // Byte code:
    //   0: aload_1
    //   1: invokevirtual getSource : ()I
    //   4: iconst_2
    //   5: iand
    //   6: ifne -> 11
    //   9: iconst_0
    //   10: ireturn
    //   11: aload_1
    //   12: invokevirtual getAction : ()I
    //   15: sipush #255
    //   18: iand
    //   19: istore_3
    //   20: invokestatic nanoTime : ()J
    //   23: lstore #4
    //   25: aload_2
    //   26: monitorenter
    //   27: iload_3
    //   28: bipush #7
    //   30: if_icmpeq -> 66
    //   33: iload_3
    //   34: bipush #8
    //   36: if_icmpeq -> 42
    //   39: goto -> 119
    //   42: aload_0
    //   43: aload_2
    //   44: iconst_3
    //   45: iconst_0
    //   46: iconst_0
    //   47: aload_1
    //   48: bipush #9
    //   50: invokevirtual getAxisValue : (I)F
    //   53: invokestatic signum : (F)F
    //   56: fneg
    //   57: f2i
    //   58: lload #4
    //   60: invokespecial postTouchEvent : (Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIJ)V
    //   63: goto -> 119
    //   66: aload_1
    //   67: invokevirtual getX : ()F
    //   70: f2i
    //   71: istore_3
    //   72: aload_1
    //   73: invokevirtual getY : ()F
    //   76: f2i
    //   77: istore #6
    //   79: iload_3
    //   80: aload_0
    //   81: getfield deltaX : I
    //   84: if_icmpne -> 96
    //   87: iload #6
    //   89: aload_0
    //   90: getfield deltaY : I
    //   93: if_icmpeq -> 119
    //   96: aload_0
    //   97: aload_2
    //   98: iconst_4
    //   99: iload_3
    //   100: iload #6
    //   102: iconst_0
    //   103: lload #4
    //   105: invokespecial postTouchEvent : (Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIJ)V
    //   108: aload_0
    //   109: iload_3
    //   110: putfield deltaX : I
    //   113: aload_0
    //   114: iload #6
    //   116: putfield deltaY : I
    //   119: aload_2
    //   120: monitorexit
    //   121: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   124: invokeinterface getGraphics : ()Lcom/badlogic/gdx/Graphics;
    //   129: invokeinterface requestRendering : ()V
    //   134: iconst_1
    //   135: ireturn
    //   136: astore_1
    //   137: aload_2
    //   138: monitorexit
    //   139: aload_1
    //   140: athrow
    // Exception table:
    //   from	to	target	type
    //   42	63	136	finally
    //   66	96	136	finally
    //   96	119	136	finally
    //   119	121	136	finally
    //   137	139	136	finally }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidMouseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */