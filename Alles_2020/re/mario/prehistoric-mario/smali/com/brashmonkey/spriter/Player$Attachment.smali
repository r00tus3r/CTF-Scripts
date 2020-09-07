.class public abstract Lcom/brashmonkey/spriter/Player$Attachment;
.super Lcom/brashmonkey/spriter/Timeline$Key$Bone;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Attachment"
.end annotation


# instance fields
.field private angleTemp:F

.field private parent:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

.field private final positionTemp:Lcom/brashmonkey/spriter/Point;

.field private final scaleTemp:Lcom/brashmonkey/spriter/Point;


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 1

    .line 1074
    invoke-direct {p0}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;-><init>()V

    .line 1075
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/Point;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->positionTemp:Lcom/brashmonkey/spriter/Point;

    .line 1076
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/Point;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->scaleTemp:Lcom/brashmonkey/spriter/Point;

    .line 1077
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player$Attachment;->setParent(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    return-void
.end method


# virtual methods
.method public getParent()Lcom/brashmonkey/spriter/Timeline$Key$Bone;
    .locals 1

    .line 1095
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->parent:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    return-object v0
.end method

.method protected abstract setAngle(F)V
.end method

.method public setParent(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1087
    iput-object p1, p0, Lcom/brashmonkey/spriter/Player$Attachment;->parent:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    return-void

    .line 1086
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "The parent cannot be null!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected abstract setPosition(FF)V
.end method

.method protected abstract setScale(FF)V
.end method

.method final update()V
    .locals 2

    .line 1100
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->positionTemp:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->set(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 1101
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->scaleTemp:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->set(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 1102
    iget v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iput v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->angleTemp:F

    .line 1104
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->parent:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    invoke-super {p0, v0}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->unmap(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    .line 1105
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, v1}, Lcom/brashmonkey/spriter/Player$Attachment;->setPosition(FF)V

    .line 1106
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, v1}, Lcom/brashmonkey/spriter/Player$Attachment;->setScale(FF)V

    .line 1107
    iget v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Player$Attachment;->setAngle(F)V

    .line 1110
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player$Attachment;->positionTemp:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->set(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 1111
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player$Attachment;->scaleTemp:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->set(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 1112
    iget v0, p0, Lcom/brashmonkey/spriter/Player$Attachment;->angleTemp:F

    iput v0, p0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    return-void
.end method
