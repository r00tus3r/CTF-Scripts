.class public Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;
.super Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;
.source "ParticleSorter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "None"
.end annotation


# instance fields
.field currentCapacity:I

.field indices:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter;-><init>()V

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;->currentCapacity:I

    return-void
.end method


# virtual methods
.method public ensureCapacity(I)V
    .locals 2

    .line 37
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;->currentCapacity:I

    if-ge v0, p1, :cond_1

    .line 38
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;->indices:[I

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 40
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;->indices:[I

    aput v0, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 41
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;->currentCapacity:I

    :cond_1
    return-void
.end method

.method public sort(Lcom/badlogic/gdx/utils/Array;)[I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;",
            ">(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)[I"
        }
    .end annotation

    .line 47
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleSorter$None;->indices:[I

    return-object p1
.end method
