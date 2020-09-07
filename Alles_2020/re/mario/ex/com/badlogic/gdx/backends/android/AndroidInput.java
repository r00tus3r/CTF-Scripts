package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Handler;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.utils.IntSet;
import com.badlogic.gdx.utils.Pool;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AndroidInput implements Input, View.OnKeyListener, View.OnTouchListener {
  public static final int NUM_TOUCHES = 20;
  
  public static final int SUPPORTED_KEYS = 260;
  
  final float[] R;
  
  public boolean accelerometerAvailable;
  
  private SensorEventListener accelerometerListener;
  
  protected final float[] accelerometerValues;
  
  final Application app;
  
  private float azimuth;
  
  int[] button = new int[20];
  
  private boolean compassAvailable;
  
  private SensorEventListener compassListener;
  
  private final AndroidApplicationConfiguration config;
  
  final Context context;
  
  private long currentEventTimeStamp;
  
  int[] deltaX = new int[20];
  
  int[] deltaY = new int[20];
  
  public boolean gyroscopeAvailable;
  
  private SensorEventListener gyroscopeListener;
  
  protected final float[] gyroscopeValues;
  
  private Handler handle;
  
  final boolean hasMultitouch;
  
  private float inclination;
  
  private boolean[] justPressedButtons;
  
  private boolean[] justPressedKeys;
  
  private boolean justTouched;
  
  private int keyCount;
  
  ArrayList<KeyEvent> keyEvents = new ArrayList();
  
  private boolean keyJustPressed;
  
  ArrayList<View.OnKeyListener> keyListeners = new ArrayList();
  
  boolean keyboardAvailable;
  
  private boolean[] keys;
  
  private IntSet keysToCatch;
  
  protected final float[] magneticFieldValues;
  
  private SensorManager manager;
  
  protected final Input.Orientation nativeOrientation;
  
  private final AndroidOnscreenKeyboard onscreenKeyboard;
  
  final float[] orientation;
  
  private float pitch;
  
  float[] pressure = new float[20];
  
  private InputProcessor processor;
  
  int[] realId = new int[20];
  
  boolean requestFocus;
  
  private float roll;
  
  private boolean rotationVectorAvailable;
  
  private SensorEventListener rotationVectorListener;
  
  protected final float[] rotationVectorValues;
  
  private int sleepTime;
  
  private String text;
  
  private Input.TextInputListener textListener;
  
  ArrayList<TouchEvent> touchEvents = new ArrayList();
  
  protected final AndroidTouchHandler touchHandler;
  
  int[] touchX = new int[20];
  
  int[] touchY = new int[20];
  
  boolean[] touched = new boolean[20];
  
  Pool<KeyEvent> usedKeyEvents = new Pool<KeyEvent>(16, 'Ϩ') {
      protected AndroidInput.KeyEvent newObject() { return new AndroidInput.KeyEvent(); }
    };
  
  Pool<TouchEvent> usedTouchEvents = new Pool<TouchEvent>(16, 'Ϩ') {
      protected AndroidInput.TouchEvent newObject() { return new AndroidInput.TouchEvent(); }
    };
  
  protected final Vibrator vibrator;
  
  public AndroidInput(Application paramApplication, Context paramContext, Object paramObject, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    int i = 0;
    this.keyCount = 0;
    this.keys = new boolean[260];
    this.keyJustPressed = false;
    this.justPressedKeys = new boolean[260];
    this.justPressedButtons = new boolean[20];
    this.accelerometerAvailable = false;
    this.accelerometerValues = new float[3];
    this.gyroscopeAvailable = false;
    this.gyroscopeValues = new float[3];
    this.text = null;
    this.textListener = null;
    this.sleepTime = 0;
    this.keysToCatch = new IntSet();
    this.compassAvailable = false;
    this.rotationVectorAvailable = false;
    this.magneticFieldValues = new float[3];
    this.rotationVectorValues = new float[3];
    this.azimuth = 0.0F;
    this.pitch = 0.0F;
    this.roll = 0.0F;
    this.inclination = 0.0F;
    this.justTouched = false;
    this.currentEventTimeStamp = 0L;
    this.requestFocus = true;
    this.R = new float[9];
    this.orientation = new float[3];
    if (paramObject instanceof View) {
      paramObject = (View)paramObject;
      paramObject.setOnKeyListener(this);
      paramObject.setOnTouchListener(this);
      paramObject.setFocusable(true);
      paramObject.setFocusableInTouchMode(true);
      paramObject.requestFocus();
    } 
    this.config = paramAndroidApplicationConfiguration;
    this.onscreenKeyboard = new AndroidOnscreenKeyboard(paramContext, new Handler(), this);
    while (true) {
      int[] arrayOfInt = this.realId;
      if (i < arrayOfInt.length) {
        arrayOfInt[i] = -1;
        i++;
        continue;
      } 
      break;
    } 
    this.handle = new Handler();
    this.app = paramApplication;
    this.context = paramContext;
    this.sleepTime = paramAndroidApplicationConfiguration.touchSleepTime;
    this.touchHandler = new AndroidMultiTouchHandler();
    this.hasMultitouch = this.touchHandler.supportsMultitouch(paramContext);
    this.vibrator = (Vibrator)paramContext.getSystemService("vibrator");
    i = getRotation();
    Graphics.DisplayMode displayMode = this.app.getGraphics().getDisplayMode();
    if (((i == 0 || i == 180) && displayMode.width >= displayMode.height) || ((i == 90 || i == 270) && displayMode.width <= displayMode.height)) {
      this.nativeOrientation = Input.Orientation.Landscape;
    } else {
      this.nativeOrientation = Input.Orientation.Portrait;
    } 
    this.keysToCatch.add(255);
  }
  
  private int[] resize(int[] paramArrayOfInt) {
    int[] arrayOfInt = new int[paramArrayOfInt.length + 2];
    System.arraycopy(paramArrayOfInt, 0, arrayOfInt, 0, paramArrayOfInt.length);
    return arrayOfInt;
  }
  
  private boolean[] resize(boolean[] paramArrayOfBoolean) {
    boolean[] arrayOfBoolean = new boolean[paramArrayOfBoolean.length + 2];
    System.arraycopy(paramArrayOfBoolean, 0, arrayOfBoolean, 0, paramArrayOfBoolean.length);
    return arrayOfBoolean;
  }
  
  private void updateOrientation() {
    if (this.rotationVectorAvailable) {
      SensorManager.getRotationMatrixFromVector(this.R, this.rotationVectorValues);
    } else if (!SensorManager.getRotationMatrix(this.R, null, this.accelerometerValues, this.magneticFieldValues)) {
      return;
    } 
    SensorManager.getOrientation(this.R, this.orientation);
    this.azimuth = (float)Math.toDegrees(this.orientation[0]);
    this.pitch = (float)Math.toDegrees(this.orientation[1]);
    this.roll = (float)Math.toDegrees(this.orientation[2]);
  }
  
  public void addKeyListener(View.OnKeyListener paramOnKeyListener) { this.keyListeners.add(paramOnKeyListener); }
  
  public void cancelVibrate() { this.vibrator.cancel(); }
  
  public float getAccelerometerX() { return this.accelerometerValues[0]; }
  
  public float getAccelerometerY() { return this.accelerometerValues[1]; }
  
  public float getAccelerometerZ() { return this.accelerometerValues[2]; }
  
  public float getAzimuth() {
    if (!this.compassAvailable && !this.rotationVectorAvailable)
      return 0.0F; 
    updateOrientation();
    return this.azimuth;
  }
  
  public long getCurrentEventTime() { return this.currentEventTimeStamp; }
  
  public int getDeltaX() { return this.deltaX[0]; }
  
  public int getDeltaX(int paramInt) { return this.deltaX[paramInt]; }
  
  public int getDeltaY() { return this.deltaY[0]; }
  
  public int getDeltaY(int paramInt) { return this.deltaY[paramInt]; }
  
  public int getFreePointerIndex() {
    int i = this.realId.length;
    for (byte b = 0; b < i; b++) {
      if (this.realId[b] == -1)
        return b; 
    } 
    this.realId = resize(this.realId);
    this.touchX = resize(this.touchX);
    this.touchY = resize(this.touchY);
    this.deltaX = resize(this.deltaX);
    this.deltaY = resize(this.deltaY);
    this.touched = resize(this.touched);
    this.button = resize(this.button);
    return i;
  }
  
  public float getGyroscopeX() { return this.gyroscopeValues[0]; }
  
  public float getGyroscopeY() { return this.gyroscopeValues[1]; }
  
  public float getGyroscopeZ() { return this.gyroscopeValues[2]; }
  
  public InputProcessor getInputProcessor() { return this.processor; }
  
  public int getMaxPointers() { return 20; }
  
  public Input.Orientation getNativeOrientation() { return this.nativeOrientation; }
  
  public float getPitch() {
    if (!this.compassAvailable && !this.rotationVectorAvailable)
      return 0.0F; 
    updateOrientation();
    return this.pitch;
  }
  
  public float getPressure() { return getPressure(0); }
  
  public float getPressure(int paramInt) { return this.pressure[paramInt]; }
  
  public float getRoll() {
    if (!this.compassAvailable && !this.rotationVectorAvailable)
      return 0.0F; 
    updateOrientation();
    return this.roll;
  }
  
  public int getRotation() {
    int i;
    Context context1 = this.context;
    if (context1 instanceof Activity) {
      i = ((Activity)context1).getWindowManager().getDefaultDisplay().getRotation();
    } else {
      i = ((WindowManager)context1.getSystemService("window")).getDefaultDisplay().getRotation();
    } 
    return (i != 0) ? ((i != 1) ? ((i != 2) ? ((i != 3) ? 0 : 270) : 180) : 90) : 0;
  }
  
  public void getRotationMatrix(float[] paramArrayOfFloat) {
    if (this.rotationVectorAvailable) {
      SensorManager.getRotationMatrixFromVector(paramArrayOfFloat, this.rotationVectorValues);
    } else {
      SensorManager.getRotationMatrix(paramArrayOfFloat, null, this.accelerometerValues, this.magneticFieldValues);
    } 
  }
  
  public void getTextInput(final Input.TextInputListener listener, final String title, final String text, final String hint) { this.handle.post(new Runnable() {
          public void run() {
            AlertDialog.Builder builder = new AlertDialog.Builder(AndroidInput.this.context);
            builder.setTitle(title);
            final EditText input = new EditText(AndroidInput.this.context);
            editText.setHint(hint);
            editText.setText(text);
            editText.setSingleLine();
            builder.setView(editText);
            builder.setPositiveButton(AndroidInput.this.context.getString(17039370), new DialogInterface.OnClickListener() {
                  public void onClick(DialogInterface param2DialogInterface, int param2Int) { Gdx.app.postRunnable(new Runnable() {
                          public void run() { listener.input(input.getText().toString()); }
                        }); }
                });
            builder.setNegativeButton(AndroidInput.this.context.getString(17039360), new DialogInterface.OnClickListener() {
                  public void onClick(DialogInterface param2DialogInterface, int param2Int) { Gdx.app.postRunnable(new Runnable() {
                          public void run() { listener.canceled(); }
                        }); }
                });
            builder.setOnCancelListener(new DialogInterface.OnCancelListener() {
                  public void onCancel(DialogInterface param2DialogInterface) { Gdx.app.postRunnable(new Runnable() {
                          public void run() { listener.canceled(); }
                        }); }
                });
            builder.show();
          }
        }); }
  
  public int getX() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield touchX : [I
    //   6: iconst_0
    //   7: iaload
    //   8: istore_1
    //   9: aload_0
    //   10: monitorexit
    //   11: iload_1
    //   12: ireturn
    //   13: astore_2
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_2
    //   17: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	13	finally
    //   14	16	13	finally }
  
  public int getX(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield touchX : [I
    //   6: iload_1
    //   7: iaload
    //   8: istore_1
    //   9: aload_0
    //   10: monitorexit
    //   11: iload_1
    //   12: ireturn
    //   13: astore_2
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_2
    //   17: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	13	finally
    //   14	16	13	finally }
  
  public int getY() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield touchY : [I
    //   6: iconst_0
    //   7: iaload
    //   8: istore_1
    //   9: aload_0
    //   10: monitorexit
    //   11: iload_1
    //   12: ireturn
    //   13: astore_2
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_2
    //   17: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	13	finally
    //   14	16	13	finally }
  
  public int getY(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield touchY : [I
    //   6: iload_1
    //   7: iaload
    //   8: istore_1
    //   9: aload_0
    //   10: monitorexit
    //   11: iload_1
    //   12: ireturn
    //   13: astore_2
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_2
    //   17: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	13	finally
    //   14	16	13	finally }
  
  public boolean isButtonJustPressed(int paramInt) { return (paramInt < 0 || paramInt > 20) ? false : this.justPressedButtons[paramInt]; }
  
  public boolean isButtonPressed(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield hasMultitouch : Z
    //   6: istore_2
    //   7: iconst_1
    //   8: istore_3
    //   9: iload_2
    //   10: ifeq -> 54
    //   13: iconst_0
    //   14: istore #4
    //   16: iload #4
    //   18: bipush #20
    //   20: if_icmpge -> 54
    //   23: aload_0
    //   24: getfield touched : [Z
    //   27: iload #4
    //   29: baload
    //   30: ifeq -> 48
    //   33: aload_0
    //   34: getfield button : [I
    //   37: iload #4
    //   39: iaload
    //   40: iload_1
    //   41: if_icmpne -> 48
    //   44: aload_0
    //   45: monitorexit
    //   46: iconst_1
    //   47: ireturn
    //   48: iinc #4, 1
    //   51: goto -> 16
    //   54: aload_0
    //   55: getfield touched : [Z
    //   58: iconst_0
    //   59: baload
    //   60: ifeq -> 76
    //   63: aload_0
    //   64: getfield button : [I
    //   67: iconst_0
    //   68: iaload
    //   69: iload_1
    //   70: if_icmpne -> 76
    //   73: goto -> 78
    //   76: iconst_0
    //   77: istore_3
    //   78: aload_0
    //   79: monitorexit
    //   80: iload_3
    //   81: ireturn
    //   82: astore #5
    //   84: aload_0
    //   85: monitorexit
    //   86: goto -> 92
    //   89: aload #5
    //   91: athrow
    //   92: goto -> 89
    // Exception table:
    //   from	to	target	type
    //   2	7	82	finally
    //   23	46	82	finally
    //   54	73	82	finally
    //   78	80	82	finally
    //   84	86	82	finally }
  
  public boolean isCatchBackKey() { return this.keysToCatch.contains(4); }
  
  public boolean isCatchKey(int paramInt) { return this.keysToCatch.contains(this.keyCount); }
  
  public boolean isCatchMenuKey() { return this.keysToCatch.contains(82); }
  
  public boolean isCursorCatched() { return false; }
  
  public boolean isKeyJustPressed(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iload_1
    //   3: iconst_m1
    //   4: if_icmpne -> 20
    //   7: aload_0
    //   8: getfield keyJustPressed : Z
    //   11: istore_2
    //   12: aload_0
    //   13: monitorexit
    //   14: iload_2
    //   15: ireturn
    //   16: astore_3
    //   17: goto -> 45
    //   20: iload_1
    //   21: iflt -> 49
    //   24: iload_1
    //   25: sipush #260
    //   28: if_icmplt -> 34
    //   31: goto -> 49
    //   34: aload_0
    //   35: getfield justPressedKeys : [Z
    //   38: iload_1
    //   39: baload
    //   40: istore_2
    //   41: aload_0
    //   42: monitorexit
    //   43: iload_2
    //   44: ireturn
    //   45: aload_0
    //   46: monitorexit
    //   47: aload_3
    //   48: athrow
    //   49: aload_0
    //   50: monitorexit
    //   51: iconst_0
    //   52: ireturn
    // Exception table:
    //   from	to	target	type
    //   7	12	16	finally
    //   34	41	16	finally }
  
  public boolean isKeyPressed(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore_2
    //   4: iload_1
    //   5: iconst_m1
    //   6: if_icmpne -> 28
    //   9: aload_0
    //   10: getfield keyCount : I
    //   13: istore_1
    //   14: iload_1
    //   15: ifle -> 20
    //   18: iconst_1
    //   19: istore_2
    //   20: aload_0
    //   21: monitorexit
    //   22: iload_2
    //   23: ireturn
    //   24: astore_3
    //   25: goto -> 53
    //   28: iload_1
    //   29: iflt -> 57
    //   32: iload_1
    //   33: sipush #260
    //   36: if_icmplt -> 42
    //   39: goto -> 57
    //   42: aload_0
    //   43: getfield keys : [Z
    //   46: iload_1
    //   47: baload
    //   48: istore_2
    //   49: aload_0
    //   50: monitorexit
    //   51: iload_2
    //   52: ireturn
    //   53: aload_0
    //   54: monitorexit
    //   55: aload_3
    //   56: athrow
    //   57: aload_0
    //   58: monitorexit
    //   59: iconst_0
    //   60: ireturn
    // Exception table:
    //   from	to	target	type
    //   9	14	24	finally
    //   42	49	24	finally }
  
  public boolean isPeripheralAvailable(Input.Peripheral paramPeripheral) {
    Vibrator vibrator1;
    if (paramPeripheral == Input.Peripheral.Accelerometer)
      return this.accelerometerAvailable; 
    if (paramPeripheral == Input.Peripheral.Gyroscope)
      return this.gyroscopeAvailable; 
    if (paramPeripheral == Input.Peripheral.Compass)
      return this.compassAvailable; 
    if (paramPeripheral == Input.Peripheral.HardwareKeyboard)
      return this.keyboardAvailable; 
    Input.Peripheral peripheral = Input.Peripheral.OnscreenKeyboard;
    boolean bool = true;
    boolean bool1 = true;
    if (paramPeripheral == peripheral)
      return true; 
    if (paramPeripheral == Input.Peripheral.Vibrator) {
      if (Build.VERSION.SDK_INT >= 11) {
        vibrator1 = this.vibrator;
        if (vibrator1 == null || !vibrator1.hasVibrator())
          bool1 = false; 
        return bool1;
      } 
      if (this.vibrator != null) {
        bool1 = bool;
      } else {
        bool1 = false;
      } 
      return bool1;
    } 
    return (vibrator1 == Input.Peripheral.MultitouchScreen) ? this.hasMultitouch : ((vibrator1 == Input.Peripheral.RotationVector) ? this.rotationVectorAvailable : ((vibrator1 == Input.Peripheral.Pressure) ? 1 : 0));
  }
  
  public boolean isTouched() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield hasMultitouch : Z
    //   6: ifeq -> 36
    //   9: iconst_0
    //   10: istore_1
    //   11: iload_1
    //   12: bipush #20
    //   14: if_icmpge -> 36
    //   17: aload_0
    //   18: getfield touched : [Z
    //   21: iload_1
    //   22: baload
    //   23: ifeq -> 30
    //   26: aload_0
    //   27: monitorexit
    //   28: iconst_1
    //   29: ireturn
    //   30: iinc #1, 1
    //   33: goto -> 11
    //   36: aload_0
    //   37: getfield touched : [Z
    //   40: iconst_0
    //   41: baload
    //   42: istore_2
    //   43: aload_0
    //   44: monitorexit
    //   45: iload_2
    //   46: ireturn
    //   47: astore_3
    //   48: aload_0
    //   49: monitorexit
    //   50: goto -> 55
    //   53: aload_3
    //   54: athrow
    //   55: goto -> 53
    // Exception table:
    //   from	to	target	type
    //   2	9	47	finally
    //   17	28	47	finally
    //   36	45	47	finally
    //   48	50	47	finally }
  
  public boolean isTouched(int paramInt) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield touched : [Z
    //   6: iload_1
    //   7: baload
    //   8: istore_2
    //   9: aload_0
    //   10: monitorexit
    //   11: iload_2
    //   12: ireturn
    //   13: astore_3
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_3
    //   17: athrow
    // Exception table:
    //   from	to	target	type
    //   2	11	13	finally
    //   14	16	13	finally }
  
  public boolean justTouched() { return this.justTouched; }
  
  public int lookUpPointerIndex(int paramInt) {
    int i = this.realId.length;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      if (this.realId[b2] == paramInt)
        return b2; 
    } 
    StringBuilder stringBuilder1 = new StringBuilder();
    for (b2 = b1; b2 < i; b2++) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(b2);
      stringBuilder.append(":");
      stringBuilder.append(this.realId[b2]);
      stringBuilder.append(" ");
      stringBuilder1.append(stringBuilder.toString());
    } 
    Application application = Gdx.app;
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append("Pointer ID lookup failed: ");
    stringBuilder2.append(paramInt);
    stringBuilder2.append(", ");
    stringBuilder2.append(stringBuilder1.toString());
    application.log("AndroidInput", stringBuilder2.toString());
    return -1;
  }
  
  public void onDrop(int paramInt1, int paramInt2) { postTap(paramInt1, paramInt2); }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent) { // Byte code:
    //   0: aload_0
    //   1: getfield keyListeners : Ljava/util/ArrayList;
    //   4: invokevirtual size : ()I
    //   7: istore #4
    //   9: iconst_0
    //   10: istore #5
    //   12: iload #5
    //   14: iload #4
    //   16: if_icmpge -> 50
    //   19: aload_0
    //   20: getfield keyListeners : Ljava/util/ArrayList;
    //   23: iload #5
    //   25: invokevirtual get : (I)Ljava/lang/Object;
    //   28: checkcast android/view/View$OnKeyListener
    //   31: aload_1
    //   32: iload_2
    //   33: aload_3
    //   34: invokeinterface onKey : (Landroid/view/View;ILandroid/view/KeyEvent;)Z
    //   39: ifeq -> 44
    //   42: iconst_1
    //   43: ireturn
    //   44: iinc #5, 1
    //   47: goto -> 12
    //   50: aload_3
    //   51: invokevirtual getAction : ()I
    //   54: ifne -> 73
    //   57: aload_3
    //   58: invokevirtual getRepeatCount : ()I
    //   61: ifle -> 73
    //   64: aload_0
    //   65: getfield keysToCatch : Lcom/badlogic/gdx/utils/IntSet;
    //   68: iload_2
    //   69: invokevirtual contains : (I)Z
    //   72: ireturn
    //   73: aload_0
    //   74: monitorenter
    //   75: aload_3
    //   76: invokevirtual getKeyCode : ()I
    //   79: ifne -> 161
    //   82: aload_3
    //   83: invokevirtual getAction : ()I
    //   86: iconst_2
    //   87: if_icmpne -> 161
    //   90: aload_3
    //   91: invokevirtual getCharacters : ()Ljava/lang/String;
    //   94: astore_3
    //   95: iconst_0
    //   96: istore_2
    //   97: iload_2
    //   98: aload_3
    //   99: invokevirtual length : ()I
    //   102: if_icmpge -> 157
    //   105: aload_0
    //   106: getfield usedKeyEvents : Lcom/badlogic/gdx/utils/Pool;
    //   109: invokevirtual obtain : ()Ljava/lang/Object;
    //   112: checkcast com/badlogic/gdx/backends/android/AndroidInput$KeyEvent
    //   115: astore_1
    //   116: aload_1
    //   117: invokestatic nanoTime : ()J
    //   120: putfield timeStamp : J
    //   123: aload_1
    //   124: iconst_0
    //   125: putfield keyCode : I
    //   128: aload_1
    //   129: aload_3
    //   130: iload_2
    //   131: invokevirtual charAt : (I)C
    //   134: putfield keyChar : C
    //   137: aload_1
    //   138: iconst_2
    //   139: putfield type : I
    //   142: aload_0
    //   143: getfield keyEvents : Ljava/util/ArrayList;
    //   146: aload_1
    //   147: invokevirtual add : (Ljava/lang/Object;)Z
    //   150: pop
    //   151: iinc #2, 1
    //   154: goto -> 97
    //   157: aload_0
    //   158: monitorexit
    //   159: iconst_0
    //   160: ireturn
    //   161: aload_3
    //   162: invokevirtual getUnicodeChar : ()I
    //   165: i2c
    //   166: istore #4
    //   168: iload_2
    //   169: bipush #67
    //   171: if_icmpne -> 178
    //   174: bipush #8
    //   176: istore #4
    //   178: aload_3
    //   179: invokevirtual getKeyCode : ()I
    //   182: iflt -> 568
    //   185: aload_3
    //   186: invokevirtual getKeyCode : ()I
    //   189: sipush #260
    //   192: if_icmplt -> 198
    //   195: goto -> 568
    //   198: aload_3
    //   199: invokevirtual getAction : ()I
    //   202: istore #5
    //   204: iload #5
    //   206: ifeq -> 429
    //   209: iload #5
    //   211: iconst_1
    //   212: if_icmpeq -> 218
    //   215: goto -> 543
    //   218: invokestatic nanoTime : ()J
    //   221: lstore #6
    //   223: aload_0
    //   224: getfield usedKeyEvents : Lcom/badlogic/gdx/utils/Pool;
    //   227: invokevirtual obtain : ()Ljava/lang/Object;
    //   230: checkcast com/badlogic/gdx/backends/android/AndroidInput$KeyEvent
    //   233: astore_1
    //   234: aload_1
    //   235: lload #6
    //   237: putfield timeStamp : J
    //   240: aload_1
    //   241: iconst_0
    //   242: i2c
    //   243: putfield keyChar : C
    //   246: aload_1
    //   247: aload_3
    //   248: invokevirtual getKeyCode : ()I
    //   251: putfield keyCode : I
    //   254: aload_1
    //   255: iconst_1
    //   256: putfield type : I
    //   259: iload_2
    //   260: istore #5
    //   262: iload_2
    //   263: iconst_4
    //   264: if_icmpne -> 289
    //   267: iload_2
    //   268: istore #5
    //   270: aload_3
    //   271: invokevirtual isAltPressed : ()Z
    //   274: ifeq -> 289
    //   277: aload_1
    //   278: sipush #255
    //   281: putfield keyCode : I
    //   284: sipush #255
    //   287: istore #5
    //   289: aload_0
    //   290: getfield keyEvents : Ljava/util/ArrayList;
    //   293: aload_1
    //   294: invokevirtual add : (Ljava/lang/Object;)Z
    //   297: pop
    //   298: aload_0
    //   299: getfield usedKeyEvents : Lcom/badlogic/gdx/utils/Pool;
    //   302: invokevirtual obtain : ()Ljava/lang/Object;
    //   305: checkcast com/badlogic/gdx/backends/android/AndroidInput$KeyEvent
    //   308: astore_1
    //   309: aload_1
    //   310: lload #6
    //   312: putfield timeStamp : J
    //   315: aload_1
    //   316: iload #4
    //   318: i2c
    //   319: putfield keyChar : C
    //   322: aload_1
    //   323: iconst_0
    //   324: putfield keyCode : I
    //   327: aload_1
    //   328: iconst_2
    //   329: putfield type : I
    //   332: aload_0
    //   333: getfield keyEvents : Ljava/util/ArrayList;
    //   336: aload_1
    //   337: invokevirtual add : (Ljava/lang/Object;)Z
    //   340: pop
    //   341: iload #5
    //   343: sipush #255
    //   346: if_icmpne -> 388
    //   349: iload #5
    //   351: istore_2
    //   352: aload_0
    //   353: getfield keys : [Z
    //   356: sipush #255
    //   359: baload
    //   360: ifeq -> 543
    //   363: aload_0
    //   364: aload_0
    //   365: getfield keyCount : I
    //   368: iconst_1
    //   369: isub
    //   370: putfield keyCount : I
    //   373: aload_0
    //   374: getfield keys : [Z
    //   377: sipush #255
    //   380: iconst_0
    //   381: bastore
    //   382: iload #5
    //   384: istore_2
    //   385: goto -> 543
    //   388: iload #5
    //   390: istore_2
    //   391: aload_0
    //   392: getfield keys : [Z
    //   395: aload_3
    //   396: invokevirtual getKeyCode : ()I
    //   399: baload
    //   400: ifeq -> 543
    //   403: aload_0
    //   404: aload_0
    //   405: getfield keyCount : I
    //   408: iconst_1
    //   409: isub
    //   410: putfield keyCount : I
    //   413: aload_0
    //   414: getfield keys : [Z
    //   417: aload_3
    //   418: invokevirtual getKeyCode : ()I
    //   421: iconst_0
    //   422: bastore
    //   423: iload #5
    //   425: istore_2
    //   426: goto -> 543
    //   429: aload_0
    //   430: getfield usedKeyEvents : Lcom/badlogic/gdx/utils/Pool;
    //   433: invokevirtual obtain : ()Ljava/lang/Object;
    //   436: checkcast com/badlogic/gdx/backends/android/AndroidInput$KeyEvent
    //   439: astore_1
    //   440: aload_1
    //   441: invokestatic nanoTime : ()J
    //   444: putfield timeStamp : J
    //   447: aload_1
    //   448: iconst_0
    //   449: i2c
    //   450: putfield keyChar : C
    //   453: aload_1
    //   454: aload_3
    //   455: invokevirtual getKeyCode : ()I
    //   458: putfield keyCode : I
    //   461: aload_1
    //   462: iconst_0
    //   463: putfield type : I
    //   466: iload_2
    //   467: istore #5
    //   469: iload_2
    //   470: iconst_4
    //   471: if_icmpne -> 496
    //   474: iload_2
    //   475: istore #5
    //   477: aload_3
    //   478: invokevirtual isAltPressed : ()Z
    //   481: ifeq -> 496
    //   484: aload_1
    //   485: sipush #255
    //   488: putfield keyCode : I
    //   491: sipush #255
    //   494: istore #5
    //   496: aload_0
    //   497: getfield keyEvents : Ljava/util/ArrayList;
    //   500: aload_1
    //   501: invokevirtual add : (Ljava/lang/Object;)Z
    //   504: pop
    //   505: iload #5
    //   507: istore_2
    //   508: aload_0
    //   509: getfield keys : [Z
    //   512: aload_1
    //   513: getfield keyCode : I
    //   516: baload
    //   517: ifne -> 543
    //   520: aload_0
    //   521: aload_0
    //   522: getfield keyCount : I
    //   525: iconst_1
    //   526: iadd
    //   527: putfield keyCount : I
    //   530: aload_0
    //   531: getfield keys : [Z
    //   534: aload_1
    //   535: getfield keyCode : I
    //   538: iconst_1
    //   539: bastore
    //   540: iload #5
    //   542: istore_2
    //   543: aload_0
    //   544: getfield app : Lcom/badlogic/gdx/Application;
    //   547: invokeinterface getGraphics : ()Lcom/badlogic/gdx/Graphics;
    //   552: invokeinterface requestRendering : ()V
    //   557: aload_0
    //   558: monitorexit
    //   559: aload_0
    //   560: getfield keysToCatch : Lcom/badlogic/gdx/utils/IntSet;
    //   563: iload_2
    //   564: invokevirtual contains : (I)Z
    //   567: ireturn
    //   568: aload_0
    //   569: monitorexit
    //   570: iconst_0
    //   571: ireturn
    //   572: astore_1
    //   573: aload_0
    //   574: monitorexit
    //   575: goto -> 580
    //   578: aload_1
    //   579: athrow
    //   580: goto -> 578
    // Exception table:
    //   from	to	target	type
    //   75	95	572	finally
    //   97	151	572	finally
    //   157	159	572	finally
    //   161	168	572	finally
    //   178	195	572	finally
    //   198	204	572	finally
    //   218	259	572	finally
    //   270	284	572	finally
    //   289	341	572	finally
    //   352	382	572	finally
    //   391	423	572	finally
    //   429	466	572	finally
    //   477	491	572	finally
    //   496	505	572	finally
    //   508	540	572	finally
    //   543	559	572	finally
    //   568	570	572	finally
    //   573	575	572	finally }
  
  public void onPause() {
    unregisterSensorListeners();
    Arrays.fill(this.realId, -1);
    Arrays.fill(this.touched, false);
  }
  
  public void onResume() { registerSensorListeners(); }
  
  public void onTap(int paramInt1, int paramInt2) { postTap(paramInt1, paramInt2); }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent) {
    if (this.requestFocus && paramView != null) {
      paramView.setFocusableInTouchMode(true);
      paramView.requestFocus();
      this.requestFocus = false;
    } 
    this.touchHandler.onTouch(paramMotionEvent, this);
    int i = this.sleepTime;
    if (i != 0) {
      long l = i;
      try {
        Thread.sleep(l);
      } catch (InterruptedException paramView) {}
    } 
    return true;
  }
  
  protected void postTap(int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield usedTouchEvents : Lcom/badlogic/gdx/utils/Pool;
    //   6: invokevirtual obtain : ()Ljava/lang/Object;
    //   9: checkcast com/badlogic/gdx/backends/android/AndroidInput$TouchEvent
    //   12: astore_3
    //   13: aload_3
    //   14: invokestatic nanoTime : ()J
    //   17: putfield timeStamp : J
    //   20: aload_3
    //   21: iconst_0
    //   22: putfield pointer : I
    //   25: aload_3
    //   26: iload_1
    //   27: putfield x : I
    //   30: aload_3
    //   31: iload_2
    //   32: putfield y : I
    //   35: aload_3
    //   36: iconst_0
    //   37: putfield type : I
    //   40: aload_0
    //   41: getfield touchEvents : Ljava/util/ArrayList;
    //   44: aload_3
    //   45: invokevirtual add : (Ljava/lang/Object;)Z
    //   48: pop
    //   49: aload_0
    //   50: getfield usedTouchEvents : Lcom/badlogic/gdx/utils/Pool;
    //   53: invokevirtual obtain : ()Ljava/lang/Object;
    //   56: checkcast com/badlogic/gdx/backends/android/AndroidInput$TouchEvent
    //   59: astore_3
    //   60: aload_3
    //   61: invokestatic nanoTime : ()J
    //   64: putfield timeStamp : J
    //   67: aload_3
    //   68: iconst_0
    //   69: putfield pointer : I
    //   72: aload_3
    //   73: iload_1
    //   74: putfield x : I
    //   77: aload_3
    //   78: iload_2
    //   79: putfield y : I
    //   82: aload_3
    //   83: iconst_1
    //   84: putfield type : I
    //   87: aload_0
    //   88: getfield touchEvents : Ljava/util/ArrayList;
    //   91: aload_3
    //   92: invokevirtual add : (Ljava/lang/Object;)Z
    //   95: pop
    //   96: aload_0
    //   97: monitorexit
    //   98: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   101: invokeinterface getGraphics : ()Lcom/badlogic/gdx/Graphics;
    //   106: invokeinterface requestRendering : ()V
    //   111: return
    //   112: astore_3
    //   113: aload_0
    //   114: monitorexit
    //   115: aload_3
    //   116: athrow
    // Exception table:
    //   from	to	target	type
    //   2	98	112	finally
    //   113	115	112	finally }
  
  void processEvents() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield justTouched : Z
    //   6: ifeq -> 38
    //   9: aload_0
    //   10: iconst_0
    //   11: putfield justTouched : Z
    //   14: iconst_0
    //   15: istore_1
    //   16: iload_1
    //   17: aload_0
    //   18: getfield justPressedButtons : [Z
    //   21: arraylength
    //   22: if_icmpge -> 38
    //   25: aload_0
    //   26: getfield justPressedButtons : [Z
    //   29: iload_1
    //   30: iconst_0
    //   31: bastore
    //   32: iinc #1, 1
    //   35: goto -> 16
    //   38: aload_0
    //   39: getfield keyJustPressed : Z
    //   42: ifeq -> 74
    //   45: aload_0
    //   46: iconst_0
    //   47: putfield keyJustPressed : Z
    //   50: iconst_0
    //   51: istore_1
    //   52: iload_1
    //   53: aload_0
    //   54: getfield justPressedKeys : [Z
    //   57: arraylength
    //   58: if_icmpge -> 74
    //   61: aload_0
    //   62: getfield justPressedKeys : [Z
    //   65: iload_1
    //   66: iconst_0
    //   67: bastore
    //   68: iinc #1, 1
    //   71: goto -> 52
    //   74: aload_0
    //   75: getfield processor : Lcom/badlogic/gdx/InputProcessor;
    //   78: ifnull -> 447
    //   81: aload_0
    //   82: getfield processor : Lcom/badlogic/gdx/InputProcessor;
    //   85: astore_2
    //   86: aload_0
    //   87: getfield keyEvents : Ljava/util/ArrayList;
    //   90: invokevirtual size : ()I
    //   93: istore_3
    //   94: iconst_0
    //   95: istore_1
    //   96: iload_1
    //   97: iload_3
    //   98: if_icmpge -> 223
    //   101: aload_0
    //   102: getfield keyEvents : Ljava/util/ArrayList;
    //   105: iload_1
    //   106: invokevirtual get : (I)Ljava/lang/Object;
    //   109: checkcast com/badlogic/gdx/backends/android/AndroidInput$KeyEvent
    //   112: astore #4
    //   114: aload_0
    //   115: aload #4
    //   117: getfield timeStamp : J
    //   120: putfield currentEventTimeStamp : J
    //   123: aload #4
    //   125: getfield type : I
    //   128: istore #5
    //   130: iload #5
    //   132: ifeq -> 180
    //   135: iload #5
    //   137: iconst_1
    //   138: if_icmpeq -> 165
    //   141: iload #5
    //   143: iconst_2
    //   144: if_icmpeq -> 150
    //   147: goto -> 208
    //   150: aload_2
    //   151: aload #4
    //   153: getfield keyChar : C
    //   156: invokeinterface keyTyped : (C)Z
    //   161: pop
    //   162: goto -> 208
    //   165: aload_2
    //   166: aload #4
    //   168: getfield keyCode : I
    //   171: invokeinterface keyUp : (I)Z
    //   176: pop
    //   177: goto -> 208
    //   180: aload_2
    //   181: aload #4
    //   183: getfield keyCode : I
    //   186: invokeinterface keyDown : (I)Z
    //   191: pop
    //   192: aload_0
    //   193: iconst_1
    //   194: putfield keyJustPressed : Z
    //   197: aload_0
    //   198: getfield justPressedKeys : [Z
    //   201: aload #4
    //   203: getfield keyCode : I
    //   206: iconst_1
    //   207: bastore
    //   208: aload_0
    //   209: getfield usedKeyEvents : Lcom/badlogic/gdx/utils/Pool;
    //   212: aload #4
    //   214: invokevirtual free : (Ljava/lang/Object;)V
    //   217: iinc #1, 1
    //   220: goto -> 96
    //   223: aload_0
    //   224: getfield touchEvents : Ljava/util/ArrayList;
    //   227: invokevirtual size : ()I
    //   230: istore_3
    //   231: iconst_0
    //   232: istore_1
    //   233: iload_1
    //   234: iload_3
    //   235: if_icmpge -> 536
    //   238: aload_0
    //   239: getfield touchEvents : Ljava/util/ArrayList;
    //   242: iload_1
    //   243: invokevirtual get : (I)Ljava/lang/Object;
    //   246: checkcast com/badlogic/gdx/backends/android/AndroidInput$TouchEvent
    //   249: astore #4
    //   251: aload_0
    //   252: aload #4
    //   254: getfield timeStamp : J
    //   257: putfield currentEventTimeStamp : J
    //   260: aload #4
    //   262: getfield type : I
    //   265: istore #5
    //   267: iload #5
    //   269: ifeq -> 389
    //   272: iload #5
    //   274: iconst_1
    //   275: if_icmpeq -> 359
    //   278: iload #5
    //   280: iconst_2
    //   281: if_icmpeq -> 334
    //   284: iload #5
    //   286: iconst_3
    //   287: if_icmpeq -> 319
    //   290: iload #5
    //   292: iconst_4
    //   293: if_icmpeq -> 299
    //   296: goto -> 432
    //   299: aload_2
    //   300: aload #4
    //   302: getfield x : I
    //   305: aload #4
    //   307: getfield y : I
    //   310: invokeinterface mouseMoved : (II)Z
    //   315: pop
    //   316: goto -> 432
    //   319: aload_2
    //   320: aload #4
    //   322: getfield scrollAmount : I
    //   325: invokeinterface scrolled : (I)Z
    //   330: pop
    //   331: goto -> 432
    //   334: aload_2
    //   335: aload #4
    //   337: getfield x : I
    //   340: aload #4
    //   342: getfield y : I
    //   345: aload #4
    //   347: getfield pointer : I
    //   350: invokeinterface touchDragged : (III)Z
    //   355: pop
    //   356: goto -> 432
    //   359: aload_2
    //   360: aload #4
    //   362: getfield x : I
    //   365: aload #4
    //   367: getfield y : I
    //   370: aload #4
    //   372: getfield pointer : I
    //   375: aload #4
    //   377: getfield button : I
    //   380: invokeinterface touchUp : (IIII)Z
    //   385: pop
    //   386: goto -> 432
    //   389: aload_2
    //   390: aload #4
    //   392: getfield x : I
    //   395: aload #4
    //   397: getfield y : I
    //   400: aload #4
    //   402: getfield pointer : I
    //   405: aload #4
    //   407: getfield button : I
    //   410: invokeinterface touchDown : (IIII)Z
    //   415: pop
    //   416: aload_0
    //   417: iconst_1
    //   418: putfield justTouched : Z
    //   421: aload_0
    //   422: getfield justPressedButtons : [Z
    //   425: aload #4
    //   427: getfield button : I
    //   430: iconst_1
    //   431: bastore
    //   432: aload_0
    //   433: getfield usedTouchEvents : Lcom/badlogic/gdx/utils/Pool;
    //   436: aload #4
    //   438: invokevirtual free : (Ljava/lang/Object;)V
    //   441: iinc #1, 1
    //   444: goto -> 233
    //   447: aload_0
    //   448: getfield touchEvents : Ljava/util/ArrayList;
    //   451: invokevirtual size : ()I
    //   454: istore_3
    //   455: iconst_0
    //   456: istore_1
    //   457: iload_1
    //   458: iload_3
    //   459: if_icmpge -> 500
    //   462: aload_0
    //   463: getfield touchEvents : Ljava/util/ArrayList;
    //   466: iload_1
    //   467: invokevirtual get : (I)Ljava/lang/Object;
    //   470: checkcast com/badlogic/gdx/backends/android/AndroidInput$TouchEvent
    //   473: astore_2
    //   474: aload_2
    //   475: getfield type : I
    //   478: ifne -> 486
    //   481: aload_0
    //   482: iconst_1
    //   483: putfield justTouched : Z
    //   486: aload_0
    //   487: getfield usedTouchEvents : Lcom/badlogic/gdx/utils/Pool;
    //   490: aload_2
    //   491: invokevirtual free : (Ljava/lang/Object;)V
    //   494: iinc #1, 1
    //   497: goto -> 457
    //   500: aload_0
    //   501: getfield keyEvents : Ljava/util/ArrayList;
    //   504: invokevirtual size : ()I
    //   507: istore_3
    //   508: iconst_0
    //   509: istore_1
    //   510: iload_1
    //   511: iload_3
    //   512: if_icmpge -> 536
    //   515: aload_0
    //   516: getfield usedKeyEvents : Lcom/badlogic/gdx/utils/Pool;
    //   519: aload_0
    //   520: getfield keyEvents : Ljava/util/ArrayList;
    //   523: iload_1
    //   524: invokevirtual get : (I)Ljava/lang/Object;
    //   527: invokevirtual free : (Ljava/lang/Object;)V
    //   530: iinc #1, 1
    //   533: goto -> 510
    //   536: aload_0
    //   537: getfield touchEvents : Ljava/util/ArrayList;
    //   540: invokevirtual isEmpty : ()Z
    //   543: ifeq -> 577
    //   546: iconst_0
    //   547: istore_1
    //   548: iload_1
    //   549: aload_0
    //   550: getfield deltaX : [I
    //   553: arraylength
    //   554: if_icmpge -> 577
    //   557: aload_0
    //   558: getfield deltaX : [I
    //   561: iconst_0
    //   562: iconst_0
    //   563: iastore
    //   564: aload_0
    //   565: getfield deltaY : [I
    //   568: iconst_0
    //   569: iconst_0
    //   570: iastore
    //   571: iinc #1, 1
    //   574: goto -> 548
    //   577: aload_0
    //   578: getfield keyEvents : Ljava/util/ArrayList;
    //   581: invokevirtual clear : ()V
    //   584: aload_0
    //   585: getfield touchEvents : Ljava/util/ArrayList;
    //   588: invokevirtual clear : ()V
    //   591: aload_0
    //   592: monitorexit
    //   593: return
    //   594: astore_2
    //   595: aload_0
    //   596: monitorexit
    //   597: goto -> 602
    //   600: aload_2
    //   601: athrow
    //   602: goto -> 600
    // Exception table:
    //   from	to	target	type
    //   2	14	594	finally
    //   16	32	594	finally
    //   38	50	594	finally
    //   52	68	594	finally
    //   74	94	594	finally
    //   101	130	594	finally
    //   150	162	594	finally
    //   165	177	594	finally
    //   180	208	594	finally
    //   208	217	594	finally
    //   223	231	594	finally
    //   238	267	594	finally
    //   299	316	594	finally
    //   319	331	594	finally
    //   334	356	594	finally
    //   359	386	594	finally
    //   389	432	594	finally
    //   432	441	594	finally
    //   447	455	594	finally
    //   462	486	594	finally
    //   486	494	594	finally
    //   500	508	594	finally
    //   515	530	594	finally
    //   536	546	594	finally
    //   548	571	594	finally
    //   577	593	594	finally
    //   595	597	594	finally }
  
  void registerSensorListeners() {
    if (this.config.useAccelerometer) {
      this.manager = (SensorManager)this.context.getSystemService("sensor");
      if (this.manager.getSensorList(1).isEmpty()) {
        this.accelerometerAvailable = false;
      } else {
        Sensor sensor = (Sensor)this.manager.getSensorList(1).get(0);
        this.accelerometerListener = new SensorListener();
        this.accelerometerAvailable = this.manager.registerListener(this.accelerometerListener, sensor, this.config.sensorDelay);
      } 
    } else {
      this.accelerometerAvailable = false;
    } 
    if (this.config.useGyroscope) {
      this.manager = (SensorManager)this.context.getSystemService("sensor");
      if (this.manager.getSensorList(4).isEmpty()) {
        this.gyroscopeAvailable = false;
      } else {
        Sensor sensor = (Sensor)this.manager.getSensorList(4).get(0);
        this.gyroscopeListener = new SensorListener();
        this.gyroscopeAvailable = this.manager.registerListener(this.gyroscopeListener, sensor, this.config.sensorDelay);
      } 
    } else {
      this.gyroscopeAvailable = false;
    } 
    this.rotationVectorAvailable = false;
    if (this.config.useRotationVectorSensor) {
      if (this.manager == null)
        this.manager = (SensorManager)this.context.getSystemService("sensor"); 
      List list = this.manager.getSensorList(11);
      if (!list.isEmpty()) {
        this.rotationVectorListener = new SensorListener();
        for (Sensor sensor : list) {
          if (sensor.getVendor().equals("Google Inc.") && sensor.getVersion() == 3) {
            this.rotationVectorAvailable = this.manager.registerListener(this.rotationVectorListener, sensor, this.config.sensorDelay);
            break;
          } 
        } 
        if (!this.rotationVectorAvailable)
          this.rotationVectorAvailable = this.manager.registerListener(this.rotationVectorListener, (Sensor)list.get(0), this.config.sensorDelay); 
      } 
    } 
    if (this.config.useCompass && !this.rotationVectorAvailable) {
      if (this.manager == null)
        this.manager = (SensorManager)this.context.getSystemService("sensor"); 
      Sensor sensor = this.manager.getDefaultSensor(2);
      if (sensor != null) {
        this.compassAvailable = this.accelerometerAvailable;
        if (this.compassAvailable) {
          this.compassListener = new SensorListener();
          this.compassAvailable = this.manager.registerListener(this.compassListener, sensor, this.config.sensorDelay);
        } 
      } else {
        this.compassAvailable = false;
      } 
    } else {
      this.compassAvailable = false;
    } 
    Gdx.app.log("AndroidInput", "sensor listener setup");
  }
  
  public void setCatchBackKey(boolean paramBoolean) { setCatchKey(4, paramBoolean); }
  
  public void setCatchKey(int paramInt, boolean paramBoolean) {
    if (!paramBoolean) {
      this.keysToCatch.remove(paramInt);
    } else if (paramBoolean) {
      this.keysToCatch.add(paramInt);
    } 
  }
  
  public void setCatchMenuKey(boolean paramBoolean) { setCatchKey(82, paramBoolean); }
  
  public void setCursorCatched(boolean paramBoolean) {}
  
  public void setCursorPosition(int paramInt1, int paramInt2) {}
  
  public void setInputProcessor(InputProcessor paramInputProcessor) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: putfield processor : Lcom/badlogic/gdx/InputProcessor;
    //   7: aload_0
    //   8: monitorexit
    //   9: return
    //   10: astore_1
    //   11: aload_0
    //   12: monitorexit
    //   13: aload_1
    //   14: athrow
    // Exception table:
    //   from	to	target	type
    //   2	9	10	finally
    //   11	13	10	finally }
  
  public void setOnscreenKeyboardVisible(final boolean visible) { this.handle.post(new Runnable() {
          public void run() {
            InputMethodManager inputMethodManager = (InputMethodManager)AndroidInput.this.context.getSystemService("input_method");
            if (visible) {
              View view = ((AndroidGraphics)AndroidInput.this.app.getGraphics()).getView();
              view.setFocusable(true);
              view.setFocusableInTouchMode(true);
              inputMethodManager.showSoftInput(((AndroidGraphics)AndroidInput.this.app.getGraphics()).getView(), 0);
            } else {
              inputMethodManager.hideSoftInputFromWindow(((AndroidGraphics)AndroidInput.this.app.getGraphics()).getView().getWindowToken(), 0);
            } 
          }
        }); }
  
  void unregisterSensorListeners() {
    SensorManager sensorManager = this.manager;
    if (sensorManager != null) {
      SensorEventListener sensorEventListener2 = this.accelerometerListener;
      if (sensorEventListener2 != null) {
        sensorManager.unregisterListener(sensorEventListener2);
        this.accelerometerListener = null;
      } 
      SensorEventListener sensorEventListener1 = this.gyroscopeListener;
      if (sensorEventListener1 != null) {
        this.manager.unregisterListener(sensorEventListener1);
        this.gyroscopeListener = null;
      } 
      sensorEventListener1 = this.rotationVectorListener;
      if (sensorEventListener1 != null) {
        this.manager.unregisterListener(sensorEventListener1);
        this.rotationVectorListener = null;
      } 
      sensorEventListener1 = this.compassListener;
      if (sensorEventListener1 != null) {
        this.manager.unregisterListener(sensorEventListener1);
        this.compassListener = null;
      } 
      this.manager = null;
    } 
    Gdx.app.log("AndroidInput", "sensor listener tear down");
  }
  
  public void vibrate(int paramInt) {
    if (Build.VERSION.SDK_INT >= 26) {
      this.vibrator.vibrate(VibrationEffect.createOneShot(paramInt, -1));
    } else {
      this.vibrator.vibrate(paramInt);
    } 
  }
  
  public void vibrate(long[] paramArrayOfLong, int paramInt) {
    if (Build.VERSION.SDK_INT >= 26) {
      this.vibrator.vibrate(VibrationEffect.createWaveform(paramArrayOfLong, paramInt));
    } else {
      this.vibrator.vibrate(paramArrayOfLong, paramInt);
    } 
  }
  
  static class KeyEvent {
    static final int KEY_DOWN = 0;
    
    static final int KEY_TYPED = 2;
    
    static final int KEY_UP = 1;
    
    char keyChar;
    
    int keyCode;
    
    long timeStamp;
    
    int type;
  }
  
  private class SensorListener implements SensorEventListener {
    public void onAccuracyChanged(Sensor param1Sensor, int param1Int) {}
    
    public void onSensorChanged(SensorEvent param1SensorEvent) {
      if (param1SensorEvent.sensor.getType() == 1)
        if (AndroidInput.this.nativeOrientation == Input.Orientation.Portrait) {
          System.arraycopy(param1SensorEvent.values, 0, AndroidInput.this.accelerometerValues, 0, AndroidInput.this.accelerometerValues.length);
        } else {
          AndroidInput.this.accelerometerValues[0] = param1SensorEvent.values[1];
          AndroidInput.this.accelerometerValues[1] = -param1SensorEvent.values[0];
          AndroidInput.this.accelerometerValues[2] = param1SensorEvent.values[2];
        }  
      if (param1SensorEvent.sensor.getType() == 2)
        System.arraycopy(param1SensorEvent.values, 0, AndroidInput.this.magneticFieldValues, 0, AndroidInput.this.magneticFieldValues.length); 
      if (param1SensorEvent.sensor.getType() == 4)
        if (AndroidInput.this.nativeOrientation == Input.Orientation.Portrait) {
          System.arraycopy(param1SensorEvent.values, 0, AndroidInput.this.gyroscopeValues, 0, AndroidInput.this.gyroscopeValues.length);
        } else {
          AndroidInput.this.gyroscopeValues[0] = param1SensorEvent.values[1];
          AndroidInput.this.gyroscopeValues[1] = -param1SensorEvent.values[0];
          AndroidInput.this.gyroscopeValues[2] = param1SensorEvent.values[2];
        }  
      if (param1SensorEvent.sensor.getType() == 11)
        if (AndroidInput.this.nativeOrientation == Input.Orientation.Portrait) {
          System.arraycopy(param1SensorEvent.values, 0, AndroidInput.this.rotationVectorValues, 0, AndroidInput.this.rotationVectorValues.length);
        } else {
          AndroidInput.this.rotationVectorValues[0] = param1SensorEvent.values[1];
          AndroidInput.this.rotationVectorValues[1] = -param1SensorEvent.values[0];
          AndroidInput.this.rotationVectorValues[2] = param1SensorEvent.values[2];
        }  
    }
  }
  
  static class TouchEvent {
    static final int TOUCH_DOWN = 0;
    
    static final int TOUCH_DRAGGED = 2;
    
    static final int TOUCH_MOVED = 4;
    
    static final int TOUCH_SCROLLED = 3;
    
    static final int TOUCH_UP = 1;
    
    int button;
    
    int pointer;
    
    int scrollAmount;
    
    long timeStamp;
    
    int type;
    
    int x;
    
    int y;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidInput.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */