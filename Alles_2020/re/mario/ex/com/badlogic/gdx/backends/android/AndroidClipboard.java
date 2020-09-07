package com.badlogic.gdx.backends.android;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.text.ClipboardManager;
import com.badlogic.gdx.utils.Clipboard;

public class AndroidClipboard implements Clipboard {
  private ClipboardManager clipboard;
  
  private ClipboardManager honeycombClipboard;
  
  public AndroidClipboard(Context paramContext) {
    if (Build.VERSION.SDK_INT < 11) {
      this.clipboard = (ClipboardManager)paramContext.getSystemService("clipboard");
    } else {
      this.honeycombClipboard = (ClipboardManager)paramContext.getSystemService("clipboard");
    } 
  }
  
  public String getContents() {
    if (Build.VERSION.SDK_INT < 11)
      return (this.clipboard.getText() == null) ? null : this.clipboard.getText().toString(); 
    ClipData clipData = this.honeycombClipboard.getPrimaryClip();
    if (clipData == null)
      return null; 
    CharSequence charSequence = clipData.getItemAt(0).getText();
    return (charSequence == null) ? null : charSequence.toString();
  }
  
  public void setContents(String paramString) {
    if (Build.VERSION.SDK_INT < 11) {
      this.clipboard.setText(paramString);
    } else {
      ClipData clipData = ClipData.newPlainText(paramString, paramString);
      this.honeycombClipboard.setPrimaryClip(clipData);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidClipboard.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */