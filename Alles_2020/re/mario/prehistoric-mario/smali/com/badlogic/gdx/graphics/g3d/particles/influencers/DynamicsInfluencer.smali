.class public Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;
.super Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;
.source "DynamicsInfluencer.java"


# instance fields
.field private accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field private angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field has2dAngularVelocity:Z

.field has3dAngularVelocity:Z

.field hasAcceleration:Z

.field private positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field private previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field private rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field public velocities:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 36
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;-><init>()V

    .line 37
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    const/4 v2, 0x1

    const/4 v3, 0x3

    invoke-direct {v0, v2, v3, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZILjava/lang/Class;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;)V
    .locals 1

    .line 48
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->toArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    check-cast p1, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;-><init>([Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;)V
    .locals 4

    .line 40
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;-><init>()V

    .line 41
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    array-length v1, p1

    const-class v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    const/4 v3, 0x1

    invoke-direct {v0, v3, v1, v2}, Lcom/badlogic/gdx/utils/Array;-><init>(ZILjava/lang/Class;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    .line 42
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 43
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;->copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public activateParticles(II)V
    .locals 6

    .line 95
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->hasAcceleration:Z

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v0, v0, p1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v1, v1, p2

    add-int/2addr v1, v0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 99
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v3, v0, 0x0

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v4, v4, v3

    aput v4, v2, v3

    .line 100
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v3, v0, 0x1

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v4, v4, v3

    aput v4, v2, v3

    .line 101
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v3, v0, 0x2

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v4, v4, v3

    aput v4, v2, v3

    .line 98
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v0, v2

    goto :goto_0

    .line 110
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has2dAngularVelocity:Z

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v0, v0, p1

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v3, v3, p2

    add-int/2addr v3, v0

    :goto_1
    if-ge v0, v3, :cond_2

    .line 113
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v5, v0, 0x0

    aput v1, v4, v5

    .line 114
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v5, v0, 0x1

    aput v2, v4, v5

    .line 112
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v0, v4

    goto :goto_1

    .line 116
    :cond_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has3dAngularVelocity:Z

    if-eqz v0, :cond_2

    .line 118
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v0, v0, p1

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v3, v3, p2

    add-int/2addr v3, v0

    :goto_2
    if-ge v0, v3, :cond_2

    .line 119
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v5, v0, 0x0

    aput v2, v4, v5

    .line 120
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v5, v0, 0x1

    aput v2, v4, v5

    .line 121
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v5, v0, 0x2

    aput v2, v4, v5

    .line 122
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v5, v0, 0x3

    aput v1, v4, v5

    .line 118
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v0, v4

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 126
    :goto_3
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_3

    .line 127
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v1, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;->activateParticles(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    return-void
.end method

.method public allocateChannels()V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 53
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v2, :cond_0

    .line 54
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v2, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;->allocateChannels()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 59
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Acceleration:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 60
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->hasAcceleration:Z

    .line 61
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->hasAcceleration:Z

    if-eqz v1, :cond_2

    .line 62
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Position:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 63
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->PreviousPosition:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 67
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->AngularVelocity2D:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 68
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    if-eqz v1, :cond_3

    const/4 v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has2dAngularVelocity:Z

    .line 69
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has2dAngularVelocity:Z

    if-eqz v1, :cond_4

    .line 70
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Rotation2D:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 71
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has3dAngularVelocity:Z

    goto :goto_3

    .line 73
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->AngularVelocity3D:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->getChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 74
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    if-eqz v1, :cond_5

    const/4 v0, 0x1

    :cond_5
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has3dAngularVelocity:Z

    .line 75
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has3dAngularVelocity:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Rotation3D:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    :cond_6
    :goto_3
    return-void
.end method

.method public bridge synthetic copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
    .locals 1

    .line 31
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;

    move-result-object v0

    return-object v0
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;
    .locals 1

    .line 207
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;)V

    return-object v0
.end method

.method public init()V
    .locals 2

    const/4 v0, 0x0

    .line 89
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_0

    .line 90
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v1, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;->init()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 4

    .line 217
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/utils/Array;

    const-class v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    const-string v3, "velocities"

    invoke-virtual {p1, v3, v1, v2, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V
    .locals 2

    .line 81
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;->set(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V

    const/4 v0, 0x0

    .line 82
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v1, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;->set(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public update()V
    .locals 17

    move-object/from16 v0, p0

    .line 133
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->hasAcceleration:Z

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 134
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v4, v4, v5

    invoke-static {v1, v3, v4, v2}, Ljava/util/Arrays;->fill([FIIF)V

    .line 135
    :cond_0
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has2dAngularVelocity:Z

    if-nez v1, :cond_1

    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has3dAngularVelocity:Z

    if-eqz v1, :cond_2

    .line 136
    :cond_1
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v4, v4, v5

    invoke-static {v1, v3, v4, v2}, Ljava/util/Arrays;->fill([FIIF)V

    :cond_2
    const/4 v1, 0x0

    .line 139
    :goto_0
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget v4, v4, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v4, :cond_3

    .line 140
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    iget-object v4, v4, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v4, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;->update()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    :cond_3
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->hasAcceleration:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 158
    :goto_1
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-ge v1, v5, :cond_4

    .line 159
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v6, v4, 0x0

    aget v5, v5, v6

    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v8, v4, 0x1

    aget v7, v7, v8

    .line 160
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v9, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v10, v4, 0x2

    aget v9, v9, v10

    .line 161
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    const/high16 v12, 0x40000000    # 2.0f

    mul-float v13, v5, v12

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v14, v14, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v14, v14, v6

    sub-float/2addr v13, v14

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v14, v14, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v14, v14, v6

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget v15, v15, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->deltaTimeSqr:F

    mul-float v14, v14, v15

    add-float/2addr v13, v14

    aput v13, v11, v6

    .line 164
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    mul-float v13, v7, v12

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v14, v14, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v14, v14, v8

    sub-float/2addr v13, v14

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v14, v14, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v14, v14, v8

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget v15, v15, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->deltaTimeSqr:F

    mul-float v14, v14, v15

    add-float/2addr v13, v14

    aput v13, v11, v8

    .line 167
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    mul-float v12, v12, v9

    iget-object v13, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v13, v13, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v13, v13, v10

    sub-float/2addr v12, v13

    iget-object v13, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->accellerationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v13, v13, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v13, v13, v10

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget v14, v14, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->deltaTimeSqr:F

    mul-float v13, v13, v14

    add-float/2addr v12, v13

    aput v12, v11, v10

    .line 170
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aput v5, v11, v6

    .line 171
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aput v7, v5, v8

    .line 172
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->previousPositionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aput v9, v5, v10

    add-int/lit8 v1, v1, 0x1

    .line 158
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v4, v5

    goto/16 :goto_1

    .line 176
    :cond_4
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has2dAngularVelocity:Z

    if-eqz v1, :cond_6

    const/4 v1, 0x0

    .line 177
    :goto_2
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-ge v3, v4, :cond_7

    .line 178
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aget v4, v4, v3

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->deltaTime:F

    mul-float v4, v4, v5

    cmpl-float v5, v4, v2

    if-eqz v5, :cond_5

    .line 180
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v5

    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v4

    .line 181
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v1, 0x0

    aget v6, v6, v7

    .line 182
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v9, v1, 0x1

    aget v8, v8, v9

    mul-float v10, v6, v5

    mul-float v11, v8, v4

    sub-float/2addr v10, v11

    mul-float v8, v8, v5

    mul-float v6, v6, v4

    add-float/2addr v8, v6

    .line 185
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aput v10, v4, v7

    .line 186
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    aput v8, v4, v9

    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 177
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v1, v4

    goto :goto_2

    .line 189
    :cond_6
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->has3dAngularVelocity:Z

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 190
    :goto_3
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    if-ge v3, v5, :cond_7

    .line 192
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v6, v1, 0x0

    aget v5, v5, v6

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v1, 0x1

    aget v6, v6, v7

    .line 193
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v8, v1, 0x2

    aget v7, v7, v8

    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v8, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v9, v4, 0x0

    aget v8, v8, v9

    .line 194
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v10, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v11, v4, 0x1

    aget v10, v10, v11

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v12, v12, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v4, 0x2

    aget v12, v12, v13

    .line 195
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v14, v14, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v15, v4, 0x3

    aget v14, v14, v15

    move/from16 v16, v1

    .line 196
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->TMP_Q:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v1, v5, v6, v7, v2}, Lcom/badlogic/gdx/math/Quaternion;->set(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v1

    invoke-virtual {v1, v8, v10, v12, v14}, Lcom/badlogic/gdx/math/Quaternion;->mul(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v1

    const/high16 v5, 0x3f000000    # 0.5f

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->deltaTime:F

    mul-float v6, v6, v5

    invoke-virtual {v1, v6}, Lcom/badlogic/gdx/math/Quaternion;->mul(F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v1

    invoke-virtual {v1, v8, v10, v12, v14}, Lcom/badlogic/gdx/math/Quaternion;->add(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Quaternion;->nor()Lcom/badlogic/gdx/math/Quaternion;

    .line 197
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->TMP_Q:Lcom/badlogic/gdx/math/Quaternion;

    iget v5, v5, Lcom/badlogic/gdx/math/Quaternion;->x:F

    aput v5, v1, v9

    .line 198
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->TMP_Q:Lcom/badlogic/gdx/math/Quaternion;

    iget v5, v5, Lcom/badlogic/gdx/math/Quaternion;->y:F

    aput v5, v1, v11

    .line 199
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->TMP_Q:Lcom/badlogic/gdx/math/Quaternion;

    iget v5, v5, Lcom/badlogic/gdx/math/Quaternion;->z:F

    aput v5, v1, v13

    .line 200
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->TMP_Q:Lcom/badlogic/gdx/math/Quaternion;

    iget v5, v5, Lcom/badlogic/gdx/math/Quaternion;->w:F

    aput v5, v1, v15

    add-int/lit8 v3, v3, 0x1

    .line 190
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v4, v1

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->angularVelocityChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int v1, v16, v1

    goto/16 :goto_3

    :cond_7
    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 4

    .line 212
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsInfluencer;->velocities:Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/utils/Array;

    const-class v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/DynamicsModifier;

    const-string v3, "velocities"

    invoke-virtual {p1, v3, v0, v1, v2}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)V

    return-void
.end method
