package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.Disposable;

public interface ServerSocket extends Disposable {
  Socket accept(SocketHints paramSocketHints);
  
  Net.Protocol getProtocol();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/ServerSocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */