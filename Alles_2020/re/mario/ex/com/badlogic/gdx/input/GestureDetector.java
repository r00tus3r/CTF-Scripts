package com.badlogic.gdx.input;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputAdapter;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.TimeUtils;
import com.badlogic.gdx.utils.Timer;

public class GestureDetector extends InputAdapter {
  private long gestureStartTime;
  
  private boolean inTapRectangle;
  
  private final Vector2 initialPointer1 = new Vector2();
  
  private final Vector2 initialPointer2 = new Vector2();
  
  private int lastTapButton;
  
  private int lastTapPointer;
  
  private long lastTapTime;
  
  private float lastTapX;
  
  private float lastTapY;
  
  final GestureListener listener;
  
  boolean longPressFired;
  
  private float longPressSeconds;
  
  private final Timer.Task longPressTask = new Timer.Task() {
      public void run() {
        if (!GestureDetector.this.longPressFired) {
          GestureDetector gestureDetector = GestureDetector.this;
          gestureDetector.longPressFired = gestureDetector.listener.longPress(this.this$0.pointer1.x, this.this$0.pointer1.y);
        } 
      }
    };
  
  private long maxFlingDelay;
  
  private boolean panning;
  
  private boolean pinching;
  
  Vector2 pointer1 = new Vector2();
  
  private final Vector2 pointer2 = new Vector2();
  
  private int tapCount;
  
  private long tapCountInterval;
  
  private float tapRectangleCenterX;
  
  private float tapRectangleCenterY;
  
  private float tapRectangleHeight;
  
  private float tapRectangleWidth;
  
  private final VelocityTracker tracker = new VelocityTracker();
  
  public GestureDetector(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, GestureListener paramGestureListener) {
    if (paramGestureListener != null) {
      this.tapRectangleWidth = paramFloat1;
      this.tapRectangleHeight = paramFloat2;
      this.tapCountInterval = (long)(paramFloat3 * 1.0E9F);
      this.longPressSeconds = paramFloat4;
      this.maxFlingDelay = (long)(paramFloat5 * 1.0E9F);
      this.listener = paramGestureListener;
      return;
    } 
    throw new IllegalArgumentException("listener cannot be null.");
  }
  
  public GestureDetector(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, GestureListener paramGestureListener) { this(paramFloat1, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramGestureListener); }
  
  public GestureDetector(GestureListener paramGestureListener) { this(20.0F, 0.4F, 1.1F, 0.15F, paramGestureListener); }
  
  private boolean isWithinTapRectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    boolean bool;
    if (Math.abs(paramFloat1 - paramFloat3) < this.tapRectangleWidth && Math.abs(paramFloat2 - paramFloat4) < this.tapRectangleHeight) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void cancel() {
    this.longPressTask.cancel();
    this.longPressFired = true;
  }
  
  public void invalidateTapSquare() { this.inTapRectangle = false; }
  
  public boolean isLongPressed() { return isLongPressed(this.longPressSeconds); }
  
  public boolean isLongPressed(float paramFloat) {
    long l = this.gestureStartTime;
    boolean bool = false;
    if (l == 0L)
      return false; 
    if (TimeUtils.nanoTime() - this.gestureStartTime > (long)(paramFloat * 1.0E9F))
      bool = true; 
    return bool;
  }
  
  public boolean isPanning() { return this.panning; }
  
  public void reset() {
    this.gestureStartTime = 0L;
    this.panning = false;
    this.inTapRectangle = false;
    this.tracker.lastTime = 0L;
  }
  
  public void setLongPressSeconds(float paramFloat) { this.longPressSeconds = paramFloat; }
  
  public void setMaxFlingDelay(long paramLong) { this.maxFlingDelay = paramLong; }
  
  public void setTapCountInterval(float paramFloat) { this.tapCountInterval = (long)(paramFloat * 1.0E9F); }
  
  public void setTapRectangleSize(float paramFloat1, float paramFloat2) {
    this.tapRectangleWidth = paramFloat1;
    this.tapRectangleHeight = paramFloat2;
  }
  
  public void setTapSquareSize(float paramFloat) { setTapRectangleSize(paramFloat, paramFloat); }
  
  public boolean touchDown(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    if (paramInt1 > 1)
      return false; 
    if (paramInt1 == 0) {
      this.pointer1.set(paramFloat1, paramFloat2);
      this.gestureStartTime = Gdx.input.getCurrentEventTime();
      this.tracker.start(paramFloat1, paramFloat2, this.gestureStartTime);
      if (Gdx.input.isTouched(1)) {
        this.inTapRectangle = false;
        this.pinching = true;
        this.initialPointer1.set(this.pointer1);
        this.initialPointer2.set(this.pointer2);
        this.longPressTask.cancel();
      } else {
        this.inTapRectangle = true;
        this.pinching = false;
        this.longPressFired = false;
        this.tapRectangleCenterX = paramFloat1;
        this.tapRectangleCenterY = paramFloat2;
        if (!this.longPressTask.isScheduled())
          Timer.schedule(this.longPressTask, this.longPressSeconds); 
      } 
    } else {
      this.pointer2.set(paramFloat1, paramFloat2);
      this.inTapRectangle = false;
      this.pinching = true;
      this.initialPointer1.set(this.pointer1);
      this.initialPointer2.set(this.pointer2);
      this.longPressTask.cancel();
    } 
    return this.listener.touchDown(paramFloat1, paramFloat2, paramInt1, paramInt2);
  }
  
  public boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { return touchDown(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public boolean touchDragged(float paramFloat1, float paramFloat2, int paramInt) {
    byte b = 1;
    if (paramInt > 1)
      return false; 
    if (this.longPressFired)
      return false; 
    if (paramInt == 0) {
      this.pointer1.set(paramFloat1, paramFloat2);
    } else {
      this.pointer2.set(paramFloat1, paramFloat2);
    } 
    if (this.pinching) {
      GestureListener gestureListener = this.listener;
      if (gestureListener != null) {
        boolean bool = gestureListener.pinch(this.initialPointer1, this.initialPointer2, this.pointer1, this.pointer2);
        int i = b;
        if (!this.listener.zoom(this.initialPointer1.dst(this.initialPointer2), this.pointer1.dst(this.pointer2)))
          if (bool) {
            i = b;
          } else {
            i = 0;
          }  
        return i;
      } 
      return false;
    } 
    this.tracker.update(paramFloat1, paramFloat2, Gdx.input.getCurrentEventTime());
    if (this.inTapRectangle && !isWithinTapRectangle(paramFloat1, paramFloat2, this.tapRectangleCenterX, this.tapRectangleCenterY)) {
      this.longPressTask.cancel();
      this.inTapRectangle = false;
    } 
    if (!this.inTapRectangle) {
      this.panning = true;
      return this.listener.pan(paramFloat1, paramFloat2, this.tracker.deltaX, this.tracker.deltaY);
    } 
    return false;
  }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) { return touchDragged(paramInt1, paramInt2, paramInt3); }
  
  public boolean touchUp(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2) {
    boolean bool1;
    if (paramInt1 > 1)
      return false; 
    if (this.inTapRectangle && !isWithinTapRectangle(paramFloat1, paramFloat2, this.tapRectangleCenterX, this.tapRectangleCenterY))
      this.inTapRectangle = false; 
    boolean bool = this.panning;
    this.panning = false;
    this.longPressTask.cancel();
    if (this.longPressFired)
      return false; 
    if (this.inTapRectangle) {
      if (this.lastTapButton != paramInt2 || this.lastTapPointer != paramInt1 || TimeUtils.nanoTime() - this.lastTapTime > this.tapCountInterval || !isWithinTapRectangle(paramFloat1, paramFloat2, this.lastTapX, this.lastTapY))
        this.tapCount = 0; 
      this.tapCount++;
      this.lastTapTime = TimeUtils.nanoTime();
      this.lastTapX = paramFloat1;
      this.lastTapY = paramFloat2;
      this.lastTapButton = paramInt2;
      this.lastTapPointer = paramInt1;
      this.gestureStartTime = 0L;
      return this.listener.tap(paramFloat1, paramFloat2, this.tapCount, paramInt2);
    } 
    if (this.pinching) {
      this.pinching = false;
      this.listener.pinchStop();
      this.panning = true;
      if (paramInt1 == 0) {
        this.tracker.start(this.pointer2.x, this.pointer2.y, Gdx.input.getCurrentEventTime());
      } else {
        this.tracker.start(this.pointer1.x, this.pointer1.y, Gdx.input.getCurrentEventTime());
      } 
      return false;
    } 
    if (bool && !this.panning) {
      bool1 = this.listener.panStop(paramFloat1, paramFloat2, paramInt1, paramInt2);
    } else {
      bool1 = false;
    } 
    this.gestureStartTime = 0L;
    long l = Gdx.input.getCurrentEventTime();
    bool = bool1;
    if (l - this.tracker.lastTime < this.maxFlingDelay) {
      this.tracker.update(paramFloat1, paramFloat2, l);
      if (this.listener.fling(this.tracker.getVelocityX(), this.tracker.getVelocityY(), paramInt2) || bool1)
        return true; 
      bool = false;
    } 
    return bool;
  }
  
  public boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4) { return touchUp(paramInt1, paramInt2, paramInt3, paramInt4); }
  
  public static class GestureAdapter implements GestureListener {
    public boolean fling(float param1Float1, float param1Float2, int param1Int) { return false; }
    
    public boolean longPress(float param1Float1, float param1Float2) { return false; }
    
    public boolean pan(float param1Float1, float param1Float2, float param1Float3, float param1Float4) { return false; }
    
    public boolean panStop(float param1Float1, float param1Float2, int param1Int1, int param1Int2) { return false; }
    
    public boolean pinch(Vector2 param1Vector21, Vector2 param1Vector22, Vector2 param1Vector23, Vector2 param1Vector24) { return false; }
    
    public void pinchStop() {}
    
    public boolean tap(float param1Float1, float param1Float2, int param1Int1, int param1Int2) { return false; }
    
    public boolean touchDown(float param1Float1, float param1Float2, int param1Int1, int param1Int2) { return false; }
    
    public boolean zoom(float param1Float1, float param1Float2) { return false; }
  }
  
  public static interface GestureListener {
    boolean fling(float param1Float1, float param1Float2, int param1Int);
    
    boolean longPress(float param1Float1, float param1Float2);
    
    boolean pan(float param1Float1, float param1Float2, float param1Float3, float param1Float4);
    
    boolean panStop(float param1Float1, float param1Float2, int param1Int1, int param1Int2);
    
    boolean pinch(Vector2 param1Vector21, Vector2 param1Vector22, Vector2 param1Vector23, Vector2 param1Vector24);
    
    void pinchStop();
    
    boolean tap(float param1Float1, float param1Float2, int param1Int1, int param1Int2);
    
    boolean touchDown(float param1Float1, float param1Float2, int param1Int1, int param1Int2);
    
    boolean zoom(float param1Float1, float param1Float2);
  }
  
  static class VelocityTracker {
    float deltaX;
    
    float deltaY;
    
    long lastTime;
    
    float lastX;
    
    float lastY;
    
    long[] meanTime;
    
    float[] meanX;
    
    float[] meanY;
    
    int numSamples;
    
    int sampleSize = 10;
    
    VelocityTracker() {
      int i = this.sampleSize;
      this.meanX = new float[i];
      this.meanY = new float[i];
      this.meanTime = new long[i];
    }
    
    private float getAverage(float[] param1ArrayOfFloat, int param1Int) {
      int i = Math.min(this.sampleSize, param1Int);
      float f = 0.0F;
      for (param1Int = 0; param1Int < i; param1Int++)
        f += param1ArrayOfFloat[param1Int]; 
      return f / i;
    }
    
    private long getAverage(long[] param1ArrayOfLong, int param1Int) {
      int i = Math.min(this.sampleSize, param1Int);
      param1Int = 0;
      long l = 0L;
      while (param1Int < i) {
        l += param1ArrayOfLong[param1Int];
        param1Int++;
      } 
      return (i == 0) ? 0L : (l / i);
    }
    
    private float getSum(float[] param1ArrayOfFloat, int param1Int) {
      int i = Math.min(this.sampleSize, param1Int);
      param1Int = 0;
      float f = 0.0F;
      while (param1Int < i) {
        f += param1ArrayOfFloat[param1Int];
        param1Int++;
      } 
      return (i == 0) ? 0.0F : f;
    }
    
    public float getVelocityX() {
      float f1 = getAverage(this.meanX, this.numSamples);
      float f2 = (float)getAverage(this.meanTime, this.numSamples) / 1.0E9F;
      return (f2 == 0.0F) ? 0.0F : (f1 / f2);
    }
    
    public float getVelocityY() {
      float f1 = getAverage(this.meanY, this.numSamples);
      float f2 = (float)getAverage(this.meanTime, this.numSamples) / 1.0E9F;
      return (f2 == 0.0F) ? 0.0F : (f1 / f2);
    }
    
    public void start(float param1Float1, float param1Float2, long param1Long) {
      this.lastX = param1Float1;
      this.lastY = param1Float2;
      this.deltaX = 0.0F;
      this.deltaY = 0.0F;
      byte b = 0;
      this.numSamples = 0;
      while (b < this.sampleSize) {
        this.meanX[b] = 0.0F;
        this.meanY[b] = 0.0F;
        this.meanTime[b] = 0L;
        b++;
      } 
      this.lastTime = param1Long;
    }
    
    public void update(float param1Float1, float param1Float2, long param1Long) {
      this.deltaX = param1Float1 - this.lastX;
      this.deltaY = param1Float2 - this.lastY;
      this.lastX = param1Float1;
      this.lastY = param1Float2;
      long l = this.lastTime;
      this.lastTime = param1Long;
      int i = this.numSamples;
      int j = i % this.sampleSize;
      this.meanX[j] = this.deltaX;
      this.meanY[j] = this.deltaY;
      this.meanTime[j] = param1Long - l;
      this.numSamples = i + 1;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/input/GestureDetector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */