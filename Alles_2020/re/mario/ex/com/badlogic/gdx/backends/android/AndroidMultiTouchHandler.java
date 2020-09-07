package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.view.MotionEvent;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;

public class AndroidMultiTouchHandler implements AndroidTouchHandler {
  private void logAction(int paramInt1, int paramInt2) {
    String str;
    if (paramInt1 == 0) {
      str = "DOWN";
    } else if (paramInt1 == 5) {
      str = "POINTER DOWN";
    } else if (paramInt1 == 1) {
      str = "UP";
    } else if (paramInt1 == 6) {
      str = "POINTER UP";
    } else if (paramInt1 == 4) {
      str = "OUTSIDE";
    } else if (paramInt1 == 3) {
      str = "CANCEL";
    } else if (paramInt1 == 2) {
      str = "MOVE";
    } else {
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("UNKNOWN (");
      stringBuilder1.append(paramInt1);
      stringBuilder1.append(")");
      str = stringBuilder1.toString();
    } 
    Application application = Gdx.app;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("action ");
    stringBuilder.append(str);
    stringBuilder.append(", Android pointer id: ");
    stringBuilder.append(paramInt2);
    application.log("AndroidMultiTouchHandler", stringBuilder.toString());
  }
  
  private void postTouchEvent(AndroidInput paramAndroidInput, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, long paramLong) {
    AndroidInput.TouchEvent touchEvent = (AndroidInput.TouchEvent)paramAndroidInput.usedTouchEvents.obtain();
    touchEvent.timeStamp = paramLong;
    touchEvent.pointer = paramInt4;
    touchEvent.x = paramInt2;
    touchEvent.y = paramInt3;
    touchEvent.type = paramInt1;
    touchEvent.button = paramInt5;
    paramAndroidInput.touchEvents.add(touchEvent);
  }
  
  private int toGdxButton(int paramInt) { return (paramInt == 0 || paramInt == 1) ? 0 : ((paramInt == 2) ? 1 : ((paramInt == 4) ? 2 : ((paramInt == 8) ? 3 : ((paramInt == 16) ? 4 : -1)))); }
  
  public void onTouch(MotionEvent paramMotionEvent, AndroidInput paramAndroidInput) { // Byte code:
    //   0: aload_1
    //   1: invokevirtual getAction : ()I
    //   4: istore_3
    //   5: aload_1
    //   6: invokevirtual getAction : ()I
    //   9: ldc 65280
    //   11: iand
    //   12: bipush #8
    //   14: ishr
    //   15: istore #4
    //   17: aload_1
    //   18: iload #4
    //   20: invokevirtual getPointerId : (I)I
    //   23: istore #5
    //   25: invokestatic nanoTime : ()J
    //   28: lstore #6
    //   30: aload_2
    //   31: monitorenter
    //   32: iconst_0
    //   33: istore #8
    //   35: iload_3
    //   36: sipush #255
    //   39: iand
    //   40: tableswitch default -> 84, 0 -> 489, 1 -> 344, 2 -> 170, 3 -> 87, 4 -> 344, 5 -> 489, 6 -> 344
    //   84: goto -> 660
    //   87: iconst_0
    //   88: istore #5
    //   90: iload #5
    //   92: aload_2
    //   93: getfield realId : [I
    //   96: arraylength
    //   97: if_icmpge -> 660
    //   100: aload_2
    //   101: getfield realId : [I
    //   104: iload #5
    //   106: iconst_m1
    //   107: iastore
    //   108: aload_2
    //   109: getfield touchX : [I
    //   112: iload #5
    //   114: iconst_0
    //   115: iastore
    //   116: aload_2
    //   117: getfield touchY : [I
    //   120: iload #5
    //   122: iconst_0
    //   123: iastore
    //   124: aload_2
    //   125: getfield deltaX : [I
    //   128: iload #5
    //   130: iconst_0
    //   131: iastore
    //   132: aload_2
    //   133: getfield deltaY : [I
    //   136: iload #5
    //   138: iconst_0
    //   139: iastore
    //   140: aload_2
    //   141: getfield touched : [Z
    //   144: iload #5
    //   146: iconst_0
    //   147: bastore
    //   148: aload_2
    //   149: getfield button : [I
    //   152: iload #5
    //   154: iconst_0
    //   155: iastore
    //   156: aload_2
    //   157: getfield pressure : [F
    //   160: iload #5
    //   162: fconst_0
    //   163: fastore
    //   164: iinc #5, 1
    //   167: goto -> 90
    //   170: aload_1
    //   171: invokevirtual getPointerCount : ()I
    //   174: istore #9
    //   176: iconst_0
    //   177: istore #5
    //   179: iload #5
    //   181: iload #9
    //   183: if_icmpge -> 660
    //   186: aload_1
    //   187: iload #5
    //   189: invokevirtual getPointerId : (I)I
    //   192: istore_3
    //   193: aload_1
    //   194: iload #5
    //   196: invokevirtual getX : (I)F
    //   199: f2i
    //   200: istore #4
    //   202: aload_1
    //   203: iload #5
    //   205: invokevirtual getY : (I)F
    //   208: f2i
    //   209: istore #10
    //   211: aload_2
    //   212: iload_3
    //   213: invokevirtual lookUpPointerIndex : (I)I
    //   216: istore_3
    //   217: iload_3
    //   218: iconst_m1
    //   219: if_icmpne -> 225
    //   222: goto -> 338
    //   225: iload_3
    //   226: bipush #20
    //   228: if_icmplt -> 234
    //   231: goto -> 660
    //   234: aload_2
    //   235: getfield button : [I
    //   238: iload_3
    //   239: iaload
    //   240: istore #11
    //   242: iload #11
    //   244: iconst_m1
    //   245: if_icmpeq -> 266
    //   248: aload_0
    //   249: aload_2
    //   250: iconst_2
    //   251: iload #4
    //   253: iload #10
    //   255: iload_3
    //   256: iload #11
    //   258: lload #6
    //   260: invokespecial postTouchEvent : (Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIIJ)V
    //   263: goto -> 280
    //   266: aload_0
    //   267: aload_2
    //   268: iconst_4
    //   269: iload #4
    //   271: iload #10
    //   273: iload_3
    //   274: iconst_0
    //   275: lload #6
    //   277: invokespecial postTouchEvent : (Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIIJ)V
    //   280: aload_2
    //   281: getfield deltaX : [I
    //   284: iload_3
    //   285: iload #4
    //   287: aload_2
    //   288: getfield touchX : [I
    //   291: iload_3
    //   292: iaload
    //   293: isub
    //   294: iastore
    //   295: aload_2
    //   296: getfield deltaY : [I
    //   299: iload_3
    //   300: iload #10
    //   302: aload_2
    //   303: getfield touchY : [I
    //   306: iload_3
    //   307: iaload
    //   308: isub
    //   309: iastore
    //   310: aload_2
    //   311: getfield touchX : [I
    //   314: iload_3
    //   315: iload #4
    //   317: iastore
    //   318: aload_2
    //   319: getfield touchY : [I
    //   322: iload_3
    //   323: iload #10
    //   325: iastore
    //   326: aload_2
    //   327: getfield pressure : [F
    //   330: iload_3
    //   331: aload_1
    //   332: iload #5
    //   334: invokevirtual getPressure : (I)F
    //   337: fastore
    //   338: iinc #5, 1
    //   341: goto -> 179
    //   344: aload_2
    //   345: iload #5
    //   347: invokevirtual lookUpPointerIndex : (I)I
    //   350: istore #5
    //   352: iload #5
    //   354: iconst_m1
    //   355: if_icmpne -> 361
    //   358: goto -> 660
    //   361: iload #5
    //   363: bipush #20
    //   365: if_icmplt -> 371
    //   368: goto -> 660
    //   371: aload_2
    //   372: getfield realId : [I
    //   375: iload #5
    //   377: iconst_m1
    //   378: iastore
    //   379: aload_1
    //   380: iload #4
    //   382: invokevirtual getX : (I)F
    //   385: f2i
    //   386: istore_3
    //   387: aload_1
    //   388: iload #4
    //   390: invokevirtual getY : (I)F
    //   393: f2i
    //   394: istore #10
    //   396: aload_2
    //   397: getfield button : [I
    //   400: iload #5
    //   402: iaload
    //   403: istore #4
    //   405: iload #4
    //   407: iconst_m1
    //   408: if_icmpeq -> 429
    //   411: aload_0
    //   412: aload_2
    //   413: iconst_1
    //   414: iload_3
    //   415: iload #10
    //   417: iload #5
    //   419: iload #4
    //   421: lload #6
    //   423: invokespecial postTouchEvent : (Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIIJ)V
    //   426: goto -> 429
    //   429: aload_2
    //   430: getfield touchX : [I
    //   433: iload #5
    //   435: iload_3
    //   436: iastore
    //   437: aload_2
    //   438: getfield touchY : [I
    //   441: iload #5
    //   443: iload #10
    //   445: iastore
    //   446: aload_2
    //   447: getfield deltaX : [I
    //   450: iload #5
    //   452: iconst_0
    //   453: iastore
    //   454: aload_2
    //   455: getfield deltaY : [I
    //   458: iload #5
    //   460: iconst_0
    //   461: iastore
    //   462: aload_2
    //   463: getfield touched : [Z
    //   466: iload #5
    //   468: iconst_0
    //   469: bastore
    //   470: aload_2
    //   471: getfield button : [I
    //   474: iload #5
    //   476: iconst_0
    //   477: iastore
    //   478: aload_2
    //   479: getfield pressure : [F
    //   482: iload #5
    //   484: fconst_0
    //   485: fastore
    //   486: goto -> 660
    //   489: aload_2
    //   490: invokevirtual getFreePointerIndex : ()I
    //   493: istore_3
    //   494: iload_3
    //   495: bipush #20
    //   497: if_icmplt -> 503
    //   500: goto -> 660
    //   503: aload_2
    //   504: getfield realId : [I
    //   507: iload_3
    //   508: iload #5
    //   510: iastore
    //   511: aload_1
    //   512: iload #4
    //   514: invokevirtual getX : (I)F
    //   517: f2i
    //   518: istore #9
    //   520: aload_1
    //   521: iload #4
    //   523: invokevirtual getY : (I)F
    //   526: f2i
    //   527: istore #10
    //   529: getstatic android/os/Build$VERSION.SDK_INT : I
    //   532: istore #5
    //   534: iload #5
    //   536: bipush #14
    //   538: if_icmplt -> 562
    //   541: aload_1
    //   542: invokevirtual getButtonState : ()I
    //   545: istore #5
    //   547: aload_0
    //   548: iload #5
    //   550: invokespecial toGdxButton : (I)I
    //   553: istore #5
    //   555: goto -> 565
    //   558: astore_1
    //   559: goto -> 677
    //   562: iconst_0
    //   563: istore #5
    //   565: iload #5
    //   567: iconst_m1
    //   568: if_icmpeq -> 589
    //   571: aload_0
    //   572: aload_2
    //   573: iconst_0
    //   574: iload #9
    //   576: iload #10
    //   578: iload_3
    //   579: iload #5
    //   581: lload #6
    //   583: invokespecial postTouchEvent : (Lcom/badlogic/gdx/backends/android/AndroidInput;IIIIIJ)V
    //   586: goto -> 589
    //   589: aload_2
    //   590: getfield touchX : [I
    //   593: iload_3
    //   594: iload #9
    //   596: iastore
    //   597: aload_2
    //   598: getfield touchY : [I
    //   601: iload_3
    //   602: iload #10
    //   604: iastore
    //   605: aload_2
    //   606: getfield deltaX : [I
    //   609: iload_3
    //   610: iconst_0
    //   611: iastore
    //   612: aload_2
    //   613: getfield deltaY : [I
    //   616: iload_3
    //   617: iconst_0
    //   618: iastore
    //   619: aload_2
    //   620: getfield touched : [Z
    //   623: astore #12
    //   625: iload #5
    //   627: iconst_m1
    //   628: if_icmpeq -> 634
    //   631: iconst_1
    //   632: istore #8
    //   634: aload #12
    //   636: iload_3
    //   637: iload #8
    //   639: bastore
    //   640: aload_2
    //   641: getfield button : [I
    //   644: iload_3
    //   645: iload #5
    //   647: iastore
    //   648: aload_2
    //   649: getfield pressure : [F
    //   652: iload_3
    //   653: aload_1
    //   654: iload #4
    //   656: invokevirtual getPressure : (I)F
    //   659: fastore
    //   660: aload_2
    //   661: monitorexit
    //   662: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   665: invokeinterface getGraphics : ()Lcom/badlogic/gdx/Graphics;
    //   670: invokeinterface requestRendering : ()V
    //   675: return
    //   676: astore_1
    //   677: aload_2
    //   678: monitorexit
    //   679: goto -> 684
    //   682: aload_1
    //   683: athrow
    //   684: goto -> 682
    // Exception table:
    //   from	to	target	type
    //   90	164	676	finally
    //   170	176	676	finally
    //   186	217	676	finally
    //   234	242	676	finally
    //   248	263	676	finally
    //   266	280	676	finally
    //   280	338	676	finally
    //   344	352	676	finally
    //   371	405	676	finally
    //   411	426	676	finally
    //   429	486	676	finally
    //   489	494	676	finally
    //   503	534	676	finally
    //   541	547	558	finally
    //   547	555	676	finally
    //   571	586	676	finally
    //   589	625	676	finally
    //   640	660	676	finally
    //   660	662	676	finally
    //   677	679	676	finally }
  
  public boolean supportsMultitouch(Context paramContext) { return paramContext.getPackageManager().hasSystemFeature("android.hardware.touchscreen.multitouch"); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidMultiTouchHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */