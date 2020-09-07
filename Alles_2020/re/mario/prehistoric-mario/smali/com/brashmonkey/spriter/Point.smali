.class public Lcom/brashmonkey/spriter/Point;
.super Ljava/lang/Object;
.source "Point.java"


# instance fields
.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, v0, v0}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Point;)V
    .locals 1

    .line 33
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-direct {p0, v0, p1}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    return-void
.end method


# virtual methods
.method public copy()Lcom/brashmonkey/spriter/Point;
    .locals 3

    .line 128
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    iget v1, p0, Lcom/brashmonkey/spriter/Point;->x:F

    iget v2, p0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-direct {v0, v1, v2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    return-object v0
.end method

.method public rotate(F)Lcom/brashmonkey/spriter/Point;
    .locals 5

    .line 110
    iget v0, p0, Lcom/brashmonkey/spriter/Point;->x:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/brashmonkey/spriter/Point;->y:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    .line 111
    :cond_0
    invoke-static {p1}, Lcom/brashmonkey/spriter/Calculator;->cosDeg(F)F

    move-result v0

    .line 112
    invoke-static {p1}, Lcom/brashmonkey/spriter/Calculator;->sinDeg(F)F

    move-result p1

    .line 114
    iget v1, p0, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v2, v1, v0

    iget v3, p0, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float v4, v3, p1

    sub-float/2addr v2, v4

    mul-float v1, v1, p1

    mul-float v3, v3, v0

    add-float/2addr v1, v3

    .line 117
    iput v2, p0, Lcom/brashmonkey/spriter/Point;->x:F

    .line 118
    iput v1, p0, Lcom/brashmonkey/spriter/Point;->y:F

    :cond_1
    return-object p0
.end method

.method public scale(FF)Lcom/brashmonkey/spriter/Point;
    .locals 1

    .line 74
    iget v0, p0, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float p1, p1, p2

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    move-result-object p1

    return-object p1
.end method

.method public scale(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;
    .locals 1

    .line 101
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Point;->scale(FF)Lcom/brashmonkey/spriter/Point;

    move-result-object p1

    return-object p1
.end method

.method public set(FF)Lcom/brashmonkey/spriter/Point;
    .locals 0

    .line 52
    iput p1, p0, Lcom/brashmonkey/spriter/Point;->x:F

    .line 53
    iput p2, p0, Lcom/brashmonkey/spriter/Point;->y:F

    return-object p0
.end method

.method public set(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;
    .locals 1

    .line 83
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public translate(FF)Lcom/brashmonkey/spriter/Point;
    .locals 1

    .line 64
    iget v0, p0, Lcom/brashmonkey/spriter/Point;->x:F

    add-float/2addr v0, p1

    iget p1, p0, Lcom/brashmonkey/spriter/Point;->y:F

    add-float/2addr p1, p2

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    move-result-object p1

    return-object p1
.end method

.method public translate(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;
    .locals 1

    .line 92
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Point;->translate(FF)Lcom/brashmonkey/spriter/Point;

    move-result-object p1

    return-object p1
.end method
