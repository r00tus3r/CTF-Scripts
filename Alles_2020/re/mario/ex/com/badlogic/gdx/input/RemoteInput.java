package com.badlogic.gdx.input;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class RemoteInput implements Runnable, Input {
  public static int DEFAULT_PORT = 8190;
  
  private static final int MAX_TOUCHES = 20;
  
  private float[] accel = new float[3];
  
  private float[] compass = new float[3];
  
  private boolean connected;
  
  int[] deltaX;
  
  int[] deltaY;
  
  private float[] gyrate = new float[3];
  
  public final String[] ips;
  
  boolean[] isTouched;
  
  boolean[] justPressedKeys;
  
  boolean justTouched;
  
  int keyCount;
  
  boolean keyJustPressed;
  
  boolean[] keys;
  
  private RemoteInputListener listener;
  
  private boolean multiTouch;
  
  private final int port;
  
  InputProcessor processor;
  
  private float remoteHeight;
  
  private float remoteWidth;
  
  private ServerSocket serverSocket;
  
  int[] touchX;
  
  int[] touchY;
  
  static  {
  
  }
  
  public RemoteInput() { this(DEFAULT_PORT); }
  
  public RemoteInput(int paramInt) { this(paramInt, null); }
  
  public RemoteInput(int paramInt, RemoteInputListener paramRemoteInputListener) {
    byte b = 0;
    this.multiTouch = false;
    this.remoteWidth = 0.0F;
    this.remoteHeight = 0.0F;
    this.connected = false;
    this.keyCount = 0;
    this.keys = new boolean[256];
    this.keyJustPressed = false;
    this.justPressedKeys = new boolean[256];
    this.deltaX = new int[20];
    this.deltaY = new int[20];
    this.touchX = new int[20];
    this.touchY = new int[20];
    this.isTouched = new boolean[20];
    this.justTouched = false;
    this.processor = null;
    this.listener = paramRemoteInputListener;
    try {
      this.port = paramInt;
      ServerSocket serverSocket1 = new ServerSocket();
      this(paramInt);
      this.serverSocket = serverSocket1;
      Thread thread = new Thread();
      this(this);
      thread.setDaemon(true);
      thread.start();
      InetAddress[] arrayOfInetAddress = InetAddress.getAllByName(InetAddress.getLocalHost().getHostName());
      this.ips = new String[arrayOfInetAddress.length];
      while (b < arrayOfInetAddress.length) {
        this.ips[b] = arrayOfInetAddress[b].getHostAddress();
        b++;
      } 
      return;
    } catch (Exception paramRemoteInputListener) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Couldn't open listening socket at port '");
      stringBuilder.append(paramInt);
      stringBuilder.append("'");
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString(), paramRemoteInputListener);
      throw gdxRuntimeException;
    } 
  }
  
  public RemoteInput(RemoteInputListener paramRemoteInputListener) { this(DEFAULT_PORT, paramRemoteInputListener); }
  
  public void cancelVibrate() {}
  
  public float getAccelerometerX() { return this.accel[0]; }
  
  public float getAccelerometerY() { return this.accel[1]; }
  
  public float getAccelerometerZ() { return this.accel[2]; }
  
  public float getAzimuth() { return this.compass[0]; }
  
  public long getCurrentEventTime() { return 0L; }
  
  public int getDeltaX() { return this.deltaX[0]; }
  
  public int getDeltaX(int paramInt) { return this.deltaX[paramInt]; }
  
  public int getDeltaY() { return this.deltaY[0]; }
  
  public int getDeltaY(int paramInt) { return this.deltaY[paramInt]; }
  
  public float getGyroscopeX() { return this.gyrate[0]; }
  
  public float getGyroscopeY() { return this.gyrate[1]; }
  
  public float getGyroscopeZ() { return this.gyrate[2]; }
  
  public String[] getIPs() { return this.ips; }
  
  public InputProcessor getInputProcessor() { return this.processor; }
  
  public int getMaxPointers() { return 20; }
  
  public Input.Orientation getNativeOrientation() { return Input.Orientation.Landscape; }
  
  public float getPitch() { return this.compass[1]; }
  
  public float getPressure() { return getPressure(0); }
  
  public float getPressure(int paramInt) {
    float f;
    if (isTouched(paramInt)) {
      f = 1.0F;
    } else {
      f = 0.0F;
    } 
    return f;
  }
  
  public float getRoll() { return this.compass[2]; }
  
  public int getRotation() { return 0; }
  
  public void getRotationMatrix(float[] paramArrayOfFloat) {}
  
  public void getTextInput(Input.TextInputListener paramTextInputListener, String paramString1, String paramString2, String paramString3) { Gdx.app.getInput().getTextInput(paramTextInputListener, paramString1, paramString2, paramString3); }
  
  public int getX() { return this.touchX[0]; }
  
  public int getX(int paramInt) { return this.touchX[paramInt]; }
  
  public int getY() { return this.touchY[0]; }
  
  public int getY(int paramInt) { return this.touchY[paramInt]; }
  
  public boolean isButtonJustPressed(int paramInt) {
    boolean bool;
    if (paramInt == 0 && this.justTouched) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public boolean isButtonPressed(int paramInt) {
    if (paramInt != 0)
      return false; 
    paramInt = 0;
    while (true) {
      boolean[] arrayOfBoolean = this.isTouched;
      if (paramInt < arrayOfBoolean.length) {
        if (arrayOfBoolean[paramInt])
          return true; 
        paramInt++;
        continue;
      } 
      break;
    } 
    return false;
  }
  
  public boolean isCatchBackKey() { return false; }
  
  public boolean isCatchKey(int paramInt) { return false; }
  
  public boolean isCatchMenuKey() { return false; }
  
  public boolean isConnected() { return this.connected; }
  
  public boolean isCursorCatched() { return false; }
  
  public boolean isKeyJustPressed(int paramInt) { return (paramInt == -1) ? this.keyJustPressed : ((paramInt < 0 || paramInt > 255) ? 0 : this.justPressedKeys[paramInt]); }
  
  public boolean isKeyPressed(int paramInt) {
    boolean bool = false;
    if (paramInt == -1) {
      if (this.keyCount > 0)
        bool = true; 
      return bool;
    } 
    return (paramInt < 0 || paramInt > 255) ? false : this.keys[paramInt];
  }
  
  public boolean isPeripheralAvailable(Input.Peripheral paramPeripheral) { return (paramPeripheral == Input.Peripheral.Accelerometer) ? true : ((paramPeripheral == Input.Peripheral.Compass) ? true : ((paramPeripheral == Input.Peripheral.MultitouchScreen) ? this.multiTouch : 0)); }
  
  public boolean isTouched() { return this.isTouched[0]; }
  
  public boolean isTouched(int paramInt) { return this.isTouched[paramInt]; }
  
  public boolean justTouched() { return this.justTouched; }
  
  public void run() {
    while (true) {
      try {
        this.connected = false;
        if (this.listener != null)
          this.listener.onDisconnected(); 
        PrintStream printStream = System.out;
        StringBuilder stringBuilder = new StringBuilder();
        this();
        stringBuilder.append("listening, port ");
        stringBuilder.append(this.port);
        printStream.println(stringBuilder.toString());
        Socket socket = this.serverSocket.accept();
        socket.setTcpNoDelay(true);
        socket.setSoTimeout(3000);
        this.connected = true;
        if (this.listener != null)
          this.listener.onConnected(); 
        DataInputStream dataInputStream = new DataInputStream();
        this(socket.getInputStream());
        this.multiTouch = dataInputStream.readBoolean();
        while (true) {
          TouchEvent touchEvent2;
          KeyEvent keyEvent;
          TouchEvent touchEvent1;
          int i = dataInputStream.readInt();
          printStream = null;
          switch (i) {
            default:
              socket = null;
              application = Gdx.app;
              eventTrigger = new EventTrigger();
              this(this, printStream, socket);
              application.postRunnable(eventTrigger);
              continue;
            case 9:
              this.gyrate[0] = dataInputStream.readFloat();
              this.gyrate[1] = dataInputStream.readFloat();
              this.gyrate[2] = dataInputStream.readFloat();
            case 8:
              this.remoteWidth = dataInputStream.readFloat();
              this.remoteHeight = dataInputStream.readFloat();
            case 7:
              this.compass[0] = dataInputStream.readFloat();
              this.compass[1] = dataInputStream.readFloat();
              this.compass[2] = dataInputStream.readFloat();
            case 6:
              this.accel[0] = dataInputStream.readFloat();
              this.accel[1] = dataInputStream.readFloat();
              this.accel[2] = dataInputStream.readFloat();
            case 5:
              touchEvent2 = new TouchEvent();
              this(this);
              touchEvent2.x = (int)(dataInputStream.readInt() / this.remoteWidth * Gdx.graphics.getWidth());
              touchEvent2.y = (int)(dataInputStream.readInt() / this.remoteHeight * Gdx.graphics.getHeight());
              touchEvent2.pointer = dataInputStream.readInt();
              touchEvent2.type = 2;
              touchEvent1 = touchEvent2;
              touchEvent2 = null;
              break;
            case 4:
              touchEvent2 = new TouchEvent();
              this(this);
              touchEvent2.x = (int)(dataInputStream.readInt() / this.remoteWidth * Gdx.graphics.getWidth());
              touchEvent2.y = (int)(dataInputStream.readInt() / this.remoteHeight * Gdx.graphics.getHeight());
              touchEvent2.pointer = dataInputStream.readInt();
              touchEvent2.type = 1;
              touchEvent1 = touchEvent2;
              touchEvent2 = null;
              break;
            case 3:
              touchEvent2 = new TouchEvent();
              this(this);
              touchEvent2.x = (int)(dataInputStream.readInt() / this.remoteWidth * Gdx.graphics.getWidth());
              touchEvent2.y = (int)(dataInputStream.readInt() / this.remoteHeight * Gdx.graphics.getHeight());
              touchEvent2.pointer = dataInputStream.readInt();
              touchEvent2.type = 0;
              touchEvent1 = touchEvent2;
              touchEvent2 = null;
              break;
            case 2:
              keyEvent = new KeyEvent();
              this(this);
              keyEvent.keyChar = dataInputStream.readChar();
              keyEvent.type = 2;
              break;
            case 1:
              keyEvent = new KeyEvent();
              this(this);
              keyEvent.keyCode = dataInputStream.readInt();
              keyEvent.type = 1;
              break;
            case 0:
              keyEvent = new KeyEvent();
              this(this);
              keyEvent.keyCode = dataInputStream.readInt();
              keyEvent.type = 0;
              break;
          } 
          Application application = Gdx.app;
          EventTrigger eventTrigger = new EventTrigger();
          this(this, touchEvent1, keyEvent);
          application.postRunnable(eventTrigger);
        } 
        break;
      } catch (IOException iOException) {
        iOException.printStackTrace();
      } 
    } 
  }
  
  public void setCatchBackKey(boolean paramBoolean) {}
  
  public void setCatchKey(int paramInt, boolean paramBoolean) {}
  
  public void setCatchMenuKey(boolean paramBoolean) {}
  
  public void setCursorCatched(boolean paramBoolean) {}
  
  public void setCursorPosition(int paramInt1, int paramInt2) {}
  
  public void setInputProcessor(InputProcessor paramInputProcessor) { this.processor = paramInputProcessor; }
  
  public void setOnscreenKeyboardVisible(boolean paramBoolean) {}
  
  public void vibrate(int paramInt) {}
  
  public void vibrate(long[] paramArrayOfLong, int paramInt) {}
  
  class EventTrigger implements Runnable {
    RemoteInput.KeyEvent keyEvent;
    
    RemoteInput.TouchEvent touchEvent;
    
    public EventTrigger(RemoteInput.TouchEvent param1TouchEvent, RemoteInput.KeyEvent param1KeyEvent) {
      this.touchEvent = param1TouchEvent;
      this.keyEvent = param1KeyEvent;
    }
    
    public void run() {
      RemoteInput remoteInput = RemoteInput.this;
      remoteInput.justTouched = false;
      if (remoteInput.keyJustPressed) {
        RemoteInput.this.keyJustPressed = false;
        for (byte b = 0; b < RemoteInput.this.justPressedKeys.length; b++)
          RemoteInput.this.justPressedKeys[b] = false; 
      } 
      if (RemoteInput.this.processor != null) {
        RemoteInput.TouchEvent touchEvent1 = this.touchEvent;
        if (touchEvent1 != null) {
          int i = touchEvent1.type;
          if (i != 0) {
            if (i != 1) {
              if (i == 2) {
                RemoteInput.this.deltaX[this.touchEvent.pointer] = this.touchEvent.x - RemoteInput.this.touchX[this.touchEvent.pointer];
                RemoteInput.this.deltaY[this.touchEvent.pointer] = this.touchEvent.y - RemoteInput.this.touchY[this.touchEvent.pointer];
                RemoteInput.this.processor.touchDragged(this.touchEvent.x, this.touchEvent.y, this.touchEvent.pointer);
              } 
            } else {
              RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
              RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
              RemoteInput.this.processor.touchUp(this.touchEvent.x, this.touchEvent.y, this.touchEvent.pointer, 0);
              RemoteInput.this.isTouched[this.touchEvent.pointer] = false;
            } 
          } else {
            RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
            RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
            RemoteInput.this.processor.touchDown(this.touchEvent.x, this.touchEvent.y, this.touchEvent.pointer, 0);
            RemoteInput.this.isTouched[this.touchEvent.pointer] = true;
            RemoteInput.this.justTouched = true;
          } 
          RemoteInput.this.touchX[this.touchEvent.pointer] = this.touchEvent.x;
          RemoteInput.this.touchY[this.touchEvent.pointer] = this.touchEvent.y;
        } 
        RemoteInput.KeyEvent keyEvent1 = this.keyEvent;
        if (keyEvent1 != null) {
          int i = keyEvent1.type;
          if (i != 0) {
            if (i != 1) {
              if (i == 2)
                RemoteInput.this.processor.keyTyped(this.keyEvent.keyChar); 
            } else {
              RemoteInput.this.processor.keyUp(this.keyEvent.keyCode);
              if (RemoteInput.this.keys[this.keyEvent.keyCode]) {
                RemoteInput remoteInput1 = RemoteInput.this;
                remoteInput1.keyCount--;
                RemoteInput.this.keys[this.keyEvent.keyCode] = false;
              } 
            } 
          } else {
            RemoteInput.this.processor.keyDown(this.keyEvent.keyCode);
            if (!RemoteInput.this.keys[this.keyEvent.keyCode]) {
              RemoteInput remoteInput2 = RemoteInput.this;
              remoteInput2.keyCount++;
              RemoteInput.this.keys[this.keyEvent.keyCode] = true;
            } 
            RemoteInput remoteInput1 = RemoteInput.this;
            remoteInput1.keyJustPressed = true;
            remoteInput1.justPressedKeys[this.keyEvent.keyCode] = true;
          } 
        } 
      } else {
        RemoteInput.TouchEvent touchEvent1 = this.touchEvent;
        if (touchEvent1 != null) {
          int i = touchEvent1.type;
          if (i != 0) {
            if (i != 1) {
              if (i == 2) {
                RemoteInput.this.deltaX[this.touchEvent.pointer] = this.touchEvent.x - RemoteInput.this.touchX[this.touchEvent.pointer];
                RemoteInput.this.deltaY[this.touchEvent.pointer] = this.touchEvent.y - RemoteInput.this.touchY[this.touchEvent.pointer];
              } 
            } else {
              RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
              RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
              RemoteInput.this.isTouched[this.touchEvent.pointer] = false;
            } 
          } else {
            RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
            RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
            RemoteInput.this.isTouched[this.touchEvent.pointer] = true;
            RemoteInput.this.justTouched = true;
          } 
          RemoteInput.this.touchX[this.touchEvent.pointer] = this.touchEvent.x;
          RemoteInput.this.touchY[this.touchEvent.pointer] = this.touchEvent.y;
        } 
        RemoteInput.KeyEvent keyEvent1 = this.keyEvent;
        if (keyEvent1 != null) {
          if (keyEvent1.type == 0) {
            if (!RemoteInput.this.keys[this.keyEvent.keyCode]) {
              RemoteInput remoteInput2 = RemoteInput.this;
              remoteInput2.keyCount++;
              RemoteInput.this.keys[this.keyEvent.keyCode] = true;
            } 
            RemoteInput remoteInput1 = RemoteInput.this;
            remoteInput1.keyJustPressed = true;
            remoteInput1.justPressedKeys[this.keyEvent.keyCode] = true;
          } 
          if (this.keyEvent.type == 1 && RemoteInput.this.keys[this.keyEvent.keyCode]) {
            RemoteInput remoteInput1 = RemoteInput.this;
            remoteInput1.keyCount--;
            RemoteInput.this.keys[this.keyEvent.keyCode] = false;
          } 
        } 
      } 
    }
  }
  
  class KeyEvent {
    static final int KEY_DOWN = 0;
    
    static final int KEY_TYPED = 2;
    
    static final int KEY_UP = 1;
    
    char keyChar;
    
    int keyCode;
    
    long timeStamp;
    
    int type;
  }
  
  public static interface RemoteInputListener {
    void onConnected();
    
    void onDisconnected();
  }
  
  class TouchEvent {
    static final int TOUCH_DOWN = 0;
    
    static final int TOUCH_DRAGGED = 2;
    
    static final int TOUCH_UP = 1;
    
    int pointer;
    
    long timeStamp;
    
    int type;
    
    int x;
    
    int y;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/input/RemoteInput.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */