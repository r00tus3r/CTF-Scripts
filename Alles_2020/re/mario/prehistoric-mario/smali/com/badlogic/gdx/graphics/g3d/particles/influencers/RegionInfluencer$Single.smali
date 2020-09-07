.class public Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;
.super Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;
.source "RegionInfluencer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Single"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 2

    const/4 v0, 0x1

    .line 41
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;-><init>([Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic copy()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleControllerComponent;
    .locals 1

    .line 32
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;

    move-result-object v0

    return-object v0
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;
    .locals 1

    .line 63
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;)V

    return-object v0
.end method

.method public init()V
    .locals 6

    .line 50
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regions:Lcom/badlogic/gdx/utils/Array;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v0, [Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$AspectTextureRegion;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 51
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->emitter:Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/emitters/Emitter;->maxParticleCount:I

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v2, v2, v3

    :goto_0
    if-ge v1, v2, :cond_0

    .line 52
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v1, 0x0

    iget v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$AspectTextureRegion;->u:F

    aput v5, v3, v4

    .line 53
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v1, 0x1

    iget v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$AspectTextureRegion;->v:F

    aput v5, v3, v4

    .line 54
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v1, 0x2

    iget v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$AspectTextureRegion;->u2:F

    aput v5, v3, v4

    .line 55
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v1, 0x3

    iget v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$AspectTextureRegion;->v2:F

    aput v5, v3, v4

    .line 56
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v1, 0x4

    const/high16 v5, 0x3f000000    # 0.5f

    aput v5, v3, v4

    .line 57
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v1, 0x5

    iget v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$AspectTextureRegion;->halfInvAspectRatio:F

    aput v5, v3, v4

    .line 51
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/RegionInfluencer$Single;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    add-int/2addr v1, v3

    goto :goto_0

    :cond_0
    return-void
.end method
