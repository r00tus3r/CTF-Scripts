package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;

public class NetJavaServerSocketImpl implements ServerSocket {
  private Net.Protocol protocol;
  
  private ServerSocket server;
  
  public NetJavaServerSocketImpl(Net.Protocol paramProtocol, int paramInt, ServerSocketHints paramServerSocketHints) { this(paramProtocol, null, paramInt, paramServerSocketHints); }
  
  public NetJavaServerSocketImpl(Net.Protocol paramProtocol, String paramString, int paramInt, ServerSocketHints paramServerSocketHints) {
    this.protocol = paramProtocol;
    try {
      InetSocketAddress inetSocketAddress = new ServerSocket();
      this();
      this.server = inetSocketAddress;
      if (paramServerSocketHints != null) {
        this.server.setPerformancePreferences(paramServerSocketHints.performancePrefConnectionTime, paramServerSocketHints.performancePrefLatency, paramServerSocketHints.performancePrefBandwidth);
        this.server.setReuseAddress(paramServerSocketHints.reuseAddress);
        this.server.setSoTimeout(paramServerSocketHints.acceptTimeout);
        this.server.setReceiveBufferSize(paramServerSocketHints.receiveBufferSize);
      } 
      if (paramString != null) {
        InetSocketAddress inetSocketAddress1 = new InetSocketAddress();
        this(paramString, paramInt);
      } else {
        inetSocketAddress = new InetSocketAddress(paramInt);
      } 
      if (paramServerSocketHints != null) {
        this.server.bind(inetSocketAddress, paramServerSocketHints.backlog);
      } else {
        this.server.bind(inetSocketAddress);
      } 
      return;
    } catch (Exception paramProtocol) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Cannot create a server socket at port ");
      stringBuilder.append(paramInt);
      stringBuilder.append(".");
      throw new GdxRuntimeException(stringBuilder.toString(), paramProtocol);
    } 
  }
  
  public Socket accept(SocketHints paramSocketHints) {
    try {
      return new NetJavaSocketImpl(this.server.accept(), paramSocketHints);
    } catch (Exception paramSocketHints) {
      throw new GdxRuntimeException("Error accepting socket.", paramSocketHints);
    } 
  }
  
  public void dispose() {
    serverSocket = this.server;
    if (serverSocket != null)
      try {
        serverSocket.close();
        this.server = null;
      } catch (Exception serverSocket) {
        throw new GdxRuntimeException("Error closing server.", serverSocket);
      }  
  }
  
  public Net.Protocol getProtocol() { return this.protocol; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/NetJavaServerSocketImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */