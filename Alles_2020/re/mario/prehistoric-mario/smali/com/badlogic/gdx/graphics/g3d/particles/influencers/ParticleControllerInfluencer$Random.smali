.class public Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;
.super Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;
.source "ParticleControllerInfluencer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Random"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;
    }
.end annotation


# instance fields
.field pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 108
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;-><init>()V

    .line 109
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;)V
    .locals 0

    .line 118
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;)V

    .line 119
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V
    .locals 0

    .line 113
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;-><init>([Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V

    .line 114
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    return-void
.end method


# virtual methods
.method public activateParticles(II)V
    .locals 2

    add-int/2addr p2, p1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 140
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    .line 141
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->start()V

    .line 142
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->particleControllerChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;->data:[Ljava/lang/Object;

    check-cast v1, [Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    aput-object v0, v1, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public bridge synthetic copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
    .locals 1

    .line 83
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;

    move-result-object v0

    return-object v0
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;
    .locals 1

    .line 158
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;)V

    return-object v0
.end method

.method public dispose()V
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;->clear()V

    .line 134
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer;->dispose()V

    return-void
.end method

.method public init()V
    .locals 3

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;->clear()V

    const/4 v0, 0x0

    .line 126
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->emitter:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    if-ge v0, v1, :cond_0

    .line 127
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;->newObject()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;->free(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public killParticles(II)V
    .locals 2

    add-int/2addr p2, p1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 149
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->particleControllerChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;->data:[Ljava/lang/Object;

    check-cast v0, [Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    aget-object v0, v0, p1

    .line 150
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->end()V

    .line 151
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->pool:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random$ParticleControllerPool;->free(Ljava/lang/Object;)V

    .line 152
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ParticleControllerInfluencer$Random;->particleControllerChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;->data:[Ljava/lang/Object;

    check-cast v0, [Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
