.class public Lcom/brashmonkey/spriter/Rectangle;
.super Ljava/lang/Object;
.source "Rectangle.java"


# instance fields
.field public bottom:F

.field public left:F

.field public right:F

.field public final size:Lcom/brashmonkey/spriter/Dimension;

.field public top:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/brashmonkey/spriter/Rectangle;->set(FFFF)V

    .line 29
    new-instance p1, Lcom/brashmonkey/spriter/Dimension;

    const/4 p2, 0x0

    invoke-direct {p1, p2, p2}, Lcom/brashmonkey/spriter/Dimension;-><init>(FF)V

    iput-object p1, p0, Lcom/brashmonkey/spriter/Rectangle;->size:Lcom/brashmonkey/spriter/Dimension;

    .line 30
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Rectangle;->calculateSize()V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Rectangle;)V
    .locals 3

    .line 38
    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->left:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->top:F

    iget v2, p1, Lcom/brashmonkey/spriter/Rectangle;->right:F

    iget p1, p1, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/brashmonkey/spriter/Rectangle;-><init>(FFFF)V

    return-void
.end method

.method public static areIntersecting(Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;)Z
    .locals 2

    .line 101
    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->left:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->top:F

    invoke-virtual {p0, v0, v1}, Lcom/brashmonkey/spriter/Rectangle;->isInside(FF)Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->right:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->top:F

    invoke-virtual {p0, v0, v1}, Lcom/brashmonkey/spriter/Rectangle;->isInside(FF)Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->left:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    invoke-virtual {p0, v0, v1}, Lcom/brashmonkey/spriter/Rectangle;->isInside(FF)Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->right:F

    iget p1, p1, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Rectangle;->isInside(FF)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static setBiggerRectangle(Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;)V
    .locals 2

    .line 112
    iget v0, p0, Lcom/brashmonkey/spriter/Rectangle;->left:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->left:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p2, Lcom/brashmonkey/spriter/Rectangle;->left:F

    .line 113
    iget v0, p0, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p2, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    .line 114
    iget v0, p0, Lcom/brashmonkey/spriter/Rectangle;->right:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->right:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p2, Lcom/brashmonkey/spriter/Rectangle;->right:F

    .line 115
    iget p0, p0, Lcom/brashmonkey/spriter/Rectangle;->top:F

    iget p1, p1, Lcom/brashmonkey/spriter/Rectangle;->top:F

    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    iput p0, p2, Lcom/brashmonkey/spriter/Rectangle;->top:F

    return-void
.end method


# virtual methods
.method public calculateSize()V
    .locals 4

    .line 64
    iget-object v0, p0, Lcom/brashmonkey/spriter/Rectangle;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v1, p0, Lcom/brashmonkey/spriter/Rectangle;->right:F

    iget v2, p0, Lcom/brashmonkey/spriter/Rectangle;->left:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/brashmonkey/spriter/Rectangle;->top:F

    iget v3, p0, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/brashmonkey/spriter/Dimension;->set(FF)V

    return-void
.end method

.method public isInside(FF)Z
    .locals 1

    .line 48
    iget v0, p0, Lcom/brashmonkey/spriter/Rectangle;->left:F

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/brashmonkey/spriter/Rectangle;->right:F

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    iget p1, p0, Lcom/brashmonkey/spriter/Rectangle;->top:F

    cmpg-float p1, p2, p1

    if-gtz p1, :cond_0

    iget p1, p0, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isInside(Lcom/brashmonkey/spriter/Point;)Z
    .locals 1

    .line 57
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Rectangle;->isInside(FF)Z

    move-result p1

    return p1
.end method

.method public set(FFFF)V
    .locals 0

    .line 88
    iput p1, p0, Lcom/brashmonkey/spriter/Rectangle;->left:F

    .line 89
    iput p2, p0, Lcom/brashmonkey/spriter/Rectangle;->top:F

    .line 90
    iput p3, p0, Lcom/brashmonkey/spriter/Rectangle;->right:F

    .line 91
    iput p4, p0, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/Rectangle;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 73
    :cond_0
    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    iput v0, p0, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    .line 74
    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->left:F

    iput v0, p0, Lcom/brashmonkey/spriter/Rectangle;->left:F

    .line 75
    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->right:F

    iput v0, p0, Lcom/brashmonkey/spriter/Rectangle;->right:F

    .line 76
    iget p1, p1, Lcom/brashmonkey/spriter/Rectangle;->top:F

    iput p1, p0, Lcom/brashmonkey/spriter/Rectangle;->top:F

    .line 77
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Rectangle;->calculateSize()V

    return-void
.end method
