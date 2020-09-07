.class public Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;
.super Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;
.source "ModelInstanceRenderer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer<",
        "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;",
        "Lcom/badlogic/gdx/graphics/g3d/particles/batches/ModelInstanceParticleBatch;",
        ">;"
    }
.end annotation


# instance fields
.field private hasColor:Z

.field private hasRotation:Z

.field private hasScale:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;-><init>()V

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ModelInstanceParticleBatch;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;-><init>()V

    .line 41
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->setBatch(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;)Z

    return-void
.end method


# virtual methods
.method public allocateChannels()V
    .locals 3

    .line 46
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Position:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    return-void
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
    .locals 2

    .line 93
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->batch:Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ModelInstanceParticleBatch;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ModelInstanceParticleBatch;)V

    return-object v0
.end method

.method public init()V
    .locals 3

    .line 51
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->ModelInstance:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->modelInstanceChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Color:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Scale:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->scaleChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 54
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Rotation3D:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->hasColor:Z

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->scaleChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->hasScale:Z

    .line 57
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->hasRotation:Z

    return-void
.end method

.method public isCompatible(Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/particles/batches/ParticleBatch<",
            "*>;)Z"
        }
    .end annotation

    .line 98
    instance-of p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/ModelInstanceParticleBatch;

    return p1
.end method

.method public update()V
    .locals 19

    move-object/from16 v0, p0

    .line 62
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    .line 63
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->modelInstanceChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ObjectChannel;->data:[Ljava/lang/Object;

    check-cast v5, [Lcom/badlogic/gdx/graphics/g3d/ModelInstance;

    aget-object v5, v5, v3

    .line 64
    iget-boolean v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->hasScale:Z

    const/high16 v7, 0x3f800000    # 1.0f

    if-eqz v6, :cond_0

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->scaleChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v6, v6, v3

    move/from16 v18, v6

    goto :goto_1

    :cond_0
    const/high16 v18, 0x3f800000    # 1.0f

    .line 66
    :goto_1
    iget-boolean v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->hasRotation:Z

    const/4 v8, 0x0

    if-eqz v6, :cond_1

    .line 67
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v6, v6, v3

    .line 68
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v8, v6, 0x0

    aget v7, v7, v8

    .line 69
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v8, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v9, v6, 0x1

    aget v8, v8, v9

    .line 70
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v9, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v10, v6, 0x2

    aget v9, v9, v10

    .line 71
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v10, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v10, v10, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v10, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v6, v6, 0x3

    aget v6, v10, v6

    move v15, v6

    move v12, v7

    move v13, v8

    move v14, v9

    goto :goto_2

    :cond_1
    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    .line 74
    :goto_2
    iget-object v8, v5, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v4, 0x0

    aget v9, v6, v7

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v4, 0x1

    aget v10, v6, v7

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v4, 0x2

    aget v11, v6, v7

    move/from16 v16, v18

    move/from16 v17, v18

    invoke-virtual/range {v8 .. v18}, Lcom/badlogic/gdx/math/Matrix4;->set(FFFFFFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    .line 77
    iget-boolean v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->hasColor:Z

    if-eqz v6, :cond_2

    .line 78
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v6, v6, v3

    .line 79
    iget-object v7, v5, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v8, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Diffuse:J

    invoke-virtual {v7, v8, v9}, Lcom/badlogic/gdx/graphics/g3d/Material;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    .line 80
    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v8, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v5, v8, v9}, Lcom/badlogic/gdx/graphics/g3d/Material;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    .line 81
    iget-object v8, v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v9, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v10, v6, 0x0

    aget v9, v9, v10

    iput v9, v8, Lcom/badlogic/gdx/graphics/Color;->r:F

    .line 82
    iget-object v8, v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v9, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v10, v6, 0x1

    aget v9, v9, v10

    iput v9, v8, Lcom/badlogic/gdx/graphics/Color;->g:F

    .line 83
    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v8, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v9, v6, 0x2

    aget v8, v8, v9

    iput v8, v7, Lcom/badlogic/gdx/graphics/Color;->b:F

    if-eqz v5, :cond_2

    .line 85
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v6, v6, 0x3

    aget v6, v7, v6

    iput v6, v5, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->opacity:F

    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 62
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceRenderer;->renderData:Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderData;

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v4, v5

    goto/16 :goto_0

    .line 88
    :cond_3
    invoke-super/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/ParticleControllerRenderer;->update()V

    return-void
.end method
