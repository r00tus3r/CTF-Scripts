package com.badlogic.gdx;

import com.badlogic.gdx.net.HttpStatus;
import com.badlogic.gdx.net.ServerSocket;
import com.badlogic.gdx.net.ServerSocketHints;
import com.badlogic.gdx.net.Socket;
import com.badlogic.gdx.net.SocketHints;
import com.badlogic.gdx.utils.Pool;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface Net {
  void cancelHttpRequest(HttpRequest paramHttpRequest);
  
  Socket newClientSocket(Protocol paramProtocol, String paramString, int paramInt, SocketHints paramSocketHints);
  
  ServerSocket newServerSocket(Protocol paramProtocol, int paramInt, ServerSocketHints paramServerSocketHints);
  
  ServerSocket newServerSocket(Protocol paramProtocol, String paramString, int paramInt, ServerSocketHints paramServerSocketHints);
  
  boolean openURI(String paramString);
  
  void sendHttpRequest(HttpRequest paramHttpRequest, HttpResponseListener paramHttpResponseListener);
  
  public static interface HttpMethods {
    public static final String DELETE = "DELETE";
    
    public static final String GET = "GET";
    
    public static final String PATCH = "PATCH";
    
    public static final String POST = "POST";
    
    public static final String PUT = "PUT";
  }
  
  public static class HttpRequest implements Pool.Poolable {
    private String content;
    
    private long contentLength;
    
    private InputStream contentStream;
    
    private boolean followRedirects = true;
    
    private Map<String, String> headers = new HashMap();
    
    private String httpMethod;
    
    private boolean includeCredentials = false;
    
    private int timeOut = 0;
    
    private String url;
    
    public HttpRequest() {}
    
    public HttpRequest(String param1String) {
      this();
      this.httpMethod = param1String;
    }
    
    public String getContent() { return this.content; }
    
    public long getContentLength() { return this.contentLength; }
    
    public InputStream getContentStream() { return this.contentStream; }
    
    public boolean getFollowRedirects() { return this.followRedirects; }
    
    public Map<String, String> getHeaders() { return this.headers; }
    
    public boolean getIncludeCredentials() { return this.includeCredentials; }
    
    public String getMethod() { return this.httpMethod; }
    
    public int getTimeOut() { return this.timeOut; }
    
    public String getUrl() { return this.url; }
    
    public void reset() {
      this.httpMethod = null;
      this.url = null;
      this.headers.clear();
      this.timeOut = 0;
      this.content = null;
      this.contentStream = null;
      this.contentLength = 0L;
      this.followRedirects = true;
    }
    
    public void setContent(InputStream param1InputStream, long param1Long) {
      this.contentStream = param1InputStream;
      this.contentLength = param1Long;
    }
    
    public void setContent(String param1String) { this.content = param1String; }
    
    public void setFollowRedirects(boolean param1Boolean) throws IllegalArgumentException {
      if (param1Boolean || Gdx.app.getType() != Application.ApplicationType.WebGL) {
        this.followRedirects = param1Boolean;
        return;
      } 
      throw new IllegalArgumentException("Following redirects can't be disabled using the GWT/WebGL backend!");
    }
    
    public void setHeader(String param1String1, String param1String2) { this.headers.put(param1String1, param1String2); }
    
    public void setIncludeCredentials(boolean param1Boolean) throws IllegalArgumentException { this.includeCredentials = param1Boolean; }
    
    public void setMethod(String param1String) { this.httpMethod = param1String; }
    
    public void setTimeOut(int param1Int) { this.timeOut = param1Int; }
    
    public void setUrl(String param1String) { this.url = param1String; }
  }
  
  public static interface HttpResponse {
    String getHeader(String param1String);
    
    Map<String, List<String>> getHeaders();
    
    byte[] getResult();
    
    InputStream getResultAsStream();
    
    String getResultAsString();
    
    HttpStatus getStatus();
  }
  
  public static interface HttpResponseListener {
    void cancelled();
    
    void failed(Throwable param1Throwable);
    
    void handleHttpResponse(Net.HttpResponse param1HttpResponse);
  }
  
  public enum Protocol {
    TCP;
    
    static  {
      $VALUES = new Protocol[] { TCP };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Net.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */