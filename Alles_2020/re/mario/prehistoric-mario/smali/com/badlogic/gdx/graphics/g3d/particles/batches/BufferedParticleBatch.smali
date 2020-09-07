.class public abstract Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;
.super Ljava/lang/Object;
.source "BufferedParticleBatch.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected bufferedParticlesCount:I

.field protected camera:Lcom/badlogic/gdx/graphics/Camera;

.field protected currentCapacity:I

.field protected renderData:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->currentCapacity:I

    .line 33
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;

    .line 34
    new-instance v1, Lcom/badlogic/gdx/utils/Array;

    const/16 v2, 0xa

    invoke-direct {v1, v0, v2, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZILjava/lang/Class;)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method protected abstract allocParticlesData(I)V
.end method

.method public begin()V
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->bufferedParticlesCount:I

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 44
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-lez v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 46
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->bufferedParticlesCount:I

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->bufferedParticlesCount:I

    :cond_0
    return-void
.end method

.method public end()V
    .locals 2

    .line 52
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->bufferedParticlesCount:I

    if-lez v0, :cond_0

    .line 53
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->ensureCapacity(I)V

    .line 54
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;->sort(Lcom/badlogic/gdx/utils/Array;)[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->flush([I)V

    :cond_0
    return-void
.end method

.method public ensureCapacity(I)V
    .locals 1

    .line 60
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->currentCapacity:I

    if-lt v0, p1, :cond_0

    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;->ensureCapacity(I)V

    .line 62
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->allocParticlesData(I)V

    .line 63
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->currentCapacity:I

    return-void
.end method

.method protected abstract flush([I)V
.end method

.method public getBufferedCount()I
    .locals 1

    .line 93
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->bufferedParticlesCount:I

    return v0
.end method

.method public getSorter()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;

    return-object v0
.end method

.method public resetCapacity()V
    .locals 1

    const/4 v0, 0x0

    .line 67
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->bufferedParticlesCount:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->currentCapacity:I

    return-void
.end method

.method public setCamera(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 1

    .line 73
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;->setCamera(Lcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method

.method public setSorter(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;)V
    .locals 1

    .line 82
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;->setCamera(Lcom/badlogic/gdx/graphics/Camera;)V

    .line 84
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->currentCapacity:I

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;->ensureCapacity(I)V

    return-void
.end method
