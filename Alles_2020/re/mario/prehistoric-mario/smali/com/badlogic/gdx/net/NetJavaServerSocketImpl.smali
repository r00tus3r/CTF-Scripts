.class public Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;
.super Ljava/lang/Object;
.source "NetJavaServerSocketImpl.java"

# interfaces
.implements Lcom/badlogic/gdx/net/ServerSocket;


# instance fields
.field private protocol:Lcom/badlogic/gdx/Net$Protocol;

.field private server:Ljava/net/ServerSocket;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/Net$Protocol;ILcom/badlogic/gdx/net/ServerSocketHints;)V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;-><init>(Lcom/badlogic/gdx/Net$Protocol;Ljava/lang/String;ILcom/badlogic/gdx/net/ServerSocketHints;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/Net$Protocol;Ljava/lang/String;ILcom/badlogic/gdx/net/ServerSocketHints;)V
    .locals 3

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->protocol:Lcom/badlogic/gdx/Net$Protocol;

    .line 50
    :try_start_0
    new-instance p1, Ljava/net/ServerSocket;

    invoke-direct {p1}, Ljava/net/ServerSocket;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    if-eqz p4, :cond_0

    .line 52
    iget-object p1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    iget v0, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->performancePrefConnectionTime:I

    iget v1, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->performancePrefLatency:I

    iget v2, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->performancePrefBandwidth:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/net/ServerSocket;->setPerformancePreferences(III)V

    .line 54
    iget-object p1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    iget-boolean v0, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->reuseAddress:Z

    invoke-virtual {p1, v0}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 55
    iget-object p1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    iget v0, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->acceptTimeout:I

    invoke-virtual {p1, v0}, Ljava/net/ServerSocket;->setSoTimeout(I)V

    .line 56
    iget-object p1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    iget v0, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->receiveBufferSize:I

    invoke-virtual {p1, v0}, Ljava/net/ServerSocket;->setReceiveBufferSize(I)V

    :cond_0
    if-eqz p2, :cond_1

    .line 62
    new-instance p1, Ljava/net/InetSocketAddress;

    invoke-direct {p1, p2, p3}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    goto :goto_0

    .line 64
    :cond_1
    new-instance p1, Ljava/net/InetSocketAddress;

    invoke-direct {p1, p3}, Ljava/net/InetSocketAddress;-><init>(I)V

    :goto_0
    if-eqz p4, :cond_2

    .line 68
    iget-object p2, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    iget p4, p4, Lcom/badlogic/gdx/net/ServerSocketHints;->backlog:I

    invoke-virtual {p2, p1, p4}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    goto :goto_1

    .line 70
    :cond_2
    iget-object p2, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    invoke-virtual {p2, p1}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception p1

    .line 73
    new-instance p2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot create a server socket at port "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, "."

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method


# virtual methods
.method public accept(Lcom/badlogic/gdx/net/SocketHints;)Lcom/badlogic/gdx/net/Socket;
    .locals 2

    .line 85
    :try_start_0
    new-instance v0, Lcom/badlogic/gdx/net/NetJavaSocketImpl;

    iget-object v1, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/badlogic/gdx/net/NetJavaSocketImpl;-><init>(Ljava/net/Socket;Lcom/badlogic/gdx/net/SocketHints;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 87
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Error accepting socket."

    invoke-direct {v0, v1, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public dispose()V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;

    if-eqz v0, :cond_0

    .line 95
    :try_start_0
    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V

    const/4 v0, 0x0

    .line 96
    iput-object v0, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->server:Ljava/net/ServerSocket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 98
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v2, "Error closing server."

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    :goto_0
    return-void
.end method

.method public getProtocol()Lcom/badlogic/gdx/Net$Protocol;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/net/NetJavaServerSocketImpl;->protocol:Lcom/badlogic/gdx/Net$Protocol;

    return-object v0
.end method
