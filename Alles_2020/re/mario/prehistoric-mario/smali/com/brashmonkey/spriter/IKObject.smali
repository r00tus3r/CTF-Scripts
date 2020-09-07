.class public Lcom/brashmonkey/spriter/IKObject;
.super Lcom/brashmonkey/spriter/Point;
.source "IKObject.java"


# instance fields
.field chainLength:I

.field iterations:I


# direct methods
.method public constructor <init>(FFII)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    .line 22
    invoke-virtual {p0, p3}, Lcom/brashmonkey/spriter/IKObject;->setLength(I)Lcom/brashmonkey/spriter/IKObject;

    .line 23
    invoke-virtual {p0, p4}, Lcom/brashmonkey/spriter/IKObject;->setIterations(I)Lcom/brashmonkey/spriter/IKObject;

    return-void
.end method


# virtual methods
.method public getChainLength()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/brashmonkey/spriter/IKObject;->chainLength:I

    return v0
.end method

.method public getIterations()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/brashmonkey/spriter/IKObject;->iterations:I

    return v0
.end method

.method public setIterations(I)Lcom/brashmonkey/spriter/IKObject;
    .locals 1

    if-ltz p1, :cond_0

    .line 48
    iput p1, p0, Lcom/brashmonkey/spriter/IKObject;->iterations:I

    return-object p0

    .line 47
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "The number of iterations has to be at least 1!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLength(I)Lcom/brashmonkey/spriter/IKObject;
    .locals 1

    if-ltz p1, :cond_0

    .line 35
    iput p1, p0, Lcom/brashmonkey/spriter/IKObject;->chainLength:I

    return-object p0

    .line 34
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "The chain has to be at least 0!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
