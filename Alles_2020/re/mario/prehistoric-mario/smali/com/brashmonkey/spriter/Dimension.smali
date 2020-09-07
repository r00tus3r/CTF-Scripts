.class public Lcom/brashmonkey/spriter/Dimension;
.super Ljava/lang/Object;
.source "Dimension.java"


# instance fields
.field public height:F

.field public width:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/brashmonkey/spriter/Dimension;->set(FF)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Dimension;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Dimension;->set(Lcom/brashmonkey/spriter/Dimension;)V

    return-void
.end method


# virtual methods
.method public set(FF)V
    .locals 0

    .line 36
    iput p1, p0, Lcom/brashmonkey/spriter/Dimension;->width:F

    .line 37
    iput p2, p0, Lcom/brashmonkey/spriter/Dimension;->height:F

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/Dimension;)V
    .locals 1

    .line 45
    iget v0, p1, Lcom/brashmonkey/spriter/Dimension;->width:F

    iget p1, p1, Lcom/brashmonkey/spriter/Dimension;->height:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Dimension;->set(FF)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Dimension;->width:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Dimension;->height:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
