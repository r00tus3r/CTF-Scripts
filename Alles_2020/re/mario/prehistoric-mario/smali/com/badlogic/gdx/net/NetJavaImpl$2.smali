.class Lcom/badlogic/gdx/net/NetJavaImpl$2;
.super Ljava/lang/Object;
.source "NetJavaImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/net/NetJavaImpl;->sendHttpRequest(Lcom/badlogic/gdx/Net$HttpRequest;Lcom/badlogic/gdx/Net$HttpResponseListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/net/NetJavaImpl;

.field final synthetic val$connection:Ljava/net/HttpURLConnection;

.field final synthetic val$doingOutPut:Z

.field final synthetic val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

.field final synthetic val$httpResponseListener:Lcom/badlogic/gdx/Net$HttpResponseListener;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/net/NetJavaImpl;ZLcom/badlogic/gdx/Net$HttpRequest;Ljava/net/HttpURLConnection;Lcom/badlogic/gdx/Net$HttpResponseListener;)V
    .locals 0

    .line 189
    iput-object p1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->this$0:Lcom/badlogic/gdx/net/NetJavaImpl;

    iput-boolean p2, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$doingOutPut:Z

    iput-object p3, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    iput-object p4, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    iput-object p5, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpResponseListener:Lcom/badlogic/gdx/Net$HttpResponseListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 194
    :try_start_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$doingOutPut:Z

    if-eqz v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    invoke-virtual {v0}, Lcom/badlogic/gdx/Net$HttpRequest;->getContent()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 198
    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    const-string v3, "UTF8"

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    :try_start_1
    invoke-virtual {v1, v0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 202
    :try_start_2
    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    invoke-virtual {v0}, Lcom/badlogic/gdx/Net$HttpRequest;->getContentStream()Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 207
    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 209
    :try_start_3
    invoke-static {v0, v1}, Lcom/badlogic/gdx/utils/StreamUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 211
    :try_start_4
    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_1
    move-exception v0

    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0

    .line 217
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 219
    new-instance v0, Lcom/badlogic/gdx/net/NetJavaImpl$HttpClientResponse;

    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/net/NetJavaImpl$HttpClientResponse;-><init>(Ljava/net/HttpURLConnection;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 221
    :try_start_5
    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->this$0:Lcom/badlogic/gdx/net/NetJavaImpl;

    iget-object v2, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/net/NetJavaImpl;->getFromListeners(Lcom/badlogic/gdx/Net$HttpRequest;)Lcom/badlogic/gdx/Net$HttpResponseListener;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 224
    invoke-interface {v1, v0}, Lcom/badlogic/gdx/Net$HttpResponseListener;->handleHttpResponse(Lcom/badlogic/gdx/Net$HttpResponse;)V

    .line 226
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->this$0:Lcom/badlogic/gdx/net/NetJavaImpl;

    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/net/NetJavaImpl;->removeFromConnectionsAndListeners(Lcom/badlogic/gdx/Net$HttpRequest;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 228
    :try_start_6
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_1

    :catchall_2
    move-exception v0

    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    :catch_0
    move-exception v0

    .line 231
    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 233
    :try_start_7
    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpResponseListener:Lcom/badlogic/gdx/Net$HttpResponseListener;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/Net$HttpResponseListener;->failed(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 235
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->this$0:Lcom/badlogic/gdx/net/NetJavaImpl;

    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/net/NetJavaImpl;->removeFromConnectionsAndListeners(Lcom/badlogic/gdx/Net$HttpRequest;)V

    :goto_1
    return-void

    :catchall_3
    move-exception v0

    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->this$0:Lcom/badlogic/gdx/net/NetJavaImpl;

    iget-object v2, p0, Lcom/badlogic/gdx/net/NetJavaImpl$2;->val$httpRequest:Lcom/badlogic/gdx/Net$HttpRequest;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/net/NetJavaImpl;->removeFromConnectionsAndListeners(Lcom/badlogic/gdx/Net$HttpRequest;)V

    throw v0
.end method
