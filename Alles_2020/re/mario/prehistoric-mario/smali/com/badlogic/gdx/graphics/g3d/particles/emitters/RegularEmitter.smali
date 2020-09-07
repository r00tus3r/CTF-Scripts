.class public Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;
.super Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;
.source "RegularEmitter.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Json$Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;
    }
.end annotation


# instance fields
.field private continuous:Z

.field protected delay:F

.field protected delayTimer:F

.field public delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

.field protected duration:F

.field protected durationTimer:F

.field public durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

.field protected emission:I

.field protected emissionDelta:I

.field protected emissionDiff:I

.field private emissionMode:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

.field public emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

.field protected life:I

.field private lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field protected lifeDiff:I

.field protected lifeOffset:I

.field protected lifeOffsetDiff:I

.field public lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

.field public lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;-><init>()V

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    .line 58
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->setActive(Z)V

    .line 61
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->setActive(Z)V

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->setActive(Z)V

    .line 63
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    .line 64
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;->Enabled:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionMode:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;)V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;-><init>()V

    .line 69
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->set(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;)V

    return-void
.end method

.method private addParticles(I)V
    .locals 2

    .line 178
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->maxParticleCount:I

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    sub-int/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-gtz p1, :cond_0

    return-void

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->activateParticles(II)V

    .line 181
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    add-int/2addr v1, p1

    iput v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    return-void
.end method


# virtual methods
.method public activateParticles(II)V
    .locals 5

    .line 106
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->life:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeDiff:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->percent:F

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v2

    mul-float v1, v1, v2

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 107
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffset:I

    int-to-float v1, v1

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetDiff:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->percent:F

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v3

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    if-lez v1, :cond_1

    if-lt v1, v0, :cond_0

    add-int/lit8 v1, v0, -0x1

    :cond_0
    sub-int v1, v0, v1

    goto :goto_0

    :cond_1
    move v1, v0

    :goto_0
    const/high16 v2, 0x3f800000    # 1.0f

    int-to-float v1, v1

    int-to-float v0, v0

    div-float v3, v1, v0

    sub-float/2addr v2, v3

    .line 114
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int p1, p1, v3

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int p2, p2, v3

    add-int/2addr p2, p1

    :goto_1
    if-ge p1, p2, :cond_2

    .line 115
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, p1, 0x0

    aput v1, v3, v4

    .line 116
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, p1, 0x1

    aput v0, v3, v4

    .line 117
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, p1, 0x2

    aput v2, v3, v4

    .line 114
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr p1, v3

    goto :goto_1

    :cond_2
    return-void
.end method

.method public allocateChannels()V
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Life:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    return-void
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
    .locals 1

    .line 258
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;)V

    return-object v0
.end method

.method public getDelay()Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    return-object v0
.end method

.method public getDuration()Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    return-object v0
.end method

.method public getEmission()Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    return-object v0
.end method

.method public getEmissionMode()Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;
    .locals 1

    .line 215
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionMode:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    return-object v0
.end method

.method public getLife()Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    return-object v0
.end method

.method public getLifeOffset()Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    return-object v0
.end method

.method public getPercentComplete()F
    .locals 3

    .line 231
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delay:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 232
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public init()V
    .locals 1

    .line 100
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->init()V

    const/4 v0, 0x0

    .line 101
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    .line 102
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    return-void
.end method

.method public isComplete()Z
    .locals 3

    .line 226
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delay:F

    const/4 v2, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    return v2

    .line 227
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-nez v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public isContinuous()Z
    .locals 1

    .line 205
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    return v0
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 274
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 275
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string v1, "continous"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    .line 276
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    const-string v1, "emission"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    .line 277
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "delay"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 278
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "duration"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 279
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    const-string v1, "life"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    .line 280
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    const-string v1, "lifeOffset"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;)V
    .locals 2

    .line 236
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->set(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;)V

    .line 237
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V

    .line 238
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V

    .line 239
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;)V

    .line 240
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;)V

    .line 241
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;)V

    .line 242
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emission:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emission:I

    .line 243
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDiff:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDiff:I

    .line 244
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    .line 245
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffset:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffset:I

    .line 246
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetDiff:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetDiff:I

    .line 247
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->life:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->life:I

    .line 248
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeDiff:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeDiff:I

    .line 249
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    .line 250
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delay:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delay:F

    .line 251
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    .line 252
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    .line 253
    iget-boolean p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    return-void
.end method

.method public setContinuous(Z)V
    .locals 0

    .line 209
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    return-void
.end method

.method public setEmissionMode(Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;)V
    .locals 0

    .line 221
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionMode:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    return-void
.end method

.method public start()V
    .locals 2

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->active:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->newLowValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delay:F

    .line 80
    iput v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    .line 81
    iput v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->newLowValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    .line 84
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    div-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->percent:F

    .line 86
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->newLowValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emission:I

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->newHighValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDiff:I

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDiff:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emission:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDiff:I

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->newLowValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->life:I

    .line 91
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->newHighValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeDiff:I

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeDiff:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->life:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeDiff:I

    .line 94
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->active:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->newLowValue()F

    move-result v0

    float-to-int v0, v0

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffset:I

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->newHighValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetDiff:I

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_4

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetDiff:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffset:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetDiff:I

    :cond_4
    return-void
.end method

.method public update()V
    .locals 11

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->deltaTime:F

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float v0, v0, v1

    .line 124
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delay:F

    const/4 v4, 0x0

    const/4 v5, 0x0

    cmpg-float v3, v2, v3

    if-gez v3, :cond_0

    add-float/2addr v2, v0

    .line 125
    iput v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayTimer:F

    goto/16 :goto_2

    .line 127
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionMode:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;->Disabled:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    if-eq v2, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 129
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    iget v6, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->duration:F

    cmpg-float v7, v3, v6

    if-gez v7, :cond_2

    add-float/2addr v3, v0

    .line 130
    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    .line 131
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationTimer:F

    div-float/2addr v3, v6

    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->percent:F

    goto :goto_1

    .line 133
    :cond_2
    iget-boolean v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    if-eqz v3, :cond_3

    if-eqz v2, :cond_3

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionMode:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;->Enabled:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter$EmissionMode;

    if-ne v3, v6, :cond_3

    .line 134
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->start()V

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_5

    .line 141
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    int-to-float v2, v2

    add-float/2addr v2, v0

    float-to-int v2, v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    .line 142
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emission:I

    int-to-float v2, v2

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDiff:I

    int-to-float v3, v3

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    iget v7, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->percent:F

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->getScale(F)F

    move-result v6

    mul-float v3, v3, v6

    add-float/2addr v2, v3

    cmpl-float v3, v2, v4

    if-lez v3, :cond_4

    div-float/2addr v1, v2

    .line 145
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    int-to-float v3, v2

    cmpl-float v3, v3, v1

    if-ltz v3, :cond_4

    int-to-float v2, v2

    div-float/2addr v2, v1

    float-to-int v2, v2

    .line 147
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->maxParticleCount:I

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    sub-int/2addr v3, v6

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 148
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    int-to-float v3, v3

    int-to-float v6, v2

    mul-float v6, v6, v1

    sub-float/2addr v3, v6

    float-to-int v3, v3

    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    .line 149
    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    int-to-float v3, v3

    rem-float/2addr v3, v1

    float-to-int v1, v3

    iput v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionDelta:I

    .line 150
    invoke-direct {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->addParticles(I)V

    .line 153
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->minParticleCount:I

    if-ge v1, v2, :cond_5

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->minParticleCount:I

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    sub-int/2addr v1, v2

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->addParticles(I)V

    .line 158
    :cond_5
    :goto_2
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    const/4 v2, 0x0

    .line 159
    :goto_3
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-ge v5, v3, :cond_7

    .line 160
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v6, v2, 0x0

    aget v7, v3, v6

    sub-float/2addr v7, v0

    aput v7, v3, v6

    cmpg-float v3, v7, v4

    if-gtz v3, :cond_6

    .line 161
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    invoke-virtual {v3, v5}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->removeElement(I)V

    goto :goto_3

    .line 164
    :cond_6
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v2, 0x2

    const/high16 v8, 0x3f800000    # 1.0f

    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v6, v9, v6

    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v10, v2, 0x1

    aget v9, v9, v10

    div-float/2addr v6, v9

    sub-float/2addr v8, v6

    aput v8, v3, v7

    add-int/lit8 v5, v5, 0x1

    .line 169
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v2, v3

    goto :goto_3

    .line 172
    :cond_7
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-ge v0, v1, :cond_8

    .line 173
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->killParticles(II)V

    :cond_8
    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 263
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->write(Lcom/badlogic/gdx/utils/Json;)V

    .line 264
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->continuous:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "continous"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 265
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    const-string v1, "emission"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "delay"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 267
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "duration"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 268
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    const-string v1, "life"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 269
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/RegularEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;

    const-string v1, "lifeOffset"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
