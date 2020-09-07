.class public Lcom/badlogic/gdx/backends/android/AndroidNet;
.super Ljava/lang/Object;
.source "AndroidNet.java"

# interfaces
.implements Lcom/badlogic/gdx/Net;


# instance fields
.field final app:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

.field netJavaImpl:Lcom/badlogic/gdx/net/NetJavaImpl;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet;->app:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    .line 45
    new-instance p1, Lcom/badlogic/gdx/net/NetJavaImpl;

    iget p2, p2, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->maxNetThreads:I

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/net/NetJavaImpl;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet;->netJavaImpl:Lcom/badlogic/gdx/net/NetJavaImpl;

    return-void
.end method


# virtual methods
.method public cancelHttpRequest(Lcom/badlogic/gdx/Net$HttpRequest;)V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidNet;->netJavaImpl:Lcom/badlogic/gdx/net/NetJavaImpl;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/net/NetJavaImpl;->cancelHttpRequest(Lcom/badlogic/gdx/Net$HttpRequest;)V

    return-void
.end method

.method public newClientSocket(Lcom/badlogic/gdx/Net$Protocol;Ljava/lang/String;ILcom/badlogic/gdx/net/SocketHints;)Lcom/badlogic/gdx/net/Socket;
    .locals 1

    .line 70
    new-instance v0, Lcom/badlogic/gdx/net/NetJavaSocketImpl;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/net/NetJavaSocketImpl;-><init>(Lcom/badlogic/gdx/Net$Protocol;Ljava/lang/String;ILcom/badlogic/gdx/net/SocketHints;)V

    return-object v0
.end method

.method public newServerSocket(Lcom/badlogic/gdx/Net$Protocol;ILcom/badlogic/gdx/net/ServerSocketHints;)Lcom/badlogic/gdx/net/ServerSocket;
    .locals 1

    .line 65
    new-instance v0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;-><init>(Lcom/badlogic/gdx/Net$Protocol;ILcom/badlogic/gdx/net/ServerSocketHints;)V

    return-object v0
.end method

.method public newServerSocket(Lcom/badlogic/gdx/Net$Protocol;Ljava/lang/String;ILcom/badlogic/gdx/net/ServerSocketHints;)Lcom/badlogic/gdx/net/ServerSocket;
    .locals 1

    .line 60
    new-instance v0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;-><init>(Lcom/badlogic/gdx/Net$Protocol;Ljava/lang/String;ILcom/badlogic/gdx/net/ServerSocketHints;)V

    return-object v0
.end method

.method public openURI(Ljava/lang/String;)Z
    .locals 3

    .line 76
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 77
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 78
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet;->app:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    invoke-interface {v1}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/high16 v2, 0x10000

    .line 79
    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidNet;->app:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidNet$1;

    invoke-direct {v1, p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidNet$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidNet;Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->runOnUiThread(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public sendHttpRequest(Lcom/badlogic/gdx/Net$HttpRequest;Lcom/badlogic/gdx/Net$HttpResponseListener;)V
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidNet;->netJavaImpl:Lcom/badlogic/gdx/net/NetJavaImpl;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/net/NetJavaImpl;->sendHttpRequest(Lcom/badlogic/gdx/Net$HttpRequest;Lcom/badlogic/gdx/Net$HttpResponseListener;)V

    return-void
.end method
