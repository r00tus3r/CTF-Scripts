.class public Lcom/brashmonkey/spriter/PlayerTweener;
.super Lcom/brashmonkey/spriter/Player;
.source "PlayerTweener.java"


# instance fields
.field private anim:Lcom/brashmonkey/spriter/TweenedAnimation;

.field public baseBoneName:Ljava/lang/String;

.field private player1:Lcom/brashmonkey/spriter/Player;

.field private player2:Lcom/brashmonkey/spriter/Player;

.field public updatePlayers:Z


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Entity;)V
    .locals 2

    .line 41
    new-instance v0, Lcom/brashmonkey/spriter/Player;

    invoke-direct {v0, p1}, Lcom/brashmonkey/spriter/Player;-><init>(Lcom/brashmonkey/spriter/Entity;)V

    new-instance v1, Lcom/brashmonkey/spriter/Player;

    invoke-direct {v1, p1}, Lcom/brashmonkey/spriter/Player;-><init>(Lcom/brashmonkey/spriter/Entity;)V

    invoke-direct {p0, v0, v1}, Lcom/brashmonkey/spriter/PlayerTweener;-><init>(Lcom/brashmonkey/spriter/Player;Lcom/brashmonkey/spriter/Player;)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Player;Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    .line 31
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->getEntity()Lcom/brashmonkey/spriter/Entity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/brashmonkey/spriter/Player;-><init>(Lcom/brashmonkey/spriter/Entity;)V

    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->updatePlayers:Z

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->baseBoneName:Ljava/lang/String;

    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/brashmonkey/spriter/PlayerTweener;->setPlayers(Lcom/brashmonkey/spriter/Player;Lcom/brashmonkey/spriter/Player;)V

    return-void
.end method


# virtual methods
.method public getBaseAnimation()Lcom/brashmonkey/spriter/Animation;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    iget-object v0, v0, Lcom/brashmonkey/spriter/TweenedAnimation;->baseAnimation:Lcom/brashmonkey/spriter/Animation;

    return-object v0
.end method

.method public getFirstPlayer()Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player1:Lcom/brashmonkey/spriter/Player;

    return-object v0
.end method

.method public getSecondPlayer()Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player2:Lcom/brashmonkey/spriter/Player;

    return-object v0
.end method

.method public getWeight()F
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    iget v0, v0, Lcom/brashmonkey/spriter/TweenedAnimation;->weight:F

    return v0
.end method

.method public setAnimation(Lcom/brashmonkey/spriter/Animation;)V
    .locals 0

    return-void
.end method

.method public setBaseAnimation(I)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Entity;->getAnimation(I)Lcom/brashmonkey/spriter/Animation;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/PlayerTweener;->setBaseAnimation(Lcom/brashmonkey/spriter/Animation;)V

    return-void
.end method

.method public setBaseAnimation(Lcom/brashmonkey/spriter/Animation;)V
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    iput-object p1, v0, Lcom/brashmonkey/spriter/TweenedAnimation;->baseAnimation:Lcom/brashmonkey/spriter/Animation;

    return-void
.end method

.method public setBaseAnimation(Ljava/lang/String;)V
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Entity;->getAnimation(Ljava/lang/String;)Lcom/brashmonkey/spriter/Animation;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/PlayerTweener;->setBaseAnimation(Lcom/brashmonkey/spriter/Animation;)V

    return-void
.end method

.method public setEntity(Lcom/brashmonkey/spriter/Entity;)V
    .locals 0

    return-void
.end method

.method public setPlayers(Lcom/brashmonkey/spriter/Player;Lcom/brashmonkey/spriter/Player;)V
    .locals 2

    .line 72
    iget-object v0, p1, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    iget-object v1, p2, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    if-ne v0, v1, :cond_1

    .line 74
    iput-object p1, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player1:Lcom/brashmonkey/spriter/Player;

    .line 75
    iput-object p2, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player2:Lcom/brashmonkey/spriter/Player;

    .line 76
    iget-object v0, p1, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    iget-object v1, p0, Lcom/brashmonkey/spriter/PlayerTweener;->entity:Lcom/brashmonkey/spriter/Entity;

    if-ne v0, v1, :cond_0

    return-void

    .line 77
    :cond_0
    new-instance v0, Lcom/brashmonkey/spriter/TweenedAnimation;

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->getEntity()Lcom/brashmonkey/spriter/Entity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/TweenedAnimation;-><init>(Lcom/brashmonkey/spriter/Entity;)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    .line 78
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object p2, p2, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    invoke-virtual {v0, v1, p2}, Lcom/brashmonkey/spriter/TweenedAnimation;->setAnimations(Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Animation;)V

    .line 79
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Player;->getEntity()Lcom/brashmonkey/spriter/Entity;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/brashmonkey/spriter/Player;->setEntity(Lcom/brashmonkey/spriter/Entity;)V

    .line 80
    iget-object p1, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    invoke-super {p0, p1}, Lcom/brashmonkey/spriter/Player;->setAnimation(Lcom/brashmonkey/spriter/Animation;)V

    return-void

    .line 73
    :cond_1
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string p2, "player1 and player2 have to hold the same entity!"

    invoke-direct {p1, p2}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setWeight(F)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    iput p1, v0, Lcom/brashmonkey/spriter/TweenedAnimation;->weight:F

    return-void
.end method

.method public update()V
    .locals 3

    .line 51
    iget-boolean v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->updatePlayers:Z

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player1:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 53
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player2:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    iget-object v1, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player1:Lcom/brashmonkey/spriter/Player;

    iget-object v1, v1, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v2, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player2:Lcom/brashmonkey/spriter/Player;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    invoke-virtual {v0, v1, v2}, Lcom/brashmonkey/spriter/TweenedAnimation;->setAnimations(Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Animation;)V

    .line 56
    invoke-super {p0}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 57
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->baseBoneName:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 58
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/TweenedAnimation;->onFirstMainLine()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player1:Lcom/brashmonkey/spriter/Player;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/brashmonkey/spriter/PlayerTweener;->player2:Lcom/brashmonkey/spriter/Player;

    :goto_0
    iget-object v1, p0, Lcom/brashmonkey/spriter/PlayerTweener;->baseBoneName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Player;->getBoneIndex(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 60
    iget-object v1, p0, Lcom/brashmonkey/spriter/PlayerTweener;->anim:Lcom/brashmonkey/spriter/TweenedAnimation;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/TweenedAnimation;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object v0

    iput-object v0, v1, Lcom/brashmonkey/spriter/TweenedAnimation;->base:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    .line 61
    invoke-super {p0}, Lcom/brashmonkey/spriter/Player;->update()V

    goto :goto_1

    .line 59
    :cond_2
    new-instance v0, Lcom/brashmonkey/spriter/SpriterException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "A bone with name \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/brashmonkey/spriter/PlayerTweener;->baseBoneName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\" does no exist!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_1
    return-void
.end method
