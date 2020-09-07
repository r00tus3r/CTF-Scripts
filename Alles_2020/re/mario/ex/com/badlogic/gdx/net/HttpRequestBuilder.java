package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.Base64Coder;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.Pools;
import java.io.InputStream;
import java.util.Map;

public class HttpRequestBuilder {
  public static String baseUrl = "";
  
  public static int defaultTimeout = 1000;
  
  public static Json json = new Json();
  
  private Net.HttpRequest httpRequest;
  
  private void validate() {
    if (this.httpRequest != null)
      return; 
    throw new IllegalStateException("A new request has not been started yet. Call HttpRequestBuilder.newRequest() first.");
  }
  
  public HttpRequestBuilder basicAuthentication(String paramString1, String paramString2) {
    validate();
    Net.HttpRequest httpRequest1 = this.httpRequest;
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append("Basic ");
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(paramString1);
    stringBuilder2.append(":");
    stringBuilder2.append(paramString2);
    stringBuilder1.append(Base64Coder.encodeString(stringBuilder2.toString()));
    httpRequest1.setHeader("Authorization", stringBuilder1.toString());
    return this;
  }
  
  public Net.HttpRequest build() {
    validate();
    Net.HttpRequest httpRequest1 = this.httpRequest;
    this.httpRequest = null;
    return httpRequest1;
  }
  
  public HttpRequestBuilder content(InputStream paramInputStream, long paramLong) {
    validate();
    this.httpRequest.setContent(paramInputStream, paramLong);
    return this;
  }
  
  public HttpRequestBuilder content(String paramString) {
    validate();
    this.httpRequest.setContent(paramString);
    return this;
  }
  
  public HttpRequestBuilder followRedirects(boolean paramBoolean) {
    validate();
    this.httpRequest.setFollowRedirects(paramBoolean);
    return this;
  }
  
  public HttpRequestBuilder formEncodedContent(Map<String, String> paramMap) {
    validate();
    this.httpRequest.setHeader("Content-Type", "application/x-www-form-urlencoded");
    String str = HttpParametersUtils.convertHttpParameters(paramMap);
    this.httpRequest.setContent(str);
    return this;
  }
  
  public HttpRequestBuilder header(String paramString1, String paramString2) {
    validate();
    this.httpRequest.setHeader(paramString1, paramString2);
    return this;
  }
  
  public HttpRequestBuilder includeCredentials(boolean paramBoolean) {
    validate();
    this.httpRequest.setIncludeCredentials(paramBoolean);
    return this;
  }
  
  public HttpRequestBuilder jsonContent(Object paramObject) {
    validate();
    this.httpRequest.setHeader("Content-Type", "application/json");
    paramObject = json.toJson(paramObject);
    this.httpRequest.setContent(paramObject);
    return this;
  }
  
  public HttpRequestBuilder method(String paramString) {
    validate();
    this.httpRequest.setMethod(paramString);
    return this;
  }
  
  public HttpRequestBuilder newRequest() {
    if (this.httpRequest == null) {
      this.httpRequest = (Net.HttpRequest)Pools.obtain(Net.HttpRequest.class);
      this.httpRequest.setTimeOut(defaultTimeout);
      return this;
    } 
    throw new IllegalStateException("A new request has already been started. Call HttpRequestBuilder.build() first.");
  }
  
  public HttpRequestBuilder timeout(int paramInt) {
    validate();
    this.httpRequest.setTimeOut(paramInt);
    return this;
  }
  
  public HttpRequestBuilder url(String paramString) {
    validate();
    Net.HttpRequest httpRequest1 = this.httpRequest;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(baseUrl);
    stringBuilder.append(paramString);
    httpRequest1.setUrl(stringBuilder.toString());
    return this;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/net/HttpRequestBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */