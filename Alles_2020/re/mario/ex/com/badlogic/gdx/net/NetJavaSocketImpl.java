package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

public class NetJavaSocketImpl implements Socket {
  private Socket socket;
  
  public NetJavaSocketImpl(Net.Protocol paramProtocol, String paramString, int paramInt, SocketHints paramSocketHints) {
    try {
      Socket socket1 = new Socket();
      this();
      this.socket = socket1;
      applyHints(paramSocketHints);
      InetSocketAddress inetSocketAddress = new InetSocketAddress();
      this(paramString, paramInt);
      if (paramSocketHints != null) {
        this.socket.connect(inetSocketAddress, paramSocketHints.connectTimeout);
      } else {
        this.socket.connect(inetSocketAddress);
      } 
      return;
    } catch (Exception paramProtocol) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error making a socket connection to ");
      stringBuilder.append(paramString);
      stringBuilder.append(":");
      stringBuilder.append(paramInt);
      throw new GdxRuntimeException(stringBuilder.toString(), paramProtocol);
    } 
  }
  
  public NetJavaSocketImpl(Socket paramSocket, SocketHints paramSocketHints) {
    this.socket = paramSocket;
    applyHints(paramSocketHints);
  }
  
  private void applyHints(SocketHints paramSocketHints) {
    if (paramSocketHints != null)
      try {
        this.socket.setPerformancePreferences(paramSocketHints.performancePrefConnectionTime, paramSocketHints.performancePrefLatency, paramSocketHints.performancePrefBandwidth);
        this.socket.setTrafficClass(paramSocketHints.trafficClass);
        this.socket.setTcpNoDelay(paramSocketHints.tcpNoDelay);
        this.socket.setKeepAlive(paramSocketHints.keepAlive);
        this.socket.setSendBufferSize(paramSocketHints.sendBufferSize);
        this.socket.setReceiveBufferSize(paramSocketHints.receiveBufferSize);
        this.socket.setSoLinger(paramSocketHints.linger, paramSocketHints.lingerDuration);
        this.socket.setSoTimeout(paramSocketHints.socketTimeout);
      } catch (Exception paramSocketHints) {
        throw new GdxRuntimeException("Error setting socket hints.", paramSocketHints);
      }  
  }
  
  public void dispose() {
    socket1 = this.socket;
    if (socket1 != null)
      try {
        socket1.close();
        this.socket = null;
      } catch (Exception socket1) {
        throw new GdxRuntimeException("Error closing socket.", socket1);
      }  
  }
  
  public InputStream getInputStream() {
    try {
      return this.socket.getInputStream();
    } catch (Exception exception) {
      throw new GdxRuntimeException("Error getting input stream from socket.", exception);
    } 
  }
  
  public OutputStream getOutputStream() {
    try {
      return this.socket.getOutputStream();
    } catch (Exception exception) {
      throw new GdxRuntimeException("Error getting output stream from socket.", exception);
    } 
  }
  
  public String getRemoteAddress() { return this.socket.getRemoteSocketAddress().toString(); }
  
  public boolean isConnected() {
    Socket socket1 = this.socket;
    return (socket1 != null) ? socket1.isConnected() : 0;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/NetJavaSocketImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */