package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import com.badlogic.gdx.Application;
import java.util.ArrayList;

public class AndroidInputThreePlus extends AndroidInput implements View.OnGenericMotionListener {
  ArrayList<View.OnGenericMotionListener> genericMotionListeners = new ArrayList();
  
  private final AndroidMouseHandler mouseHandler;
  
  public AndroidInputThreePlus(Application paramApplication, Context paramContext, Object paramObject, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    super(paramApplication, paramContext, paramObject, paramAndroidApplicationConfiguration);
    if (paramObject instanceof View)
      ((View)paramObject).setOnGenericMotionListener(this); 
    this.mouseHandler = new AndroidMouseHandler();
  }
  
  public void addGenericMotionListener(View.OnGenericMotionListener paramOnGenericMotionListener) { this.genericMotionListeners.add(paramOnGenericMotionListener); }
  
  public boolean onGenericMotion(View paramView, MotionEvent paramMotionEvent) {
    if (this.mouseHandler.onGenericMotion(paramMotionEvent, this))
      return true; 
    int i = this.genericMotionListeners.size();
    for (byte b = 0; b < i; b++) {
      if (((View.OnGenericMotionListener)this.genericMotionListeners.get(b)).onGenericMotion(paramView, paramMotionEvent))
        return true; 
    } 
    return false;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidInputThreePlus.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */