package com.badlogic.gdx.backends.android;

import android.content.Intent;
import android.net.Uri;
import com.badlogic.gdx.Net;
import com.badlogic.gdx.net.NetJavaImpl;
import com.badlogic.gdx.net.NetJavaServerSocketImpl;
import com.badlogic.gdx.net.NetJavaSocketImpl;
import com.badlogic.gdx.net.ServerSocket;
import com.badlogic.gdx.net.ServerSocketHints;
import com.badlogic.gdx.net.Socket;
import com.badlogic.gdx.net.SocketHints;

public class AndroidNet implements Net {
  final AndroidApplicationBase app;
  
  NetJavaImpl netJavaImpl;
  
  public AndroidNet(AndroidApplicationBase paramAndroidApplicationBase, AndroidApplicationConfiguration paramAndroidApplicationConfiguration) {
    this.app = paramAndroidApplicationBase;
    this.netJavaImpl = new NetJavaImpl(paramAndroidApplicationConfiguration.maxNetThreads);
  }
  
  public void cancelHttpRequest(Net.HttpRequest paramHttpRequest) { this.netJavaImpl.cancelHttpRequest(paramHttpRequest); }
  
  public Socket newClientSocket(Net.Protocol paramProtocol, String paramString, int paramInt, SocketHints paramSocketHints) { return new NetJavaSocketImpl(paramProtocol, paramString, paramInt, paramSocketHints); }
  
  public ServerSocket newServerSocket(Net.Protocol paramProtocol, int paramInt, ServerSocketHints paramServerSocketHints) { return new NetJavaServerSocketImpl(paramProtocol, paramInt, paramServerSocketHints); }
  
  public ServerSocket newServerSocket(Net.Protocol paramProtocol, String paramString, int paramInt, ServerSocketHints paramServerSocketHints) { return new NetJavaServerSocketImpl(paramProtocol, paramString, paramInt, paramServerSocketHints); }
  
  public boolean openURI(String paramString) {
    boolean bool;
    final Uri uri = Uri.parse(paramString);
    Intent intent = new Intent("android.intent.action.VIEW", uri);
    if (this.app.getContext().getPackageManager().resolveActivity(intent, 65536) != null) {
      this.app.runOnUiThread(new Runnable() {
            public void run() {
              Intent intent = new Intent("android.intent.action.VIEW", uri);
              if (!(AndroidNet.this.app.getContext() instanceof android.app.Activity))
                intent.addFlags(268435456); 
              AndroidNet.this.app.startActivity(intent);
            }
          });
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void sendHttpRequest(Net.HttpRequest paramHttpRequest, Net.HttpResponseListener paramHttpResponseListener) { this.netJavaImpl.sendHttpRequest(paramHttpRequest, paramHttpResponseListener); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/AndroidNet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */