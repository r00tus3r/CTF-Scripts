.class public Lcom/badlogic/gdx/net/SocketHints;
.super Ljava/lang/Object;
.source "SocketHints.java"


# instance fields
.field public connectTimeout:I

.field public keepAlive:Z

.field public linger:Z

.field public lingerDuration:I

.field public performancePrefBandwidth:I

.field public performancePrefConnectionTime:I

.field public performancePrefLatency:I

.field public receiveBufferSize:I

.field public sendBufferSize:I

.field public socketTimeout:I

.field public tcpNoDelay:Z

.field public trafficClass:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x1388

    .line 26
    iput v0, p0, Lcom/badlogic/gdx/net/SocketHints;->connectTimeout:I

    const/4 v0, 0x0

    .line 34
    iput v0, p0, Lcom/badlogic/gdx/net/SocketHints;->performancePrefConnectionTime:I

    const/4 v1, 0x1

    .line 35
    iput v1, p0, Lcom/badlogic/gdx/net/SocketHints;->performancePrefLatency:I

    .line 36
    iput v0, p0, Lcom/badlogic/gdx/net/SocketHints;->performancePrefBandwidth:I

    const/16 v2, 0x14

    .line 47
    iput v2, p0, Lcom/badlogic/gdx/net/SocketHints;->trafficClass:I

    .line 49
    iput-boolean v1, p0, Lcom/badlogic/gdx/net/SocketHints;->keepAlive:Z

    .line 51
    iput-boolean v1, p0, Lcom/badlogic/gdx/net/SocketHints;->tcpNoDelay:Z

    const/16 v1, 0x1000

    .line 53
    iput v1, p0, Lcom/badlogic/gdx/net/SocketHints;->sendBufferSize:I

    .line 55
    iput v1, p0, Lcom/badlogic/gdx/net/SocketHints;->receiveBufferSize:I

    .line 57
    iput-boolean v0, p0, Lcom/badlogic/gdx/net/SocketHints;->linger:Z

    .line 59
    iput v0, p0, Lcom/badlogic/gdx/net/SocketHints;->lingerDuration:I

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/net/SocketHints;->socketTimeout:I

    return-void
.end method
