package com.badlogic.gdx.backends.android;

import android.app.Dialog;
import android.content.Context;
import android.os.Handler;
import android.text.Editable;
import android.text.InputFilter;
import android.text.method.ArrowKeyMovementMethod;
import android.text.method.MovementMethod;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.badlogic.gdx.Input;
import java.io.IOException;

class AndroidOnscreenKeyboard implements View.OnKeyListener, View.OnTouchListener {
  final Context context;
  
  Dialog dialog;
  
  final Handler handler;
  
  final AndroidInput input;
  
  TextView textView;
  
  public AndroidOnscreenKeyboard(Context paramContext, Handler paramHandler, AndroidInput paramAndroidInput) {
    this.context = paramContext;
    this.handler = paramHandler;
    this.input = paramAndroidInput;
  }
  
  public static TextView createView(Context paramContext) { return new TextView(paramContext) {
        Editable editable = new AndroidOnscreenKeyboard.PassThroughEditable();
        
        protected boolean getDefaultEditable() { return true; }
        
        protected MovementMethod getDefaultMovementMethod() { return ArrowKeyMovementMethod.getInstance(); }
        
        public Editable getEditableText() { return this.editable; }
        
        public boolean onKeyDown(int param1Int, KeyEvent param1KeyEvent) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("down keycode: ");
          stringBuilder.append(param1KeyEvent.getKeyCode());
          Log.d("Test", stringBuilder.toString());
          return super.onKeyDown(param1Int, param1KeyEvent);
        }
        
        public boolean onKeyUp(int param1Int, KeyEvent param1KeyEvent) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("up keycode: ");
          stringBuilder.append(param1KeyEvent.getKeyCode());
          Log.d("Test", stringBuilder.toString());
          return super.onKeyUp(param1Int, param1KeyEvent);
        }
      }; }
  
  Dialog createDialog() {
    this.textView = createView(this.context);
    this.textView.setOnKeyListener(this);
    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2, 80);
    this.textView.setLayoutParams(layoutParams);
    this.textView.setFocusable(true);
    this.textView.setFocusableInTouchMode(true);
    TextView textView1 = this.textView;
    textView1.setImeOptions(textView1.getImeOptions() | 0x10000000);
    FrameLayout frameLayout = new FrameLayout(this.context);
    frameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, false));
    frameLayout.addView(this.textView);
    frameLayout.setOnTouchListener(this);
    this.dialog = new Dialog(this.context, 16973841);
    this.dialog.setContentView(frameLayout);
    return this.dialog;
  }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent) { return false; }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent) { return false; }
  
  public void setVisible(boolean paramBoolean) {
    if (paramBoolean) {
      Dialog dialog1 = this.dialog;
      if (dialog1 != null) {
        dialog1.dismiss();
        this.dialog = null;
      } 
    } 
    if (paramBoolean && this.dialog == null && !this.input.isPeripheralAvailable(Input.Peripheral.HardwareKeyboard)) {
      this.handler.post(new Runnable() {
            public void run() {
              AndroidOnscreenKeyboard androidOnscreenKeyboard = AndroidOnscreenKeyboard.this;
              androidOnscreenKeyboard.dialog = androidOnscreenKeyboard.createDialog();
              AndroidOnscreenKeyboard.this.dialog.show();
              AndroidOnscreenKeyboard.this.handler.post(new Runnable() {
                    public void run() {
                      AndroidOnscreenKeyboard.this.dialog.getWindow().setSoftInputMode(32);
                      InputMethodManager inputMethodManager = (InputMethodManager)AndroidOnscreenKeyboard.this.context.getSystemService("input_method");
                      if (inputMethodManager != null)
                        inputMethodManager.showSoftInput(AndroidOnscreenKeyboard.this.textView, 2); 
                    }
                  });
              final View content = AndroidOnscreenKeyboard.this.dialog.getWindow().findViewById(16908290);
              view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
                    private int keyboardHeight;
                    
                    private boolean keyboardShowing;
                    
                    int[] screenloc = new int[2];
                    
                    public boolean onPreDraw() {
                      content.getLocationOnScreen(this.screenloc);
                      this.keyboardHeight = Math.abs(this.screenloc[1]);
                      if (this.keyboardHeight > 0)
                        this.keyboardShowing = true; 
                      if (this.keyboardHeight == 0 && this.keyboardShowing) {
                        AndroidOnscreenKeyboard.this.dialog.dismiss();
                        AndroidOnscreenKeyboard.this.dialog = null;
                      } 
                      return true;
                    }
                  });
            }
          });
    } else if (!paramBoolean) {
      Dialog dialog1 = this.dialog;
      if (dialog1 != null)
        dialog1.dismiss(); 
    } 
  }
  
  public static class PassThroughEditable implements Editable {
    public Editable append(char param1Char) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("append: ");
      stringBuilder.append(param1Char);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public Editable append(CharSequence param1CharSequence) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("append: ");
      stringBuilder.append(param1CharSequence);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public Editable append(CharSequence param1CharSequence, int param1Int1, int param1Int2) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("append: ");
      stringBuilder.append(param1CharSequence);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public char charAt(int param1Int) {
      Log.d("Editable", "charAt");
      return Character.MIN_VALUE;
    }
    
    public void clear() { Log.d("Editable", "clear"); }
    
    public void clearSpans() { Log.d("Editable", "clearSpanes"); }
    
    public Editable delete(int param1Int1, int param1Int2) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("delete, ");
      stringBuilder.append(param1Int1);
      stringBuilder.append(", ");
      stringBuilder.append(param1Int2);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public void getChars(int param1Int1, int param1Int2, char[] param1ArrayOfChar, int param1Int3) { Log.d("Editable", "getChars"); }
    
    public InputFilter[] getFilters() {
      Log.d("Editable", "getFilters");
      return new InputFilter[0];
    }
    
    public int getSpanEnd(Object param1Object) {
      Log.d("Editable", "getSpanEnd");
      return 0;
    }
    
    public int getSpanFlags(Object param1Object) {
      Log.d("Editable", "getSpanFlags");
      return 0;
    }
    
    public int getSpanStart(Object param1Object) {
      Log.d("Editable", "getSpanStart");
      return 0;
    }
    
    public <T> T[] getSpans(int param1Int1, int param1Int2, Class<T> param1Class) {
      Log.d("Editable", "getSpans");
      return null;
    }
    
    public Editable insert(int param1Int, CharSequence param1CharSequence) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("insert: ");
      stringBuilder.append(param1CharSequence);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public Editable insert(int param1Int1, CharSequence param1CharSequence, int param1Int2, int param1Int3) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("insert: ");
      stringBuilder.append(param1CharSequence);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public int length() {
      Log.d("Editable", "length");
      return 0;
    }
    
    public int nextSpanTransition(int param1Int1, int param1Int2, Class param1Class) {
      Log.d("Editable", "nextSpanTransition");
      return 0;
    }
    
    public void removeSpan(Object param1Object) { Log.d("Editable", "removeSpan"); }
    
    public Editable replace(int param1Int1, int param1Int2, CharSequence param1CharSequence) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("replace: ");
      stringBuilder.append(param1CharSequence);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public Editable replace(int param1Int1, int param1Int2, CharSequence param1CharSequence, int param1Int3, int param1Int4) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("replace: ");
      stringBuilder.append(param1CharSequence);
      Log.d("Editable", stringBuilder.toString());
      return this;
    }
    
    public void setFilters(InputFilter[] param1ArrayOfInputFilter) { Log.d("Editable", "setFilters"); }
    
    public void setSpan(Object param1Object, int param1Int1, int param1Int2, int param1Int3) { Log.d("Editable", "setSpan"); }
    
    public CharSequence subSequence(int param1Int1, int param1Int2) {
      Log.d("Editable", "subSequence");
      return null;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidOnscreenKeyboard.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */