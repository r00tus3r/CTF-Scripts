.class public abstract Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;
.super Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
.source "ParticleControllerRenderer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;",
        "T::",
        "Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch<",
        "TD;>;>",
        "Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;"
    }
.end annotation


# instance fields
.field protected batch:Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;-><init>()V

    return-void
.end method

.method protected constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)V"
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    return-void
.end method


# virtual methods
.method public abstract isCompatible(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch<",
            "*>;)Z"
        }
    .end annotation
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V
    .locals 1

    .line 56
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;->set(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V

    .line 57
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iput-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    :cond_0
    return-void
.end method

.method public setBatch(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch<",
            "*>;)Z"
        }
    .end annotation

    .line 45
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->isCompatible(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->batch:Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public update()V
    .locals 2

    .line 40
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->batch:Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;->draw(Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;)V

    return-void
.end method
