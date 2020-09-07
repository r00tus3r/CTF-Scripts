.class public abstract Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;
.super Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
.source "Emitter.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Json$Serializable;


# instance fields
.field public maxParticleCount:I

.field public minParticleCount:I

.field public percent:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;-><init>()V

    const/4 v0, 0x4

    .line 30
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;-><init>()V

    const/4 v0, 0x4

    .line 30
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    .line 36
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->set(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;)V

    return-void
.end method


# virtual methods
.method public end()V
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    const/4 v1, 0x0

    iput v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    return-void
.end method

.method public getMaxParticleCount()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    return v0
.end method

.method public getMinParticleCount()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->minParticleCount:I

    return v0
.end method

.method public init()V
    .locals 2

    .line 44
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    const/4 v1, 0x0

    iput v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    return-void
.end method

.method public isComplete()Z
    .locals 2

    .line 53
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->percent:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 90
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string v1, "minParticleCount"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->minParticleCount:I

    .line 91
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string v1, "maxParticleCount"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;)V
    .locals 1

    .line 78
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->minParticleCount:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->minParticleCount:I

    .line 79
    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    return-void
.end method

.method public setMaxParticleCount(I)V
    .locals 0

    .line 69
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    return-void
.end method

.method public setMinParticleCount(I)V
    .locals 0

    .line 61
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->minParticleCount:I

    return-void
.end method

.method public setParticleCount(II)V
    .locals 0

    .line 73
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->setMinParticleCount(I)V

    .line 74
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->setMaxParticleCount(I)V

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 84
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->minParticleCount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "minParticleCount"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "maxParticleCount"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
