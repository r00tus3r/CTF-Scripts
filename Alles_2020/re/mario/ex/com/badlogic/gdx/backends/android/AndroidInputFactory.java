package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.os.Build;
import com.badlogic.gdx.Application;

public class AndroidInputFactory {
  public static AndroidInput newAndroidInput(Application paramApplication, Context paramContext, Object paramObject, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    try {
      Class clazz;
      if (Build.VERSION.SDK_INT >= 12) {
        clazz = Class.forName("com.badlogic.gdx.backends.android.AndroidInputThreePlus");
      } else {
        clazz = Class.forName("com.badlogic.gdx.backends.android.AndroidInput");
      } 
      return (AndroidInput)clazz.getConstructor(new Class[] { Application.class, Context.class, Object.class, AndroidApplicationConfiguration.class }).newInstance(new Object[] { paramApplication, paramContext, paramObject, paramAndroidApplicationConfiguration });
    } catch (Exception paramApplication) {
      throw new RuntimeException("Couldn't construct AndroidInput, this should never happen", paramApplication);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidInputFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */