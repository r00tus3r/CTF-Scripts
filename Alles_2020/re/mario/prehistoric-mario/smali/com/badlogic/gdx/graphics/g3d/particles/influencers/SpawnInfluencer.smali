.class public Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;
.super Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;
.source "SpawnInfluencer.java"


# instance fields
.field positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

.field public spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;-><init>()V

    .line 36
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/PointSpawnShapeValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/PointSpawnShapeValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;-><init>()V

    .line 44
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/Influencer;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    return-void
.end method


# virtual methods
.method public activateParticles(II)V
    .locals 3

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int p1, p1, v0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int p2, p2, v0

    add-int/2addr p2, p1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 65
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->emitter:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->percent:F

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->spawn(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    .line 66
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v1, p1, 0x0

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput v2, v0, v1

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v1, p1, 0x1

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput v2, v0, v1

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v1, p1, 0x2

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput v2, v0, v1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public allocateChannels()V
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleChannels;->Position:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->addChannel(Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$ChannelDescriptor;)Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$Channel;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    return-void
.end method

.method public bridge synthetic copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
    .locals 1

    .line 30
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;

    move-result-object v0

    return-object v0
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;
    .locals 1

    .line 75
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;)V

    return-object v0
.end method

.method public init()V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->init()V

    return-void
.end method

.method public load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    return-void
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 85
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    const-string v1, "spawnShape"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    return-void
.end method

.method public save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    return-void
.end method

.method public start()V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->start()V

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 3

    .line 80
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/SpawnInfluencer;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    const-class v1, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    const-string v2, "spawnShape"

    invoke-virtual {p1, v2, v0, v1}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-void
.end method
