package com.badlogic.gdx.net;

import com.badlogic.gdx.utils.Disposable;
import java.io.InputStream;
import java.io.OutputStream;

public interface Socket extends Disposable {
  InputStream getInputStream();
  
  OutputStream getOutputStream();
  
  String getRemoteAddress();
  
  boolean isConnected();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/Socket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */