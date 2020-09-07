.class public Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;
.super Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;
.source "ParticleSorter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Distance"
.end annotation


# instance fields
.field private currentSize:I

.field private distances:[F

.field private particleIndices:[I

.field private particleOffsets:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;-><init>()V

    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->currentSize:I

    return-void
.end method


# virtual methods
.method public ensureCapacity(I)V
    .locals 1

    .line 59
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->currentSize:I

    if-ge v0, p1, :cond_0

    .line 60
    new-array v0, p1, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->distances:[F

    .line 61
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    .line 62
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleOffsets:[I

    .line 63
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->currentSize:I

    :cond_0
    return-void
.end method

.method public qsort(II)V
    .locals 7

    if-ge p1, p2, :cond_6

    sub-int v0, p2, p1

    const/16 v1, 0x8

    if-gt v0, v1, :cond_2

    move v0, p1

    :goto_0
    if-gt v0, p2, :cond_1

    move v1, v0

    :goto_1
    if-le v1, p1, :cond_0

    .line 98
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->distances:[F

    add-int/lit8 v3, v1, -0x1

    aget v4, v2, v3

    aget v5, v2, v1

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    .line 99
    aget v4, v2, v1

    .line 100
    aget v5, v2, v3

    aput v5, v2, v1

    .line 101
    aput v4, v2, v3

    .line 104
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    aget v4, v2, v1

    .line 105
    aget v5, v2, v3

    aput v5, v2, v1

    .line 106
    aput v4, v2, v3

    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->distances:[F

    aget v0, v0, p1

    add-int/lit8 v1, p1, 0x1

    .line 114
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    aget v2, v2, p1

    move v3, v1

    :goto_2
    if-gt v1, p2, :cond_5

    .line 118
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->distances:[F

    aget v5, v4, v1

    cmpl-float v5, v0, v5

    if-lez v5, :cond_4

    if-le v1, v3, :cond_3

    .line 121
    aget v5, v4, v1

    .line 122
    aget v6, v4, v3

    aput v6, v4, v1

    .line 123
    aput v5, v4, v3

    .line 126
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    aget v5, v4, v1

    .line 127
    aget v6, v4, v3

    aput v6, v4, v1

    .line 128
    aput v5, v4, v3

    :cond_3
    add-int/lit8 v3, v3, 0x1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 135
    :cond_5
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->distances:[F

    add-int/lit8 v4, v3, -0x1

    aget v5, v1, v4

    aput v5, v1, p1

    .line 136
    aput v0, v1, v4

    .line 137
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    aget v1, v0, v4

    aput v1, v0, p1

    .line 138
    aput v2, v0, v4

    add-int/lit8 v0, v3, -0x2

    .line 141
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->qsort(II)V

    .line 142
    invoke-virtual {p0, v3, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->qsort(II)V

    :cond_6
    return-void
.end method

.method public sort(Lcom/badlogic/gdx/utils/Array;)[I
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;",
            ">(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)[I"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/Camera;->view:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x2

    .line 70
    aget v1, v0, v1

    const/4 v2, 0x6

    aget v2, v0, v2

    const/16 v3, 0xa

    aget v0, v0, v3

    .line 72
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    .line 73
    iget-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    add-int/2addr v7, v5

    const/4 v8, 0x0

    :goto_1
    if-ge v5, v7, :cond_0

    .line 74
    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->distances:[F

    iget-object v10, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v10, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v11, v8, 0x0

    aget v10, v10, v11

    mul-float v10, v10, v1

    iget-object v11, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v12, v8, 0x1

    aget v11, v11, v12

    mul-float v11, v11, v2

    add-float/2addr v10, v11

    iget-object v11, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v12, v8, 0x2

    aget v11, v11, v12

    mul-float v11, v11, v0

    add-float/2addr v10, v11

    aput v10, v9, v5

    .line 77
    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    aput v5, v9, v5

    add-int/lit8 v5, v5, 0x1

    .line 73
    iget-object v9, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v8, v9

    goto :goto_1

    .line 79
    :cond_0
    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    add-int/2addr v4, v6

    goto :goto_0

    :cond_1
    add-int/lit8 p1, v4, -0x1

    .line 82
    invoke-virtual {p0, v3, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->qsort(II)V

    :goto_2
    if-ge v3, v4, :cond_2

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleOffsets:[I

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleIndices:[I

    aget v0, v0, v3

    aput v3, p1, v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 87
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$Distance;->particleOffsets:[I

    return-object p1
.end method
