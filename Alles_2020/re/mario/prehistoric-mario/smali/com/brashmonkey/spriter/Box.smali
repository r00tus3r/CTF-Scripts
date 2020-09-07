.class public Lcom/brashmonkey/spriter/Box;
.super Ljava/lang/Object;
.source "Box.java"


# instance fields
.field public final points:[Lcom/brashmonkey/spriter/Point;

.field private rect:Lcom/brashmonkey/spriter/Rectangle;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 19
    new-array v1, v0, [Lcom/brashmonkey/spriter/Point;

    iput-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x0

    if-ge v1, v0, :cond_0

    .line 22
    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    new-instance v4, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v4, v2, v2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, Lcom/brashmonkey/spriter/Rectangle;

    invoke-direct {v0, v2, v2, v2, v2}, Lcom/brashmonkey/spriter/Rectangle;-><init>(FFFF)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    return-void
.end method


# virtual methods
.method public calcFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V
    .locals 8

    .line 35
    iget-object v0, p2, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v0, v0, Lcom/brashmonkey/spriter/Dimension;->width:F

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v0, v0, v1

    .line 36
    iget-object p2, p2, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    iget p2, p2, Lcom/brashmonkey/spriter/Dimension;->height:F

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float p2, p2, v1

    .line 38
    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v1, v1, v0

    .line 39
    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float v2, v2, p2

    .line 41
    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    neg-float v5, v1

    neg-float v6, v2

    invoke-virtual {v3, v5, v6}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    .line 42
    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v7, 0x1

    aget-object v3, v3, v7

    sub-float/2addr v0, v1

    invoke-virtual {v3, v0, v6}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    .line 43
    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v3, 0x2

    aget-object v1, v1, v3

    sub-float/2addr p2, v2

    invoke-virtual {v1, v5, p2}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    .line 44
    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v2, 0x3

    aget-object v1, v1, v2

    invoke-virtual {v1, v0, p2}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    const/4 p2, 0x0

    :goto_0
    const/4 v0, 0x4

    if-ge p2, v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v0, v0, p2

    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->rotate(F)Lcom/brashmonkey/spriter/Point;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v4, v0, :cond_1

    .line 49
    iget-object p2, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object p2, p2, v4

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p2, v1}, Lcom/brashmonkey/spriter/Point;->translate(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public collides(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;FF)Z
    .locals 5

    .line 62
    iget-object v0, p2, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v0, v0, Lcom/brashmonkey/spriter/Dimension;->width:F

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v0, v0, v1

    .line 63
    iget-object p2, p2, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    iget p2, p2, Lcom/brashmonkey/spriter/Dimension;->height:F

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float p2, p2, v1

    .line 65
    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v1, v1, v0

    .line 66
    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float v2, v2, p2

    .line 68
    new-instance v3, Lcom/brashmonkey/spriter/Point;

    iget-object v4, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->x:F

    sub-float/2addr p3, v4

    iget-object v4, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->y:F

    sub-float/2addr p4, v4

    invoke-direct {v3, p3, p4}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    .line 69
    iget p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    neg-float p1, p1

    invoke-virtual {v3, p1}, Lcom/brashmonkey/spriter/Point;->rotate(F)Lcom/brashmonkey/spriter/Point;

    .line 71
    iget p1, v3, Lcom/brashmonkey/spriter/Point;->x:F

    neg-float p3, v1

    cmpl-float p1, p1, p3

    if-ltz p1, :cond_0

    iget p1, v3, Lcom/brashmonkey/spriter/Point;->x:F

    sub-float/2addr v0, v1

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    iget p1, v3, Lcom/brashmonkey/spriter/Point;->y:F

    neg-float p3, v2

    cmpl-float p1, p1, p3

    if-ltz p1, :cond_0

    iget p1, v3, Lcom/brashmonkey/spriter/Point;->y:F

    sub-float/2addr p2, v2

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getBoundingRect()Lcom/brashmonkey/spriter/Rectangle;
    .locals 7

    .line 91
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v2

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v4, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v4, v4, v2

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v5, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v5, v5, v2

    iget v5, v5, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/brashmonkey/spriter/Rectangle;->set(FFFF)V

    .line 92
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v1, v1, v2

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v5, 0x2

    aget-object v3, v3, v5

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v6, 0x3

    aget-object v3, v3, v6

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget v3, v3, Lcom/brashmonkey/spriter/Rectangle;->left:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, v0, Lcom/brashmonkey/spriter/Rectangle;->left:F

    .line 93
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v1, v1, v2

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v4

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v5

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v6

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget v3, v3, Lcom/brashmonkey/spriter/Rectangle;->right:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Lcom/brashmonkey/spriter/Rectangle;->right:F

    .line 94
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v1, v1, v2

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v4

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v5

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v6

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget-object v3, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget v3, v3, Lcom/brashmonkey/spriter/Rectangle;->top:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Lcom/brashmonkey/spriter/Rectangle;->top:F

    .line 95
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v1, v1, v2

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v2, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v4

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v5

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v6

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget v2, v2, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, v0, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    .line 96
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->rect:Lcom/brashmonkey/spriter/Rectangle;

    return-object v0
.end method

.method public isInside(Lcom/brashmonkey/spriter/Rectangle;)Z
    .locals 5

    .line 81
    iget-object v0, p0, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v4, v0, v2

    .line 82
    invoke-virtual {p1, v4}, Lcom/brashmonkey/spriter/Rectangle;->isInside(Lcom/brashmonkey/spriter/Point;)Z

    move-result v4

    or-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return v3
.end method
