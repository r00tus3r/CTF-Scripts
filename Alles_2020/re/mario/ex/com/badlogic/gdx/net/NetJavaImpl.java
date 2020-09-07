package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class NetJavaImpl {
  final ObjectMap<Net.HttpRequest, HttpURLConnection> connections;
  
  private final ExecutorService executorService;
  
  final ObjectMap<Net.HttpRequest, Net.HttpResponseListener> listeners;
  
  public NetJavaImpl() { this(2147483647); }
  
  public NetJavaImpl(int paramInt) {
    this.executorService = new ThreadPoolExecutor(false, paramInt, 60L, TimeUnit.SECONDS, new SynchronousQueue(), new ThreadFactory(this) {
          public Thread newThread(Runnable param1Runnable) {
            param1Runnable = new Thread(param1Runnable, "NetThread");
            param1Runnable.setDaemon(true);
            return param1Runnable;
          }
        });
    this.connections = new ObjectMap();
    this.listeners = new ObjectMap();
  }
  
  public void cancelHttpRequest(Net.HttpRequest paramHttpRequest) {
    Net.HttpResponseListener httpResponseListener = getFromListeners(paramHttpRequest);
    if (httpResponseListener != null) {
      httpResponseListener.cancelled();
      removeFromConnectionsAndListeners(paramHttpRequest);
    } 
  }
  
  Net.HttpResponseListener getFromListeners(Net.HttpRequest paramHttpRequest) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield listeners : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual get : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast com/badlogic/gdx/Net$HttpResponseListener
    //   13: astore_1
    //   14: aload_0
    //   15: monitorexit
    //   16: aload_1
    //   17: areturn
    //   18: astore_1
    //   19: aload_0
    //   20: monitorexit
    //   21: aload_1
    //   22: athrow
    // Exception table:
    //   from	to	target	type
    //   2	14	18	finally }
  
  void putIntoConnectionsAndListeners(Net.HttpRequest paramHttpRequest, Net.HttpResponseListener paramHttpResponseListener, HttpURLConnection paramHttpURLConnection) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connections : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: aload_3
    //   8: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   11: pop
    //   12: aload_0
    //   13: getfield listeners : Lcom/badlogic/gdx/utils/ObjectMap;
    //   16: aload_1
    //   17: aload_2
    //   18: invokevirtual put : (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   21: pop
    //   22: aload_0
    //   23: monitorexit
    //   24: return
    //   25: astore_1
    //   26: aload_0
    //   27: monitorexit
    //   28: aload_1
    //   29: athrow
    // Exception table:
    //   from	to	target	type
    //   2	22	25	finally }
  
  void removeFromConnectionsAndListeners(Net.HttpRequest paramHttpRequest) { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield connections : Lcom/badlogic/gdx/utils/ObjectMap;
    //   6: aload_1
    //   7: invokevirtual remove : (Ljava/lang/Object;)Ljava/lang/Object;
    //   10: pop
    //   11: aload_0
    //   12: getfield listeners : Lcom/badlogic/gdx/utils/ObjectMap;
    //   15: aload_1
    //   16: invokevirtual remove : (Ljava/lang/Object;)Ljava/lang/Object;
    //   19: pop
    //   20: aload_0
    //   21: monitorexit
    //   22: return
    //   23: astore_1
    //   24: aload_0
    //   25: monitorexit
    //   26: aload_1
    //   27: athrow
    // Exception table:
    //   from	to	target	type
    //   2	20	23	finally }
  
  public void sendHttpRequest(Net.HttpRequest paramHttpRequest, Net.HttpResponseListener paramHttpResponseListener) {
    if (paramHttpRequest.getUrl() == null) {
      paramHttpResponseListener.failed(new GdxRuntimeException("can't process a HTTP request without URL set"));
      return;
    } 
    try {
      boolean bool;
      URL uRL;
      String str = paramHttpRequest.getMethod();
      if (str.equalsIgnoreCase("GET")) {
        String str1 = paramHttpRequest.getContent();
        String str2 = "";
        String str3 = str2;
        if (str1 != null) {
          str3 = str2;
          if (!"".equals(str1)) {
            StringBuilder stringBuilder1 = new StringBuilder();
            this();
            stringBuilder1.append("?");
            stringBuilder1.append(str1);
            str3 = stringBuilder1.toString();
          } 
        } 
        URL uRL1 = new URL();
        StringBuilder stringBuilder = new StringBuilder();
        this();
        stringBuilder.append(paramHttpRequest.getUrl());
        stringBuilder.append(str3);
        this(stringBuilder.toString());
        uRL = uRL1;
      } else {
        uRL = new URL(paramHttpRequest.getUrl());
      } 
      HttpURLConnection httpURLConnection = (HttpURLConnection)uRL.openConnection();
      if (str.equalsIgnoreCase("POST") || str.equalsIgnoreCase("PUT") || str.equalsIgnoreCase("PATCH")) {
        bool = true;
      } else {
        bool = false;
      } 
      httpURLConnection.setDoOutput(bool);
      httpURLConnection.setDoInput(true);
      httpURLConnection.setRequestMethod(str);
      HttpURLConnection.setFollowRedirects(paramHttpRequest.getFollowRedirects());
      putIntoConnectionsAndListeners(paramHttpRequest, paramHttpResponseListener, httpURLConnection);
      for (Map.Entry entry : paramHttpRequest.getHeaders().entrySet())
        httpURLConnection.addRequestProperty((String)entry.getKey(), (String)entry.getValue()); 
      httpURLConnection.setConnectTimeout(paramHttpRequest.getTimeOut());
      httpURLConnection.setReadTimeout(paramHttpRequest.getTimeOut());
      ExecutorService executorService1 = this.executorService;
      Runnable runnable = new Runnable() {
          public void run() {
            try {
              if (doingOutPut) {
                String str = httpRequest.getContent();
                if (str != null) {
                  outputStreamWriter = new OutputStreamWriter();
                  this("UTF8");
                  try {
                    outputStreamWriter.write(str);
                  } finally {
                    StreamUtils.closeQuietly(outputStreamWriter);
                  } 
                } else {
                  InputStream inputStream = httpRequest.getContentStream();
                  if (inputStream != null) {
                    outputStream = connection.getOutputStream();
                    try {
                      StreamUtils.copyStream(inputStream, outputStream);
                    } finally {
                      StreamUtils.closeQuietly(outputStream);
                    } 
                  } 
                } 
              } 
              connection.connect();
              NetJavaImpl.HttpClientResponse httpClientResponse = new NetJavaImpl.HttpClientResponse();
              this();
              try {
                Net.HttpResponseListener httpResponseListener = NetJavaImpl.this.getFromListeners(httpRequest);
                if (httpResponseListener != null)
                  httpResponseListener.handleHttpResponse(httpClientResponse); 
                NetJavaImpl.this.removeFromConnectionsAndListeners(httpRequest);
              } finally {
                connection.disconnect();
              } 
            } catch (Exception null) {
              connection.disconnect();
              try {
                httpResponseListener.failed(null);
                return;
              } finally {
                NetJavaImpl.this.removeFromConnectionsAndListeners(httpRequest);
              } 
            } 
          }
        };
      super(this, bool, paramHttpRequest, httpURLConnection, paramHttpResponseListener);
      executorService1.submit(runnable);
      return;
    } catch (Exception exception) {
      try {
        paramHttpResponseListener.failed(exception);
        return;
      } finally {
        removeFromConnectionsAndListeners(paramHttpRequest);
      } 
    } 
  }
  
  static class HttpClientResponse implements Net.HttpResponse {
    private final HttpURLConnection connection;
    
    private HttpStatus status;
    
    public HttpClientResponse(HttpURLConnection param1HttpURLConnection) throws IOException {
      this.connection = param1HttpURLConnection;
      try {
        HttpStatus httpStatus = new HttpStatus();
        this(param1HttpURLConnection.getResponseCode());
        this.status = httpStatus;
      } catch (IOException param1HttpURLConnection) {
        this.status = new HttpStatus(-1);
      } 
    }
    
    private InputStream getInputStream() {
      try {
        return this.connection.getInputStream();
      } catch (IOException iOException) {
        return this.connection.getErrorStream();
      } 
    }
    
    public String getHeader(String param1String) { return this.connection.getHeaderField(param1String); }
    
    public Map<String, List<String>> getHeaders() { return this.connection.getHeaderFields(); }
    
    public byte[] getResult() {
      Exception exception;
      InputStream inputStream = getInputStream();
      if (inputStream == null)
        return StreamUtils.EMPTY_BYTES; 
      try {
        exception = StreamUtils.copyStreamToByteArray(inputStream, this.connection.getContentLength());
        StreamUtils.closeQuietly(inputStream);
        return exception;
      } catch (IOException iOException) {
        exception = StreamUtils.EMPTY_BYTES;
        StreamUtils.closeQuietly(inputStream);
        return exception;
      } finally {}
      StreamUtils.closeQuietly(inputStream);
      throw exception;
    }
    
    public InputStream getResultAsStream() { return getInputStream(); }
    
    public String getResultAsString() {
      Exception exception;
      InputStream inputStream = getInputStream();
      if (inputStream == null)
        return ""; 
      try {
        exception = StreamUtils.copyStreamToString(inputStream, this.connection.getContentLength(), "UTF8");
        StreamUtils.closeQuietly(inputStream);
        return exception;
      } catch (IOException null) {
        StreamUtils.closeQuietly(inputStream);
        return "";
      } finally {}
      StreamUtils.closeQuietly(inputStream);
      throw exception;
    }
    
    public HttpStatus getStatus() { return this.status; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/NetJavaImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */