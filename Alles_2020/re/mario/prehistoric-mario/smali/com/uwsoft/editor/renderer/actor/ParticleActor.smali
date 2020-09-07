.class public Lcom/uwsoft/editor/renderer/actor/ParticleActor;
.super Lcom/badlogic/gdx/scenes/scene2d/Actor;
.source "ParticleActor.java"


# instance fields
.field private lastDelta:F

.field private particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;-><init>()V

    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->lastDelta:F

    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->setVisible(Z)V

    .line 15
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 2

    .line 41
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->lastDelta:F

    .line 42
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->getY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->setPosition(FF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 1

    .line 52
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->lastDelta:F

    invoke-virtual {p2, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    return-void
.end method

.method public fastForward(F)V
    .locals 0

    .line 47
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->act(F)V

    return-void
.end method

.method public getParticleEffect()Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    return-object v0
.end method

.method public setPosition(FF)V
    .locals 1

    .line 19
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->setX(F)V

    .line 20
    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->setY(F)V

    .line 21
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->getX()F

    move-result p2

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->getY()F

    move-result v0

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->setPosition(FF)V

    return-void
.end method

.method public start()V
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->reset()V

    .line 26
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->start()V

    return-void
.end method

.method public stop()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 30
    :goto_0
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->getEmitters()Lcom/badlogic/gdx/utils/Array;

    move-result-object v2

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v2, :cond_0

    .line 31
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->getEmitters()Lcom/badlogic/gdx/utils/Array;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setContinuous(Z)V

    .line 32
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/ParticleActor;->particleEffect:Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->getEmitters()Lcom/badlogic/gdx/utils/Array;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
