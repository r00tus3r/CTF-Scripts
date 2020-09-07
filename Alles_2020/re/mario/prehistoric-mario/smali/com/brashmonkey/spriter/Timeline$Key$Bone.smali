.class public Lcom/brashmonkey/spriter/Timeline$Key$Bone;
.super Ljava/lang/Object;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Timeline$Key;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bone"
.end annotation


# instance fields
.field public angle:F

.field public final pivot:Lcom/brashmonkey/spriter/Point;

.field public final position:Lcom/brashmonkey/spriter/Point;

.field public final scale:Lcom/brashmonkey/spriter/Point;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 121
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/Point;-><init>()V

    invoke-direct {p0, v0}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;-><init>(Lcom/brashmonkey/spriter/Point;)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Point;)V
    .locals 4

    .line 117
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    new-instance v2, Lcom/brashmonkey/spriter/Point;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v1}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {p0, p1, v0, v2, v3}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;F)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;F)V
    .locals 1

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0, p1}, Lcom/brashmonkey/spriter/Point;-><init>(Lcom/brashmonkey/spriter/Point;)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    .line 107
    new-instance p1, Lcom/brashmonkey/spriter/Point;

    invoke-direct {p1, p2}, Lcom/brashmonkey/spriter/Point;-><init>(Lcom/brashmonkey/spriter/Point;)V

    iput-object p1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    .line 108
    iput p4, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 109
    new-instance p1, Lcom/brashmonkey/spriter/Point;

    invoke-direct {p1, p3}, Lcom/brashmonkey/spriter/Point;-><init>(Lcom/brashmonkey/spriter/Point;)V

    iput-object p1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 3

    .line 113
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;F)V

    return-void
.end method


# virtual methods
.method public isBone()Z
    .locals 1

    .line 129
    instance-of v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public map(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 4

    .line 186
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    neg-float v1, v1

    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/brashmonkey/spriter/Point;->translate(FF)Lcom/brashmonkey/spriter/Point;

    .line 187
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    neg-float v1, v1

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->rotate(F)Lcom/brashmonkey/spriter/Point;

    .line 188
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v1, v2, v1

    iget-object v3, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    div-float v3, v2, v3

    invoke-virtual {v0, v1, v3}, Lcom/brashmonkey/spriter/Point;->scale(FF)Lcom/brashmonkey/spriter/Point;

    .line 189
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    div-float v1, v2, v1

    iget-object v3, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    div-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/brashmonkey/spriter/Point;->scale(FF)Lcom/brashmonkey/spriter/Point;

    .line 190
    iget v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 191
    iget v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    mul-float v1, v1, p1

    mul-float v0, v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    return-void
.end method

.method public set(FFFFFFF)V
    .locals 0

    .line 151
    iput p3, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 152
    iget-object p3, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p3, p1, p2}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    .line 153
    iget-object p1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p1, p4, p5}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    .line 154
    iget-object p1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p1, p6, p7}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;)V
    .locals 8

    .line 165
    iget v1, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget v2, p1, Lcom/brashmonkey/spriter/Point;->y:F

    iget v4, p3, Lcom/brashmonkey/spriter/Point;->x:F

    iget v5, p3, Lcom/brashmonkey/spriter/Point;->y:F

    iget v6, p4, Lcom/brashmonkey/spriter/Point;->x:F

    iget v7, p4, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v0, p0

    move v3, p2

    invoke-virtual/range {v0 .. v7}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->set(FFFFFFF)V

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 3

    .line 137
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->set(Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|position: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", scale: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", angle: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unmap(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 3

    .line 173
    iget v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    mul-float v1, v1, v2

    mul-float v0, v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 174
    iget v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 175
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->scale(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 176
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->scale(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 177
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->rotate(F)Lcom/brashmonkey/spriter/Point;

    .line 178
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Point;->translate(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    return-void
.end method
