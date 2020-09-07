package com.alles.platformer;

import android.os.Bundle;
import com.badlogic.gdx.backends.android.AndroidApplication;
import com.badlogic.gdx.backends.android.AndroidApplicationConfiguration;

public class AndroidLauncher extends AndroidApplication {
  protected void onCreate(Bundle paramBundle) {
    super.onCreate(paramBundle);
    AndroidApplicationConfiguration androidApplicationConfiguration = new AndroidApplicationConfiguration();
    initialize(new MyPlatformer(), androidApplicationConfiguration);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/alles/platformer/AndroidLauncher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */