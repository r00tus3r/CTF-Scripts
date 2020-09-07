.class public abstract Lcom/brashmonkey/spriter/IKResolver;
.super Ljava/lang/Object;
.source "IKResolver.java"


# instance fields
.field protected ikMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/brashmonkey/spriter/IKObject;",
            "Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;",
            ">;"
        }
    .end annotation
.end field

.field protected player:Lcom/brashmonkey/spriter/Player;

.field protected tolerance:F


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x40a00000    # 5.0f

    .line 34
    iput v0, p0, Lcom/brashmonkey/spriter/IKResolver;->tolerance:F

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/IKResolver;->ikMap:Ljava/util/HashMap;

    .line 36
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/IKResolver;->setPlayer(Lcom/brashmonkey/spriter/Player;)V

    return-void
.end method


# virtual methods
.method public getPlayer()Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/brashmonkey/spriter/IKResolver;->player:Lcom/brashmonkey/spriter/Player;

    return-object v0
.end method

.method public getTolerance()F
    .locals 1

    .line 101
    iget v0, p0, Lcom/brashmonkey/spriter/IKResolver;->tolerance:F

    return v0
.end method

.method public mapIKObject(Lcom/brashmonkey/spriter/IKObject;Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/brashmonkey/spriter/IKResolver;->ikMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public mapIKObject(Lcom/brashmonkey/spriter/IKObject;Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 2

    .line 85
    iget-object v0, p0, Lcom/brashmonkey/spriter/IKResolver;->ikMap:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/brashmonkey/spriter/IKResolver;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v1, p2}, Lcom/brashmonkey/spriter/Player;->getBoneRef(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public resolve()V
    .locals 7

    .line 62
    iget-object v0, p0, Lcom/brashmonkey/spriter/IKResolver;->ikMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    const/4 v2, 0x0

    .line 63
    :goto_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/brashmonkey/spriter/IKObject;

    iget v3, v3, Lcom/brashmonkey/spriter/IKObject;->iterations:I

    if-ge v2, v3, :cond_0

    .line 64
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/brashmonkey/spriter/IKObject;

    iget v3, v3, Lcom/brashmonkey/spriter/IKObject;->x:F

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/brashmonkey/spriter/IKObject;

    iget v4, v4, Lcom/brashmonkey/spriter/IKObject;->y:F

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/brashmonkey/spriter/IKObject;

    iget v5, v5, Lcom/brashmonkey/spriter/IKObject;->chainLength:I

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    invoke-virtual {p0, v3, v4, v5, v6}, Lcom/brashmonkey/spriter/IKResolver;->resolve(FFILcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected abstract resolve(FFILcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
.end method

.method public setPlayer(Lcom/brashmonkey/spriter/Player;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 46
    iput-object p1, p0, Lcom/brashmonkey/spriter/IKResolver;->player:Lcom/brashmonkey/spriter/Player;

    return-void

    .line 45
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "player cannot be null!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setTolerance(F)V
    .locals 0

    .line 110
    iput p1, p0, Lcom/brashmonkey/spriter/IKResolver;->tolerance:F

    return-void
.end method

.method public unmapIKObject(Lcom/brashmonkey/spriter/IKObject;)V
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/brashmonkey/spriter/IKResolver;->ikMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
