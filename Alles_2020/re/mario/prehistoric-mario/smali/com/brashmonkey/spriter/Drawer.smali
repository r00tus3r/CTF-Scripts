.class public abstract Lcom/brashmonkey/spriter/Drawer;
.super Ljava/lang/Object;
.source "Drawer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected loader:Lcom/brashmonkey/spriter/Loader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/brashmonkey/spriter/Loader<",
            "TR;>;"
        }
    .end annotation
.end field

.field public pointRadius:F


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Loader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Loader<",
            "TR;>;)V"
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x40a00000    # 5.0f

    .line 27
    iput v0, p0, Lcom/brashmonkey/spriter/Drawer;->pointRadius:F

    .line 35
    iput-object p1, p0, Lcom/brashmonkey/spriter/Drawer;->loader:Lcom/brashmonkey/spriter/Loader;

    return-void
.end method


# virtual methods
.method public abstract circle(FFF)V
.end method

.method public draw(Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    .line 179
    iget-object v0, p1, Lcom/brashmonkey/spriter/Player;->characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

    invoke-virtual {p0, p1, v0}, Lcom/brashmonkey/spriter/Drawer;->draw(Lcom/brashmonkey/spriter/Player;[Lcom/brashmonkey/spriter/Entity$CharacterMap;)V

    return-void
.end method

.method public draw(Lcom/brashmonkey/spriter/Player;[Lcom/brashmonkey/spriter/Entity$CharacterMap;)V
    .locals 0

    .line 188
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->objectIterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/brashmonkey/spriter/Drawer;->draw(Ljava/util/Iterator;[Lcom/brashmonkey/spriter/Entity$CharacterMap;)V

    return-void
.end method

.method public abstract draw(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V
.end method

.method public draw(Ljava/util/Iterator;[Lcom/brashmonkey/spriter/Entity$CharacterMap;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Object;",
            ">;[",
            "Lcom/brashmonkey/spriter/Entity$CharacterMap;",
            ")V"
        }
    .end annotation

    .line 197
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 198
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    .line 199
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/FileReference;->hasFile()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz p2, :cond_2

    .line 201
    array-length v1, p2

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_2

    aget-object v3, p2, v2

    if-eqz v3, :cond_1

    .line 203
    iget-object v4, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    iget-object v5, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    invoke-virtual {v3, v5}, Lcom/brashmonkey/spriter/Entity$CharacterMap;->get(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/FileReference;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/brashmonkey/spriter/FileReference;->set(Lcom/brashmonkey/spriter/FileReference;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 205
    :cond_2
    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Drawer;->draw(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method public drawBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Dimension;)V
    .locals 9

    .line 80
    iget v0, p2, Lcom/brashmonkey/spriter/Dimension;->height:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 81
    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    iget v3, p2, Lcom/brashmonkey/spriter/Dimension;->height:F

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    .line 82
    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget v3, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    iget v4, p2, Lcom/brashmonkey/spriter/Dimension;->height:F

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    .line 83
    iget v3, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    const/high16 v4, 0x42b40000    # 90.0f

    add-float/2addr v3, v4

    float-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v3, v5

    mul-float v3, v3, v0

    iget-object v5, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v5, v5, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float v3, v3, v5

    .line 84
    iget v5, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    add-float/2addr v5, v4

    float-to-double v4, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v4, v4, v0

    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float v4, v4, v0

    .line 86
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget v5, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v5, v5

    iget v6, p2, Lcom/brashmonkey/spriter/Dimension;->width:F

    mul-float v5, v5, v6

    iget-object v6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v6, v6, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v5, v5, v6

    add-float/2addr v0, v5

    .line 87
    iget-object v5, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v5, v5, Lcom/brashmonkey/spriter/Point;->y:F

    iget v6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    iget p2, p2, Lcom/brashmonkey/spriter/Dimension;->width:F

    mul-float v6, v6, p2

    iget-object p2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v6, v6, p2

    add-float/2addr v5, v6

    add-float p2, v1, v3

    add-float v6, v2, v4

    .line 89
    iget-object v7, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v7, v7, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v8, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v8, v8, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v7, v8, p2, v6}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    .line 90
    invoke-virtual {p0, p2, v6, v0, v5}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    sub-float/2addr v1, v3

    sub-float/2addr v2, v4

    .line 93
    iget-object p2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v3, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p2, v3, v1, v2}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    .line 94
    invoke-virtual {p0, v1, v2, v0, v5}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    .line 95
    iget-object p2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p2, p1, v0, v5}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    return-void
.end method

.method public drawBoneBoxes(Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    .line 114
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->boneIterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/brashmonkey/spriter/Drawer;->drawBoneBoxes(Lcom/brashmonkey/spriter/Player;Ljava/util/Iterator;)V

    return-void
.end method

.method public drawBoneBoxes(Lcom/brashmonkey/spriter/Player;Ljava/util/Iterator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Player;",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Bone;",
            ">;)V"
        }
    .end annotation

    .line 123
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    .line 125
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/Player;->getBox(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Box;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Drawer;->drawBox(Lcom/brashmonkey/spriter/Box;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public drawBones(Lcom/brashmonkey/spriter/Player;)V
    .locals 3

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 53
    invoke-virtual {p0, v1, v0, v0, v1}, Lcom/brashmonkey/spriter/Drawer;->setColor(FFFF)V

    .line 54
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->boneIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 55
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    .line 57
    invoke-virtual {p1, v1}, Lcom/brashmonkey/spriter/Player;->getKeyFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Timeline$Key;

    move-result-object v2

    .line 58
    iget-boolean v2, v2, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p1, v1}, Lcom/brashmonkey/spriter/Player;->getObjectInfoFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object v2

    .line 60
    iget-object v2, v2, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    .line 61
    invoke-virtual {p0, v1, v2}, Lcom/brashmonkey/spriter/Drawer;->drawBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Dimension;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public drawBox(Lcom/brashmonkey/spriter/Box;)V
    .locals 6

    .line 215
    iget-object v0, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v2, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v3, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v5, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, v2, v3, v5}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    .line 216
    iget-object v0, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v0, v0, v4

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v2, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v4

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v3, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v4, 0x3

    aget-object v3, v3, v4

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v5, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, v2, v3, v5}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    .line 217
    iget-object v0, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v0, v0, v4

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v2, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v4

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v3, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    const/4 v4, 0x2

    aget-object v3, v3, v4

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v5, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, v2, v3, v5}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    .line 218
    iget-object v0, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v0, v0, v4

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v2, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v2, v2, v4

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v3, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object v3, v3, v1

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object p1, p1, Lcom/brashmonkey/spriter/Box;->points:[Lcom/brashmonkey/spriter/Point;

    aget-object p1, p1, v1

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, v2, v3, p1}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    return-void
.end method

.method public drawBoxes(Lcom/brashmonkey/spriter/Player;)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 103
    invoke-virtual {p0, v1, v0, v1, v0}, Lcom/brashmonkey/spriter/Drawer;->setColor(FFFF)V

    .line 104
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Drawer;->drawBoneBoxes(Lcom/brashmonkey/spriter/Player;)V

    .line 105
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Drawer;->drawObjectBoxes(Lcom/brashmonkey/spriter/Player;)V

    .line 106
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Drawer;->drawPoints(Lcom/brashmonkey/spriter/Player;)V

    return-void
.end method

.method public drawObjectBoxes(Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    .line 134
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->objectIterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/brashmonkey/spriter/Drawer;->drawObjectBoxes(Lcom/brashmonkey/spriter/Player;Ljava/util/Iterator;)V

    return-void
.end method

.method public drawObjectBoxes(Lcom/brashmonkey/spriter/Player;Ljava/util/Iterator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Player;",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Object;",
            ">;)V"
        }
    .end annotation

    .line 143
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    .line 145
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/Player;->getBox(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Box;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Drawer;->drawBox(Lcom/brashmonkey/spriter/Box;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public drawPoints(Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    .line 154
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->objectIterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/brashmonkey/spriter/Drawer;->drawPoints(Lcom/brashmonkey/spriter/Player;Ljava/util/Iterator;)V

    return-void
.end method

.method public drawPoints(Lcom/brashmonkey/spriter/Player;Ljava/util/Iterator;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Player;",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Object;",
            ">;)V"
        }
    .end annotation

    .line 163
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 164
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    .line 165
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/Player;->getObjectInfoFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->type:Lcom/brashmonkey/spriter/Entity$ObjectType;

    sget-object v2, Lcom/brashmonkey/spriter/Entity$ObjectType;->Point:Lcom/brashmonkey/spriter/Entity$ObjectType;

    if-ne v1, v2, :cond_0

    .line 166
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget v2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    iget v4, p0, Lcom/brashmonkey/spriter/Drawer;->pointRadius:F

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v4

    double-to-float v2, v2

    add-float/2addr v1, v2

    .line 167
    iget-object v2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget v3, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    iget v5, p0, Lcom/brashmonkey/spriter/Drawer;->pointRadius:F

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    double-to-float v3, v3

    add-float/2addr v2, v3

    .line 168
    iget-object v3, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v4, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->y:F

    iget v5, p0, Lcom/brashmonkey/spriter/Drawer;->pointRadius:F

    invoke-virtual {p0, v3, v4, v5}, Lcom/brashmonkey/spriter/Drawer;->circle(FFF)V

    .line 169
    iget-object v3, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/brashmonkey/spriter/Drawer;->line(FFFF)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public drawRectangle(Lcom/brashmonkey/spriter/Rectangle;)V
    .locals 3

    .line 222
    iget v0, p1, Lcom/brashmonkey/spriter/Rectangle;->left:F

    iget v1, p1, Lcom/brashmonkey/spriter/Rectangle;->bottom:F

    iget-object v2, p1, Lcom/brashmonkey/spriter/Rectangle;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v2, v2, Lcom/brashmonkey/spriter/Dimension;->width:F

    iget-object p1, p1, Lcom/brashmonkey/spriter/Rectangle;->size:Lcom/brashmonkey/spriter/Dimension;

    iget p1, p1, Lcom/brashmonkey/spriter/Dimension;->height:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/brashmonkey/spriter/Drawer;->rectangle(FFFF)V

    return-void
.end method

.method public abstract line(FFFF)V
.end method

.method public abstract rectangle(FFFF)V
.end method

.method public abstract setColor(FFFF)V
.end method

.method public setLoader(Lcom/brashmonkey/spriter/Loader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Loader<",
            "TR;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 45
    iput-object p1, p0, Lcom/brashmonkey/spriter/Drawer;->loader:Lcom/brashmonkey/spriter/Loader;

    return-void

    .line 44
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "The loader instance can not be null!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
